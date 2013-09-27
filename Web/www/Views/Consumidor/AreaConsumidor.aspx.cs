using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Business;
using WebSite.Entities;
using WebSite.Data;
using System.Data;

public partial class Views_Shared_AreaConsumidor : System.Web.UI.Page
{
    private Consumidor consumidor       = null;
    private ConsumidorDAO consumidorDao = null;
    private Usuario usuario             = null;
    private UsuarioDAO usuarioDao       = null;
    private Utils utls = new Utils();
    private String Acao;

    #region Preencher Dados do Consumidor
    public void PreencheDadosConsumidor()
    {
        DataSet dst = new DataSet();
        consumidorDao = new ConsumidorDAO();
        dst = consumidorDao.ConsultaConsumidor(Convert.ToInt32(Session["idUsuario"]));

        txbDocumento.Text = Convert.ToString(Session["docUsuario"]);
        if (dst.Tables[0].Rows.Count > 0)
        {
            Session["idConsumidor"] = Convert.ToInt32(dst.Tables[0].Rows[0]["idConsumidor"]);
            txbNome.Text            = Convert.ToString(dst.Tables[0].Rows[0]["nomeConsumidor"]);
            txbDtNascimento.Text    = Convert.ToString(dst.Tables[0].Rows[0]["dtNascimento"]);
            txbTelefone.Text        = utls.ConvertePara<String>(dst.Tables[0].Rows[0]["telConsumidor"], "");
            txbCelular.Text         = utls.ConvertePara<String>(dst.Tables[0].Rows[0]["celConsumidor"], "");
            txbCEP.Text             = Convert.ToString(dst.Tables[0].Rows[0]["cepConsumidor"]);
            txbUf.Text              = Convert.ToString(dst.Tables[0].Rows[0]["ufConsumidor"]);
            txbCidade.Text          = Convert.ToString(dst.Tables[0].Rows[0]["cidConsumidor"]);
            txbEndereco.Text        = Convert.ToString(dst.Tables[0].Rows[0]["enderConsumidor"]);
            txbNumero.Text          = Convert.ToString(dst.Tables[0].Rows[0]["numConsumidor"]);
            txbComplemento.Text     = utls.ConvertePara<String>(dst.Tables[0].Rows[0]["complConsumidor"], "");
            txbBairro.Text          = Convert.ToString(dst.Tables[0].Rows[0]["bairroConsumidor"]);
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
        txbDocumento.Text          = Convert.ToString(Session["docUsuario"]);
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PreencheDadosConsumidor();
            PreencheConfiguracoes();
            //grdDesejos.DataBind();
            //grdPedido.DataBind();
            //grdCompra.DataBind();
        }
    }

    protected void btnConfirmaDados_Click(object sender, EventArgs e)
    {
        try
        {
            consumidor = new Consumidor();
            if (Session["IdConsumidor"] != null)
            {
                consumidor.IdConsumidor = Convert.ToInt32(Session["IdConsumidor"]);
                Acao = "U";
            }
            else
            {
                consumidor.IdConsumidor = 0;
                Acao = "I";
            }
            consumidor.IdUsuario        = Convert.ToInt32(Session["idUsuario"]);
            consumidor.NomeConsumidor   = txbNome.Text;
            consumidor.DtNascimento     = Convert.ToDateTime(txbDtNascimento.Text);
            consumidor.TelConsumidor    = txbTelefone.Text;
            consumidor.CelConsumidor    = txbCelular.Text;
            consumidor.CepConsumidor    = txbCEP.Text;
            consumidor.UfConsumidor     = txbUf.Text;
            consumidor.CidConsumidor    = txbCidade.Text;
            consumidor.EnderConsumidor  = txbEndereco.Text;
            consumidor.NumConsumidor    = Convert.ToInt32(txbNumero.Text);
            consumidor.ComplConsumidor  = txbComplemento.Text;
            consumidor.BairroConsumidor = txbBairro.Text;
            consumidor.SexoConsumidor   = ddlPergunta.SelectedValue;

            consumidorDao = new ConsumidorDAO();
            consumidorDao.ManutencaoConsumidor(consumidor, Acao);
        }
        finally
        {
            PreencheDadosConsumidor();
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
            usuario.AtivoUsuario = 1;

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