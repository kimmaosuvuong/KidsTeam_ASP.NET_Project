using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using ShopWebDAO;

namespace ShopWebDAO
{
    public class ProductDAO
    {
        ShopOnlineDBDataContext db = null;
        public ProductDAO()
        {
            db = new ShopOnlineDBDataContext();
        }
        public List<Product> getAllProduct()
        {
            var litsProduct = db.Products.ToList();
            return litsProduct;
        }
        public List<Product> ListProduct()
        {
            return db.Products.OrderBy(x => x.Id).Take(8).ToList();
        }
         public List<Product> ListProByCate(long CateId, ref int totalRecord, int page = 1, int pageSize =2)
        {
            totalRecord = db.Products.Where(x => x.CategoryId == CateId).Count();
            var model =  db.Products.Where(x => x.CategoryId == CateId).OrderBy(x => x.Id).Skip((page-1)*pageSize).Take(pageSize).ToList();
            return model;
        }
        public List<Product> NewProduct()
        {
            return db.Products.OrderByDescending(x => x.Id).Take(4).ToList();
        }
         public long ViewDetailCate(long id)
        {
            long cateId  = db.Categories.Where(x=>x.Id==id).Select(x=>x.Id).First();
            return cateId;
        }
    }
}
