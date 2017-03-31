<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="El_oasis_del_libro.Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            background-color: #0000FF;
            height: 196px;
            width: 1020px;
        }
        .auto-style2 {
            font-weight: bold;
        }
        .auto-style3 {
            height: 187px;
            float: left;
        }
        .auto-style4 {
            text-align: center;
            color: #FFFFFF;
            font-size: large;
            background-color: #0033CC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width=" "100%">
        <tr>
            <td colspan="2">
              <img src="imagenes/oasis titulo.PNG"  runat="server" class="auto-style1"/>
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
                        <asp:MenuItem NavigateUrl="~/Libros.aspx" Text="Libros"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Ventas.aspx" Text="Ventas" Value="Ventas"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Clientes.aspx" Text="Clientes" Value="Clientes"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Reportes.aspx" Text="Reportes" Value="Reportes"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="#507CD1" />
                </asp:Menu>
                </strong>
            </td>
        </tr>
       <tr>
            <td colspan="2" class="auto-style4">
                <strong>GESTIÓN DE CLIENTES  
            </strong>  
            </td>
        </tr>
        <tr>
                <td>NUMERO IDENTIFICACION CLIENTE 
                    <asp:TextBox ID="IdCliente" runat="server"></asp:TextBox>
                </td>
            <td rowspan="5">
                <img src="imagenes/Cliente.PNG" runat="server" class="auto-style3" />
            </td>
            </tr>
        <tr>
                <td>NOMBRE CLIENTE 
                    <asp:TextBox ID="NombreCliente" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
                <td>TELEFONO
                    <asp:TextBox ID="Telefono" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>DIRECCION
                    <asp:TextBox ID="Direccion" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
            <td>
                <strong>
                <asp:Button ID="Registrar" runat="server" Text="REGISTRAR" CssClass="auto-style2" OnClick="Registrar_Click" /> <asp:Button ID="Guardar" runat="server" Text="GUARDAR"  CssClass="auto-style2" OnClick="Guardar_Click" /> 
                </strong>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="IdIncorrecto" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong> CLIENTES
            </strong>
            </td>
        </tr> 
        <tr> <td colspan="2">
        <asp:GridView ID="gridClientes" Width="100%" runat="server" AutoGenerateColumns="False" OnRowCommand="gridClientes_RowCommand" Height="246px" DataKeyNames="IdCliente" DataSourceID="SqlDataSourceCli"  >
                        <Columns>
                            <asp:BoundField DataField="IdCliente" HeaderText="IdCliente" ReadOnly="True" SortExpression="IdCliente" />
                            <asp:BoundField DataField="NombreCliente" HeaderText="NombreCliente" SortExpression="NombreCliente" />
                            <asp:BoundField DataField="TelefonoCliente" HeaderText="TelefonoCliente" SortExpression="TelefonoCliente" />
                            <asp:BoundField DataField="DireccionCliente" HeaderText="DireccionCliente" SortExpression="DireccionCliente" />
                            <asp:ButtonField  ButtonType="Button" CommandName ="Editar"  Text="Editar" HeaderText="Editar"  ShowHeader="True" />
                            <asp:ButtonField  ButtonType="Button" CommandName ="Eliminar" Text="Eliminar" HeaderText="Eliminar" ShowHeader="True" />
                               </Columns>
                    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCli" runat="server" ConnectionString="<%$ ConnectionStrings:OasisLibrosConnectionString %>" SelectCommand="SELECT * FROM [CLIENTES]"></asp:SqlDataSource>
 </td> 
            </tr> 
    </table>
    </div>
    </form>
</body>
</html>
