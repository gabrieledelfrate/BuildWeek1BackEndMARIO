<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MARIO.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Login</title>
    <link rel="icon" type="image/x-icon" href="/Images/piccol.ico" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Workbench:SCAN@6&display=swap" rel="stylesheet" />
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            font-family: sans-serif;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background: #0050AA;
        }

        .form {
            position: absolute;
            top: 22%;
            right: 41%;
            padding: 60px 15px;
            width: 370px;
            height: 485px;
            background: #E60A14;
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
            margin-top: 30px;
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
            width: 100%;
            margin-bottom: 20px;
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
            text-align: center;
            color: #0050AA;
            margin-top: 20px;
        }

        .logmar {
            margin-top: 150px;
        }

        .animate-charcter {
            text-transform: uppercase;
            background-image: linear-gradient( -225deg, #231557 0%, #44107a 29%, #ff1361 67%, #fff800 100% );
            background-size: auto auto;
            background-clip: border-box;
            background-size: 200% auto;
            color: #fff;
            background-clip: text;
            text-fill-color: transparent;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: textclip 2s linear infinite;
            display: inline-block;
            font-size: 190px;
            font-family: 'Workbench', sans-serif;
            letter-spacing:6px;
        }

        @keyframes textclip {
            to {
                background-position: 200% center;
            }
        }
    </style>
</head>
<body>
    <div class="row w-100 mb-5">
        <div class="col-3 w-100 d-flex justify-content-end">
            <h2 class="text-center text-white fw-bolder mt-2 animate-charcter workbench">AL </h2>
        </div>
        <div class="col-6 w-100 d-flex justify-content-center">
            <h2 class="text-center text-white fw-bolder mt-2 animate-charcter">PICCOL</h2>
        </div>
        <div class="col-3 w-100 d-flex justify-content-start">
            <h2 class="text-center text-white fw-bolder mt-2 animate-charcter">I</h2>
        </div>
    </div>

    <div class="row my-5 w-100 d-flex justify-content-evenly">
        <div class="col-6 w-100 d-flex justify-content-center">
            <h2 class=" mt-2 animate-charcter">PREZZI </h2>
        </div>
        <div class="col-6 w-100 d-flex justify-content-center">
            <h2 class=" mt-2 animate-charcter">VANNO</h2>
        </div>
    </div>

    <div class="row logmar w-100 justify-content-evenly">
        <div class="col-4 w-100 d-flex justify-content-end">
            <h2 class=" mt-2 animate-charcter">A</h2>
        </div>
        <div class="col-8 w-100 d-flex justify-content-center">
            <h2 class="mt-2 animate-charcter">PICCO-L</h2>
        </div>
    </div>


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
