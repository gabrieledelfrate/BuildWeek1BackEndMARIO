﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MARIO.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            font-family: sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background: #0050AA;
        }

        .form {
            position: relative;
            padding: 60px 15px;
            width: 370px;
            height: 480px;
            background: #E60A14;
            overflow: hidden;
            box-shadow: 0px 0px 10px 0px rgb(116, 119, 114);
            border-radius: 5px;
        }

        .form-inner {
            position: absolute;
            height: 98%;
            width: 98%;
            top: 50%;
            left: 50%;
            background: #FFF000;
            transform: translate(-50%, -50%);
        }

        .content {
            height: 100%;
            width: 100%;
            padding: 25px;
        }

        .form-inner h2 {
            font-size: 45px;
            font-weight: bold;
            color: #3F51B5;
            text-align: center;
            padding-top: 35px;
        }

        .input {
            display: block;
            padding: 12px 15px;
            width: 100%;
            left: 50%;
            border-radius: 10px;
            margin-top: 20px;
            border: 1.5px solid rgb(109, 87, 121);
            outline: none;
            color: #3F51B5;
        }

        .btn {
            cursor: pointer;
            color: white;
            margin-top: 40px;
            width: 100%;
            padding: 12px;
            outline: none;
            background: #E60A14;
            border: none;
            font-size: 18px;
            border-radius: 10px;
            transition: 0.4s;
        }

            .btn:hover {
                background: #FF9C2A;
            }

        .btnRegister {
            cursor: pointer;
            color: white;
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            outline: none;
            background: #0050AA;
            border: none;
            font-size: 18px;
            border-radius: 10px;
            transition: 0.4s;
        }

            .btnRegister:hover {
                background: #35A6FF;
            }

        p {
            text-align:center;
            color: #0050AA;
            margin-top: 20px;
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form">
        <div class="form-inner">
            <h2>LOGIN</h2>
            <div class="content">
                <asp:TextBox CssClass="input" ID="txtUsername" runat="server" placeholder="Email"></asp:TextBox>
                <asp:TextBox CssClass="input" ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" CssClass="btn" />
                <div>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <p>Non sei ancora registrato?</p>
                    <asp:Button ID="btnRegister" runat="server" Text="Registrati" OnClick="BtnRegistrati_Click" CssClass="btnRegister" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>