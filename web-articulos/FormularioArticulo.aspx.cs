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
    public partial class FormularioArticulo : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmaEliminacion = false;
            try
            {
                //Pantalla para agregar (solo llenar los ddl)
                if (!IsPostBack)
                {
                    MarcaNegocio negocioM = new MarcaNegocio();
                    List<Marca> listaM = negocioM.listar();

                    CategoriaNegocio negocioC = new CategoriaNegocio();
                    List<Categoria> listaC = negocioC.listar();

                    ddlMarca.DataSource = listaM;
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    ddlCategoria.DataSource = listaC;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo nuevo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Precio = int.Parse(txtPrecio.Text);

                nuevo.NombreMarca = new Marca();
                nuevo.NombreMarca.Id = int.Parse(ddlMarca.SelectedValue);
                nuevo.TipoCat = new Categoria();
                nuevo.TipoCat.Id = int.Parse(ddlCategoria.SelectedValue);

                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtImagenUrl.Text;

                negocio.agregar(nuevo);
                Response.Redirect("ArticulosLista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}