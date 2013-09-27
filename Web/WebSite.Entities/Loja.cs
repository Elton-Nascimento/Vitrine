using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebSite.Entities
{
    public class Loja
    {
        #region Atributos
            private Int32  _idLoja;
            private Int32  _idUsuario;
            private String _bannerLoja;
            private String _logoLoja;
            private String _razaoSocial;
            private String _nomeFantasia;
            private String _foneLoja;
            private String _siteLoja;
            private String _cepLoja;
            private String _ufLoja;
            private String _cidLoja;
            private String _enderLoja;
            private Int32  _numLoja;
            private String _complLoja;
            private String _bairroLoja;
        #endregion

        #region Encapsulate Fields
            public Int32 IdLoja
            {
                get { return _idLoja; }
                set { _idLoja = value; }
            }

            public Int32 IdUsuario
            {
                get { return _idUsuario; }
                set { _idUsuario = value; }
            }

            public String BannerLoja
            {
                get { return _bannerLoja; }
                set { _bannerLoja = value; }
            }

            public String LogoLoja
            {
                get { return _logoLoja; }
                set { _logoLoja = value; }
            }

            public String RazaoSocial
            {
                get { return _razaoSocial; }
                set { _razaoSocial = value; }
            }

            public String NomeFantasia
            {
                get { return _nomeFantasia; }
                set { _nomeFantasia = value; }
            }

            public String FoneLoja
            {
                get { return _foneLoja; }
                set { _foneLoja = value; }
            }

            public String SiteLoja
            {
                get { return _siteLoja; }
                set { _siteLoja = value; }
            }

            public String CepLoja
            {
                get { return _cepLoja; }
                set { _cepLoja = value; }
            }

            public String UfLoja
            {
                get { return _ufLoja; }
                set { _ufLoja = value; }
            }

            public String CidLoja
            {
                get { return _cidLoja; }
                set { _cidLoja = value; }
            }

            public String EnderLoja
            {
                get { return _enderLoja; }
                set { _enderLoja = value; }
            }

            public Int32 NumLoja
            {
                get { return _numLoja; }
                set { _numLoja = value; }
            }

            public String ComplLoja
            {
                get { return _complLoja; }
                set { _complLoja = value; }
            }

            public String BairroLoja
            {
                get { return _bairroLoja; }
                set { _bairroLoja = value; }
            }
        #endregion
    }
}
