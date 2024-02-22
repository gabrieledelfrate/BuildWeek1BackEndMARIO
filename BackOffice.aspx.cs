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
            GridViewProducts.DataBind();
        }
        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                List<int> product = (List<int>)Session["idprodotto"];

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString))
                {
                    product.Remove(productId);
                    Session["idprodotto"] = product;

                }
            }
        }

    }
}
