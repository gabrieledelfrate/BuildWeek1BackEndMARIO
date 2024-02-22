<%@ Import Namespace="System.Linq" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Dettaglio.aspx.cs" Inherits="MARIO.Dettaglio" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row ms-5">
        <div class="col-2"></div>
        <div class="col-2 mt-5 ms-5">
            <h2 id="ttlProduct" runat="server"></h2>
            <img src="www" id="img" runat="server" alt="..." class="w-100 100" />



        </div>
        <div class="col-4 d-flex justify-content-start align-items-center">
            <p class="mt-3" id="txtDescription" runat="server"></p>
        </div>
    </div>

    <div class="row mt-3 mb-5">
        <div class="col-7">
            <p class="text-center fs-3 fw-bold" id="txtPrice" runat="server"></p>
        </div>
        <div class="col-3">
            <asp:Button ID="btnAddCart" runat="server" Text="Aggiungi al carrello" CssClass="btn btn-outline-success ms-3" OnClick="btnAddCart_Click" />
            <asp:DropDownList ID="ddlQuantita" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQuantita_SelectedIndexChanged" CssClass="btn">
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
    </div>


    <div class="container-lg m-auto mt-5">
        <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
    </div>

<div aria-live="polite" aria-atomic="true" style="position: fixed; top: 0; right: 0; min-height: 200px; z-index: 1000;">
    <div style="position: absolute; top: 0; right: 0;">
         <div class="toast toast-success" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000">
            <div class="toast-header">
                <strong class="mr-auto">Successo</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body">
                Prodotto aggiunto al carrello con successo!
            </div>
        </div>
        <div class="toast toast-error" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000">
            <div class="toast-header">
                <strong class="mr-auto">Errore</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body">
                Si � verificato un errore durante l'aggiunta del prodotto al carrello.
            </div>
        </div>
    </div>
</div>
    <script>
        $(document).ready(function () {
            $('#btnAddCart').click(function () {
                $('.toast').toast('show');
            });
        });
    </script>
</asp:Content>

