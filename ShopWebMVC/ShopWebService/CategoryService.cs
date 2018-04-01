using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShopWebDAO;
using Model;

namespace ShopWebService
{
    public class CategoryService
    {
        private CategoryDAO categoryDAO;

        public CategoryService() {
            categoryDAO = new CategoryDAO();
        }

        public List<CategoryModel> getCategory() {
            return categoryDAO.findAllCategory();
        }
    }
}
