using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using WebSite.Data;
using System.Data.SqlClient;

namespace WebSite.Business
{
    public class PessoaDAO
    {
        private Conecta banco = new Conecta();

        public DataSet cnsPessoa(int ID_Pessoa)
        {
            banco.SqlCmd.CommandText = @"SELECT ID_Pessoa,
                                                NM_Pessoa,
                                                DT_Nascimento,
                                                Documento,
                                                Estado_Civil
                                           FROM PESSOA(NOLOCK)
                                          WHERE ID_Pessoa = @ID_Pessoa;";
            banco.SqlCmd.CommandType = CommandType.Text;

            try
            {
                banco.SqlCmd.Parameters.AddWithValue("@ID_Pessoa", ID_Pessoa);
                banco.abrirConexao();

                DataSet dst = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(banco.SqlCmd);
                da.Fill(dst);

                return dst;
            }
            catch (Exception ex)
            {
                throw new Exception("mensagem do contexto", ex);
            }
        }

        public DataSet cnsEndereco(int ID_Pessoa)
        {
            banco.SqlCmd.CommandText = @"SELECT CEP,
                                                UF,
                                                Cidade,
                                                Bairro,
                                                NM_Endereco,
                                                Numero,
                                                Complemento
                                           FROM ENDERECO(NOLOCK)
                                          WHERE ID_Pessoa = @ID_Pessoa;";
            banco.SqlCmd.CommandType = CommandType.Text;

            try
            {
                banco.SqlCmd.Parameters.AddWithValue("@ID_Pessoa", ID_Pessoa);
                banco.abrirConexao();

                DataSet dst = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(banco.SqlCmd);
                da.Fill(dst);

                return dst;
            }
            catch (Exception ex)
            {                
                throw new Exception("mensagem do contexto", ex);
            }
        }
    }
}
