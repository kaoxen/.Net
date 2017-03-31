<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="El_oasis_del_libro.Factura" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 197px;
            width: 1021px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table> <tr>
            <td>
                <img src="imagenes/oasis titulo.PNG"  runat="server" class="auto-style1"/>
            </td>
        </tr>
            <tr>
            <td>
               Factura #  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
               </tr>
            <tr>
            <td> Cliente  <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
               
            </td>
               </tr>
            <tr>
            <td>
               Fecha  <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
               </tr>
            <tr>
            <td>
               Total  <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
               </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Regresar a Ventas" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
