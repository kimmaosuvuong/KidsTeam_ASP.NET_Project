using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopWebMVC.Services;
using ShopWebMVC.Models;
namespace ShopWebMVC.Controllers
{
    public class CategoryController : CustomerBaseController
    {

        public CategoryController() {
        }
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TestLoad()
        {
            return View(categoryService.findAllCategory());
        }
    }
}