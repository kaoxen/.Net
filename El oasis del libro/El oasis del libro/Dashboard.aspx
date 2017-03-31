<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="El_oasis_del_libro.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 171px;
            width: 1019px;
        }
        .auto-style2 {
            height: 145px;
            width: 195px;
        }
        .auto-style3 {
            height: 137px;
            width: 143px;
        }
        .auto-style4 {
            height: 69px;
            width: 111px;
            margin-top: 0px;
        }
        .auto-style5 {
            height: 171px;
            width: 192px;
            float: left;
            margin-left: 148px;
        }
        .auto-style6 {
            height: 146px;
            width: 233px;
            margin-top: 0px;
        }
        .auto-style8 {
            width: 433px;
        }
        .auto-style9 {
            width: 494px;
            text-align: center;
        }
        .auto-style10 {
            width: 354px;
            color: #0033CC;
        }
        .auto-style11 {
            text-align: center;
        }
        .auto-style12 {
            color: #0033CC;
        }
        .auto-style13 {
            width: 433px;
            color: #0033CC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width=" "100%">
        <tr>
            <td colspan="2">
                <strong>
                <img src="imagenes/oasis titulo.PNG"  runat="server" class="auto-style1"/>
            </strong>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>
                <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Large" ForeColor="#284E98" StaticSubMenuIndent="10px">
                    <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#B5C7DE" />
                    <DynamicSelectedStyle BackColor="#507CD1" />
                    <Items>
                        <asp:MenuItem NavigateUrl="~/Libros.aspx" Text="Libros"></asp:MenuItem> <asp:MenuItem NavigateUrl="~/Ventas.aspx" Text="Ventas" Value="Ventas"></asp:MenuItem> <asp:MenuItem NavigateUrl="~/Clientes.aspx" Text="Clientes" Value="Clientes"></asp:MenuItem> <asp:MenuItem NavigateUrl="~/Reportes.aspx" Text="Reportes" Value="Reportes"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="#507CD1" />
                </asp:Menu>
                </strong>
            </td>
        </tr>
       <tr>
           <td class="auto-style9">
               <strong>
               <img src="~/imagenes/Cliente.PNG"  runat="server" class="auto-style2"/></strong><p class="auto-style10"><strong>REGISTRAR CLIENTE <br />  MODIFICAR CLIENTE <br />  ELIMINAR CLIENTE <br />  </strong>  </p>
               
           </td>
           <td class="auto-style11">
               <strong>
              <img src="~/imagenes/lib.PNG"  runat="server" class="auto-style6"/></strong><p class="auto-style12"> <strong>REGISTRAR LIBRO <br />  MODIFICAR LIBRO <br />  ELIMINAR LIBRO <br />  </strong>  </p>
    </td>    </tr>
        <tr>
            <td class="auto-style9">
                <strong>
                <img src="~/imagenes/CajaR.PNG" runat="server" class="auto-style3"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="~/imagenes/Factura.PNG" runat="server" class="auto-style4"/></strong> <p class="auto-style13"><strong>REGISTRAR LIBROS A  VENTA <br />  MODIFICAR LIBROS DE LA VENTA <br />  ELIMINAR LIBROS DE LA VENTA <br /> GENERAR FACTURA  <br /></strong></p>
                </td>
            <td class="auto-style11">
                <strong>
                <img src="~/imagenes/INVENTARIOS.PNG" runat="server" class="auto-style5"/></strong> <p class="auto-style8"><strong><span class="auto-style12">   VER INVENTARIOS </span> <br class="auto-style12" />   </strong>   </p>
            </td>
        </tr>
    </table>
    </div>
    </form>
    <p>
        <strong></strong></p>
</body>
</html>
