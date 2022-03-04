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
    public partial class ViewOnGoingTheses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         

            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminViewOnGoingTheses = new SqlCommand("AdminViewOnGoingTheses", conn);
            AdminViewOnGoingTheses.CommandType = CommandType.StoredProcedure;

            SqlParameter thesesCount = AdminViewOnGoingTheses.Parameters.Add("@thesesCount", SqlDbType.Int);
            thesesCount.Direction = ParameterDirection.Output;

            
            conn.Open();
            AdminViewOnGoingTheses.ExecuteNonQuery();
            conn.Close();

           int x=Int32.Parse(thesesCount.Value.ToString());
            //Response.Write(x);
            Label y = new Label();
            y.Text = x.ToString();
            y.BackColor = System.Drawing.Color.Red;
            y.Height = 70;
            y.Width = 50;
            y.Font.Size = 48;
            form1.Controls.Add(y);
        }
    }
}