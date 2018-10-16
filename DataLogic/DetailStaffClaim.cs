using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DataLogic
{
   public class DetailStaffClaim
    {
       public void Insert(String RefNo,int sub_no,String Title,String Desc,Decimal amount,decimal ex_rate)
       {
           new DATASOURCE.DataSet1TableAdapters.pro_CSD_selectallTableAdapter().Insert(RefNo, sub_no, Title, Desc, amount, ex_rate);
       }

       public DataTable getData(string refno)
       {
           return new DATASOURCE.DataSet1TableAdapters.pro_CSD_selectallTableAdapter().GetDataBy2(refno);
       }

       public void Update(String RefNo,int sub_no,string Title,string Desc,Decimal amount,decimal ex_rate)
       {
           new DATASOURCE.DataSet1TableAdapters.pro_CSD_selectallTableAdapter().Update(RefNo, sub_no, Title, Desc, amount, ex_rate);
       }


    }
}
