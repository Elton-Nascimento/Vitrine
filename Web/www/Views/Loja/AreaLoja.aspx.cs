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
using System.IO;

public partial class Views_Loja_AreaLoja : System.Web.UI.Page
{
    private Loja       loja = null;
    private LojaDAO    lojaDao = null;
    private Usuario    usuario = null;
    private UsuarioDAO usuarioDao = null;
    private String     Acao;
    private Utils      utls = new Utils();

    #region Preencher Dados da Loja
    public void PreencheDadosLoja()
    {   
        DataSet dst = new DataSet();
        lojaDao = new LojaDAO();

        dst = lojaDao.ConsultaLoja(utls.ConvertePara<Int32>(Session["idUsuario"], 0), 0);

        if (dst.Tables[0].Rows.Count > 0)
        {
            Session["idLoja"]     = Convert.ToInt32(dst.Tables[0].Rows[0]["idLoja"]);
            imgBanner.ImageUrl    = Convert.ToString(dst.Tables[0].Rows[0]["bannerLoja"]);
            Session["bannerLoja"] = Convert.ToString(dst.Tables[0].Rows[0]["bannerLoja"]);
		    imgLogo.ImageUrl      = Convert.ToString(dst.Tables[0].Rows[0]["logoLoja"]);
            Session["logoLoja"]   = Convert.ToString(dst.Tables[0].Rows[0]["logoLoja"]);
            txbRazao.Text         = Convert.ToString(dst.Tables[0].Rows[0]["razaoSocial"]);
            txbNomeFantasia.Text  = utls.ConvertePara<String>(dst.Tables[0].Rows[0]["nomeFantasia"],"");
            txbFone.Text          = utls.ConvertePara<String>(dst.Tables[0].Rows[0]["foneLoja"],    "");     
            txbSite.Text          = utls.ConvertePara<String>(dst.Tables[0].Rows[0]["siteLoja"],    "");
            txbCEP.Text           = Convert.ToString(dst.Tables[0].Rows[0]["cepLoja"]);
            txbUf.Text            = Convert.ToString(dst.Tables[0].Rows[0]["ufLoja"]);
            txbCidade.Text        = Convert.ToString(dst.Tables[0].Rows[0]["cidLoja"]);
            txbEndereco.Text      = Convert.ToString(dst.Tables[0].Rows[0]["enderLoja"]);
            txbNumero.Text        = Convert.ToString(dst.Tables[0].Rows[0]["numLoja"]);
            txbComplemento.Text   = utls.ConvertePara<String>(dst.Tables[0].Rows[0]["complLoja"],   "");
            txbBairro.Text        = Convert.ToString(dst.Tables[0].Rows[0]["bairroLoja"]);
            imgBanner.DataBind();
            imgLogo.DataBind();
            txbRazao.Focus();
        }
    }
    #endregion

