using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebSite.Entities
{
    public class Consumidor
    {
        #region Atributos
        private Int32    _idConsumidor;
        private Int32    _idUsuario;
        private String   _nomeConsumidor;
        private DateTime _dtNascimento;
        private String   _telConsumidor;
        private String   _celConsumidor;
        private String   _cepConsumidor;
        private String   _ufConsumidor;
        private String   _cidConsumidor;
        private String   _enderConsumidor;
        private Int32    _numConsumidor;
        private String   _complConsumidor;
        private String   _bairroConsumidor;
        private String _sexoConsumidor;
        #endregion

        #region Encapsulate Fields
        public Int32 IdConsumidor
        {
            get { return _idConsumidor; }
            set { _idConsumidor = value; }
        }

        public Int32 IdUsuario
        {
            get { return _idUsuario; }
            set { _idUsuario = value; }
        }

        public String NomeConsumidor
        {
            get { return _nomeConsumidor; }
            set { _nomeConsumidor = value; }
        }

        public DateTime DtNascimento
        {
            get { return _dtNascimento; }
            set { _dtNascimento = value; }
        }

        public String TelConsumidor
        {
            get { return _telConsumidor; }
            set { _telConsumidor = value; }
        }

        public String CelConsumidor
        {
            get { return _celConsumidor; }
            set { _celConsumidor = value; }
        }

        public String CepConsumidor
        {
            get { return _cepConsumidor; }
            set { _cepConsumidor = value; }
        }

        public String UfConsumidor
        {
            get { return _ufConsumidor; }
            set { _ufConsumidor = value; }
        }

        public String CidConsumidor
        {
            get { return _cidConsumidor; }
            set { _cidConsumidor = value; }
        }

        public String EnderConsumidor
        {
            get { return _enderConsumidor; }
            set { _enderConsumidor = value; }
        }

        public Int32 NumConsumidor
        {
            get { return _numConsumidor; }
            set { _numConsumidor = value; }
        }

        public String ComplConsumidor
        {
            get { return _complConsumidor; }
            set { _complConsumidor = value; }
        }

        public String BairroConsumidor
        {
            get { return _bairroConsumidor; }
            set { _bairroConsumidor = value; }
        }

        public String SexoConsumidor
        {
            get { return _sexoConsumidor; }
            set { _sexoConsumidor = value; }
        }
        #endregion
    }
}
