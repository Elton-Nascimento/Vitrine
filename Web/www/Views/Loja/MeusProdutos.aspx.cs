using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Entities;
using WebSite.Business;
using WebSite.Data;
using System.Data;

public partial class Views_Loja_MeusProdutos : System.Web.UI.Page
{
    private ProdutoDAO produtoDao;
    private Utils utls = new Utils();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DBUtils dbUtls = new DBUtils();
            DataSet dst = new DataSet();

            dst = dbUtls.ListarCategorias();
            if (dst.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
                {
                    if (!Convert.IsDBNull(dst.Tables[0].Rows[i]["CategoriaPai"]))
	                {
		                ListItem it = new ListItem();
                        it.Value = dst.Tables[0].Rows[i]["idCategoria"].ToString();
                        it.Text  = dst.Tables[0].Rows[i]["descrCategoria"].ToString();
                        ddlCategoria.Items.Add(it);   
	                }
                }
            }
        }   
    }

    protected void btnPesquisar_Click(object sender, EventArgs e)
    {
        produtoDao = new ProdutoDAO();
        grdMeusProdutos.DataSource = produtoDao.ConsultaProduto(null,
                                                                utls.ConvertePara<Int32>(ddlCategoria.SelectedValue, 0),
                                                                txbNomeProduto.Text,
                                                                utls.ConvertePara<Int32>(Session["idLoja"], 0));
        grdMeusProdutos.DataBind();
    }

    protected void grdMeusProdutos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            Session["modo"] = "U";
            Session["idProduto"] = e.CommandArgument;
            Response.Redirect("CadastroProduto.aspx");
        }
    }
    protected void btnNovo_Click(object sender, EventArgs e)
    {
        Session["modo"] = "I";
        Response.Redirect("CadastroProduto.aspx");
    }
}