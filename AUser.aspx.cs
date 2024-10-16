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
    public partial class AUser : System.Web.UI.Page
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
                string query = "SELECT v_name, v_id, v_city, v_email FROM voting";

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " WHERE v_name LIKE @SearchQuery OR v_email LIKE @SearchQuery";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                }

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                //GridViewUsers.DataSource = dt;
                GridViewUsers.DataBind();
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