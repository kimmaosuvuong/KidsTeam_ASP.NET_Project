using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Model
{
    public class AccountModel
    {       
        public string UserName { get; set; }

        public string PassWord { get; set; }

        public Customer Customer { get; set; }
    }
}
