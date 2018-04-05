using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public static class CommonStatuses
    {
        public static string ACCOUNT = "ACCOUNT";
        public static string LOGIN_ERROR = "LOGIN_ERROR";
        public static string LOGIN_ERROR_2 = "USERNAME_PASSWORD_WRONG";
        public static string REGISTER_ERROR_1 = "REGISTER_ERROR";
        public static string REGISTER_ERROR_2 = "INSERT_ACCOUNT_FAIL";
        public static string REGISTER_SUCCESS = "REGISTER_SUCCESS";
        public static string PROFILE_ERROR_1 = "NOT_LOGIN_YET";
        public static string PROFILE_ERROR_2 = "MOEDL_STATE_FAIL";
        public static string PROFILE_ERROR_3 = "UPDATE_PROFILE_ERROR";
        public static string PROFILE_SUCCESS = "UPDATE_PROFILE_SUCCESS";
    }
}
