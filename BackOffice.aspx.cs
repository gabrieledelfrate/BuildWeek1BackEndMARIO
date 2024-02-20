using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MARIO
{
    public partial class BackOffice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewProducts.DataBind();
            }
        }
        protected void GridViewProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewProducts.EditIndex = e.NewEditIndex;
            GridViewProducts.DataBind();
        }
        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                List<int> product = (List<int>)Session["idprodotto"];

                if (product != null)
                {
                    product.Remove(productId);
                    Session["idprodotto"] = product;

                }
            }
        }

    }
}