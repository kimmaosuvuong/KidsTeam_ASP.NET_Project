using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using ShopWebService;

namespace ShopWebMVC.Controllers
{
    public class CustomerController : CustomerBaseController
    {
        private AccountService accountService;

        public CustomerController() {
            accountService = new AccountService();
        }
        // GET: Customer
        public ActionResult Index()
        {
            return RedirectToAction("UpdateProfile");
        }
        public ActionResult UpdateProfile()
        {
            if (Session[CommonStatuses.ACCOUNT] != null)
            {
                return View(Session[CommonStatuses.ACCOUNT]);
            }
            else
            {
                ModelState.AddModelError(CommonStatuses.PROFILE_ERROR_1, "Ban chua dang nhap. Vui long dang nhap de truy cap.");
                return RedirectToAction("Index","Login");
            }
        }

        public ActionResult Update(AccountModel accountModel)
        {
            if (ModelState.IsValid)
            {
                var account = accountService.updateCustomerInformation(accountModel);
                if (account != null)
                {
                    Session[CommonStatuses.ACCOUNT] = account;
                    ModelState.AddModelError(CommonStatuses.PROFILE_SUCCESS, "Cap nhat thong tin thanh cong.");
                }
                else
                {
                    ModelState.AddModelError(CommonStatuses.PROFILE_ERROR_3, "Qua trinh cap nhat bi loi. Vui long thu lai sau.");
                }
            }
            else {
                ModelState.AddModelError(CommonStatuses.PROFILE_ERROR_1, "Ban chua dang nhap. Vui long dang nhap de truy cap.");
            }
            return View("UpdateProfile", Session[CommonStatuses.ACCOUNT]);
        }
    }
}