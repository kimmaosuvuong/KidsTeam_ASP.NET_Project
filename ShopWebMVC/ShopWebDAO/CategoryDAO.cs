using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using ShopWebDAO.Utils;

namespace ShopWebDAO
{
    public class CategoryDAO : ClassUtils
    {
        IList<Category> listCategoryDb;

        public CategoryDAO()
        {
            listCategoryDb = findAll<Category>();
        }
        //lay danh sach dau muc chinh
        public List<CategoryModel> findAllCategory()
        {
            List<CategoryModel> result = new List<CategoryModel>();
            foreach (Category elm in listCategoryDb)
            {
                if (elm.ParentId == null)
                {
                    result.Add(buildCategoryModel(elm));
                }
            }
            return result;
        }
        //tao CategoryModel tu Category truyen vao
        private CategoryModel buildCategoryModel(Category category)
        {
            CategoryModel result = new CategoryModel();
            result.childrens = new List<CategoryModel>();
            foreach (Category elm in listCategoryDb)
            {
                if (elm.ParentId == category.Id)
                {
                    result.childrens.Add(buildCategoryModel(elm));
                }
            }
            //den cuoi cung tra ve category
            result.Id = category.Id;
            result.Code = category.Code;
            result.Name = category.Name;
            return result;
        }
    }
}
