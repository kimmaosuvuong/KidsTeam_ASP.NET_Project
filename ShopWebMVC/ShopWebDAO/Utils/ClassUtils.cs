using System;
using System.Collections.Generic;
using System.Linq;
using Model;
using System.Data;

namespace ShopWebDAO.Utils
{
    public class ClassUtils
    {
        //lay tat ca du lieu cua bang
        public IList<T> findAll<T>() where T : class
        {
            IList<T> result = new List<T>();
            ShopOnlineDBDataContext context = new ShopOnlineDBDataContext();
            var query = from a in context.GetTable<T>()
                        select a;
            var list = query.ToList();
            return list;
        }
        //them 1 hang vao trong bang
        public T save<T>(T A) where T : class
        {
            ShopOnlineDBDataContext context = new ShopOnlineDBDataContext();
            context.GetTable<T>().InsertOnSubmit(A);
            try
            {
                context.SubmitChanges();
                return A;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                context.SubmitChanges();
                return A;
            }
        }
    }
}