using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Entities;
using WebSite.Business;
using WebSite.Data;
using System.Web.Security;
using System.Data;

public partial class Views_Shared_Login : System.Web.UI.Page
{
    private UsuarioDAO usuarioDao = new UsuarioDAO();
    private Usuario    usuario    = null;
    private PedidoDAO pedidoDao = new PedidoDAO();

    public void Decisao(Usuario usuario)
    {
        if (usuario == null)
        {
            Response.Redirect("~/Views/Shared/Login.aspx");
        }
        else
        {
            Session["idUsuario"]    = usuario.IdUsuario;
            Session["tipoUsuario"]  = usuario.TipoUsuario;
            Session["docUsuario"]   = usuario.DocUsuario;
            Session["emailUsuario"] = usuario.EmailUsuario;
            Session["senhaUsuario"] = usuario.SenhaUsuario;
            Session["guidUsuario"]  = usuario.GuidUsuario;
            Session["dtUsuario"]    = usuario.DtUsuario;

            FormsAuthentication.SetAuthCookie(usuario.EmailUsuario, true);
            if (ckbMantenha.Checked)
            {
                HttpCookie aCookie = new HttpCookie("Usuario");
                aCookie.Values["idUsuario"]    = usuario.IdUsuario.ToString();
                aCookie.Values["tipoUsuario"]  = usuario.TipoUsuario;
                aCookie.Values["docUsuario"]   = usuario.DocUsuario;
                aCookie.Values["emailUsuario"] = usuario.EmailUsuario;
                aCookie.Values["senhaUsuario"] = usuario.SenhaUsuario;
                aCookie.Values["guidUsuario"]  = usuario.GuidUsuario;
                aCookie.Values["dtUsuario"]    = usuario.DtUsuario.ToString();
                
                aCookie.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(aCookie);
            }

            if (Session["tipoUsuario"].ToString() == "F")
            {
                DataSet dstCarrinho = new DataSet();

                PedidoDAO pedidoDao = new PedidoDAO();
                dstCarrinho = pedidoDao.ConsultaPedido("Carrinho", Convert.ToString(Session["guidVisitante"]), null);

                if (dstCarrinho.Tables[0].Rows.Count > 0)
                {
                    Session["idPedido"] = Convert.ToInt32(dstCarrinho.Tables[0].Rows[0]["idPedido"]);

                    pnlMessage.Visible = true;
                    pnlMessage.Enabled = true;
                    pnlMessage.Style.Add(HtmlTextWriterStyle.Left, "562px");
                    pnlMessage.Style.Add(HtmlTextWriterStyle.Top, "324px");
                }
                else
                {
                    Response.Redirect("~/Views/Shared/Home.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Views/Shared/Home.aspx");
            }
        }
    }

    public void Logar(string email, string senha)
    {
        if (email != null && senha != null)
        {
            usuario = usuarioDao.VerificarUsuario(email, senha);

            Decisao(usuario);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string email = Request.QueryString["emailUsuario"];
        string guid = Request.QueryString["guidUsuario"];

        if (email != null && guid != null)
        {
            bool ativado = false;

            ativado = usuarioDao.AtivacaoUsuario(guid);

            if (ativado == true)
            {
                txbEmail.Text = email;
            }
        }

        Logar(null, null);
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        Logar(txbEmail.Text, txbSenha.Text);
    }

    protected void lkbEsqueceu_Click(object sender, EventArgs e)
    {
        Session["email"] = txbEmail.Text;

        Response.Redirect("~/Views/Shared/EsqueceuSenha.aspx");
    }

    protected void btnSim_Click(object sender, EventArgs e)
    {
        try
        {
            pedidoDao = new PedidoDAO();
            pedidoDao.TransferenciaPedido("Pedido", 
                                          Convert.ToInt32(Session["idUsuario"]), 
                                          Convert.ToInt32(Session["idPedido"]));
        }
        finally
        {
            Session.Remove("idPedido");
            pnlMessage.Enabled = false;
            pnlMessage.Visible = false;
            Response.Redirect("~/Views/Shared/Home.aspx");
        }
    }

    protected void btnNao_Click(object sender, EventArgs e)
    {
        try
        {
            pedidoDao = new PedidoDAO();
            pedidoDao.LimparCarrinho(Convert.ToInt32(Session["idPedido"]));
        }
        finally
        {
            Session.Remove("idPedido");
            pnlMessage.Enabled = false;
            pnlMessage.Visible = false;
            Response.Redirect("~/Views/Shared/Home.aspx");
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Session.Remove("idPedido");
        pnlMessage.Enabled = false;
        pnlMessage.Visible = false;

        Session["Pagina"] = "~/Views/Shared/FinalizaCompra.aspx";
        Response.Redirect("~/Views/Construction/Logof.aspx");
    }

    protected void lnkFechar_Click(object sender, EventArgs e)
    {
        Session.Remove("idPedido");
        pnlMessage.Enabled = false;
        pnlMessage.Visible = false;

        Session["Pagina"] = "~/Views/Shared/FinalizaCompra.aspx";
        Response.Redirect("~/Views/Construction/Logof.aspx");
    }
}