using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using ShopWebService;

namespace ShopWebMVC.Controllers
{
    public abstract class CustomerBaseController : Controller
    {
        public CategoryService categoryService { get; set;}
        public CustomerBaseController() {
            categoryService = new CategoryService();
            ViewBag.Category = categoryService.getCategory();
        }
    }
}