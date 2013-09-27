using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Views_Shared_Logof : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Pagina"] != null)
        {
            Session.Abandon();
            Response.Cookies["Usuario"].Expires = DateTime.Now.AddDays(-1);
            FormsAuthentication.SignOut();
            Response.Redirect("~/Views/Shared/FinalizaCompra.aspx");
        }
        else
        {
            Response.Cookies["Usuario"].Expires = DateTime.Now.AddDays(-1);
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("~/Views/Shared/Home.aspx");
        }        
    }
}