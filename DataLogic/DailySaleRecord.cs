using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace DataLogic
{
    public class DailySaleRecord
    {
        public void INsert(int eid,String loc,String machine,String Brand,int supplier,int sr,int jur,DateTime date)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_dailySale_selectAllTableAdapter().Insert(eid, loc, machine, Brand, supplier, sr, jur, date);
        }

        public int getID(DateTime date)
        {          
           
           return (Int32)new DATASOURCE.DataSet1TableAdapters.pro_dailySale_selectAllTableAdapter().pro_DailySale_getVouID(date);          
            
        }

        public DataTable getVou(int vouid)
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_dailySale_selectAllTableAdapter().GetDataBy1(vouid);
        }
    }
}
