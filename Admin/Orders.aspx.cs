using HospitalWebsite.Admin.App_Code.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalWebsite.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BreadcrumbPlaceholder.Controls.Add(new LiteralControl(BreadcrumbUtility.GetBreadcrumbHtml("Orders", "./Dashboard.aspx", "Home", "#", "Orders")));
        }
    }
}