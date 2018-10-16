using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace DataLogic
{
    public class password
    {
        public void Create(int eid,string username,string password,string nrc)
        {
            new DATASOURCE.DataSet1TableAdapters.pro_password_selectallTableAdapter().pro_password_create(eid,nrc, username,password);
        }

        public object getEID(String nrc)
        {              
            return new DATASOURCE.DataSet1TableAdapters.pro_Employee_selectAllTableAdapter().pro_employee_getIDFromNRC(nrc);           
        }

        public string passwordMatch(String user,String password)
        {
            try
            {
                return new DATASOURCE.DataSet1TableAdapters.pro_password_selectallTableAdapter().pro_password_match(user, password).ToString();
            }
            catch
            {
                return string.Empty;
            }
        }

        public string getNRCname(string nrc)
        {
            try
            {
                return new DATASOURCE.DataSet1TableAdapters.pro_password_selectallTableAdapter().pro_password_getNRC(nrc).ToString();
            }
            catch
            {
                return null ;
            }
        }

        public String getUsernaem(string nrc)
        {
            try
            {
                return new DATASOURCE.DataSet1TableAdapters.pro_password_selectallTableAdapter().pro_password_getUsername(nrc).ToString();
            }
            catch
            {
               return null;
            }
        }
    }
}
