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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("ViewAllSupervisors.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAllTheses.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewOnGoingTheses.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            int thesisSNum = Int32.Parse(th1.Text);
            Decimal amount = Decimal.Parse(amnt1.Text);
            int noOfInst = Int32.Parse(noinst1.Text);
            Decimal fund = Decimal.Parse(fund1.Text);

    

            SqlCommand AdminIssueThesisPayment = new SqlCommand("AdminIssueThesisPayment", conn);
            AdminIssueThesisPayment.CommandType = CommandType.StoredProcedure;

            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesisSNum));
            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@amount", amount));
            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@noOfInstallments", noOfInst));
            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@fundPercentage", fund));

            Response.Write("Payment issued successfully!");
          
            conn.Open();
            AdminIssueThesisPayment.ExecuteNonQuery();
            conn.Close();

        }

        protected void Button5_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            int paymentID = Int16.Parse(pid1.Text);
            DateTime instDate = DateTime.Parse(idate1.Text);
        
            SqlCommand AdminIssueInstallPayment = new SqlCommand("AdminIssueInstallPayment", conn);
            AdminIssueInstallPayment.CommandType = CommandType.StoredProcedure;

            AdminIssueInstallPayment.Parameters.Add(new SqlParameter("@paymentID", paymentID));
            AdminIssueInstallPayment.Parameters.Add(new SqlParameter("@InstallStartDate", instDate));
      

            Response.Write("Installment issued successfully!");

            conn.Open();
            AdminIssueInstallPayment.ExecuteNonQuery();
            conn.Close();

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            int ThesisSerialNo = Int16.Parse(th4.Text);
           

            SqlCommand AdminUpdateExtension = new SqlCommand("AdminUpdateExtension", conn);
            AdminUpdateExtension.CommandType = CommandType.StoredProcedure;

            AdminUpdateExtension.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));


            Response.Write("Thesis extended successfully!");

            conn.Open();
            AdminUpdateExtension.ExecuteNonQuery();
            conn.Close();

        }
    }
}