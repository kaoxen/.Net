using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_oasis_del_libro
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                Label1.Text = "";
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (USUARIO.Text== "kate") { if (PW.Text=="123")
                {
                    Response.Redirect("Dashboard.aspx");

                }
                                         
                        } else
            {
                Label1.Text = " Usuario o contraseña incorrecto";

            }
        }
    }
}