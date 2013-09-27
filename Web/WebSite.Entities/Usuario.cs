using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebSite.Entities
{
    public class Usuario
    {
        #region Atributos
            private Int32    _idUsuario;
            private Int32    _idPergunta;
            private String   _respostaUsuario;
            private String   _tipoUsuario;
            private String   _docUsuario;
            private String   _emailUsuario;
            private String   _senhaUsuario;
            private String   _guidUsuario;
            private DateTime _dtUsuario;
            private Int32    _ativoUsuario;
        #endregion

        #region Encapsulate Fields
            public Int32 IdUsuario
            {
                get { return _idUsuario; }
                set { _idUsuario = value; }
            }

            public Int32 IdPergunta
            {
                get { return _idPergunta; }
                set { _idPergunta = value; }
            }

            public String RespostaUsuario
            {
                get { return _respostaUsuario; }
                set { _respostaUsuario = value; }
            }

            public String TipoUsuario
            {
                get { return _tipoUsuario; }
                set { _tipoUsuario = value; }
            }

            public String DocUsuario
            {
                get { return _docUsuario; }
                set { _docUsuario = value; }
            }

            public String EmailUsuario
            {
                get { return _emailUsuario; }
                set { _emailUsuario = value; }
            }

            public String SenhaUsuario
            {
                get { return _senhaUsuario; }
                set { _senhaUsuario = value; }
            }

            public String GuidUsuario
            {
                get { return _guidUsuario; }
                set { _guidUsuario = value; }
            }

            public DateTime DtUsuario
            {
                get { return _dtUsuario; }
                set { _dtUsuario = value; }
            }

            public Int32 AtivoUsuario
            {
                get { return _ativoUsuario; }
                set { _ativoUsuario = value; }
            }

        #endregion
    }
}
