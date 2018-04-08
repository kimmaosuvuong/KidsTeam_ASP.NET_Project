using ShopWebDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopWebMVC.Controllers
{
    public class ProductController : CustomerBaseController
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DetailProduct()
        {
            return View();
        }
        /// <summary>
        /// lay danh sach san pham theo loai va phan trang
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult LoadByCategory(long id, int page =1, int pageSize =2)
        {
            
            ProductDAO pro = new ProductDAO();
            ViewBag.categoryid = pro.ViewDetailCate(id);
            int totalRecord = 0;
            var model = pro.ListProByCate(id, ref totalRecord , page,pageSize);
            ViewBag.total = totalRecord;
            ViewBag.page = page;

            int maxPage = 5;
            int totalPage = (int)Math.Ceiling((double)totalRecord / pageSize);
            ViewBag.totalPage = totalPage;
            ViewBag.maxPage = maxPage;
            ViewBag.first = 1;
            ViewBag.last = totalPage;
            ViewBag.next = page+1;
            ViewBag.prev = page - 1;

            return View(model);
        }
    }
}