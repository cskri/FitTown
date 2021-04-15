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
    string currentRole;
    RolePrincipal r;

    public void Page_Load()
    {
        if (!IsPostBack)
        {
            try
            {
                r = (RolePrincipal)User;
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
                currentRole = "Basic";
            }
            else if(rolesArray.Contains("Plus"))
            {
                Price.Text = "199kr/month";
                currentRole = "Plus";
            }
            else if (rolesArray.Contains("Prime"))
            {
                Price.Text = "499kr/month";
                currentRole = "Prime";
            }
            else if (rolesArray.Contains("admin"))
            {
                Price.Text = "No monthly price for admin account";
                currentRole = "admin";
            }
            
            // Bind the set of roles to RoleList 
            RoleList.Items.Add(new ListItem("Basic 99kr/month", "Basic"));
            RoleList.Items.Add(new ListItem("Plus 199kr/month", "Plus"));
            RoleList.Items.Add(new ListItem("Prime 499kr/month", "Prime"));
            RoleList.DataBind();
            
        }
    }
    protected void ConfirmButton_Click(object sender, EventArgs e)
    {
        
        r = (RolePrincipal)User;
        rolesArray = r.GetRoles();
        Msg.Text = "";
        
        for (int i = 0; i < rolesArray.Length; i++)
        {
            Msg.Text = Msg.Text + rolesArray.GetValue(i);
        }
        if (rolesArray.Contains("Basic"))
        {
            Price.Text = "99kr/month";
            currentRole = "Basic";
        }
        else if (rolesArray.Contains("Plus"))
        {
            Price.Text = "199kr/month";
            currentRole = "Plus";
        }
        else if (rolesArray.Contains("Prime"))
        {
            Price.Text = "499kr/month";
            currentRole = "Prime";
        }

        String newRole = RoleList.SelectedValue;
        if (!currentRole.Equals(newRole) && !currentRole.Equals("admin"))
        {
            Roles.AddUserToRole(User.Identity.Name, newRole);
            Roles.RemoveUserFromRole(User.Identity.Name, currentRole);
            currentRole = newRole;
            ConfirmLabel.Text = "Membership for user is changed";
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            ConfirmLabel.Text = "Membership not changed. Error Occurred";
        }
    }
}