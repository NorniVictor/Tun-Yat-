using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DataLogic
{
  public   class ProductList
    {
      public DataTable getTable()
      {
          return new DATASOURCE.DataSet1TableAdapters.pro_pdt_selectallTableAdapter().GetData();
      }

      public void Insert(String Name,String Description,int sid,String Remark)
      {
          new DATASOURCE.DataSet1TableAdapters.pro_pdt_selectallTableAdapter().Insert(Name, Description, sid, Remark);
      }

      public void Update(int id,String Name,String Description,int sid,String Remark)
      {
          new DATASOURCE.DataSet1TableAdapters.pro_pdt_selectallTableAdapter().Update(id, Name, Description, sid, Remark);
      }
    }
}
