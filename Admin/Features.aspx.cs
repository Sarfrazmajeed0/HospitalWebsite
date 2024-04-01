using HospitalWebsite.Admin.App_Code.Helpers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalWebsite.Admin
{
    public partial class Features : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Inject breadcrumb HTML into the page
            BreadcrumbPlaceholder.Controls.Add(new LiteralControl(BreadcrumbUtility.GetBreadcrumbHtml("Features", "./Dashboard.aspx", "Home", "#", "Features")));

            string query = "SELECT * FROM Users";
            using (SqlConnection connection = new SqlConnection(GlobalVariables.connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader dataReader = command.ExecuteReader();

                    // Check if there are rows returned
                    if (dataReader.HasRows)
                    {
                        // Read the first row
                        dataReader.Read();

                        // Retrieve data from the first row
                        string userData = "Username: " + dataReader["password"].ToString();

                        // Register JavaScript to display alert
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + userData + "')", true);
                    }
                    else
                    {
                        // If no rows returned
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No data found')", true);
                    }
                }
            }

        }
    }
}