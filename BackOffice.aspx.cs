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
            if (!IsPostBack)
            {
                BindProductData();
            }
        }

        private void BindProductData()
        {
            try
            {
                DBConn.conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT idprodotto, nome, descrizione, immagine FROM Prodotti", DBConn.conn);
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
                string descrizione = ((TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtDescrizioneEdit")).Text;
                string immagine = ((TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtImmagineEdit")).Text;

                DBConn.conn.Open();

                SqlCommand cmd = new SqlCommand("UPDATE Prodotti SET nome = @nome, descrizione = @descrizione, immagine = @immagine WHERE idprodotto = @idprodotto", DBConn.conn);
                cmd.Parameters.AddWithValue("@nome", nome);
                cmd.Parameters.AddWithValue("@descrizione", descrizione);
                cmd.Parameters.AddWithValue("@idprodotto", productId);
                cmd.Parameters.AddWithValue("@immagine", immagine);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                DBConn.conn.Close();
                GridViewProducts.EditIndex = -1;
                BindProductData();
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
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
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
        protected void btn_AddProduct(object sender, EventArgs e)
        {
            try
            {
                string nome = txtNomeAdd.Text;
                string descrizione = txtDescrizioneAdd.Text;
                string immagine = txtImmagineAdd.Text;

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO Prodotti (nome, descrizione, immagine) VALUES (@nome, @descrizione, @immagine)", conn);
                    cmd.Parameters.AddWithValue("@nome", nome);
                    cmd.Parameters.AddWithValue("@descrizione", descrizione);
                    cmd.Parameters.AddWithValue("@immagine", immagine);
                    cmd.ExecuteNonQuery();
                }
                txtNomeAdd.Text = string.Empty;
                txtDescrizioneAdd.Text = string.Empty;
                txtImmagineAdd.Text = string.Empty;
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                BindProductData();
            }
        }
    }
}