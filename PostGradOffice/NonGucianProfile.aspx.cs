using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;

namespace PostGradOffice
{
    public partial class NonGucianProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand viewMyProfile = new SqlCommand("viewMyProfile", conn);
            viewMyProfile.CommandType = CommandType.StoredProcedure;
            String id = Session["users"].ToString();
            int i = Int32.Parse(id);
            viewMyProfile.Parameters.Add(new SqlParameter("@studentId", i));

            conn.Open();
            SqlDataReader rdr = viewMyProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int i_d = rdr.GetInt32(rdr.GetOrdinal("id"));
                Label sid = new Label();
                sid.Text = "<br />"+ "My id is : " + i_d.ToString();
                form1.Controls.Add(sid);

                String firstName = rdr.GetString(rdr.GetOrdinal("firstName"));
                Label fname = new Label();
                fname.Text = "<br />"+ "My First Name : " + firstName;
                form1.Controls.Add(fname);

                String lastName = rdr.GetString(rdr.GetOrdinal("lastName"));
                Label lname = new Label();
                lname.Text = "<br />"+ "My Last Name : " + lastName;
                form1.Controls.Add(lname);

                String type = rdr.GetString(rdr.GetOrdinal("type"));
                Label t = new Label();
                t.Text = "<br />"+"User Type : " + type;
                form1.Controls.Add(t);

                String faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                Label fac = new Label();
                fac.Text = "<br />"+ "My faculty : " +faculty;
                form1.Controls.Add(fac);

                String address = rdr.GetString(rdr.GetOrdinal("address"));
                Label ad = new Label();
                ad.Text = "<br />"+"My Address is : " + address;
                form1.Controls.Add(ad);

                Decimal GPA = rdr.GetDecimal(rdr.GetOrdinal("GPA"));
                Label g = new Label();
                g.Text = "<br />"+"My GPA is : " + GPA.ToString();
                form1.Controls.Add(g);


            }
            Response.Write(Session["user"]);

        }
    }
}

