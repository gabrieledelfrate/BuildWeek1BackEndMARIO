using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MARIO
{
    public partial class Registrazione : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Cliente (email, password) VALUES (@Email, @password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write("Errore durante l'inserimento dei dati: " + ex.ToString());
                }
            }

            Response.Redirect("Login.aspx");
        }
    }
}