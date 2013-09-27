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

public partial class MasterPage : System.Web.UI.MasterPage
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

        if (!Page.IsPostBack)
        {
            #region Preenchendo a trvCategoria
            int x;
            DBUtils dbUtls = new DBUtils();
            DataSet dst = new DataSet();
            dst = dbUtls.ListarCategorias();

            if (dst.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
                {
                    if (Convert.IsDBNull(dst.Tables[0].Rows[i]["CategoriaPai"]))
                    {
                        x = Convert.ToInt32(dst.Tables[0].Rows[i]["idCategoria"]);
                        TreeNode tn = new TreeNode();
                        tn.Text = Convert.ToString(dst.Tables[0].Rows[i]["DescrCategoria"]);
                        tn.Value = Convert.ToString(dst.Tables[0].Rows[i]["idCategoria"]);
                        tn.SelectAction = TreeNodeSelectAction.Expand;
                        trvCategoria.Nodes.Add(tn);

                        for (int a = 0; a < dst.Tables[0].Rows.Count; a++)
                        {
                            if (!Convert.IsDBNull(dst.Tables[0].Rows[a]["CategoriaPai"]) &&
                                Convert.ToInt32(dst.Tables[0].Rows[a]["CategoriaPai"]) == x)
                            {
                                TreeNode tnc = new TreeNode();
                                tnc.Text = Convert.ToString(dst.Tables[0].Rows[a]["DescrCategoria"]);
                                tnc.Value = Convert.ToString(dst.Tables[0].Rows[a]["idCategoria"]);
                                tnc.NavigateUrl = "~/Views/Shared/PesquisaProduto.aspx";
                                tn.ChildNodes.Add(tnc);
                            }
                        }
                    }
                }
            }
            trvCategoria.DataBind();
            #endregion
        }
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
        else
        {
            Response.Redirect("~/Views/Shared/Login.aspx");
        }
    }
    protected void ibtnBusca_Click(object sender, ImageClickEventArgs e)
    {
        string idCategoria = null;
        string descrProduto = txbProduto.Text;
        Response.Redirect("~/Views/Shared/PesquisaProduto.aspx?Categoria="+idCategoria+"&Descricao="+descrProduto);
    }

    protected void lkbFinalizaCompra_Click(object sender, EventArgs e)
    {
        if (Session["tipoUsuario"] == null || Session["tipoUsuario"].ToString() == "F")
        {
            Response.Redirect("~/Views/Shared/FinalizaCompra.aspx");
        }
    }
}