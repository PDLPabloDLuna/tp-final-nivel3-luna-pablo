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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Miembro miembro = new Miembro();
            MiembroNegocio negocio = new MiembroNegocio();
            try
            {
                miembro.Email = txtEmail.Text;
                miembro.Pass = txtPassword.Text;
                if (negocio.Login(miembro))
                {
                    Session.Add("miembro", miembro);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    Session.Add("error", "Usuario o Pass incorrecto.");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}