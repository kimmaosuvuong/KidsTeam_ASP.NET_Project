using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using ShopWebDAO.Utils;

namespace ShopWebDAO
{
    public class CustomerDAO : ClassUtils
    {
        public Customer findCustomerById(long id) {
            var customer = findAll<Customer>().Where(elm => elm.Id == id).DefaultIfEmpty(null).Single();
            return customer;
        }
    }
}
