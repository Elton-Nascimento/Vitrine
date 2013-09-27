using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Entities;
using WebSite.Business;
using System.Data;
using WebSite.Data;

public partial class Views_Shared_VisualizaProduto : System.Web.UI.Page
{
    private Utils utls = new Utils();
    private WebSite.Business.PedidoDAO.stcPedido       stcPedido;
    private WebSite.Business.PedidoDAO.stcItens_Pedido stcItens_Pedido;

    #region Encapsulmento
    protected Int32 IdProduto
    {
        get { return Convert.ToInt32(ViewState["IdProduto"]); }
        set { ViewState["IdProduto"] = value; }
    }
    protected Int32 IdProdPag
    {
        get { return Convert.ToInt32(ViewState["IdProdPag"]); }
        set { ViewState["IdProdPag"] = value; }
    }
    #endregion

    #region Preenche Pagina
    public void CarregaProduto()
    {
        DataSet    dstProduto = new DataSet();
        ProdutoDAO produtoDao = new ProdutoDAO();
        int        IdLoja     = 0;
        
        dstProduto = produtoDao.ConsultaProduto(Convert.ToInt32(Session["idProduto"]), 
                                                0, null, 0);

        DataRow drProduto = dstProduto.Tables[0].Rows[0];

        if (dstProduto.Tables[0].Rows.Count > 0)
        {
            IdLoja              = Convert.ToInt32(drProduto["idLoja"]);
            lblDescricao.Text   = Convert.ToString(drProduto["descrProduto"]);
            lblProduto.Text     = Convert.ToString(drProduto["descrProduto"]);
            hfdValorVenda.Value = Convert.ToString(drProduto["valorVenda"]);
            Double Valor        = Convert.ToDouble(drProduto["valorVenda"]);

            lblValor.Text = string.Format("{0:C2}", Valor);

            if (Convert.ToInt32(drProduto["qtdeEstoque"]) > 0)
	        {
		        for (int i = 1; i <= Convert.ToInt32(drProduto["qtdeEstoque"]); i++)
			    {
			        ListItem li = new ListItem();
                    li.Text     = i.ToString();
                    li.Value    = i.ToString();
                    ddlQtde.Items.Add(li);
			    }
	        }
            lblCategoria.Text  = Convert.ToString(drProduto["descrCategoria"]);
            lblQtde.Text       = Convert.ToString(drProduto["qtdeEstoque"]);

            if (Convert.ToBoolean(drProduto["freteGratis"]))
	        {
		        lblFreteGratis.Text = "Sim";
	        }
            else
	        {
                lblFreteGratis.Text = "Não";
	        }
            lblUnLike.Text = Convert.ToString(drProduto["unlikeProduto"]);
            Label7.Text = Convert.ToString(drProduto["likeProduto"]);

            DataSet dstLoja = new DataSet();
            LojaDAO lojaDao = new LojaDAO();

            dstLoja = lojaDao.ConsultaLoja(null, IdLoja);

            DataRow drLoja = dstLoja.Tables[0].Rows[0];

            if (dstLoja.Tables[0].Rows.Count > 0)
            {
                if (!Convert.IsDBNull(drLoja["logoLoja"]))
                {
                    imgLogo.ImageUrl = Convert.ToString(drLoja["logoLoja"]);
                }
                lblRazao.Text       = Convert.ToString(drLoja["razaoSocial"]);
                lblFantasia.Text    = utls.ConvertePara<String>(drLoja["nomeFantasia"], "");
                lblContato.Text     = utls.ConvertePara<String>(drLoja["foneLoja"], "");
                lblSite.Text        = utls.ConvertePara<String>(drLoja["siteLoja"], "");
                lblCep.Text         = Convert.ToString(drLoja["cepLoja"]);
                lblEstado.Text      = Convert.ToString(drLoja["ufLoja"]);
                lblCidade.Text      = Convert.ToString(drLoja["cidLoja"]);
                lblBairro.Text      = Convert.ToString(drLoja["bairroLoja"]);
                lblEndereco.Text    = Convert.ToString(drLoja["enderLoja"]);
                lblNumero.Text      = Convert.ToString(drLoja["numLoja"]);
                lblComplemento.Text = utls.ConvertePara<String>(drLoja["complLoja"], "");
            }
        }
    }

    protected void CarregaValores()
    {
        DataSet dst = new DataSet();
        
        Prod_PagDAO prodPagDao = new Prod_PagDAO();
        dst = prodPagDao.ConsultaValores(IdProduto, 
                                         IdProdPag, 
                                         utls.ConvertePara<Int32>(ddlQtde.SelectedValue, 1));
        lblValorTotal.Text   = string.Format("{0:C2}", utls.ConvertePara<Double>(dst.Tables[0].Rows[0]["valorTotal"], 750.00));
        lblValorParcela.Text = string.Format("{0:C2}", utls.ConvertePara<Double>(dst.Tables[0].Rows[0]["valorParcela"], 120.56));
        hfdValorVenda.Value  = Convert.ToString(dst.Tables[0].Rows[0]["valorTotal"]);
        ddlQtdeParcelas.Items.Clear();
        int QtdeParcela      = utls.ConvertePara<Int32>(dst.Tables[0].Rows[0]["qtdeParcela"], 1);
        for (int i = 1; i <= QtdeParcela; i++)
		{
            ListItem li = new ListItem();
            li.Value = i.ToString();
            li.Text  = i.ToString();
            ddlQtdeParcelas.Items.Add(li);
		}
        ddlQtdeParcelas.DataBind();
    }
    #endregion    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string tipoUsuario = utls.ConvertePara<String>(Session["tipoUsuario"], "");

