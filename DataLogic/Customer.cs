using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataLogic
{
    public class Customer
    {
        public void insert(String Name,String NRC,String Com,String State,String City,String Photo,String Street,String Phone,String Remark,DateTime Reg_Date)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_Cus_selectallTableAdapter().Insert(Name, NRC, Com, State, City, Photo , Street, Phone, Remark, Reg_Date);
        }

        public DataTable selectall()
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_Cus_selectallTableAdapter().GetData();
        }

        public void update(int id,String Name,String NRC,String com,String State,String City,String photo,String Street,String Phone,String remark,DateTime Reg_Date)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_Cus_selectallTableAdapter().pro_customer_update(id, Name, NRC, com, State, City, photo, Street, Phone, remark, Reg_Date);
        }

        public int getID(String name, String nrc)
        {
            return (Int32)new DATASOURCE.DataSet1TableAdapters.pro_Cus_selectallTableAdapter().pro_customer_getID(name, nrc);
        }
    }


}
