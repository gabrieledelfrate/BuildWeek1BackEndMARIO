using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MARIO
{
    public partial class BackOffice : System.Web.UI.Page
    {
        public class DBConn
        {
            public static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                BindProductData();
            }
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        private void BindProductData()
        {
            try
            {
                DBConn.conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT idprodotto, nome, prezzo, descrizione, immagine FROM Prodotti", DBConn.conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewProducts.DataSource = dt;
                GridViewProducts.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                DBConn.conn.Close();
            }
        }

        protected void GridViewProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewProducts.EditIndex = e.NewEditIndex;
            BindProductData();
        }

        protected void GridViewProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int productId = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex].Values["idprodotto"]);
                string nome = ((TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtNomeEdit")).Text;
                decimal prezzo = Convert.ToDecimal(((TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtPrezzoEdit")).Text);
                string descrizione = ((TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtDescrizioneEdit")).Text;
                string immagine = ((TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtImmagineEdit")).Text;

                DBConn.conn.Open();

                SqlCommand cmd = new SqlCommand("UPDATE Prodotti SET nome = @nome, prezzo = @prezzo, descrizione = @descrizione, immagine = @immagine WHERE idprodotto = @idprodotto", DBConn.conn);
                cmd.Parameters.AddWithValue("@nome", nome);
                cmd.Parameters.AddWithValue("@prezzo", prezzo);
                cmd.Parameters.AddWithValue("@descrizione", descrizione);
                cmd.Parameters.AddWithValue("@idprodotto", productId);
                cmd.Parameters.AddWithValue("@immagine", immagine);
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "showUpdateSuccessToast", "$('.toast-update-success').toast('show');", true);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showUpdateErrorToast", "$('.toast-update-error').toast('show');", true);
                Response.Write(ex.ToString());
            }
            finally
            {
                DBConn.conn.Close();
                GridViewProducts.EditIndex = -1;
                BindProductData();
            }
        }
        protected void GridViewProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewProducts.PageIndex = e.NewPageIndex;
            BindProductData();
        }
        protected void GridViewProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                LinkButton btnEdit = (LinkButton)e.Row.FindControl("btnEdit");
                if (btnEdit != null)
                {
                    btnEdit.OnClientClick = "openEditModal(); return false;";
                }
            }
        }


        protected void GridViewProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewProducts.EditIndex = -1;
            BindProductData();
        }

        protected void GridViewProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int productId = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex].Value);

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM Prodotti WHERE idprodotto = @idprodotto", conn);
                    cmd.Parameters.AddWithValue("@idprodotto", productId);
                    cmd.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "showDeleteSuccessToast", "$('.toast-delete-success').toast('show');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showDeleteErrorToast", "$('.toast-delete-error').toast('show');", true);
                Response.Write(ex.ToString());
            }
            finally
            {
                BindProductData();
            }
        }

        protected void btn_AddProduct(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                try
                {
                    string nome = txtNomeAdd.Text;
                    decimal prezzo = Convert.ToDecimal(txtPrezzoAdd.Text);
                    string descrizione = txtDescrizioneAdd.Text;
                    string immagine = txtImmagineAdd.Text;

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString))
                    {
                        conn.Open();

                        SqlCommand cmd = new SqlCommand("INSERT INTO Prodotti (nome, prezzo, descrizione, immagine) VALUES (@nome, @prezzo, @descrizione, @immagine)", conn);
                        cmd.Parameters.AddWithValue("@nome", nome);
                        cmd.Parameters.AddWithValue("@prezzo", prezzo);
                        cmd.Parameters.AddWithValue("@descrizione", descrizione);
                        cmd.Parameters.AddWithValue("@immagine", immagine);
                        cmd.ExecuteNonQuery();
                    }

                    txtNomeAdd.Text = string.Empty;
                    txtPrezzoAdd.Text = string.Empty;
                    txtDescrizioneAdd.Text = string.Empty;
                    txtImmagineAdd.Text = string.Empty;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAddSuccessToast", "$('.toast-add-success').toast('show');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAddErrorToast", "$('.toast-add-error').toast('show');", true);
                    Response.Write(ex.ToString());
                }
                finally
                {
                    BindProductData();
                }
            }
        }
    }
}