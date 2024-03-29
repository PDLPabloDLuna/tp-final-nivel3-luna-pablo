using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace web_articulos
{
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["miembro"]))
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                FavoritoNegocio negocio = new FavoritoNegocio();
                Miembro user = (Miembro)Session["miembro"];
                string id = user.Id.ToString();
                Session.Add("listaFavs", negocio.listar(id));
                dgvFavoritos.DataSource = Session["listaFavs"];
                dgvFavoritos.DataBind();
            }
        }

        protected void dgvFavoritos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvFavoritos.PageIndex = e.NewPageIndex;
            dgvFavoritos.DataSource = Session["listaFavs"];
            dgvFavoritos.DataBind();
        }

        protected void dgvFavoritos_SelectedIndexChanged(object sender, EventArgs e)
        {
            FavoritoNegocio negocio = new FavoritoNegocio();
            Miembro user = (Miembro)Session["miembro"];
            try
            {
                string idUser = user.Id.ToString();
                string idArt = dgvFavoritos.SelectedDataKey.Value.ToString();
                negocio.eliminarFav(idUser, idArt);
                Response.Redirect("Favoritos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}