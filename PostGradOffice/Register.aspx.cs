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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void fnamet_TextChanged(object sender, EventArgs e)
        {

        }

        protected void regist_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            
            String fn = fnamet.Text;
            String ln = lnamet.Text;
            String pass = passwt.Text;
            String faculty = fact.Text;
            int gbit = Int16.Parse(guct.Text);
            String email = emailt.Text;
            String address = addresst.Text;



            SqlCommand studentRegister = new SqlCommand("studentRegister", conn);
            studentRegister.CommandType = CommandType.StoredProcedure;
            studentRegister.Parameters.Add(new SqlParameter("@first_name", fn));
            studentRegister.Parameters.Add(new SqlParameter("@last_name", ln));
            studentRegister.Parameters.Add(new SqlParameter("@password", pass));
            studentRegister.Parameters.Add(new SqlParameter("@faculty", faculty));
            studentRegister.Parameters.Add(new SqlParameter("@Gucian", gbit));
            studentRegister.Parameters.Add(new SqlParameter("@email", email));
            studentRegister.Parameters.Add(new SqlParameter("@address", address));

            conn.Open();
            studentRegister.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }

        protected void supregister_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            String fns = fnamest.Text;
            String lns = lnamest.Text;
            String pws = pwst.Text;
            String facs = fst.Text;
            String emails = emailst.Text;
                

            SqlCommand supervisorRegister = new SqlCommand("supervisorRegister", conn);
            supervisorRegister.CommandType = CommandType.StoredProcedure;
            supervisorRegister.Parameters.Add(new SqlParameter("@first_name", fns));
            supervisorRegister.Parameters.Add(new SqlParameter("@last_name", lns));
            supervisorRegister.Parameters.Add(new SqlParameter("@password", pws));
            supervisorRegister.Parameters.Add(new SqlParameter("@faculty", facs));
            supervisorRegister.Parameters.Add(new SqlParameter("@email", emails));
          

            conn.Open();
            supervisorRegister.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }

        protected void examiner_reg(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            String fns = fexam.Text;
            String field = fieldexam.Text;
            String pws = passexam.Text;
            String facs = facexam.Text;
            String emails = emailexam.Text;


            SqlCommand examinerRegister = new SqlCommand("examinerRegister", conn);
            examinerRegister.CommandType = CommandType.StoredProcedure;
            examinerRegister.Parameters.Add(new SqlParameter("@email", emails));
            examinerRegister.Parameters.Add(new SqlParameter("@password", pws));
            examinerRegister.Parameters.Add(new SqlParameter("@name", fns));
            examinerRegister.Parameters.Add(new SqlParameter("@fieldOfWork", field));
            examinerRegister.Parameters.Add(new SqlParameter("@isNational", facs));
          


            conn.Open();
            examinerRegister.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");

        }
    }
}