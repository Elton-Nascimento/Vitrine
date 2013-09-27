using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebSite.Entities
{
    public class Prod_Pag
    {
        private Int32? idProdPag;
        private Int32? idProduto;
        private Int32? idPagamento;
        private Int32  qtdeParcela;
        private Double jurosParcela;

        public Int32? IdProdPag
        {
            get { return idProdPag; }
            set { idProdPag = value; }
        }
        
        public Int32? IdProduto
        {
            get { return idProduto; }
            set { idProduto = value; }
        }
        
        public Int32? IdPagamento
        {
            get { return idPagamento; }
            set { idPagamento = value; }
        }
        
        public Int32 QtdeParcela
        {
            get { return qtdeParcela; }
            set { qtdeParcela = value; }
        }
        
        public Double JurosParcela
        {
            get { return jurosParcela; }
            set { jurosParcela = value; }
        }
    }
}
