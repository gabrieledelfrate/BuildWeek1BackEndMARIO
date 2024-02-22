using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace MARIO
{
    public class MasterPage : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateCartCount();
            }
        }

        public void UpdateCartCount()
        {
            Label lblCartCount = (Label)FindControl("lblCartCount");

            if (Session["CartCount"] != null)
            {
                int cartCount = Convert.ToInt32(Session["CartCount"]);
                lblCartCount.Text = cartCount > 0 ? cartCount.ToString() : string.Empty;
            }
        }


        protected Button btnLogin;
        protected Button btnLogout;
        /*protected void Page_Load(object sender, EventArgs e)
        {
            // Controlla lo stato di autenticazione dell'utente
            if (User.Identity.IsAuthenticated)
            {
                // L'utente è autenticato, visualizza il pulsante di Logout
                btnLogout.Visible = true;
            }
            else
            {
                // L'utente non è autenticato, visualizza il pulsante di Login
                btnLogin.Visible = true;
            }
        } */

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}