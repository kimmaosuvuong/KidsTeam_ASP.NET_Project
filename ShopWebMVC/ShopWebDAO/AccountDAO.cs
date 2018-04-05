using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using ShopWebDAO.Utils;

namespace ShopWebDAO
{
    public class AccountDAO : ClassUtils
    {
        public Account findByUserNameAndPassWord(string userName, string passWord) {
            var account = findAll<Account>().Where(elm => elm.UserName == userName && elm.PassWord == passWord).DefaultIfEmpty(null).Single();
            return account;
        }

        public Account findByUserName(string userName)
        {
            var account = findAll<Account>().Where(elm => elm.UserName == userName).DefaultIfEmpty(null).Single();
            return account;
        }
    }
}
