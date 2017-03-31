using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_oasis_del_libro
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                 IdIncorrecto.Text = "";

                if (Request.QueryString != null)
                {
                    string advert = Request.QueryString["advert"];
                    IdIncorrecto.Text = advert;

                }

            }
        }

      
        protected void gridClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                int indiceFila = Convert.ToInt32(e.CommandArgument.ToString());
                string codcli = gridClientes.Rows[indiceFila].Cells[0].Text;
                if (e.CommandName == "Editar")
                {
                    CLIENTES seleccionLibro = conexion.CLIENTES.Where(w => w.IdCliente == codcli).SingleOrDefault();

                    IdCliente.Text = seleccionLibro.IdCliente.ToString();
                    NombreCliente.Text = seleccionLibro.NombreCliente;
                    Telefono.Text = seleccionLibro.TelefonoCliente.ToString();
                    Direccion.Text = seleccionLibro.DireccionCliente.ToString();
                    IdCliente.Enabled = false;

                }
                if (e.CommandName == "Eliminar")
                {
                    CLIENTES seleccionLibro = conexion.CLIENTES.Where(w => w.IdCliente == codcli).SingleOrDefault();
                    VENTAS ventascli = conexion.VENTAS.Where(w => w.IdCliente == codcli).FirstOrDefault();
                    if (ventascli == null)
                    {
                        if (seleccionLibro != null)
                        {
                            conexion.CLIENTES.Remove(seleccionLibro);
                            conexion.SaveChanges();
                        }
                    }
                    Response.Redirect("Clientes.aspx");
                }
                /*  if (e.CommandName == "Ver")
                  {
                      pendiente traer datos de cantidad 
                  }*/
                
            }
        }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())

            { string IdentC = IdCliente.Text;
                CLIENTES validarId = conexion.CLIENTES.Where(w => w.IdCliente == IdentC).SingleOrDefault();
                if (validarId == null)
                {
                    CLIENTES nuevoCliente = new CLIENTES();

                    nuevoCliente.IdCliente = IdCliente.Text;
                    nuevoCliente.NombreCliente = NombreCliente.Text;
                    nuevoCliente.TelefonoCliente = Convert.ToInt32(Telefono.Text);
                    nuevoCliente.DireccionCliente = Convert.ToInt32(Direccion.Text);

                    conexion.CLIENTES.Add(nuevoCliente);
                    conexion.SaveChanges();

                    Response.Redirect("Clientes.aspx");
                }
                else {

                    string advert = "El Id del Cliente ya existe";
                    Response.Redirect("Clientes.aspx?advert=" + advert);
                }
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            string codcli = IdCliente.Text;
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                CLIENTES cambioCliente = conexion.CLIENTES.Where(w => w.IdCliente== codcli).SingleOrDefault();
                if (cambioCliente != null)
                {
                    cambioCliente.NombreCliente = NombreCliente.Text;
                    cambioCliente.TelefonoCliente = Convert.ToInt32(Telefono.Text);
                    cambioCliente.DireccionCliente = Convert.ToInt32(Direccion.Text);

                    conexion.SaveChanges();
                }

            }
            Response.Redirect("Clientes.aspx");
        }
    }
}
