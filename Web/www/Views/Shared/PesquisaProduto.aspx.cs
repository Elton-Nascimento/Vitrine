using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Shared_PesquisaProduto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void grdProduto_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "selecionar")
        {
            Session["idProduto"] = Convert.ToString(e.CommandArgument);
            Response.Redirect("VisualizaProduto.aspx");
        }
    }
}