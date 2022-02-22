using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DejaBrew
{
    public partial class AdminProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnShowDiv_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickedButton.ID == "BtnCreateNewProd")
                DivCreateNewProd.Attributes["class"] = "show";
            else if (clickedButton.ID == "BtnUpdateNewProd")
                DivUpdateProd.Attributes["class"] = "show";
            else if (clickedButton.ID == "BtnProdStatus")
                DivChangeProdStat.Attributes["class"] = "show";
        }

        protected void SaveNewProduct()
        {

        }
    }
}