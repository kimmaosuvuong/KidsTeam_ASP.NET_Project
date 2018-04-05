using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using ShopWebDAO;

namespace ShopWebService
{
    public class AccountService
    {
        private AccountDAO accountDAO;
        private CustomerDAO customerDAO;
        private CartDAO cartDAO;

        public AccountService() {
            accountDAO = new AccountDAO();
            customerDAO = new CustomerDAO();
            cartDAO = new CartDAO();
        }
        //kiem tra dang nhap
        public AccountModel Login(string userName, string passWord) {
            AccountModel result = null;
            Account account = accountDAO.findByUserNameAndPassWord(userName, passWord);
            //kiem tra xem co ton tai tai khona khong
            if (account != null) {
                Customer customer = account.Customer;
                result = new AccountModel()
                {
                    UserName = userName,
                    PassWord = passWord,
                    Customer = customer
                };
            }
            return result;
        }
        //kiem tra su ton tai cua tai khoan
        public bool checkExistAccount(string userName) {
            bool result = false;
            Account account = accountDAO.findByUserName(userName);
            if(account != null)
            {
                result = true;
            }
            return result;
        }
        //them mot tai khoan
        public bool addNewAccountModel(AccountModel accountModel) {
            bool result = false;
            Account account = null;
            Cart cart = null;
            Customer customer = customerDAO.save<Customer>(accountModel.Customer);
            //kiem tra viec them vao co thanh cong hay khong
            if (customer != null) {
                //Them tai khoan
                account = new Account() {
                    UserName = accountModel.UserName,
                    PassWord = accountModel.PassWord,
                    CustomerId = customer.Id
                };
                account = accountDAO.save<Account>(account);
                //Them gio hang
                cart = new Cart() {
                    Code = DateTime.Now.Ticks.ToString(),
                    CustomerId = customer.Id
                };
                cart = cartDAO.save<Cart>(cart);
            }
            //kiem tra viec them vao co thanh cong hay khong
            if (account != null && cart != null)
            {
                //neu ca 2 them thanh cong
                result = true;
            }
            else {
                //neu 1 trong 2 khong them thanh cong
                customerDAO.delete<Customer>(customer);
                if (account != null)
                {
                    accountDAO.delete<Account>(account);
                }
                else if (cart != null) {
                    cartDAO.delete<Cart>(cart);
                }
            }
            return result;
        }
        //cap nhat du lieu cua tai khoan
        public AccountModel updateCustomerInformation(AccountModel accountModel) {
            AccountModel result = null;
            try
            {
                //lay tai khoan can thay doi thong tin
                Account account = accountDAO.findByUserName(accountModel.UserName);
                //bat dau cap nhat thong tin
                account.PassWord = accountModel.PassWord;
                account.Customer.Name = accountModel.Customer.Name;
                account.Customer.Email = accountModel.Customer.Email;
                account.Customer.Phone = accountModel.Customer.Phone;
                account.Customer.Address = accountModel.Customer.Address;
                account.Customer.Birthday = accountModel.Customer.Birthday;

                if (customerDAO.update<Customer>() && accountDAO.update<Account>())
                {
                    result = new AccountModel()
                    {
                        UserName = account.UserName,
                        PassWord = account.PassWord,
                        Customer = account.Customer
                    };
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return result;
        }
    }
}
