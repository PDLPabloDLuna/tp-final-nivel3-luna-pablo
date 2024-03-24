using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public static class Seguridad
    {
        public static bool sesionActiva(object user)
        {
            Miembro miembro = user != null ? (Miembro)user : null;
            if (miembro != null && miembro.Id != 0)
                return true;
            else
                return false;
        }

        public static bool esAdmin(object user)
        {
            Miembro miembro = user != null ? (Miembro)user : null;
            return miembro != null ? miembro.Admin : false;
        }
    }

}
