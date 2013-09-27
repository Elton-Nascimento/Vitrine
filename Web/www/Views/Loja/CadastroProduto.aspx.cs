using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using WebSite.Entities;
using WebSite.Business;
using WebSite.Data;
using Microsoft.SqlServer.Server;
using System.Data;

public partial class Views_Loja_CadastroProduto : System.Web.UI.Page
{
    private Produto      produto;
    private Prod_Pag     prod_pag;
    private ProdutoDAO   produtoDao;
    private Prod_PagDAO  prod_pagDao;
    private ImagensDAO   imagensDao;
    private Utils        utls = new Utils();
    private DataSet      dst;
    private List<string> lstBandeira = new List<string>();

    #region Preenchimento do Wizard
    protected void CarregaProduto(int idProduto, string descrProduto)
    {
        dst = new DataSet();
        
        produtoDao = new ProdutoDAO();
        dst = produtoDao.ConsultaProduto(idProduto, 0, descrProduto, utls.ConvertePara<Int32>(Session["idLoja"], 0));

        if (dst.Tables[0].Rows.Count > 0)
        {
            DataRow dr = dst.Tables[0].Rows[0];
            txbDescricao.Text           = utls.ConvertePara<String>(dr["descrProduto"], "");
            ddlCategoria.SelectedValue  = utls.ConvertePara<String>(dr["idCategoria"], "");
            txbQtde.Text                = utls.ConvertePara<String>(dr["qtdeEstoque"], "");
            txbCusto.Text               = utls.ConvertePara<String>(dr["valorCusto"], "");
            txbVenda.Text               = utls.ConvertePara<String>(dr["valorVenda"], "");
            cblOutros.Items[0].Selected = Convert.ToBoolean(dr["freteGratis"]);
            cblOutros.Items[1].Selected = Convert.ToBoolean(dr["ativoProduto"]);
            ddlCategoria.DataBind();
        }
    }

    protected void CarregaImagens(int idProduto)
    {
        dst = new DataSet();

        imagensDao = new ImagensDAO();
        dst = imagensDao.ConsultaImagens(utls.ConvertePara<Int32>(Session["idProduto"], 0));
    }
    #endregion

    #region Selected CheckBox
    protected void checkedAll_Changed(object sender, EventArgs e)
    {
        CheckBox CheckBoxTodos = (CheckBox)grdBandeira.HeaderRow.FindControl("ckbTodos");

        foreach (GridViewRow row in grdBandeira.Rows)
        {
            CheckBox checkBox = (CheckBox)row.FindControl("ckbItem");
            checkBox.Checked = CheckBoxTodos.Checked;

            SaveCheckBoxData();
        }
    }
    protected void CheckedItem_Changed(object sender, EventArgs e)
    {
        SaveCheckBoxData();
    }
    private void SaveCheckBoxData()
    {
        lstBandeira = (List<string>)ViewState["grdBandeira"];

        foreach (GridViewRow row in grdBandeira.Rows)
        {
            string idPagamento = grdBandeira.DataKeys[row.RowIndex]["idPagamento"].ToString();
            bool isChecked = ((CheckBox)row.FindControl("ckbItem")).Checked;

            if (isChecked)
            {
                if (lstBandeira.Contains(idPagamento) == false)
                    lstBandeira.Add(idPagamento);
            }
            else
            {
                if (lstBandeira.Contains(idPagamento))
                    lstBandeira.Remove(idPagamento);
            }
        }

        ViewState["grdBandeira"] = lstBandeira;
    }
    private void LoadCheckBoxData()
    {
        lstBandeira = (List<string>)ViewState["grdBandeira"];

        foreach (GridViewRow row in grdBandeira.Rows)
        {
            string idPagamento = grdBandeira.DataKeys[row.RowIndex]["idPagamento"].ToString();

            if (lstBandeira.Contains(idPagamento))
            {
                CheckBox checkBox = (CheckBox)row.FindControl("ckbItem");
                checkBox.Checked = true;
            }
        }
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        wzProduto.PreRender += new EventHandler(Wizard1_PreRender);

        if (!IsPostBack)
	    {
            List<string> list = new List<string>();
            ViewState["grdBandeira"] = list;

		    if (Session["modo"].ToString() == "U")
            {
                CarregaProduto(utls.ConvertePara<Int32>(Session["idProduto"], 0), "");
                CarregaImagens(utls.ConvertePara<Int32>(Session["idProduto"], 0));
            }
	    }
    }

    protected void Wizard1_PreRender(object sender, EventArgs e)
    {
        Repeater SideBarList = wzProduto.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
        SideBarList.DataSource = wzProduto.WizardSteps;
        SideBarList.DataBind();
    }

