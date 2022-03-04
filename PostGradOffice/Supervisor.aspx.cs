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
    public partial class Supervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentsThesisYears.aspx");
        }

        protected void sidp_Click(object sender, EventArgs e)
        {
            String sid = sid1.Text;
            Session["students"] = sid;

            Response.Redirect("StudentPublication.aspx");
        }

        protected void addDef_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            String gucian = gucianBox.Text;

            int thesisSNum = Int16.Parse(th1.Text);
            DateTime defDate = DateTime.Parse(dd1.Text);
            String defLoc = dl1.Text;


            if (gucian == "yes")
            {
                SqlCommand AddDefenseGucian = new SqlCommand("AddDefenseGucian", conn);
                AddDefenseGucian.CommandType = CommandType.StoredProcedure;
                AddDefenseGucian.Parameters.Add(new SqlParameter("@ThesisSerialNo ", thesisSNum));
                AddDefenseGucian.Parameters.Add(new SqlParameter("@DefenseDate", defDate));
                AddDefenseGucian.Parameters.Add(new SqlParameter("@DefenseLocation", defLoc));

                conn.Open();
                AddDefenseGucian.ExecuteNonQuery();
                conn.Close();

                Response.Write("Defense Added Successfully for GUCian Student!");
            }
            else
            {
                SqlCommand AddDefenseNonGucian = new SqlCommand("AddDefenseNonGucian", conn);
                AddDefenseNonGucian.CommandType = CommandType.StoredProcedure;
                AddDefenseNonGucian.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesisSNum));
                AddDefenseNonGucian.Parameters.Add(new SqlParameter("@DefenseDate", defDate));
                AddDefenseNonGucian.Parameters.Add(new SqlParameter("@DefenseLocation", defLoc));

                conn.Open();
                AddDefenseNonGucian.ExecuteNonQuery();
                conn.Close();

                Response.Write("Defense Added Successfully for Non-GUCian Student!");
            }
        }

        protected void addExaminer2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);




            int thesisSNum = Int16.Parse(th2.Text);
            DateTime defDate = DateTime.Parse(dd2.Text);
            String examName = e2.Text;
            String examPass = pass2.Text;
            String nat = nat2.Text;
            String examField = f2.Text;


            SqlCommand AddExaminer = new SqlCommand("AddExaminer", conn);
            AddExaminer.CommandType = CommandType.StoredProcedure;


            if (nat == "yes")
            {
                string mystring = "true";
                bool value = Convert.ToBoolean(mystring);

                AddExaminer.Parameters.Add(new SqlParameter("@ThesisSerialNo ", thesisSNum));
                AddExaminer.Parameters.Add(new SqlParameter("@DefenseDate", defDate));
                AddExaminer.Parameters.Add(new SqlParameter("@ExaminerName", examName));
                AddExaminer.Parameters.Add(new SqlParameter("@Password ", examPass));
                AddExaminer.Parameters.Add(new SqlParameter("@National", value));
                AddExaminer.Parameters.Add(new SqlParameter("@fieldOfWork", examField));
                Response.Write("Egyptian Examiner added successfully for a Defense");
            }
            else
            {
                string mystring = "false";
                bool value = Convert.ToBoolean(mystring);

                AddExaminer.Parameters.Add(new SqlParameter("@ThesisSerialNo ", thesisSNum));
                AddExaminer.Parameters.Add(new SqlParameter("@DefenseDate", defDate));
                AddExaminer.Parameters.Add(new SqlParameter("@ExaminerName", examName));
                AddExaminer.Parameters.Add(new SqlParameter("@Password ", examPass));
                AddExaminer.Parameters.Add(new SqlParameter("@National", value));
                AddExaminer.Parameters.Add(new SqlParameter("@fieldOfWork", examField));
                Response.Write("Non-Egyptian Examiner added successfully for a Defense");
            }

            conn.Open();
            AddExaminer.ExecuteNonQuery();
            conn.Close();

        }

        protected void evaluateProg_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            String id = Session["users"].ToString();
            int supid = Int32.Parse(id);
            int thesisSNum = Int16.Parse(th3.Text);
            int progNo = Int16.Parse(prog3.Text);
            int eval = Int16.Parse(eval3.Text);

            SqlCommand EvaluateProgressReport = new SqlCommand("EvaluateProgressReport", conn);
            EvaluateProgressReport.CommandType = CommandType.StoredProcedure;
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@supervisorID ",supid));
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo ", thesisSNum));
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", progNo));
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@evaluation", eval));

            SqlParameter success = EvaluateProgressReport.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            
            conn.Open();
            EvaluateProgressReport.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "0")
            {
                Response.Write ("Progress Report Evaluated Successfully!");
            }
            else if (success.Value.ToString() == "1")
            {
               Response.Write("This Progress Report is not supervised by You!");
            }
            else if (success.Value.ToString() == "2")
            {
                Response.Write ("Evaluation must be between 0 to 3!");
            }
            else if (success.Value.ToString() == "3")
            {
                Response.Write ("Progress report not found!");

            }
            

            }

        protected void cancelThesis_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

        
            int thesisSNum = Int16.Parse(th4.Text);
        

            SqlCommand CancelThesis = new SqlCommand("CancelThesis", conn);
            CancelThesis.CommandType = CommandType.StoredProcedure;

            CancelThesis.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesisSNum));

            SqlParameter success = CancelThesis.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


            conn.Open();
            CancelThesis.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "0")
            {
                Response.Write("Thesis Cancelled Successfully!");
            }
            else if (success.Value.ToString() == "1")
            {
                Response.Write("last evaluation must be zero !");
            }
            else if (success.Value.ToString() == "1")
            {
                Response.Write("Thesis serial Number is invalid!");
            }


        }
    }

}