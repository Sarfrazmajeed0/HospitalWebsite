using HospitalWebsite.Admin.App_Code.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalWebsite.Admin
{
    public partial class Tenders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Inject breadcrumb HTML into the page
            BreadcrumbPlaceholder.Controls.Add(new LiteralControl(BreadcrumbUtility.GetBreadcrumbHtml("Tenders", "./Dashboard.aspx", "Home", "#", "Tenders")));
        }
    }
}