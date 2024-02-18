using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace dominio
{
    public class Articulo
    {
        public int Id { get; set; }
        [DisplayName("Código")]
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        [DisplayName("Descripción")]
        public string Descripcion { get; set; }
        public string UrlImagen { get; set; }
        [DisplayName("Marca")]
        public Marca NombreMarca { get; set; }
        [DisplayName("Categoría")]
        public Categoria TipoCat { get; set; }
        public decimal Precio { get; set; }
    }
}
