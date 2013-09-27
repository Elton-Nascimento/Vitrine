using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using WebSite.Business;
using WebSite.Entities;
using WebSite.Data;

public partial class Views_Shared_CadastroUsuario : System.Web.UI.Page
{
    Utils ults = new Utils();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (ddlTipoUsuario.SelectedValue == "F")
        {
            lblDocumento.Text = "CPF";
        }
        else if (ddlTipoUsuario.SelectedValue == "J")
        {
            lblDocumento.Text = "CNPJ";
        }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
		if (Page.IsValid)
        {
            try
            {
                Usuario usuario = new Usuario();
                usuario.TipoUsuario     = ddlTipoUsuario.SelectedValue;
                usuario.IdPergunta      = Convert.ToInt32(ddlPergunta.SelectedValue);
                usuario.DocUsuario      = txbDocumento.Text;
                usuario.RespostaUsuario = txbResposta.Text;
                usuario.EmailUsuario    = txbEmail.Text;
                usuario.SenhaUsuario    = txbConfirmar.Text;

                UsuarioDAO usuarioDAO = new UsuarioDAO();
                usuarioDAO.ManutencaoUsuario(usuario, "I");
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
	
	protected void ctvSenha_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (txbSenha.Text.Length < 5)
        {
            args.IsValid = false;
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

    protected void ddlTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTipoUsuario.SelectedItem.Selected.ToString() == "Consumidor")
        {
            lblDocumento.Text = "CPF";
        }
        else if (ddlTipoUsuario.SelectedItem.Selected.ToString() == "Lojista")
        {
            lblDocumento.Text = "CNPJ";
        }
    }

    protected void lnkFechar_Click(object sender, EventArgs e)
    {
        pnlMessage.Enabled = false;
        pnlMessage.Visible = false;
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        pnlMessage.Enabled = false;
        pnlMessage.Visible = false;


        Response.Redirect("Home.aspx");
    }
}