using System;
using System.Collections.Generic;
using System.Linq;
using Model;
using System.Data;

namespace ShopWebDAO.Utils
{
    public abstract class ClassUtils
    {
        public ShopOnlineDBDataContext context;

        public ClassUtils() {
            context = new ShopOnlineDBDataContext();
        }
        //lay tat ca du lieu cua bang
        public IList<T> findAll<T>() where T : class
        {
            IList<T> result = new List<T>();
            var query = from a in context.GetTable<T>()
                        select a;
            var list = query.ToList();
            return list;
        }
        //them 1 hang vao trong bang
        public T save<T>(T A) where T : class
        {
            context.GetTable<T>().InsertOnSubmit(A);
            try
            {
                context.SubmitChanges();
                return A;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }
        //Xoa 1 hang trong bang
        public bool delete<T>(T A) where T : class {
            bool result = false;
            context.GetTable<T>().DeleteOnSubmit(A);
            try
            {
                context.SubmitChanges();
                result = true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                result = false;
            }
            return result;
        }
        //Cap nhat lai thong tin trong bang sau khi thay doi
        public bool update<T>() where T : class
        {
            bool result = false;
            try
            {
                context.SubmitChanges();
                result = true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                result = false;
            }
            return result;
        }
    }
}