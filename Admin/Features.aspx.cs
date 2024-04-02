using HospitalWebsite.Admin.App_Code.Helpers;
using HospitalWebsite.Admin.App_Code.Models.Features;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
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

          

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string title = Feature_title.Text;
            string description = feature_description.Text;
            string imageUrl = "";

            //Handle image upload
            if (featureImage.HasFile)
            {
                try
                {
                    string filename = Guid.NewGuid().ToString() + Path.GetExtension(featureImage.FileName);
                    string uploadFolderPath = Server.MapPath("~/Images/");
                    string imagePath = Path.Combine(uploadFolderPath, filename);
                    featureImage.SaveAs(imagePath);
                    imageUrl = filename; // Save the relative path to the image
                }
                catch (Exception ex)
                {
                    // Handle file saving exceptions here
                    // Log the exception or show an error message
                    // For debugging, you can use ex.Message to see the error message
                    // Example: Response.Write("Error: " + ex.Message);
                }
            }

            // Insert into the database
            using (SqlConnection connection = new SqlConnection(GlobalVariables.connectionString))
            {
                string query = "INSERT INTO Features (Title, Description, imageName) VALUES (@Title, @Description, @ImageUrl)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Title", title);
                command.Parameters.AddWithValue("@Description", description);
                command.Parameters.AddWithValue("@ImageUrl", imageUrl);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    // Optionally, you can redirect the user to another page or display a success message here
                }
                catch (Exception ex)
                {
                    // Handle database insertion exceptions here
                    // Log the exception or show an error message
                    // For debugging, you can use ex.Message to see the error message
                    // Example: Response.Write("Error: " + ex.Message);
                }
            }
        }




    }
}