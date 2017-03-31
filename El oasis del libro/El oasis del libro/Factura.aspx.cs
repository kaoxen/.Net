using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_oasis_del_libro
{
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {

                int cod = Convert.ToInt32(Request.QueryString["cod"]);
              
           
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {

                VENTAS seleccionVenta = conexion.VENTAS.Where(w => w.IdFactura ==cod).SingleOrDefault();
                    if (seleccionVenta != null)
                    {
                        Label1.Text = cod.ToString();
                        Label2.Text = seleccionVenta.IdCliente;
                        Label3.Text = seleccionVenta.FechaVenta.ToString();
                        Label4.Text = seleccionVenta.ValorTotal.ToString();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }
    }
}