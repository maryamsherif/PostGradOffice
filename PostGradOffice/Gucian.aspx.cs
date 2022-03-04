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
    public partial class Gucian : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        

        }


        protected void gucian(object sender, EventArgs e)
        {
            String id = Session["users"].ToString(); 
            int i = Int32.Parse(id);
            Response.Write(i);

            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection NO
            SqlConnection conn = new SqlConnection(connStr);


            String mob = Atele.Text;

            SqlCommand addMobile = new SqlCommand("addMobile", conn);
            addMobile.CommandType = CommandType.StoredProcedure;
            addMobile.Parameters.Add(new SqlParameter("@ID", i));
            addMobile.Parameters.Add(new SqlParameter("@mobile_number", mob));

            conn.Open();
            addMobile.ExecuteNonQuery();
            conn.Close();


        }



        protected void gucianp(object sender, EventArgs e)
        {
          Response.Redirect("GucProfile.aspx");
            
        }

        protected void viewthesis_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThesisInfo.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

                int thesisSNum = Int16.Parse(th1.Text);
                DateTime progDate = DateTime.Parse(prep1.Text);
                int progNo = Int16.Parse(prno1.Text);
                String id = Session["users"].ToString();
                int sid = Int32.Parse(id);


            SqlCommand AddProgressReport = new SqlCommand("AddProgressReport", conn);
            AddProgressReport.CommandType = CommandType.StoredProcedure;

            AddProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", thesisSNum));
            AddProgressReport.Parameters.Add(new SqlParameter("@progressReportDate", progDate));
            AddProgressReport.Parameters.Add(new SqlParameter("@studentID ", sid));
            AddProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", progNo));
      
            conn.Open();
            AddProgressReport.ExecuteNonQuery();
            conn.Close();

            Response.Write("Progress Report Added Successfully!");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            int thesisSNum = Int16.Parse(th2.Text);
            int progNo = Int16.Parse(prno2.Text);
            int stat = Int16.Parse(state2.Text);
            String desc = desc2.Text;
            String id = Session["users"].ToString();
            int sid = Int32.Parse(id);



            SqlCommand FillProgressReport = new SqlCommand("FillProgressReport", conn);
            FillProgressReport.CommandType = CommandType.StoredProcedure;

            FillProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", thesisSNum));
            FillProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", progNo));
            FillProgressReport.Parameters.Add(new SqlParameter("@state", stat));
            FillProgressReport.Parameters.Add(new SqlParameter("@description", desc));
            FillProgressReport.Parameters.Add(new SqlParameter("@studentID ", sid));
            
            conn.Open();
            FillProgressReport.ExecuteNonQuery();
            conn.Close();

            Response.Write("Progress Report Filled Successfully!");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);




            String tit = title3.Text;
            DateTime pDate = DateTime.Parse(pubD3.Text);
            String hst = host3.Text;
            String plc = place3.Text;
            String acc = acc3.Text;


            SqlCommand addPublication = new SqlCommand("addPublication", conn);
            addPublication.CommandType = CommandType.StoredProcedure;


            //SqlParameter id = addPublication.Parameters.Add("@pubID", SqlDbType.Int);
            //id.Direction = ParameterDirection.Output;

            //Session["publications"] = id.Value.ToString();
           

            if (acc == "yes")
            {
                

                string mystring = "true";
                bool value = Convert.ToBoolean(mystring);

                addPublication.Parameters.Add(new SqlParameter("@title", tit));
                addPublication.Parameters.Add(new SqlParameter("@pubDate", pDate));
                addPublication.Parameters.Add(new SqlParameter("@host", hst));
                addPublication.Parameters.Add(new SqlParameter("@place", plc));
                addPublication.Parameters.Add(new SqlParameter("@accepted", value));

            }

            else
            {
              

                string mystring = "false";
                bool value = Convert.ToBoolean(mystring);

                addPublication.Parameters.Add(new SqlParameter("@title", tit));
                addPublication.Parameters.Add(new SqlParameter("@pubDate", pDate));
                addPublication.Parameters.Add(new SqlParameter("@host", hst));
                addPublication.Parameters.Add(new SqlParameter("@place", plc));
                addPublication.Parameters.Add(new SqlParameter("@accepted", value));

                
            }

            conn.Open();
            addPublication.ExecuteNonQuery();
            conn.Close();

            SqlCommand getIDPublication = new SqlCommand("getIDPublication", conn);
            getIDPublication.CommandType = CommandType.StoredProcedure;

            getIDPublication.Parameters.Add(new SqlParameter("@title", tit));
            getIDPublication.Parameters.Add(new SqlParameter("@pubDate", pDate));
            getIDPublication.Parameters.Add(new SqlParameter("@host", hst));
            getIDPublication.Parameters.Add(new SqlParameter("@place", plc));

            SqlParameter id = getIDPublication.Parameters.Add("@id", SqlDbType.Int);
            id.Direction = ParameterDirection.Output;

            if (acc == "yes")
            {


                string mystring = "true";
                bool value = Convert.ToBoolean(mystring);

                getIDPublication.Parameters.Add(new SqlParameter("@accepted", value));

        
            }

            else
            {

                string mystring = "false";
                bool value = Convert.ToBoolean(mystring);

                getIDPublication.Parameters.Add(new SqlParameter("@accepted", value));

            }


         
            conn.Open();
            getIDPublication.ExecuteNonQuery();
            conn.Close();

            
            Session["publications"] = id.Value.ToString();
            Response.Write(Session["publications"]);

        }

        protected void Button4_Click(object sender, EventArgs e)
        {


            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            String thesisNum = th4.Text;
            String pid = Session["publications"].ToString();
            int p_id = Int32.Parse(pid);


            SqlCommand linkPubThesis = new SqlCommand("linkPubThesis", conn);
            linkPubThesis.CommandType = CommandType.StoredProcedure;


            linkPubThesis.Parameters.Add(new SqlParameter("@PubID", p_id));
            linkPubThesis.Parameters.Add(new SqlParameter("@thesisSerialNo", thesisNum));

            conn.Open();
            linkPubThesis.ExecuteNonQuery();
            conn.Close();


        }
    }
}