using HospitalWebsite.Admin.App_Code.Helpers;
using System;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
using System.IO;
using System.Web;
using System.Web.UI;

namespace HospitalWebsite.Admin.App_Code.Models.Features
{
    public static class Features_Model
    {
        public static void create_features_table()
        {

            // SQL query to create the table if it doesn't exist
            // SQL query to create the table if it doesn't exist
            //string createTableQuery = @"CREATE TABLE IF NOT EXISTS Features(
            //                        ID INT PRIMARY KEY IDENTITY,
            //                        Title NVARCHAR(100) NOT NULL,
            //                        Description NVARCHAR(MAX) not null,
            //                        imageName NVARCHAR(MAX)
            //                    );";
            string createTableQuery = @"
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Features')
    BEGIN
        CREATE TABLE Features(
            ID INT PRIMARY KEY IDENTITY,
            Title NVARCHAR(100) NOT NULL,
            Description NVARCHAR(MAX) NOT NULL,
            ImageName NVARCHAR(MAX)
        );
    END
";



            try
            {
                // Create a connection to the SQLite database
                using (SqlConnection connection = new SqlConnection(GlobalVariables.connectionString))
                {
                    // Open the connection
                    connection.Open();

                    // Create a command to execute the SQL query
                    using (SqlCommand command = new SqlCommand(createTableQuery, connection))
                    {
                        // Execute the query
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Page page = HttpContext.Current.CurrentHandler as Page;
                if (page != null)
                {
                    ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", $"alert('{ex.Message}');", true);
                }
                
            }
        }

        public static void InsertDataIntoFeatureTable(string title, string description, string imageName)
        {
            create_features_table();

            string query = "INSERT INTO Features (Title, Description, ImageName) VALUES (@Title, @Description, @ImageName)";

            try
            {
                // Create a connection to the SQL Server database
                using (SqlConnection connection = new SqlConnection(GlobalVariables.connectionString))
                {
                    // Open the connection
                    connection.Open();

                    // Create a command to execute the SQL query
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@Title", title);
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@ImageName", imageName);

                        // Execute the query
                        command.ExecuteNonQuery();
                    }

                    // Save the image to the upload folder
                    string uploadFolderPath = HttpContext.Current.Server.MapPath("~/Uploads/");
                    string imagePath = Path.Combine(uploadFolderPath, imageName);
                    //File.WriteAllBytes(imagePath, imageData);
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Page page = HttpContext.Current.CurrentHandler as Page;
                if (page != null)
                {
                    ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", $"alert('{ex.Message}');", true);
                }
            }
        }

    }
}