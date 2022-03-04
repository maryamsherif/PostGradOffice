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
    public partial class ViewAllSupervisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand AdminListSup = new SqlCommand("AdminListSup", conn);
            AdminListSup.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = AdminListSup.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                int i_d = rdr.GetInt32(rdr.GetOrdinal("id"));
                Label id = new Label();
                id.Text = "<br />" + "Supervisor ID is : " + i_d.ToString();
                form1.Controls.Add(id);

                String email = rdr.GetString(rdr.GetOrdinal("email"));
                Label em = new Label();
                em.Text = "<br />" + "Supervisor's mail is : " + email;
                form1.Controls.Add(em);

                String password = rdr.GetString(rdr.GetOrdinal("password"));
                Label pass = new Label();
                pass.Text = "<br />" + "Supervisor's password is : " + password;
                form1.Controls.Add(pass);

                String name = rdr.GetString(rdr.GetOrdinal("name"));
                Label nm = new Label();
                nm.Text = "<br />" + "Supervisor's name is : " + name;
                form1.Controls.Add(nm);

                String fac = rdr.GetString(rdr.GetOrdinal("faculty"));
                Label f = new Label();
                f.Text = "<br />" + "Supervisor's Faculty is : " + fac;
                form1.Controls.Add(f);
            }
        }
    }
}