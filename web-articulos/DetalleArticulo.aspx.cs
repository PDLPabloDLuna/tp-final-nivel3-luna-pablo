using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace web_articulos
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                ArticuloNegocio negocio = new ArticuloNegocio();
                Articulo seleccionado = (negocio.listar(id))[0];

                //Cargando los campos de DetalleArticulo.aspx                  
                txtCodigo.Text = seleccionado.Codigo.ToString();
                txtNombre.Text = seleccionado.Nombre;
                txtDescripcion.Text = seleccionado.Descripcion;
                txtMarca.Text = seleccionado.NombreMarca.ToString();
                txtCategoria.Text = seleccionado.TipoCat.ToString();
                imgArticulo.ImageUrl = seleccionado.UrlImagen;
                lblPrecio.Text = "Precio: " + seleccionado.Precio.ToString("C2");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}