    #region Preencher Configuracoes
    public void PreencheConfiguracoes()
    {
        usuarioDao = new UsuarioDAO();
        usuario = new Usuario();
        usuario = usuarioDao.VerificarUsuario(Session["emailUsuario"].ToString(),
                                              Session["senhaUsuario"].ToString());

        Session["idPergunta"]      = Convert.ToInt32(usuario.IdPergunta);
        Session["respostaUsuario"] = Convert.ToString(usuario.RespostaUsuario);
        Session["senhaUsuario"]    = Convert.ToString(usuario.SenhaUsuario);
        ddlPergunta.SelectedValue  = Convert.ToString(Session["idPergunta"]);
        txbResposta.Text           = Convert.ToString(Session["respostaUsuario"]);
        txbCnpj.Text               = Convert.ToString(Session["docUsuario"]);
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PreencheDadosLoja();
            PreencheConfiguracoes();
        }
    }

    protected void btnCancelarDados_Click(object sender, EventArgs e)
    {
        PreencheDadosLoja();
    }

    protected void btnConfirmaDados_Click(object sender, EventArgs e)
    {
        try
        {
            loja = new Loja();
            if (Session["idLoja"] != null)
            {
                loja.IdLoja = Convert.ToInt32(Session["idLoja"]);
                Acao = "U";
            }
            else
            {
                loja.IdLoja = 0;
                Acao = "I";
            }
            loja.IdUsuario    = Convert.ToInt32(Session["idUsuario"]);
            loja.BannerLoja   = Convert.ToString(imgBanner.ImageUrl);
            loja.LogoLoja     = Convert.ToString(imgLogo.ImageUrl);
            loja.RazaoSocial  = Convert.ToString(txbRazao.Text);
            loja.NomeFantasia = Convert.ToString(txbNomeFantasia.Text);
            loja.FoneLoja     = Convert.ToString(txbFone.Text);
            loja.SiteLoja     = Convert.ToString(txbSite.Text);
            loja.CepLoja      = Convert.ToString(txbCEP.Text);
            loja.UfLoja       = Convert.ToString(txbUf.Text);
            loja.CidLoja      = Convert.ToString(txbCidade.Text);
            loja.EnderLoja    = Convert.ToString(txbEndereco.Text);
            loja.NumLoja      = Convert.ToInt32(txbNumero.Text);
            loja.ComplLoja    = Convert.ToString(txbComplemento.Text);
            loja.BairroLoja   = Convert.ToString(txbBairro.Text);

            LojaDAO lojaDao = new LojaDAO();
            lojaDao.ManutencaoLoja(loja, Acao);
        }
        finally
        {
            PreencheDadosLoja();
        }
    }

    protected void btnConfirmarSenha_Click(object sender, EventArgs e)
    {
        try
        {
            usuario = new Usuario();
            usuario.IdUsuario       = Convert.ToInt32(Session["idUsuario"]);
            usuario.IdPergunta      = Convert.ToInt32(Session["idPergunta"]);
            usuario.RespostaUsuario = Convert.ToString(Session["respostaUsuario"]);
            usuario.SenhaUsuario    = txbConfirmaSenha.Text;
            Session["senhaUsuario"] = txbConfirmaSenha.Text;
            usuario.AtivoUsuario    = 1;

            usuarioDao = new UsuarioDAO();
            usuarioDao.ManutencaoUsuario(usuario, "U");
        }
        finally
        {
            PreencheConfiguracoes();
        }
    }

    protected void btnConfirmarPergunta_Click(object sender, EventArgs e)
    {
        try
        {
            usuario = new Usuario();
            usuario.IdUsuario       = Convert.ToInt32(Session["idUsuario"]);
            usuario.IdPergunta      = Convert.ToInt32(ddlPergunta.SelectedValue);
            usuario.RespostaUsuario = Convert.ToString(txbResposta.Text);
            usuario.SenhaUsuario    = Convert.ToString(Session["senhaUsuario"]);
            usuario.AtivoUsuario    = 1;

            usuarioDao = new UsuarioDAO();
            usuarioDao.ManutencaoUsuario(usuario, "U");
        }
        finally
        {
            PreencheConfiguracoes();   
        }
    }

    protected void btnCancelarPergunta_Click(object sender, EventArgs e)
    {
        PreencheConfiguracoes();
    }

    protected void ibtnProdutos_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("MeusProdutos.aspx");
    }

    protected void ibtnVendas_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Vendas.aspx");
    }

    protected void ibtnSAC_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CentralAtendimento.aspx");
    }

    protected void ibtnEstatisticas_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Estatisticas.aspx");
    }

    protected void ibtnBanner_Click(object sender, ImageClickEventArgs e)
    {
        string caminho = string.Empty;

        if (fplBanner.HasFile)
        {
            try
            {
                caminho = Convert.ToString("~/Content/Imagens/Loja/" + fplBanner.FileName);
                fplBanner.SaveAs(Server.MapPath(caminho));
            }
            finally
            {
                imgBanner.ImageUrl = caminho;
            }
        }
    }
    protected void ibtnLogo_Click(object sender, ImageClickEventArgs e)
    {
        string caminho = string.Empty;

        if (fplLogo.HasFile)
        {
            try
            {
                caminho = Convert.ToString("~/Content/Imagens/Loja/" + fplLogo.FileName);
                fplLogo.SaveAs(Server.MapPath(caminho));
            }
            finally
            {
                imgLogo.ImageUrl = caminho;
            }
        }
    }

    protected void ibtnBuscaCep_Click(object sender, ImageClickEventArgs e)
    {
        CEP.stcCep stcCEP = new CEP.stcCep();
        CEP.ws_CEP ws_cep = new CEP.ws_CEP();

        stcCEP = ws_cep.ConsultaCep(txbCEP.Text);
        txbUf.Text       = utls.ConvertePara<String>(stcCEP.SiglaEstado, "");
        txbCidade.Text   = utls.ConvertePara<String>(stcCEP.NomeCidade, "");
        txbBairro.Text   = utls.ConvertePara<String>(stcCEP.NomeBairro, "");
        txbEndereco.Text = utls.ConvertePara<String>(stcCEP.NomeLogradouro, "");
    }
}