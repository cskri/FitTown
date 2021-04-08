using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account : System.Web.UI.Page
{
    string[] rolesArray;
    int amount;

    public void Page_Load()
    {
        if (!IsPostBack)
        {
            try
            {
                RolePrincipal r = (RolePrincipal)User;
                rolesArray = r.GetRoles();
            }
            catch (HttpException e)
            {
                Msg.Text = "There is no current logged on user. Role information cannot be retrieved.";
                return;
            }
            for(int i=0; i<rolesArray.Length; i++){
                Msg.Text = Msg.Text + rolesArray.GetValue(i);
            }
            if (rolesArray.Contains("Basic"))
            {
                Price.Text = "99kr/month";
            }
            else if(rolesArray.Contains("Plus"))
            {
                Price.Text = "199kr/month";
            }
            else if (rolesArray.Contains("Prime"))
            {
                Price.Text = "499kr/month";
            }
            else if (rolesArray.Contains("admin"))
            {
                Price.Text = "No monthly price for admin account";
            }
            
        }
    }
}