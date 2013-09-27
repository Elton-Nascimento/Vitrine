using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Business;

public partial class AutoComplete : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Método para pesquisa de Produtos
    /// </summary>
    /// <param name="prefixText">Texto digitado para pesquisa</param>
    /// <param name="count">Total de resultados para mostrar</param>
    /// <returns>Array contendo os produtos de acordo com a pesquisa</returns>
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] PesquisarProdutos(string prefixText, int count)
    {
        List<string> Produtos = GetAllProduts().Where(pro => pro.ToLower().Contains(prefixText.ToLower())).ToList(); // Obtendo produtos de acordo com o texto digitado

        List<string> results = new List<string>();
        int total = 0;

        // Efetuando o count
        foreach (var produto in Produtos)
        {
            if (total == count)
                break;

            results.Add(produto);
            total++;
        }

        return results.ToArray();
    }

    public static List<string> GetAllProduts()
    {
        ProdutoDAO produtoDao = new ProdutoDAO();

        return produtoDao.ListarAutoComplete();
    }
}