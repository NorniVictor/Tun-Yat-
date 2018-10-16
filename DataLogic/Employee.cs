using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DataLogic
{
    public class Employee
    {
        public DataTable employeeSelectAll()
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_Employee_selectAllTableAdapter().GetData();
        }

        public void employeeInsert(String Name,String NRC_No,String Father_name,DateTime Entrance_date,String Address,int Phone_no,DateTime Leave_date,int PositionID,String Edu)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_Employee_selectAllTableAdapter().pro_Employee_Insert(Name, NRC_No, Father_name, Entrance_date, Address, Phone_no, Leave_date, PositionID, Edu);
        }

        public void update(int EID,String Name,String NRC_No,String Father_name,DateTime Entrance_date,String Address,int Phone_no,DateTime Leave_date,int PositionID,String edu)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_Employee_selectAllTableAdapter().pro_Employee_update(EID, Name, NRC_No, Father_name, Entrance_date, Address, Phone_no, Leave_date, PositionID, edu);
        }

        public String ConvertIdToName(int id)
        {
            return new DATASOURCE.DataSet1TableAdapters.pro_Employee_selectAllTableAdapter().pro_ConvertEmpIDtoName(id).ToString();
        }
    }
}