    protected string GetClassForWizardStep(object wizardStep)
    {
        WizardStep step = wizardStep as WizardStep;

        if (step == null)
        {
            return "";
        }
        int stepIndex = wzProduto.WizardSteps.IndexOf(step);

        if (stepIndex < wzProduto.ActiveStepIndex)
        {
            return "prevStep";
        }
        else if (stepIndex > wzProduto.ActiveStepIndex)
        {
            return "nextStep";
        }
        else
        {
            return "currentStep";
        }
    }

    protected void wzProduto_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (Page.IsValid)
        {
            produto    = new Produto();
            produtoDao = new ProdutoDAO();

            int index = ((Wizard)sender).ActiveStepIndex;
            if (index == 0)
            {
                if (Session["modo"].ToString() == "I")
                {
                    try
                    {
                        if (utls.ProdutoExistente(Convert.ToInt32(Session["idUsuario"]), Convert.ToString(Session["idUsuario"])))
                        {
                            return;
                        }

                        produto.IdProduto    = utls.ConvertePara<Int32>(Session["idProduto"], 0);
                        produto.IdLoja       = utls.ConvertePara<Int32>(Session["idLoja"], 0);
                        produto.IdCategoria  = Convert.ToInt32(ddlCategoria.SelectedValue);
                        produto.DescrProduto = Convert.ToString(txbDescricao.Text);
                        produto.QtdeEstoque  = utls.ConvertePara<Int32>(txbQtde.Text, 1);
                        produto.ValorCusto   = utls.ConvertePara<Double>(txbCusto.Text, 0.00);
                        produto.ValorVenda   = Convert.ToDouble(txbVenda.Text);
                        produto.FreteGratis  = utls.ConvertePara<Boolean>(cblOutros.Items[0].Selected, false);
                        produto.AtivoProduto = utls.ConvertePara<Boolean>(cblOutros.Items[1].Selected, true);

                        produtoDao.sp_ManutencaoProduto(produto, Session["modo"].ToString());
                    }
                    finally
                    {
                        produtoDao = new ProdutoDAO();
                        dst = produtoDao.ConsultaProduto(0, Convert.ToInt32(ddlCategoria.SelectedValue),
                                                         txbDescricao.Text, utls.ConvertePara<Int32>(Session["idLoja"], 0));

                        if (dst.Tables[0].Rows.Count > 0)
                        {
                            DataRow dr = dst.Tables[0].Rows[0];
                            Session["idProduto"] = dr["idProduto"].ToString();
                        }
                    }
                }
                else
                {
                    produto.IdProduto    = utls.ConvertePara<Int32>(Session["idProduto"], 0);
                    produto.IdLoja       = utls.ConvertePara<Int32>(Session["idLoja"], 0);
                    produto.IdCategoria  = Convert.ToInt32(ddlCategoria.SelectedValue);
                    produto.DescrProduto = Convert.ToString(txbDescricao.Text);
                    produto.QtdeEstoque  = utls.ConvertePara<Int32>(txbQtde.Text, 1);
                    produto.ValorCusto   = utls.ConvertePara<Double>(txbCusto.Text, 0.00);
                    produto.ValorVenda   = Convert.ToDouble(txbVenda.Text);
                    produto.FreteGratis  = utls.ConvertePara<Boolean>(cblOutros.Items[0].Selected, false);
                    produto.AtivoProduto = utls.ConvertePara<Boolean>(cblOutros.Items[1].Selected, true);

                    produtoDao.sp_ManutencaoProduto(produto, Session["modo"].ToString());
                }
            }
        }
    }

    protected void grdImagens_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Alterar")
        {
            imagensDao = new ImagensDAO();
            string caminho  = Server.MapPath("~/Content/Imagens/Loja/Produtos/");
            string mensagem = string.Empty;

            GridViewRow selected = (GridViewRow)((Control)(e.CommandSource)).Parent.Parent;
            int index = selected.RowIndex;
            FileUpload fup = (FileUpload)grdImagens.Rows[index].FindControl("fplImagemProduto");
        }
    }

    protected void grdBandeira_DataBound(object sender, EventArgs e)
    {
        LoadCheckBoxData();
        if (grdBandeira.Rows.Count <= 0)
        {
            btnInserir.Visible = false;
        }
        else
        {
            btnInserir.Visible = true;
        }
    }

    protected void btnInserir_Click(object sender, EventArgs e)
    {
        lstBandeira = (List<string>)ViewState["grdBandeira"];

        if (lstBandeira.Count > 0)
        {
            try
            {
                prod_pagDao = new Prod_PagDAO();

                for (int i = 0; i < lstBandeira.Count; i++)
                {
                    prod_pag = new Prod_Pag();
                    prod_pag.IdPagamento = Convert.ToInt32(lstBandeira[i]);
                    prod_pag.QtdeParcela = 1;
                    prod_pag.IdProduto   = Convert.ToInt32(Session["idProduto"]);

                    prod_pagDao.sp_ManutencaoProd_Pag(prod_pag, "I");
                }
            }
            finally
            {
                grdProduto_Pagamento.DataBind();
                List<string> list = new List<string>();
                ViewState["grdBandeira"] = list;
            }
        }
    }

    protected void grdProduto_Pagamento_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        prod_pag = new Prod_Pag();
        prod_pagDao = new Prod_PagDAO();

        if (e.CommandName == "Deletar")
        {
            prod_pag.IdProdPag   = Convert.ToInt32(e.CommandArgument);

            prod_pagDao.sp_ManutencaoProd_Pag(prod_pag, "D");
        }
        else if (e.CommandName == "Alterar")
        {
            try
            {
                GridViewRow selected = (GridViewRow)((Control)(e.CommandSource)).Parent.Parent;
                int index = selected.RowIndex;
                TextBox txbQtdeParcela = (TextBox)grdProduto_Pagamento.Rows[index].FindControl("txbQtde");
                TextBox txbJuros = (TextBox)grdProduto_Pagamento.Rows[index].FindControl("txbJuros");

                prod_pag.QtdeParcela = Convert.ToInt32(txbQtdeParcela.Text);
                prod_pag.JurosParcela = Convert.ToInt32(txbJuros.Text);
                prod_pag.IdProdPag = Convert.ToInt32(e.CommandArgument);

                prod_pagDao.sp_ManutencaoProd_Pag(prod_pag, "U");
            }
            finally
            {
                grdProduto_Pagamento.EditIndex = -1;
                grdProduto_Pagamento.DataBind();
            }
        }
        grdProduto_Pagamento.DataBind();
    }

    protected void grdProduto_Pagamento_DataBinding(object sender, EventArgs e)
    {
        grdBandeira.DataBind();
    }

    protected void wzProduto_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (Convert.ToString(Session["modo"]) == "I")
        {
            pnlMessage.Visible = true;
            pnlMessage.Enabled = true;
            pnlMessage.Style.Add(HtmlTextWriterStyle.Left, "562px");
            pnlMessage.Style.Add(HtmlTextWriterStyle.Top, "324px");
        }
        else
        {
            Response.Redirect("MeusProdutos.aspx");
        }
    }

    protected void grdImagens_SelectedIndexChanged(object sender, EventArgs e)
    {
       btnEditar.CommandArgument = Convert.ToString(grdImagens.SelectedDataKey["idImagem"]);
       imgProduto.ImageUrl       = Convert.ToString(grdImagens.SelectedDataKey["localImagem"]);
    }

    protected void ibtnRefresh_Click(object sender, ImageClickEventArgs e)
    {
        string caminho = string.Empty;

        if (fplImagemProduto.HasFile)
        {
            try
            {
                caminho = Convert.ToString("~/Content/Imagens/Loja/Produtos/" + fplImagemProduto.FileName);
                fplImagemProduto.SaveAs(Server.MapPath(caminho));
            }
            finally
            {
                imgProduto.ImageUrl = caminho;
            }
        }
    }

    protected void btnEditar_Click(object sender, EventArgs e)
    {
        imagensDao = new ImagensDAO();
        if (imgProduto.ImageUrl != null || imgProduto.ImageUrl != "")
        {
            try
            {
                int    idImagem = Convert.ToInt32(((Button)sender).CommandArgument);
                string nome     = imgProduto.ImageUrl.Replace("~/Content/Imagens/Loja/Produtos/", "");

                imagensDao.UpateImagens(nome, imgProduto.ImageUrl, idImagem);
            }
            finally
            {
                grdImagens.DataBind();
            }
        }
    }

    protected void btnSim_Click(object sender, EventArgs e)
    {
        pnlMessage.Visible = false;
        pnlMessage.Enabled = false;

        Response.Redirect("MeusProdutos.aspx");
    }
    protected void btnNao_Click(object sender, EventArgs e)
    {
        try
        {
            grdProduto_Pagamento.SelectedIndex = 0;
            int vidProduto = Convert.ToInt32(grdProduto_Pagamento.SelectedDataKey["idProduto"]);

            produtoDao = new ProdutoDAO();
            produto    = new Produto();
            produto.IdProduto    = vidProduto;
            produto.IdLoja       = Convert.ToInt32(Session["idLoja"]);
            produto.IdCategoria  = 0;
            produto.DescrProduto = "";
            produto.QtdeEstoque  = 1;
            produto.ValorCusto   = 0.00;
            produto.ValorVenda   = 0.00;
            produto.FreteGratis  = false;
            produto.AtivoProduto = false;          
            
            produtoDao.sp_ManutencaoProduto(produto, "D");
        }
        finally
        {
            pnlMessage.Visible = false;
            pnlMessage.Enabled = false;

            Response.Redirect("MeusProdutos.aspx");
        }
    }
}