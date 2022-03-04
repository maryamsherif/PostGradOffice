using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostGradOffice
{
    public partial class ThesisInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand ViewMyThesis = new SqlCommand("ViewMyThesis", conn);
            ViewMyThesis.CommandType = CommandType.StoredProcedure;
            String id = Session["users"].ToString();
            int i = Int32.Parse(id);
            ViewMyThesis.Parameters.Add(new SqlParameter("@studentId", i));

            conn.Open();
            SqlDataReader rdr = ViewMyThesis.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                
                int serialNumber = rdr.GetInt32(rdr.GetOrdinal("serialNumber"));
                Label snum = new Label();
                snum.Text = "<br />" + "My Thesis serial number : " + "\n" + serialNumber.ToString();
                form1.Controls.Add(snum);

                String field = rdr.GetString(rdr.GetOrdinal("field"));
                Label fld = new Label();
                fld.Text = "<br />" + "Thesis field : " + "\n" + field;
                form1.Controls.Add(fld);

                String type = rdr.GetString(rdr.GetOrdinal("type"));
                Label t = new Label();
                t.Text = "<br />" + "Thesis Type : " + "\n" + type;
                form1.Controls.Add(t);


                String title = rdr.GetString(rdr.GetOrdinal("title"));
                Label tit = new Label();
                tit.Text = "<br />" + "Thesis title is : " + "\n" + title;
                form1.Controls.Add(tit);

                DateTime startDate = rdr.GetDateTime(rdr.GetOrdinal("startDate"));
                Label sD = new Label();
                sD.Text = "<br />" + "Thesis Start Date : " + "\n" + startDate.ToString();
                form1.Controls.Add(sD);

                DateTime endDate = rdr.GetDateTime(rdr.GetOrdinal("endDate"));
                Label eD = new Label();
                eD.Text = "<br />" + "Thesis End Date : " + "\n" + endDate.ToString();
                form1.Controls.Add(eD);


                DateTime defenseDate = rdr.GetDateTime(rdr.GetOrdinal("defenseDate"));
                Label dD = new Label();
                dD.Text = "<br />" + "Defense Date : " + "\n" + defenseDate.ToString();
                form1.Controls.Add(dD);

                int years = rdr.GetInt32(rdr.GetOrdinal("years"));
                Label y = new Label();
                y.Text = "<br />" + "Years : " + "\n" + years.ToString();
                form1.Controls.Add(y);

                Decimal grade = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                Label g = new Label();
                g.Text = "<br />" + "Grade : " + "\n" + grade.ToString();
                form1.Controls.Add(g);

                int payment_id = rdr.GetInt32(rdr.GetOrdinal("payment_id"));
                Label pay = new Label();
                pay.Text = "<br />" + "Payment id : " + "\n" + payment_id.ToString();
                form1.Controls.Add(pay);

                int noOfExtensions = rdr.GetInt32(rdr.GetOrdinal("noOfExtensions"));
                Label nE = new Label();
                nE.Text = "<br />"+"Number of extensions : " + "\n" + noOfExtensions.ToString();
                form1.Controls.Add(nE);

            }
            Response.Write(Session["user"]);

        }
    }
}