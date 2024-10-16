using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Nothing
{
    public partial class Voting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in by checking if session data exists
                if (Session["vid"] == null)
                {
                    // If not logged in, redirect to login page
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    // Display user's name and email from session variables
                    lblvname.Text = Session["vname"].ToString();
                    lblvemail.Text = Session["vemail"].ToString();
                    lblvcity.Text = Session["vcity"].ToString();
                }
            }
        }
        protected void btnVote_click(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            string selectedParty = clickedButton.CommandArgument;
            string vid = Session["vid"].ToString();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["vote"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO voting_data VALUES(@vid,@p_name,@vote_time)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@vid", vid);
                    cmd.Parameters.AddWithValue("@p_name", selectedParty);
                    cmd.Parameters.AddWithValue("@vote_time", DateTime.Now);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Your vote has been submitted successfully!');</script>");
                    Response.Redirect("ThankYou.aspx");

                }

                //protected void btnp1_Click(object sender, EventArgs e)
                //{


                //}

                //protected void btnp2_Click(object sender, EventArgs e)
                //{

                //}
                //protected void btnp3_Click(object sender, EventArgs e)
                //{

                //}
                //protected void btnp4_Click(object sender, EventArgs e)
                //{

                //}
            }
        }
    }
}