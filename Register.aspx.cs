using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Reference the SpecifyRolesStep WizardStep 
            WizardStep SpecifyRolesStep = RegisterUserWithRoles.FindControl("SpecifyRolesStep") as WizardStep;

            // Reference the RoleList CheckBoxList 
            DropDownList RoleList = SpecifyRolesStep.FindControl("RoleList") as DropDownList;

            // Bind the set of roles to RoleList 
            RoleList.Items.Add(new ListItem("Basic 99kr/month","Basic"));
            RoleList.Items.Add(new ListItem("Plus 199kr/month","Plus"));
            RoleList.Items.Add(new ListItem("Prime 499kr/month","Prime"));
            RoleList.DataBind();
        } 
    }
  
    protected void RegisterUserWithRoles_ActiveStepChanged(object sender, EventArgs e)
    {
        // Have we JUST reached the Complete step? 
        if (RegisterUserWithRoles.ActiveStep.Title == "Complete")
        {
            // Reference the SpecifyRolesStep WizardStep 
            WizardStep SpecifyRolesStep = RegisterUserWithRoles.FindControl("SpecifyRolesStep") as WizardStep;

            // Reference the RoleList CheckBoxList 
            DropDownList RoleList = SpecifyRolesStep.FindControl("RoleList") as DropDownList;

            // Add the checked roles to the just-added user 
            foreach (ListItem li in RoleList.Items)
            {
                if (li.Selected)
                    Roles.AddUserToRole(RegisterUserWithRoles.UserName, li.Value);
            }
        }
    }
}