using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HospitalWebsite.Admin.App_Code.Helpers
{
    public static class GlobalVariables
    {
        public static string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    }
}