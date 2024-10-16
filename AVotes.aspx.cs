using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nothing
{
    public partial class AVotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // Method to bind the GridView
        private void BindGrid(string searchQuery = "")
        {
            string connStr = ConfigurationManager.ConnectionStrings["vote"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT vid, p_name, vote_time FROM voting_data";

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " WHERE p_name LIKE @SearchQuery";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                }

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                //GridViewVotingData.DataSource = dt;
                GridViewVotingData.DataBind();

                //// Calculate total votes
                //int totalVotes = 0;
                //foreach (DataRow row in dt.Rows)
                //{
                //    totalVotes += Convert.ToInt32(row["Votes"]);
                //}

                //lblTotalVotes.Text = "Total Votes: " + totalVotes.ToString();
            }
        }

        // Search filter event
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            BindGrid(searchQuery); // Filter the grid based on search query
        }

    }
}