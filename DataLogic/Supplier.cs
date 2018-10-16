using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DataLogic
{
   public  class Supplier
    {
       public DataTable getTabel()
       {
           return new DATASOURCE.DataSet1TableAdapters.PRO_SUPPLIER_SELECTALLTableAdapter().GetData();
       }

       public void Insert(String name,String address,String person,String phone,String remark,String photo)
       {
           new DATASOURCE.DataSet1TableAdapters.PRO_SUPPLIER_SELECTALLTableAdapter().Insert(name, address, person, phone, remark, photo);
       }

       public void Update(int ID, String name, String address, String person, String phone, String remark, String photo)
       {
           new DATASOURCE.DataSet1TableAdapters.PRO_SUPPLIER_SELECTALLTableAdapter().Update(ID, name, address, person, phone, remark, photo);
       }

       public String getName(int ID)
       {
           return new DATASOURCE.DataSet1TableAdapters.PRO_SUPPLIER_SELECTALLTableAdapter().Pro_supplier_getName(ID).ToString();
       }
    }
}
