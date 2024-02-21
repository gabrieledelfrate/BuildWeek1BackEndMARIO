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
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Cliente (email, password) VALUES (@Email, @Password)";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlParameter paramEmail = new SqlParameter("@Email", email);
                SqlParameter paramPassword = new SqlParameter("@Password", password);
                cmd.Parameters.Add(paramEmail);
                cmd.Parameters.Add(paramPassword);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write("Errore durante l'inserimento dei dati: " + ex.Message);
                }
            }

            Response.Redirect("Login.aspx");
        }

    }
}