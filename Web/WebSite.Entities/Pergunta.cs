using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebSite.Entities
{
    public class Pergunta
    {
        #region Atributos
            private Int32  _idPergunta;
            private String _descrPergunta;
        #endregion

        #region Encapsulate Fields
            public Int32 IdPergunta
            {
                get { return _idPergunta; }
                set { _idPergunta = value; }
            }

            public String DescrPergunta
            {
                get { return _descrPergunta; }
                set { _descrPergunta = value; }
            }
        #endregion
    }
}
