using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebSite.Entities
{
    public class Produto
    {
        #region Atributos
        private Int32?  _idProduto;
        private Int32?  _idLoja;
        private Int32?  _idCategoria;
        private String  _descrProduto;
        private Int32   _qtdeEstoque;
        private Double  _valorCusto;
        private Double  _valorVenda;
        private Boolean _freteGratis;
        private Int32   _likeProduto;
        private Int32   _unlikeProduto;
        private Boolean _ativoProduto;
        #endregion

        #region Encapsulate Fields
        public Int32? IdProduto
        {
            get { return _idProduto; }
            set { _idProduto = value; }
        }

        public Int32? IdLoja
        {
            get { return _idLoja; }
            set { _idLoja = value; }
        }

        public Int32? IdCategoria
        {
            get { return _idCategoria; }
            set { _idCategoria = value; }
        }

        public String DescrProduto
        {
            get { return _descrProduto; }
            set { _descrProduto = value; }
        }

        public Int32 QtdeEstoque
        {
            get { return _qtdeEstoque; }
            set { _qtdeEstoque = value; }
        }

        public Double ValorCusto
        {
            get { return _valorCusto; }
            set { _valorCusto = value; }
        }

        public Double ValorVenda
        {
            get { return _valorVenda; }
            set { _valorVenda = value; }
        }

        public Boolean FreteGratis
        {
            get { return _freteGratis; }
            set { _freteGratis = value; }
        }

        public Int32 LikeProduto
        {
            get { return _likeProduto; }
            set { _likeProduto = value; }
        }

        public Int32 UnlikeProduto
        {
            get { return _unlikeProduto; }
            set { _unlikeProduto = value; }
        }

        public Boolean AtivoProduto
        {
            get { return _ativoProduto; }
            set { _ativoProduto = value; }
        }
        #endregion
    }
}
