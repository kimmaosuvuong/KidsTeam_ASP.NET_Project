using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopWebMVC.Models;
using ShopWebMVC.Services;

namespace ShopWebMVC.Controllers
{
    public abstract class CustomerBaseController : Controller
    {
        public CategoryServices categoryService { get; set;}

        public CustomerBaseController() {
            categoryService = new CategoryServices();
            ViewBag.Category = categoryService.findAllCategory();
        }
    }
}