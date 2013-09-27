using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Business;
using WebSite.Entities;

public partial class Views_Shared_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void lnkDetalhes_Click(object sender, EventArgs e)
    {
        Session["idProduto"] = Convert.ToInt32((((LinkButton)sender).CommandArgument));
        Response.Redirect("VisualizaProduto.aspx");
    }
}