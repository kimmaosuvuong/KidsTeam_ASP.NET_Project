using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using ShopWebService;

namespace ShopWebMVC.Controllers
{
    public class LoginController : CustomerBaseController
    {
        private AccountService accountService;

        public LoginController() {
            accountService = new AccountService();
        }
        // GET: Login
        public ActionResult Index(AccountModel account)
        {
            if (Session[CommonStatuses.ACCOUNT] != null) {
                return RedirectToAction("UpdateProfile","Customer");
            }
            return View();
        }

        public ActionResult Login(AccountModel account)
        {
            if (ModelState.IsValid)
            {
                var accountModel = accountService.Login(account.UserName, account.PassWord);
                if (accountModel != null)
                {
                    Session.Add(CommonStatuses.ACCOUNT, accountModel);
                    return RedirectToAction("Index", "Home");
                }
                else {
                    ModelState.AddModelError(CommonStatuses.LOGIN_ERROR_2, "Sai tai khoan hoac mat khau. Vui long kiem tra lai.");
                }
            }
            else
            {
                ModelState.AddModelError(CommonStatuses.LOGIN_ERROR, "Dang nhap that bai");
            }
            return View("Index");
        }
        // cập nhật đăng xuất tài khoản
        public ActionResult Logout()
        {
            var accounModel = Session[CommonStatuses.ACCOUNT];
            var user = (AccountModel)accounModel;
            if (user != null)
            {
                Session.Remove(CommonStatuses.ACCOUNT);
                return RedirectToAction("Index", "Login");
            }
            return View();
        }
        //dang ky 1 tai khona moi
        public ActionResult Register(AccountModel account)
        {
            if (ModelState.IsValid)
            {
                if (accountService.checkExistAccount(account.UserName))
                {
                    ModelState.AddModelError(CommonStatuses.REGISTER_ERROR_1, "Tai khoan da ton tai");
                }
                else {
                    account.Customer.Point = 0;
                    account.Customer.TypeId = 1;
                    account.Customer.Code = DateTime.Now.Ticks.ToString();
                    bool result = accountService.addNewAccountModel(account);
                    if (result == false)
                    {
                        ModelState.AddModelError(CommonStatuses.REGISTER_ERROR_2, "Dang ky bi loi. VUi long thu lai sau");
                    }
                    else {
                        ModelState.AddModelError(CommonStatuses.REGISTER_SUCCESS, "Tao tai khoan thanh cong. Vui long dang nhap de hoan tat.");
                    }
                }
            }
            else
            {
                ModelState.AddModelError(CommonStatuses.LOGIN_ERROR, "Dang nhap that bai");
            }
            return View("Index");
        }
    }
}