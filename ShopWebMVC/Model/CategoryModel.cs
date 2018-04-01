using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model
{
    public class CategoryModel
    {
        public  long Id { get; set; }
        public  string Code { get; set; }
        public  string Name { get; set; }
        public  List<CategoryModel> childrens { get; set; }
        public override string ToString() {
            return this.Id.ToString();
        }

    }
}