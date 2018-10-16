using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DataLogic
{
    public class Expense
    {
        public DataTable SelectAll() 
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_Exp_selectAllTableAdapter().GetData();
        }

        public void Insert(int eid,int Position,string sub,string location,DateTime vou_Date,Decimal cashDisburse,int Approved,int Submitted,int Reg)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_Exp_selectAllTableAdapter().pro_EXP_Insert(eid, Position,sub, location, vou_Date, cashDisburse, Approved, Submitted, Reg);
        }

        public Int32 getVouID(int eid,DateTime date,Decimal cash)
        { 
            return Int32.Parse(new DATASOURCE.DataSet1TableAdapters.pro_Exp_selectAllTableAdapter().pro_exp_getVouID(eid,date,cash).ToString());
        }

        public DataTable getVou(int i)
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_Exp_selectAllTableAdapter().GetDataBy3(i);
        }

        public void update(int Exp_VouID,int position,int EmpID,String sub,String location,DateTime vou_Date,Decimal cashdisburse,int Approved,int Submitted,int Reg)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_Exp_selectAllTableAdapter().pro_EXP_Update(Exp_VouID, position, EmpID, sub, location, vou_Date, cashdisburse, Approved, Submitted, Reg);
        }

    }
}
