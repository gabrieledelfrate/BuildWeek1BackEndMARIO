<%@ Import Namespace="System.Linq" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Dettaglio.aspx.cs" Inherits="MARIO.Dettaglio" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row ms-5">
        <div class="col-2 mt-5 ms-5">
            <h2 id="ttlProduct" runat="server"></h2>
            <img src="www" id="img" runat="server" alt="..." class="w-100 100" />
            <p class="mt-2 text-center fs-3 fw-bold" id="txtPrice" runat="server"></p>
            <asp:Button ID="btnAddCart" runat="server" Text="Aggiungi al carrello" CssClass="btn btn-outline-success ms-3" OnClick="btnAddCart_Click" />
            <asp:DropDownList ID="ddlQuantita" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQuantita_SelectedIndexChanged" CssClass="btn btn-secondary">
                <asp:ListItem Text="1" Value="1" />
                <asp:ListItem Text="2" Value="2" />
                <asp:ListItem Text="3" Value="3" />
                <asp:ListItem Text="4" Value="4" />
                <asp:ListItem Text="5" Value="5" />
                <asp:ListItem Text="6" Value="6" />
                <asp:ListItem Text="7" Value="7" />
                <asp:ListItem Text="8" Value="8" />
                <asp:ListItem Text="9" Value="9" />
                <asp:ListItem Text="10" Value="10" />
            </asp:DropDownList>
        </div>
        <div class="col-4 d-flex justify-content-start align-items-center">
            <p class="mt-3" id="txtDescription" runat="server"></p>
        </div>
    </div>
    <div class="container-lg m-auto mt-5">
        <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
    </div>
   <div id="cartToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true" runat="server" Visible="false">
    <div class="d-flex">
        <div class="toast-body">
            Prodotto aggiunto al carrello!
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
</div>

</asp:Content>