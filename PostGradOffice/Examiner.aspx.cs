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
    public partial class Examiner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
           
            String name = TextBox1.Text;
            String field = TextBox2.Text;
            String email = TextBox10.Text;
            String pass = TextBox11.Text;

            String id = Session["users"].ToString();
            int eid = Int32.Parse(id);


            SqlCommand editExaminerProfile = new SqlCommand("editExaminerProfile", conn);
            editExaminerProfile.CommandType = CommandType.StoredProcedure;

            editExaminerProfile.Parameters.Add(new SqlParameter("@ExaminerID", eid));
            editExaminerProfile.Parameters.Add(new SqlParameter("@name", name));
            editExaminerProfile.Parameters.Add(new SqlParameter("@fieldOfWork", field));
            editExaminerProfile.Parameters.Add(new SqlParameter("@email", email));
            editExaminerProfile.Parameters.Add(new SqlParameter("@password", pass));

            conn.Open();
            editExaminerProfile.ExecuteNonQuery();
            conn.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
       
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int ThesisSerialNo = Int16.Parse(th1.Text);
            DateTime defenseDate = DateTime.Parse(dd1.Text);
            String comments = cmt1.Text;
            String id = Session["users"].ToString();
            int supid = Int32.Parse(id);

            SqlCommand AddCommentsGrade = new SqlCommand("AddCommentsGrade", conn);
            AddCommentsGrade.CommandType = CommandType.StoredProcedure;

            AddCommentsGrade.Parameters.Add(new SqlParameter("@ExaminerID", supid));
            AddCommentsGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
            AddCommentsGrade.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
            AddCommentsGrade.Parameters.Add(new SqlParameter("@comments", comments));

            SqlParameter success = AddCommentsGrade.Parameters.Add("@s", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            conn.Open();
            AddCommentsGrade.ExecuteNonQuery();
            conn.Close();


            if (success.Value.ToString() == "0")
            {
                Response.Write("Comment Added successfully!");
            }
            else if (success.Value.ToString() == "1")
            {
                Response.Write("This Defense is not examined by You!");
            }
           
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
          
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int ThesisSerialNo = Int32.Parse(th2.Text);
            DateTime defenseDate = DateTime.Parse(dd2.Text);
            Decimal grade = Decimal.Parse(grd2.Text);


            SqlCommand AddDefenseGrade = new SqlCommand("AddDefenseGrade", conn);
            AddDefenseGrade.CommandType = CommandType.StoredProcedure;

            AddDefenseGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
            AddDefenseGrade.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
            AddDefenseGrade.Parameters.Add(new SqlParameter("@grade", grade));


            conn.Open();
            AddDefenseGrade.ExecuteNonQuery();
            conn.Close();


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListAllExaminerInfo.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String key = key1.Text;
            Session["keyword"] = key;
            Response.Redirect("SearchThesis.aspx");
        }
    }
}