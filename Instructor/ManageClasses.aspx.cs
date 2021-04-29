using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_ManageClasses : System.Web.UI.Page
{
    public void Page_Load()
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime dob = DateTime.Parse(Request.Form[TextBox1.UniqueID]);
    }
    protected void ConfirmButton_Click(Object sender, EventArgs e)
    {

    }

}
