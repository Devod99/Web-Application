using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nothing
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get user input from login form
            string id = txtvid.Text;
            string pass = txtpass.Text;


            // Get connection string from Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["vote"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT v_id,v_name,v_city,v_email FROM voting WHERE v_id = @id AND v_pass = @pass";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@pass", pass);

                    // Open the connection
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    // Execute the query and get the result
                    //var result = cmd.ExecuteScalar();

                    if (rdr.Read())
                    {
                        //int vid = (int)rdr["v_id"];
                        string vid = rdr["v_id"].ToString();
                        string vname = rdr["v_name"].ToString();
                        string vemail = rdr["v_email"].ToString();
                        string vcity = rdr["v_city"].ToString();
                        //bool isVoting = (bool)rdr["is_voting"];

                        Session["vname"] = vname;
                        Session["vid"] = vid;
                        Session["vemail"] = vemail;
                        Session["vcity"] = vcity;
                        //Session["isVoting"] = isVoting;
                        //if (Voting)
                        //{
                        //    Response.Redirect("Voting.aspx");
                        //}
                        //else
                        //{
                        //    Response.Redirect("Home.aspx");
                        //}
                        Response.Redirect("Voting.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid login credentials!";
                    }
                }
            }
        }
    }
}