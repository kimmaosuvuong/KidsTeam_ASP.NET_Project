using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using ShopWebDAO;

namespace ShopWebMVC.Controllers
{
    public class HomeController : CustomerBaseController
    {
        // GET: Home
        /// <summary>
        /// get danh sach san pham va san pham moi nhat
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            ProductDAO list = new ProductDAO();
            ViewBag.listProduct = list.ListProduct();
            ViewBag.newProduct = list.NewProduct();
            return View();
        }
    }
}