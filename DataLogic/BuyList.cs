using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataLogic
{
    public class BuyList
    {
        public DataTable getTable()
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_buy_selectAllTableAdapter().GetData();
        }

        public void insert(DateTime Date,Decimal ExRate,Int32 Buyer)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_buy_selectAllTableAdapter().Insert(Date, ExRate, Buyer);
        }

        public void insertDetail(int id,int pid,int sid,int qty,decimal price)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_bDetail_selectallTableAdapter().Insert(id, pid, sid, qty, price);
        }

        public int getVouID(DateTime datetime,int id)
        {
         return (Int32) new DATASOURCE.DataSet1TableAdapters.pro_buy_selectAllTableAdapter().pro_buy_getVou(datetime, id);
        }
    }
}
