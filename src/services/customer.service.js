const CustomerRepository = require("../repositories/customer.repository");
const MemberShipRepository = require("../repositories/menberShip.repository");
const s3Service = require("./awsS3.service");
const { generate } = require("generate-password");
const MemberShipService = require("../services/menberShip.service");
const StatisticsService = require("../services/statistics.service");
const ejs = require("ejs");
const bcrypt = require("bcrypt");
const axios = require("axios");
const sms = require("../config/sms");

require("dotenv").config();
// rm sms
// const twilio = require("twilio")(
//   process.env.TWILIO_SID,
//   process.env.TWILIO_AUTH_TOKEN
// );
const mailer = require("../utils/mailer");

const { GeneratePassword, GenerateSalt } = require("../utils/auth.util");

const renderEjs = async (filename, data, options) => {
  const ejsString = await new Promise((resolve, reject) => {
    ejs.renderFile(filename, data, options, function (err, str) {
      return err ? reject(err) : resolve(str);
    });
  });
  return ejsString;
};
class CustomerService {
  async getAllCustomer(query) {
    const data = await CustomerRepository.GetAllCustomers(query);
    return data;
  }

  async getCustomerById(id) {
    return await CustomerRepository.GetById(id);
  }

  async getCustomerByCode(code) {
    return await CustomerRepository.getCustomerByCode(code);
  }

  async getCustomerByPhone(phone) {
    return await CustomerRepository.GetByPhone(phone);
  }

  async getCustomerByEmail(email) {
    return await CustomerRepository.GetByEmail(email);
  }

  async createCustomer(req) {
    const customer = req.body;
    const image = req.file;
    console.log("image sv", image);
    if (image) {
      const result = await s3Service.uploadFile(image);
      console.log(result);
      customer.image = result;
    }
    const password = generate({
      length: 10,
      numbers: true,
      uppercase: true,
      lowercase: true,
      symbols: true,
      excludeSimilarCharacters: true,
    });
    console.log("password", password);
    const salt = await GenerateSalt();
    const passwordHash = await GeneratePassword(password, salt);
    customer.password = passwordHash;
    customer.salt = salt;
    customer.isActivated = true;
    customer.rank_id = 1;
    const newCus = await CustomerRepository.CreateCustomer(customer);
    if (newCus) {
      const memberShip = {
        idCustomer: newCus.id,
        idRank: 1,
      };
      const mb = await MemberShipService.createMemberShip(memberShip);
    }
    return newCus;
  }

  async createCustomerInCinema(body) {
    const isExist = await CustomerRepository.GetByPhone(body.phone);
    if (isExist) {
      throw new Error("Số điện thoại đã tồn tại");
    }
    const password = generate({
      length: 6,
      numbers: true,
      uppercase: true,
      lowercase: true,
      excludeSimilarCharacters: true,
    });
    console.log("password", password);
    const salt = await GenerateSalt();
    const passwordHash = await GeneratePassword(password, salt);
    body.password = passwordHash;
    body.salt = salt;
    body.isActivated = true;
    body.rank_id = 1;
    try {
      const newCus = await CustomerRepository.CreateCustomer(body);
      if (newCus) {
        const memberShip = {
          idCustomer: newCus.id,
          idRank: 1,
        };
        const mb = await MemberShipService.createMemberShip(memberShip);
        const phone = body.phone.replace("0", "+84");
        
        //============= send otp ===================
        //   console.log("mb", mb);
        // const message = `Welcome to Cinema-Hub. Your username is ${phone} and password is ${password}. Please install our app to change your password. https://play.google.com/store/apps/details?id=com.cinemahub.app`;
        // sms.sendSMS(phone, message, (result) => {
        //   console.log(result);
        // });

        // rm sms

        // twilio.messages.create({
        //   body: `Welcome to Cinema-Hub. Your username is ${body.phone} and password is ${password}.`,
        //   messagingServiceSid: 'MG1b388d3ff4767ae0eb503d0fce5c1ef6',
        //   to: phone,
        // })
        // .then(message => console.log(message.sid))
        // .catch(err => console.log(err));

        // return { message: "Tạo tài khoản thành công" }
      }
      return newCus;
    } catch (err) {
      console.log(err);
      throw new Error(err.message);
    }
  }

