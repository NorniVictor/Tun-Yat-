using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataLogic
{
    public class DetailDailySale
    {
        public void Insert(int vouid,int no,DateTime date,string descr,decimal acre,decimal fuel,string implement,DateTime un_start,DateTime un_end,DateTime pro_start,DateTime pro_end,String Remark)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_DetailDailySale_SelectAllTableAdapter().Insert(vouid, no, date, descr, acre, fuel, implement, un_start, un_end, pro_start, pro_end, Remark);
        }

        public DataTable getTable(int vouid)
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_DetailDailySale_SelectAllTableAdapter().GetDataBy(vouid);
        }

        public void Update(int vouid,int no,DateTime date,String descr,decimal acre,decimal fuel,String implement,DateTime un_start,DateTime un_end,DateTime pro_start,DateTime pro_end,String Remark)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_DetailDailySale_SelectAllTableAdapter().Update(vouid, no, date, descr, acre, fuel, implement, un_start, un_end, pro_start, pro_end, Remark);
        }
    }
}
