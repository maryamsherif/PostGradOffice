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
    public partial class SearchThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);



            SqlCommand SearchThesis = new SqlCommand("SearchThesis", conn);
            SearchThesis.CommandType = CommandType.StoredProcedure;
            
            String id = Session["users"].ToString();
            int i = Int32.Parse(id);
            SearchThesis.Parameters.Add(new SqlParameter("@ExaminerID", i));

            String key = Session["keyword"].ToString();
            SearchThesis.Parameters.Add(new SqlParameter("@Keyword", key));

            conn.Open();
            SqlDataReader rdr = SearchThesis.ExecuteReader(CommandBehavior.CloseConnection);
           

            while (rdr.Read())
            {

                int serialNumber = rdr.GetInt32(rdr.GetOrdinal("serialNumber"));
                Label sn = new Label();
                sn.Text = "<br />" + "Thesis serial number is : " + serialNumber.ToString();
                form1.Controls.Add(sn);

                String field = rdr.GetString(rdr.GetOrdinal("field"));
                Label fd = new Label();
                fd.Text = "<br />" + "Thesis field is : " + field;
                form1.Controls.Add(fd);

                String type = rdr.GetString(rdr.GetOrdinal("type"));
                Label tt = new Label();
                tt.Text = "<br />" + "Thesis type is : " + type;
                form1.Controls.Add(tt);

                //String title = rdr.GetString(rdr.GetOrdinal("title"));
                //Label t = new Label();
                //t.Text = "<br />" + "Thesis title is : " + title;
                //form1.Controls.Add(t);

                DateTime startDate = rdr.GetDateTime(rdr.GetOrdinal("startDate"));
                Label sd = new Label();
                sd.Text = "<br />" + "Thesis start date is : " + startDate.ToString();
                form1.Controls.Add(sd);

                DateTime endDate = rdr.GetDateTime(rdr.GetOrdinal("endDate"));
                Label eD = new Label();
                eD.Text = "<br />" + "Thesis end date is : " + endDate.ToString();
                form1.Controls.Add(eD);

                DateTime defenseDate = rdr.GetDateTime(rdr.GetOrdinal("defenseDate"));
                Label dd = new Label();
                dd.Text = "<br />" + "Thesis Defense date is : " + defenseDate.ToString();
                form1.Controls.Add(dd);


                int years = rdr.GetInt32(rdr.GetOrdinal("years"));
                Label y = new Label();
                y.Text = "<br />" + "Thesis years are : " + years.ToString();
                form1.Controls.Add(y);


                Decimal grade = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                Label g = new Label();
                g.Text = "<br />" + "Thesis grade is : " + grade.ToString();
                form1.Controls.Add(g);

                int payment_id = rdr.GetInt32(rdr.GetOrdinal("payment_id"));
                Label pid = new Label();
                pid.Text = "<br />" + "Thesis payment ID is : " + payment_id.ToString();
                form1.Controls.Add(pid);


                int noOfExtensions = rdr.GetInt32(rdr.GetOrdinal("noOfExtensions"));
                Label nE = new Label();
                nE.Text = "<br />" + "Thesis number of extensions is : " + noOfExtensions.ToString();
                form1.Controls.Add(nE);


                
                String title = rdr.GetString(rdr.GetOrdinal("title"));
                bool b2 = string.IsNullOrEmpty(title);

                if (b2==true)
                {
                    Response.Write("No Thesis Found! ");
                }
                else
                {
                    //String title = rdr.GetString(rdr.GetOrdinal("title"));
                    Label t = new Label();
                    t.Text = "<br />" + "Thesis title is : " + title;
                    form1.Controls.Add(t);
                }

            }

           
        }
    }
}