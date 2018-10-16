using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DataLogic
{
    public class StaffCalim
    {
        public void Insert(string refno,int checkedby,int approved,int received,int submitted,DateTime date,int day,string project,int regby)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_CS_selectAllTableAdapter().Insert(refno, checkedby, approved, received, submitted, date, day,project, regby,DateTime.Now.ToShortDateString() );
        }

        public void update(string refno,int _checked,int approved,int received,int submitted,DateTime date,string project,int regby,int day,String regdate)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_CS_selectAllTableAdapter().Update(refno, _checked, approved, received, submitted, date, project, regby, day, regdate);
        }

        public DataTable selectByRef(String reg)
        {
        return new DATASOURCE.DataSet1TableAdapters.pro_CS_selectAllTableAdapter().GetDataBy1(reg);
        }

        

    }
}
