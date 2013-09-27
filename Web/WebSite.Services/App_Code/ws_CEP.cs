using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using WebSite.Data;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for ws_CEP
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class ws_CEP : System.Web.Services.WebService {

    public ws_CEP () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public WebSite.Data.Utils.stcCep ConsultaCep(string cep)
    {
        Utils utls = new Utils();
        WebSite.Data.Utils.stcCep stcRetorno = new Utils.stcCep();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CEPConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = @"SELECT TOP 1
                                   LOGRADOURO.cepLogradouro,
                                   ESTADO.siglaEstado,
                                   CIDADE.nomeCidade,
                                   BAIRRO.nomeBairro,
                                   LOGRADOURO.nomeLogradouro
                              FROM LOGRADOURO
                             INNER JOIN BAIRRO
                                ON LOGRADOURO.idBairro = BAIRRO.idBairro
                              LEFT OUTER JOIN CIDADE
                                ON BAIRRO.idCidade = CIDADE.idCidade
                             INNER JOIN ESTADO
                                ON CIDADE.idEstado = ESTADO.idEstado
                             WHERE LOGRADOURO.cepLogradouro = @CepLogradouro;";
        try
        {
            cmd.Parameters.AddWithValue("@CepLogradouro", Convert.ToString(cep));

            cmd.Connection.Open();

            DataSet dts = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dts);

            if (dts.Tables[0].Rows.Count > 0)
            {
                DataRow dr = dts.Tables[0].Rows[0];
                stcRetorno.CepLogradouro = utls.ConvertePara<String>(dr["cepLogradouro"], cep); ;
                stcRetorno.SiglaEstado   = utls.ConvertePara<String>(dr["siglaEstado"], "");
                stcRetorno.NomeCidade    = utls.ConvertePara<String>(dr["nomeCidade"], "");
                if (cep.Substring(5, 3) == "000")
                {
                    stcRetorno.NomeBairro = "";
                    stcRetorno.NomeLogradouro = "";
                }
                else
                {
                    stcRetorno.NomeBairro = utls.ConvertePara<String>(dts.Tables[0].Rows[0]["nomeBairro"], "");
                    stcRetorno.NomeLogradouro = utls.ConvertePara<String>(dts.Tables[0].Rows[0]["nomeLogradouro"], "");
                }
            }

            cmd.Connection.Close();

            return stcRetorno;
        }
        catch (Exception ex)
        {
            throw (new Exception("mensagem do contexto", ex));
        }
    }
    
}
