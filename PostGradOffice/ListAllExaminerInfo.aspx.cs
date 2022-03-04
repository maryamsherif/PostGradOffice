using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostGradOffice
{
    public partial class ListAllExaminerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            //create proc ListAll
            //@ExaminerID int

            SqlCommand ListAll = new SqlCommand("ListAll", conn);
            ListAll.CommandType = CommandType.StoredProcedure;
            String id = Session["users"].ToString();
            int i = Int32.Parse(id);
            ListAll.Parameters.Add(new SqlParameter("@ExaminerID", i));


            conn.Open();
            SqlDataReader rdr = ListAll.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                String title = rdr.GetString(rdr.GetOrdinal("title"));
                Label fname = new Label();
                fname.Text = "<br />" + "Thesis title : " + title;
                form1.Controls.Add(fname);

                String name = rdr.GetString(rdr.GetOrdinal("name"));
                Label lname = new Label();
                lname.Text = "<br />" + "Supervisor Name is : " + name;
                form1.Controls.Add(lname);

                String firstName = rdr.GetString(rdr.GetOrdinal("firstName"));
                Label t = new Label();
                t.Text = "<br />" + "Student name is : " + firstName;
                form1.Controls.Add(t);

            }


            //conn.Open();
            //ListAll.ExecuteNonQuery();
            //conn.Close();
        }
    }
}