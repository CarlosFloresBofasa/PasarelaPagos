<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autenticar.aspx.cs" Inherits="WebApplication2.Autenticar" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Dermacenter</title>
<style>
  /* Estilos generales */
<style>
  /* Estilos generales */
  body {
    font-family: Arial, sans-serif;
    background-color: #fde9e8;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
  }

  #login-container {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  #login-container img {
    max-width: 100%;
    height: auto;
  }

  /* Estilos específicos para el botón Gmail */
  .google-login-button {
    display: inline-flex;
    align-items: center;
    background-color: #fde9e8;
    border: 1px solid #fde9e8;
    border-radius: 4px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 10px; /* Ajusta según sea necesario */
  }

  .google-login-button img {
    margin-right: 10px;
  }

  .google-login-button:hover {
    background-color: #fde9e8;
  }
    .auto-style2 {
        height: 85px;
        width: 160px;
    }
    .auto-style3 {
        width: 399px;
        height: 51px;
    }
        #formAutenticacion {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 300px;
        text-align: center;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        text-align: left;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    #Button1 {
        background-color: #4caf50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    #Button1:hover {
        background-color: #45a049;
    }
</style>



</head>

<body>
  <div id="login-container">
    <img src="https://dermacentergt.com/wp-content/uploads/2020/03/logo-dermacenter-1-768x184.png" alt="Dermacenter Logo" class="auto-style3">
    <h2>Iniciar sesión</h2>
  <form id="formAutenticacion" runat="server">
    <div>
        <label for="txtEmail">Email:</label>
        <input type="text" id="txtEmail" runat="server" />
    </div>
    <div>
        <label for="txtPassword">Contraseña:</label>
        <input type="password" id="txtPassword" runat="server" />
    </div>
    <div>
 &nbsp;
        <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Entrar" BackColor="#FDE9E8" BorderColor="#999999" BorderWidth="1px" ForeColor="Black" />--%>
        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Entrar" OnClientClick="return validarCampos();" />

    </div>
</form>
    <div class="google-login-button" onclick="loginWithGoogle()" style="border-color: hidden; border-width: hidden; border-style: inherit;">
      <img src="imagenes/logogoogle.png" alt="Google Logo" class="auto-style2" border="1">
      Iniciar sesión con Google
    </div>
  </div>
</body>   
</html>
<script>
    function loginWithGoogle() {
        alert('En desarrollo');
        // Realizar una solicitud AJAX al servidor cuando se hace clic en el botón
        $.ajax({
            type: 'POST',
            url: 'TuPagina.aspx/AutenticarConGoogle', // Ruta del método en tu código del servidor
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (response) {
                // Manejar la respuesta del servidor si es necesario
                console.log(response);
            },
            error: function (error) {
                // Manejar errores si los hay
                console.error(error);
            }
        });
    }

    $(document).ready(function () {
        // Ejecutar funciones necesarias al cargar el documento
        
    });
</script>
 <script>
     function validarCampos() {
         // Obtén los valores de los campos
         var email = document.getElementById('<%= txtEmail.ClientID %>').value;
        var password = document.getElementById('<%= txtPassword.ClientID %>').value;

         // Realiza la validación
         if (email.trim() === '' || password.trim() === '') {
             alert('Por favor, completa todos los campos.');
             return false; // Evita que el formulario se envíe
         }

         // Si todos los campos están completos, permite el envío del formulario
         return true;
     }
 </script>