<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="El_oasis_del_libro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EL OASIS DEL LIBRO</title>
    <style type="text/css">
        .auto-style2 {
            width: 378px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                <img src="imagenes/oasis titulo.PNG" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                 <strong>USUARIO  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="USUARIO" runat="server"></asp:TextBox>
            </td>
          
        </tr>
        <tr>
            <td class="auto-style2">
                <strong>PASSWORD </strong>&nbsp; <asp:TextBox ID="PW" runat="server" TextMode="Password"></asp:TextBox>
            </td>
           
            </tr>
        <tr> <td class="auto-style2">
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
            </td>
           
            
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
       
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
