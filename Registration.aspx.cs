using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using static System.Net.Mime.MediaTypeNames;
using System.ComponentModel.Design;

namespace Nothing
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void register_Click(object sender, EventArgs e)
        {
            string name = fullname.Text;
            string id = voterid.Text;
            string city = txtcity.Text;
            string emailid = email.Text;
            string password = pass.Text;
            string cpassword = cpass.Text;

            string query = "INSERT INTO voting VALUES (@fullname, @voterid, @txtcity, @email, @pass, @cpass)";

            //string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["vote"].ConnectionString;
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["vote"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@fullname", name);
                    cmd.Parameters.AddWithValue("@voterid", id);
                    cmd.Parameters.AddWithValue("@txtcity", city);
                    cmd.Parameters.AddWithValue("@email", emailid);
                    cmd.Parameters.AddWithValue("@pass", password);
                    cmd.Parameters.AddWithValue("@cpass", cpassword);

                    // Open the connection and execute the query
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Registration failed!";
                    }
                }
            }
        }
    }
}