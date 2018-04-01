using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopWebMVC.Controllers
{
    public class CheckoutController : CustomerBaseController
    {
        // GET: Checkout
        public ActionResult Index()
        {
            return View();
        }
    }
}