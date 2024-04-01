using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HospitalWebsite.Admin.App_Code.Helpers
{
    public static class BreadcrumbUtility
    {
        public static string GetBreadcrumbHtml(string page_tiltle,string homeUrl, string homeText, string activePageUrl, string activePageText)
        {
            return $@"
            <div class='pagetitle'>
                <h1>{page_tiltle}</h1>
                <nav>
                    <ol class='breadcrumb'>
                        <li class='breadcrumb-item'><a href='{homeUrl}'>{homeText}</a></li>
                        <li class='breadcrumb-item active'><a href='{activePageUrl}'>{activePageText}</a></li>
                    </ol>
                </nav>
            </div>";
        }
    }
}