            switch (tipoUsuario)
            {
                case "F":
                    ibtnAddFavoritos.Enabled = true;
                    ibtnAddFavoritos.ImageUrl = "~/Content/Imagens/Adicionar_Favoritos.png";
                    ibtnAddCarrinho.Enabled = true;
                    ibtnAddCarrinho.ImageUrl = "~/Content/Imagens/Adicionar_Carrinho.png";
                    break;
                case "J":
                    ibtnAddFavoritos.Enabled = false;
                    ibtnAddFavoritos.ImageUrl = "~/Content/Imagens/Nao_Adicionar_Favoritos.png";
                    ibtnAddCarrinho.Enabled = false;
                    ibtnAddCarrinho.ImageUrl = "~/Content/Imagens/Nao_Adicionar_Carrinho.png";
                    break;
                default:
                    ibtnAddFavoritos.Enabled = false;
                    ibtnAddFavoritos.ImageUrl = "~/Content/Imagens/Nao_Adicionar_Favoritos.png";
                    ibtnAddCarrinho.Enabled = true;
                    ibtnAddCarrinho.ImageUrl = "~/Content/Imagens/Adicionar_Carrinho.png";
                    break;
            }
            
            IdProduto = Convert.ToInt32(Session["idProduto"]);
            CarregaProduto();
            grdPagamento.SelectedIndex = 0;
            RadioButton rb_Pagamento = (RadioButton)grdPagamento.FindControl("rbPagamento");
            IdProdPag = Convert.ToInt32(grdPagamento.SelectedValue);
            CarregaValores();
        }
    }

    protected void rptImgProduto_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Selecionar")
        {
            imgPrincipal.ImageUrl = utls.ConvertePara<String>(e.CommandArgument, "~/Content/Imagens/produto.png");
        }

        hplBox.NavigateUrl = imgPrincipal.ImageUrl;
    }

    protected void rbPagamento_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton rb_Pagamento = (RadioButton)sender;
        GridViewRow row = (GridViewRow)rb_Pagamento.Parent.Parent;
        grdPagamento.SelectedIndex = row.RowIndex;

        IdProdPag = Convert.ToInt32(grdPagamento.SelectedValue);
        CarregaValores();
    }

    protected void grdPagamento_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        RadioButton rdo = (RadioButton)e.Row.FindControl("rbPagamento");
        
        if (rdo == null)
        {
            return;
        }
        string script = "SetUniqueRadioButton('grdPagamento.*pagamento',this)";
        rdo.Attributes.Add("onclick", script);
    }

    protected void ddlQtde_SelectedIndexChanged(object sender, EventArgs e)
    {
        CarregaValores();
    }

    protected void ibtnAddFavoritos_Click(object sender, ImageClickEventArgs e)
    {
        DesejosDAO desejoDao = new DesejosDAO();
        desejoDao.ManutencaoDesejo("I", 0, Convert.ToInt32(Session["idUsuario"]), IdProduto);
    }

    protected void ibtnAddCarrinho_Click(object sender, ImageClickEventArgs e)
    {
        if (utls.ConvertePara<String>(Session["tipoUsuario"], "") == "F" || Session["tipoUsuario"] == null)
        {
            int? IdUsuario = null;
            stcItens_Pedido = new PedidoDAO.stcItens_Pedido();
            stcPedido       = new PedidoDAO.stcPedido();
            stcPedido.dtPedido = DateTime.Now;
            stcPedido.idPedido = utls.ConvertePara<Int32>(Session["idPedido"], 0);
            if (Session["idUsuario"] != null)
            {
                IdUsuario = Convert.ToInt32(Session["idUsuario"]);
            }
            else
            {
                stcPedido.guidVisitante = Convert.ToString(Session["guidVisitante"]);
            }
            stcItens_Pedido.idProdPag   = IdProdPag;
            stcItens_Pedido.idProduto   = IdProduto;
            stcItens_Pedido.qtdeParcela = utls.ConvertePara<Int32>(ddlQtdeParcelas.SelectedValue, 1);
            stcItens_Pedido.qtdeItem    = utls.ConvertePara<Int32>(ddlQtde.SelectedValue, 1);
            stcItens_Pedido.valorItem   = Convert.ToDouble(hfdValorVenda.Value);
            stcItens_Pedido.dtPagamento = DateTime.Now.AddDays(30);

            PedidoDAO pedidoDao = new PedidoDAO();
            pedidoDao.sp_ManutencaoPedido("I", IdUsuario, stcPedido, stcItens_Pedido);

            Response.Redirect("FinalizaCompra.aspx");
        }
    }
}