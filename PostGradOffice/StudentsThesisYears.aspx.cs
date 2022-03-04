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
    public partial class StudentsThesisYears : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand ViewSupStudentsYears = new SqlCommand("ViewSupStudentsYears", conn);
            ViewSupStudentsYears.CommandType = CommandType.StoredProcedure;
            String id = Session["users"].ToString();
            int i = Int32.Parse(id);
            ViewSupStudentsYears.Parameters.Add(new SqlParameter("@supervisorID", i));

            conn.Open();
            SqlDataReader rdr = ViewSupStudentsYears.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                String firstName = rdr.GetString(rdr.GetOrdinal("firstName"));
                Label fname = new Label();
                fname.Text = "<br />" + "Student First Name : " + firstName;
                form1.Controls.Add(fname);

                String lastName = rdr.GetString(rdr.GetOrdinal("lastName"));
                Label lname = new Label();
                lname.Text = "<br />" + "Student Last Name : " + lastName;
                form1.Controls.Add(lname);

                int years = rdr.GetInt32(rdr.GetOrdinal("years"));
                Label y = new Label();
                y.Text = "<br />" + "Thesis years : " + years.ToString() +" years.";
                form1.Controls.Add(y);
            }
            Response.Write(Session["user"]);
        }
    }
}