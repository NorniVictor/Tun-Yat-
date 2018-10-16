using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataLogic
{
    public class Expense_detail
    {
        public DataTable selectall()
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_expDetail_selectallTableAdapter().GetData();
        }

        public void insert(int Exp_VouID,int No,DateTime Date,String Description,decimal Amount,String Attach_Receipt)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_expDetail_selectallTableAdapter().pro_expDetail_insert(Exp_VouID, No, Date, Description, Amount, Attach_Receipt);
        }

        public DataTable getDetailVou(int i)
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_expDetail_selectallTableAdapter().GetDataBy2(i);
        }

        public void update(int Exp_VouID,int No,DateTime Date,String Description,Decimal Amount,String Attach_Receipt )
        {
            new DATASOURCE.DataSet1TableAdapters.pro_expDetail_selectallTableAdapter().pro_expDetail_Update(Exp_VouID, No, Date, Description, Amount, Attach_Receipt);
        }
    }
}
