using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Entities;
using WebSite.Business;
using WebSite.Data;

public partial class Views_Shared_EsqueceuSenha : System.Web.UI.Page
{
    Utils ults = new Utils();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txbEmail.Text = Session["email"].ToString();
            Session.Remove("email");   
        }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Usuario esqueceu = new Usuario();
                esqueceu.TipoUsuario = ddlTipoUsuario.SelectedValue;
                esqueceu.IdPergunta = Convert.ToInt32(ddlPergunta.SelectedValue);
                esqueceu.DocUsuario = txbDocumento.Text;
                esqueceu.RespostaUsuario = txbResposta.Text;
                esqueceu.EmailUsuario = txbEmail.Text;

                UsuarioDAO usuarioDao = new UsuarioDAO();
                usuarioDao.EsqueceuSenha(esqueceu);
            }
            finally
            {
                pnlMessage.Visible = true;
                pnlMessage.Enabled = true;
                pnlMessage.Style.Add(HtmlTextWriterStyle.Left, "562px");
                pnlMessage.Style.Add(HtmlTextWriterStyle.Top, "324px");
            }
        }
    }

    protected void ctvDocumento_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (ddlTipoUsuario.SelectedValue == "F")
        {
            ctvDocumento.Text = "CPF Inválido!";

            string cpf = txbDocumento.Text;

            if (ults.ValidaCpf(cpf) == false)
            {
                args.IsValid = false;
            }
        }
        else if (ddlTipoUsuario.SelectedValue == "J")
        {
            ctvDocumento.Text = "CNPJ Invalido";

            string cnpj = txbDocumento.Text;

            if (ults.ValidaCnpj(cnpj) == false)
            {
                args.IsValid = false;
            }
        }
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        pnlMessage.Enabled = false;
        pnlMessage.Visible = false;
        Response.Redirect("Home.aspx");
    }

    protected void lnkFechar_Click(object sender, EventArgs e)
    {
        pnlMessage.Enabled = false;
        pnlMessage.Visible = false;
    }
}