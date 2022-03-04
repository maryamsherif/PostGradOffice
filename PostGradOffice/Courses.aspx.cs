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
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand ViewCoursesGrades = new SqlCommand("ViewCoursesGrades", conn);
            ViewCoursesGrades.CommandType = CommandType.StoredProcedure;
            String id = Session["users"].ToString();
            int i = Int32.Parse(id);
            ViewCoursesGrades.Parameters.Add(new SqlParameter("@studentId", i));

            conn.Open();
            SqlDataReader rdr = ViewCoursesGrades.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {



                String code = rdr.GetString(rdr.GetOrdinal("code"));
                Label cd = new Label();
                cd.Text = "<br />"+"My Courses : " + code;
                form1.Controls.Add(cd);

                Decimal grade = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                Label g = new Label();
                g.Text = "<br />"+"My Courses Grades : " + grade.ToString();
                form1.Controls.Add(g);

            }
        }
    }
}