using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nothing
{
    public partial class AHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetStatistics();
            }

        }
        private void GetStatistics()
        {
            string connString = ConfigurationManager.ConnectionStrings["vote"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Query to get total users
                string queryTotalUsers = "SELECT COUNT(*) FROM voting";
                using (SqlCommand cmd = new SqlCommand(queryTotalUsers, conn))
                {
                    int totalUsers = (int)cmd.ExecuteScalar();
                    lblTotalUsers.Text = totalUsers.ToString();
                }

                // Query to get total votes cast
                string queryTotalVotes = "SELECT COUNT(*) FROM voting";
                using (SqlCommand cmd = new SqlCommand(queryTotalVotes, conn))
                {
                    int totalVotes = (int)cmd.ExecuteScalar();
                    lblTotalVotes.Text = totalVotes.ToString();
                }

                // Count active sessions (Assuming you are tracking sessions in the database)
                //string queryActiveSessions = "SELECT COUNT(*) FROM Sessions WHERE IsActive = 1";
                //using (SqlCommand cmd = new SqlCommand(queryActiveSessions, conn))
                //{
                //    int activeSessions = Application["ActiveSessions"] != null ? (int)Application["ActiveSessions"]: 0;
                //    lblActiveSessions.Text = activeSessions.ToString();
                //}

                conn.Close();
            }
        }
    }
}