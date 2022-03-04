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
    public partial class StudentPublication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Session["students"].ToString();
            int sid = Int32.Parse(id);


            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand ViewAStudentPublications = new SqlCommand("ViewAStudentPublications", conn);
            ViewAStudentPublications.CommandType = CommandType.StoredProcedure;
            ViewAStudentPublications.Parameters.Add(new SqlParameter("@StudentID", sid));

            conn.Open();
            SqlDataReader rdr = ViewAStudentPublications.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int i_d = rdr.GetInt32(rdr.GetOrdinal("id"));
                Label pid = new Label();
                pid.Text = "<br />" + "Publication ID is : " + i_d.ToString();
                form1.Controls.Add(pid);

                String title = rdr.GetString(rdr.GetOrdinal("title"));
                Label t = new Label();
                t.Text = "<br />" + "Publication title is : " + title;
                form1.Controls.Add(t);

                DateTime datePub = rdr.GetDateTime(rdr.GetOrdinal("dateOfPublication"));
                Label dp = new Label();
                dp.Text = "<br />" + "Date of publication is : " + datePub.ToString();
                form1.Controls.Add(dp);

                String place = rdr.GetString(rdr.GetOrdinal("place"));
                Label plc = new Label();
                plc.Text = "<br />" + "Publication Location is : " + place;
                form1.Controls.Add(plc);

                Boolean ac = rdr.GetBoolean(rdr.GetOrdinal("accepted"));
                String accepted = ac.ToString();
                Label acc = new Label();

                if (accepted == "1")
                     {
                        acc.Text = "<br />" + "Acceptance state : " + "Accepted";
                     }
                 else
                     {
                       acc.Text = "<br />" + "Acceptance state : " + "Rejected";
                     }
                form1.Controls.Add(acc);

                String host = rdr.GetString(rdr.GetOrdinal("host"));
                Label h = new Label();
                h.Text = "<br />" + "The name of the host is : " + host;
                form1.Controls.Add(h);

            }
            Response.Write(Session["user"]);

        }
    }
}