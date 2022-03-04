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
    public partial class ViewAllTheses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand AdminViewAllTheses = new SqlCommand("AdminViewAllTheses", conn);
            AdminViewAllTheses.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = AdminViewAllTheses.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                int serialNumber = rdr.GetInt32(rdr.GetOrdinal("serialNumber"));
                Label id = new Label();
                id.Text = "<br />" + "Serial Number is : " + serialNumber.ToString();
                form1.Controls.Add(id);

                String field = rdr.GetString(rdr.GetOrdinal("field"));
                Label em = new Label();
                em.Text = "<br />" + "Thesis Field is : " + field;
                form1.Controls.Add(em);

                String type = rdr.GetString(rdr.GetOrdinal("type"));
                Label t = new Label();
                t.Text = "<br />" + "Thesis type is : " + type;
                form1.Controls.Add(t);

                String title = rdr.GetString(rdr.GetOrdinal("title"));
                Label nm = new Label();
                nm.Text = "<br />" + "Thesis title is : " + title;
                form1.Controls.Add(nm);

                DateTime startDate = rdr.GetDateTime(rdr.GetOrdinal("startDate"));
                Label f = new Label();
                f.Text = "<br />" + "Thesis Start Date is : " + startDate.ToString();
                form1.Controls.Add(f);

                DateTime endDate = rdr.GetDateTime(rdr.GetOrdinal("endDate"));
                Label endD = new Label();
                endD.Text = "<br />" + "Thesis End Date is : " + endDate.ToString();
                form1.Controls.Add(endD);

                DateTime defenseDate = rdr.GetDateTime(rdr.GetOrdinal("defenseDate"));
                Label dd = new Label();
                dd.Text = "<br />" + "Defense Date is : " + defenseDate.ToString();
                form1.Controls.Add(dd);

                int years = rdr.GetInt32(rdr.GetOrdinal("years"));
                Label y = new Label();
                y.Text = "<br />" + "Thesis Years are : " + years.ToString()+" years.";
                form1.Controls.Add(y);

                decimal grade = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                Label g = new Label();
                g.Text = "<br />" + "Thesis Grade is : " + grade.ToString();
                form1.Controls.Add(g);

                int payment_id = rdr.GetInt32(rdr.GetOrdinal("payment_id"));
                Label pid = new Label();
                pid.Text = "<br />" + "Payment ID of Thesis is : " + payment_id.ToString();
                form1.Controls.Add(pid);

                int noOfExtensions = rdr.GetInt32(rdr.GetOrdinal("noOfExtensions"));
                Label nE = new Label();
                nE.Text = "<br />" + "Number of extensions is : " + noOfExtensions.ToString();
                form1.Controls.Add(nE);

            }
        }
    }
}