  async updateCustomer(req) {
    const id = req.params.id;
    const customer = req.body;
    const image = req.file;
    const old = await CustomerRepository.GetById(id);
    if (!old) {
      throw new Error("Không tìm thấy khách hàng");
    }
    if (old.phone !== customer.phone) {
      const isExist = await CustomerRepository.GetByPhone(customer.phone);
      if (isExist) {
        throw new Error("Số điện thoại đã tồn tại");
      }
    }
    if (customer.email && old.email !== customer.email) {
      const isExist = await CustomerRepository.GetByEmail(customer.email);
      if (isExist) {
        throw new Error("Email đã tồn tại");
      }
    }
    console.log("id", id);
    try {
      if (image) {
        const result = await s3Service.uploadFile(image);
        console.log(result);
        customer.image = result;
      }
      return await CustomerRepository.UpdateCustomer(id, customer);
    } catch (err) {
      console.log(err);
      throw new Error(err.message);
    }
  }

  async updateCustomerByID(req) {
    const id = req.params.id;
    const customer = req.body;
    const old = await CustomerRepository.GetById(id);
    if (!old) {
      throw new Error("Không tìm thấy khách hàng");
    }
    if (old.phone !== customer.phone) {
      const isExist = await CustomerRepository.GetByPhone(customer.phone);
      if (isExist) {
        throw new Error("Số điện thoại đã tồn tại");
      }
    }
    if (customer.email && old.email !== customer.email) {
      const isExist = await CustomerRepository.GetByEmail(customer.email);
      if (isExist) {
        throw new Error("Email đã tồn tại");
      }
    }
    console.log("id", id);
    try {
      return await CustomerRepository.UpdateCustomer(id, customer);
    } catch (err) {
      console.log(err);
      throw new Error(err.message);
    }
  }

  async resetPassword(req) {
    const id = req.params.id;
    const { password } = req.body;
    const salt = await GenerateSalt();
    const passwordHash = await GeneratePassword(password, salt);
    return await CustomerRepository.UpdateCustomer(id, {
      password: passwordHash,
      salt,
    });
  }

  async deleteCustomer(id) {
    return await CustomerRepository.UpdateCustomer(id, { isDeleted: true });
  }

  async getInfoMemberShip(id) {
    const total_spent = await StatisticsService.getRevenueByCustomerInMonth(id);
    console.log(total_spent[0].dataValues);
    const data = await MemberShipRepository.GetInfoCustomer(id);
    data.dataValues.total_spent = total_spent[0].dataValues.total;
    return data;
  }

  async getCustomers() {
    const data = await MemberShipRepository.GetCustomers();
    console.log("data", data);
    return data;
  }

  async handleForgotPassword(req, res) {
    const user = await CustomerRepository.GetByEmail(req.body.email);
    if (!user) {
      return {
        status: 404,
        code: 0,
        message: "Email không tồn tại trong hệ thống.",
      };
    } else {
      bcrypt.hash(user.email, parseInt(10)).then(async (hashedEmail) => {
        console.log(
          `${process.env.APP_URL}/auth/reset-password?email=${user.email}&token=${hashedEmail}&isCustomer=true`
        );
        const mailTemplate = await renderEjs(
          `${process.cwd()}/src/resources/views/reset-password.ejs`,
          {
            fromOrgName: "Cinema Hub",
            linkInvite: `${process.env.URL_FE}/auth/reset-password?email=${user.email}&token=${hashedEmail}&isCustomer=true`,
            fromEmail: "admin@admin.com",
            fromName: "Admin",
            userName: `${user.firstName} ${user.lastName}`,
          }
        );
        mailer.sendMail(
          user.email,
          "Cinema Hub Notification: Setup Cinema Hub Password",
          mailTemplate
        );
        res.json({
          status: 200,
          code: 1,
          message: "Link lấy lại Mật Khẩu đã được gửi về email.",
        });
      });
    }
  }
}

module.exports = new CustomerService();
