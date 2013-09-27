using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Business;
using WebSite.Entities;
using System.Data;
using WebSite.Data;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    private Usuario    login      = new Usuario();
    private UsuarioDAO usuarioDao = new UsuarioDAO();
    private Usuario    usuario    = null;
    private HttpCookie cookie;
    private HttpCookie cookieVisitante;

    protected void Page_Load(object sender, EventArgs e)
    {
        #region Verificar a Session
            if (Session.Count >= 4)
            {
                lbtn1.Text = Session["emailUsuario"].ToString();
                lbtn2.Text = "Sair";
            }
            else
            {
                lbtn1.Text = "Login";
                lbtn2.Text = "Cadastro";
            }
        #endregion

        #region Verificar o Cookie
        cookie          = Request.Cookies["Usuario"];
        cookieVisitante = Request.Cookies["Visitante"];

        if (cookie != null)
        {
            usuario = usuarioDao.VerificarUsuario(cookie.Values["emailUsuario"],
                                                  cookie.Values["senhaUsuario"]);

            Session["idUsuario"]       = usuario.IdUsuario;
            Session["idPergunta"]      = usuario.IdPergunta;
            Session["respostaUsuario"] = usuario.RespostaUsuario;
            Session["tipoUsuario"]     = usuario.TipoUsuario;
            Session["docUsuario"]      = usuario.DocUsuario;
            Session["emailUsuario"]    = usuario.EmailUsuario;
            Session["senhaUsuario"]    = usuario.SenhaUsuario;
            Session["guidUsuario"]     = usuario.GuidUsuario;
            Session["dtUsuario"]       = usuario.DtUsuario;

            cookieVisitante.Values["guidVisitante"] = Session["guidUsuario"].ToString();
            Session["guidVisitante"] = Session["guidUsuario"].ToString();
        }
        else if (cookieVisitante != null)
        {
            Session["guidVisitante"] = cookieVisitante.Values["guidVisitante"];
        }
        else
        {
            string guid = Guid.NewGuid().ToString();
            cookieVisitante = new HttpCookie("Visitante");
            cookieVisitante.Values["guidVisitante"] = guid;
            cookieVisitante.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(cookieVisitante);
            Session["guidVisitante"] = guid;
        }
        #endregion
    }

    protected void lbtn1_Click(object sender, EventArgs e)
    {
        if (lbtn1.Text == "Login")
        {
            Response.Redirect("~/Views/Shared/Login.aspx");
        }
    }

    protected void lbtn2_Click(object sender, EventArgs e)
    {
        if (lbtn2.Text == "Sair")
        {
            Response.Redirect("~/Views/Construction/Logof.aspx");
        }
        else
        {
            Response.Redirect("~/Views/Shared/CadastroUsuario.aspx");
        }
    }

    protected void lkbMinhaArea_Click(object sender, EventArgs e)
    {
        if (Session["tipoUsuario"] != null && Session["tipoUsuario"].ToString() == "F")
        {
            Response.Redirect("~/Views/Consumidor/AreaConsumidor.aspx");
        }
        else if (Session["tipoUsuario"] != null && Session["tipoUsuario"].ToString() == "J")
        {
            Response.Redirect("~/Views/Loja/AreaLoja.aspx");
        }
    }

    protected void lkbFinalizaCompra_Click(object sender, EventArgs e)
    {
        if (Session["tipoUsuario"] == null || Session["tipoUsuario"].ToString() == "F")
        {
            Response.Redirect("~/Views/Shared/FinalizaCompra.aspx");   
        }
    }
}