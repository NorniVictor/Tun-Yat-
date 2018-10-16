using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataLogic
{
     public  class Position
    {
         public void Insert(String positionname)
         {       
            new DATASOURCE.DataSet1TableAdapters.pro_Position_selectAllTableAdapter().pro_Position_insert(positionname);
          }

         public String isNameExist(String name)
         {
             String strname = null;
             try
             {
                 return strname = new DATASOURCE.DataSet1TableAdapters.pro_Position_selectAllTableAdapter().pro_Position_selectByName(name).ToString();
             }
             catch
             {
                 return null;
             }
         }

         public DataTable getTable()
         {
             return new DATASOURCE.DataSet1TableAdapters.pro_Position_selectAllTableAdapter().GetData();
         }

         public void Update(int id, String name)
         {
             new DATASOURCE.DataSet1TableAdapters.pro_Position_selectAllTableAdapter().pro_Position_update(id, name);         
         }

         public String getName(int id)
         {
             return new DATASOURCE.DataSet1TableAdapters.pro_Position_selectAllTableAdapter().pro_Position_getName(id).ToString();
         }
    }
}
