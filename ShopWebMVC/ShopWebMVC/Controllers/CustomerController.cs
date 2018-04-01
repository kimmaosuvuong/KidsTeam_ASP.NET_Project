using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopWebMVC.Controllers
{
    public class CustomerController : CustomerBaseController
    {
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult UpdateProfile()
        {
            return View();
        }
    }
}