using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace PostGradOffice
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            String email = username.Text;
            String pass = password.Text;

            SqlCommand userLogin = new SqlCommand("userLogin", conn);
            userLogin.CommandType = CommandType.StoredProcedure;
            userLogin.Parameters.Add(new SqlParameter("@email", email));
            userLogin.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter success = userLogin.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter type = userLogin.Parameters.Add("@type", SqlDbType.Int);
            SqlParameter id = userLogin.Parameters.Add("@id", SqlDbType.Int);

            success.Direction = ParameterDirection.Output;
            type.Direction = ParameterDirection.Output;
            id.Direction = ParameterDirection.Output;

            conn.Open();
            userLogin.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "1")
            {
                Session["users"] = id.Value.ToString();
                //string i = Session["users"].ToString();
                //Response.Write(i);

                if (type.Value.ToString() == "0")
                {
                    Response.Redirect("Gucian.aspx");

                }
                if (type.Value.ToString() == "1")
                {
                    Response.Redirect("NonGuican.aspx");

                }
                if (type.Value.ToString() == "2")
                {
                    Response.Redirect("Admin.aspx");

                }
                if (type.Value.ToString() == "3")
                {
                    Response.Redirect("Supervisor.aspx");

                }
                if (type.Value.ToString() == "4")
                {
                    Response.Redirect("Examiner.aspx");

                }
            }
            else
                if (success.Value.ToString() == "0")
            {
                Response.Redirect("Register.aspx");

            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void username_TextChanged(object sender, EventArgs e)
        {

        }

        protected void register(object sender, EventArgs e)
        {

        }

        protected void signupsupervisor_Click(object sender, EventArgs e)
        {

        }
    }
}