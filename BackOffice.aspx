<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackOffice.aspx.cs" Inherits="MARIO.BackOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Backoffice - Lista Prodotti</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="icon" type="image/x-icon" href="/Images/piccol.ico" />
    <script>
        function openEditModal(rowId) {
            var modalId = "editModal" + rowId;
            $("#" + modalId).modal("show");
            return false;
        }
        function openEditModal2() {
            $('#addModal').modal('show');
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mb-5 pt-5">
            <asp:Button ID="btnGoToHome" runat="server" Text="Home" CssClass="btn btn-info mb-5" PostBackUrl="~/Home.aspx" />
            <asp:Button ID="btnGoToStoricoOrdini" runat="server" Text="Storico Ordini" CssClass="btn btn-info mb-5" PostBackUrl="~/StoricoOrdini.aspx" />

            <div class="d-flex justify-content-around mb-5 row">
                <div class="col-9">
                    <h2>ADMIN Page - Aggiungi, Modifica o Elimina prodotti dal DataBase</h2>
                </div>
                <div class="col-3 d-flex justify-content-center align-items-center">
                    <asp:Button runat="server" CommandName="Add" CssClass="btn btn-info" Text="Aggiungi prodotto" OnClientClick="return openEditModal2()" />

                    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addModalLabel">Aggiungi Prodotto</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>

                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="txtNomeAdd">Nome:</label>
                                        <asp:TextBox ID="txtNomeAdd" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtPrezzoAdd">Prezzo:</label>
                                        <asp:TextBox ID="txtPrezzoAdd" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtDescrizioneAdd">Descrizione:</label>
                                        <asp:TextBox ID="txtDescrizioneAdd" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtImmagineAdd">Immagine:</label>
                                        <asp:TextBox ID="txtImmagineAdd" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnAddProduct" runat="server" Text="Aggiungi" OnClick="btn_AddProduct" CssClass="btn btn-success" />
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="idprodotto"
                OnRowEditing="GridViewProducts_RowEditing" OnRowUpdating="GridViewProducts_RowUpdating" OnRowDeleting="GridViewProducts_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="idprodotto" HeaderText="ID Prodotto" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="nome" HeaderText="Nome Prodotto" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="prezzo" HeaderText="Prezzo" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="descrizione" HeaderText="Descrizione" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="Immagine" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image ID="immagine" runat="server" ImageUrl='<%# Eval("immagine") %>' Width="100" Height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Operazioni">
                        <ItemTemplate>
                            <div class="text-center">

                                <asp:LinkButton ID="btnEdit" runat="server" Text="Modifica" CommandName="Edit" CssClass="btn btn-primary mb-2"
                                    OnClientClick='<%# Eval("idprodotto", "return openEditModal({0});") %>'></asp:LinkButton>

                                <div class="modal fade" id='<%# "editModal" + Eval("idprodotto") %>' tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel">Modifica Prodotto</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="txtNomeEdit">Nome:</label>
                                                    <asp:TextBox ID="txtNomeEdit" runat="server" Text='<%# Eval("nome") %>' CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtPrezzoEdit">Prezzo:</label>
                                                    <asp:TextBox ID="txtPrezzoEdit" runat="server" Text='<%# Eval("prezzo") %>' CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtDescrizioneEdit">Descrizione:</label>
                                                    <asp:TextBox ID="txtDescrizioneEdit" runat="server" Text='<%# Eval("descrizione") %>' CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtImmagineEdit">Immagine:</label>
                                                    <asp:TextBox ID="txtImmagineEdit" runat="server" Text='<%# Eval("immagine") %>' CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="modal-footer">
                                                <asp:Button ID="btnUpdate" runat="server" Text="Aggiorna" CommandName="Update" CssClass="btn btn-success" />
                                                <asp:Button ID="btnCancel" runat="server" Text="Annulla" CommandName="Cancel" CssClass="btn btn-secondary" data-dismiss="modal" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button runat="server" CommandName="Delete" CommandArgument='<%# Eval("idprodotto") %>'
                                    CssClass="btn btn-danger" Text="Elimina" OnClientClick="return confirm('Sei sicuro di voler eliminare questo elemento?');" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

        <!------------------------------ TOAST DEI CRUD --------------------------->

        <div class="toast toast-add-success" role="alert" aria-live="assertive" aria-atomic="true" data-delay="4000" style="position: fixed; bottom: 0; right: 0; margin: 20px; z-index: 1000;">
            <div class="toast-header bg-success text-white fw-bold">
                <strong class="mr-auto">Successo</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body bg-success text-white py-4">
                Il prodotto è stato aggiunto correttamente al database.
            </div>
        </div>

        <div class="toast toast-add-error" role="alert" aria-live="assertive" aria-atomic="true" data-delay="4000" style="position: fixed; bottom: 0; right: 0; margin: 20px; z-index: 1000;">
            <div class="toast-header bg-danger text-white fw-bold">
                <strong class="mr-auto">Errore</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body bg-danger text-white py-4">
                Qualcosa è andato storto.
            </div>
        </div>

        <div class="toast toast-delete-success" role="alert" aria-live="assertive" aria-atomic="true" data-delay="4000" style="position: fixed; bottom: 0; right: 0; margin: 20px; z-index: 1000;">
            <div class="toast-header bg-success text-white fw-bold">
                <strong class="mr-auto">Successo</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body bg-success text-white py-4">
                Prodotto eliminato con successo dal database.
            </div>
        </div>

        <div class="toast toast-delete-error" role="alert" aria-live="assertive" aria-atomic="true" data-delay="4000" style="position: fixed; bottom: 0; right: 0; margin: 20px; z-index: 1000;">
            <div class="toast-header bg-danger text-white fw-bold">
                <strong class="mr-auto">Errore</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body bg-danger text-white py-4">
                Errore durante l'eliminazione del prodotto.
            </div>
        </div>

        <div class="toast toast-update-success" role="alert" aria-live="assertive" aria-atomic="true" data-delay="4000" style="position: fixed; bottom: 0; right: 0; margin: 20px; z-index: 1000;">
            <div class="toast-header bg-success text-white fw-bold">
                <strong class="mr-auto">Successo</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body bg-success text-white py-4">
                Prodotto del database aggiornato con successo.
            </div>
        </div>

        <div class="toast toast-update-error" role="alert" aria-live="assertive" aria-atomic="true" data-delay="4000" style="position: fixed; bottom: 0; right: 0; margin: 20px; z-index: 1000;">
            <div class="toast-header bg-danger text-white fw-bold">
                <strong class="mr-auto">Errore</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body bg-danger text-white py-4">
                Errore durante l'aggiornamento del prodotto.
            </div>
        </div>
    </form>
</body>
</html>
