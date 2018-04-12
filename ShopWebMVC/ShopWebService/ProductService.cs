using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShopWebDAO;
using Model;

namespace ShopWebService
{
    public class ProductService 
    {
        private ProductDAO productDAO;
        public ProductService()
        {
            productDAO = new ProductDAO();
        }
        public List<Product> getAllProduct()
        {
            return productDAO.getAllProduct();
        }
        public List<Product> getRelativeProductByCategory(long id)
        {  
            var relativeProducts = getAllProduct().Where(pro => pro.CategoryId == id).ToList();
            return relativeProducts.GetRange(0,4);
        }

    }
}
