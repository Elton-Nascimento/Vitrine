using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Business;
using System.Data;

public partial class Views_Shared_FinalizaCompra : System.Web.UI.Page
{
    private Double total = 0.00;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["idUsuario"] != null)
        {
            DataSet dtsCarrinho = new DataSet();

            PedidoDAO pedidoDao = new PedidoDAO();
            dtsCarrinho = pedidoDao.ConsultaPedido("Carrinho", null, Convert.ToInt32(Session["idUsuario"]));

            grdCarrinho.DataSource = dtsCarrinho;
            grdCarrinho.DataBind();

            if (Session["idPedido"] == null && grdCarrinho.Rows.Count > 0)
            {
                grdCarrinho.SelectedIndex = 0;
                Session["idPedido"] = Convert.ToInt32(grdCarrinho.SelectedDataKey["idPedido"]);
            }
        }
        else
        {
            DataSet dtsCarrinho = new DataSet();

            PedidoDAO pedidoDao = new PedidoDAO();
            dtsCarrinho = pedidoDao.ConsultaPedido("Carrinho", Convert.ToString(Session["guidVisitante"]), null);

            grdCarrinho.DataSource = dtsCarrinho;
            grdCarrinho.DataBind();

            if (Session["idPedido"] == null && grdCarrinho.Rows.Count > 0)
            {
                grdCarrinho.SelectedIndex = 0;
                Session["idPedido"] = Convert.ToInt32(grdCarrinho.SelectedDataKey["idPedido"]);
            }
        }
    }

    protected void btnContComprando_Click(object sender, EventArgs e)
    {
        Response.Redirect("PesquisaProduto.aspx");
    }

    protected void btnLimpaCarrinho_Click(object sender, EventArgs e)
    {
        if (grdCarrinho.Rows.Count > 0)
        {
            grdCarrinho.SelectedIndex = 0;
            PedidoDAO pedidoDao = new PedidoDAO();
            pedidoDao.LimparCarrinho(Convert.ToInt32(grdCarrinho.SelectedDataKey["idPedido"]));
            
            Page_Load(sender, e);
        }
        Session.Remove("idPedido");
    }

    protected void grdCarrinho_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Excluir")
        {
            try
            {
                WebSite.Business.PedidoDAO.stcPedido stcPedido = new PedidoDAO.stcPedido();
                stcPedido.dtPedido = DateTime.Now;
                WebSite.Business.PedidoDAO.stcItens_Pedido stcItens = new PedidoDAO.stcItens_Pedido();
                stcItens.dtPagamento = DateTime.Now.AddDays(30);
                stcItens.idItem = Convert.ToInt32(e.CommandArgument);

                PedidoDAO pedidoDao = new PedidoDAO();
                pedidoDao.sp_ManutencaoPedido("D", null, stcPedido, stcItens);
            }
            finally
            {
                Page_Load(sender, e);
            }            
        }
    }

    protected void grdCarrinho_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Double valor = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "valorItem"));
        total += valor;

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[9].HorizontalAlign = HorizontalAlign.Right;
            e.Row.Cells[9].Text = String.Format("{0:C}", total);
        }
    }

    protected void btnFinaCompras_Click(object sender, EventArgs e)
    {
        if (grdCarrinho.Rows.Count > 0)
        {
            if (Session["idUsuario"] != null)
            {
                pnlMessage.Visible = true;
                pnlMessage.Enabled = true;
                pnlMessage.Style.Add(HtmlTextWriterStyle.Left, "562px");
                pnlMessage.Style.Add(HtmlTextWriterStyle.Top, "324px");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    protected void btnSim_Click(object sender, EventArgs e)
    {
        if (Session["tipoUsuario"].ToString() == "F")
        {
            try
            {
                PedidoDAO pedidoDao = new PedidoDAO();
                pedidoDao.TransferenciaPedido("Compra",
                                              Convert.ToInt32(Session["idUsuario"]), 
                                              Convert.ToInt32(Session["idPedido"]));
            }
            finally
            {
                Session.Remove("idPedido");
                pnlMessage.Enabled = false;
                pnlMessage.Visible = false;
                Response.Redirect("~/Views/Consumidor/AreaConsumidor.aspx");
            }
        }
    }

    protected void btnNao_Click(object sender, EventArgs e)
    {
        pnlMessage.Enabled = false;
        pnlMessage.Visible = false;
    }
}