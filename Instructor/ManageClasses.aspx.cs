using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Instructor_ManageClasses : System.Web.UI.Page
{
    public void Page_Load()
    {
        Label1.Text = this.User.Identity.Name;
        if (!this.IsPostBack)
        {
            this.BindGrid();
            this.BindGrid2();
           
            RemoveAtendee.Enabled = false;
            DeleteButton.Enabled = false;
        }
    }
    protected void DeleteButton_Click(Object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        string dbstring = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        SqlConnection con = new SqlConnection(dbstring);

        con.Open();

        string sqlStr = "DELETE FROM ClassBooking WHERE ClassId = @theId";
        string sqlStr2 = "DELETE FROM Classes WHERE Id = @theId";

        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
        SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con);

        sqlCmd.Parameters.AddWithValue("@theId",Convert.ToInt32(row.Cells[1].Text));
        sqlCmd2.Parameters.AddWithValue("@theId",Convert.ToInt32(row.Cells[1].Text));

        sqlCmd.ExecuteNonQuery();
        sqlCmd2.ExecuteNonQuery();
        con.Close();

        //Reload Page
        Page.Response.Redirect(Page.Request.Url.ToString(), false);

    }
     protected void ConfirmButton_Click(object sender, EventArgs e)
    {
        
        string dbstring = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        SqlConnection con = new SqlConnection(dbstring);

        con.Open();

         string sqlStr = "SELECT MAX([Id]) FROM Classes ";

        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
 
        Int32 result = (Int32) sqlCmd.ExecuteScalar() +1;
       
         string sqlStr3 = "SELECT Capacity FROM Rooms WHERE (Name = '" + roomDropDownList.Text + "')";
           SqlCommand sqlCmd3 = new SqlCommand(sqlStr3, con);
           Int32 capacity = (Int32) sqlCmd3.ExecuteScalar();

            string sqlStr2 = "INSERT INTO Classes (Id, Name, Room, Date, MaxParticipants, Instructor) VALUES (@theId, @theName, @theRoom, @theDate, @theCapacity, @theInstructor)";

            SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con);

            sqlCmd2.Parameters.AddWithValue("@theId", result++);
            sqlCmd2.Parameters.AddWithValue("@theName", ClassName.Text);
            sqlCmd2.Parameters.AddWithValue("@theRoom", roomDropDownList.Text);
            sqlCmd2.Parameters.AddWithValue("@theDate", TextBox1.Text);
            sqlCmd2.Parameters.AddWithValue("@theCapacity", (int)capacity);
            RolePrincipal r = (RolePrincipal)User;
            sqlCmd2.Parameters.AddWithValue("@theInstructor", r.Identity.Name);

            sqlCmd2.ExecuteNonQuery();

            con.Close();

            resultLabel.ForeColor = System.Drawing.Color.Black;
            resultLabel.Text = "Class Created";
         //Reload Page
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
        }
     protected void OnPaging(object sender, GridViewPageEventArgs e)
     {
         GridView1.PageIndex = e.NewPageIndex;
         this.BindGrid();
     }
     protected void OnPaging2(object sender, GridViewPageEventArgs e)
     {
         GridView2.PageIndex = e.NewPageIndex;
         this.BindGrid2();
     }
     private void BindGrid()
     {
         string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
         if(this.User.IsInRole("admin"))
         {
             using (SqlConnection con = new SqlConnection(constr))
             {
                 using (SqlCommand cmd = new SqlCommand("SELECT * FROM Classes"))
                 {
                     using (SqlDataAdapter sda = new SqlDataAdapter())
                     {
                         cmd.Connection = con;
                         sda.SelectCommand = cmd;
                         using (DataTable dt = new DataTable())
                         {
                             sda.Fill(dt);
                             GridView1.DataSource = dt;
                             GridView1.DataBind();
                         }
                     }
                 }
             }
         }
         else
         {
             using (SqlConnection con = new SqlConnection(constr))
             {
                 using (SqlCommand cmd = new SqlCommand("SELECT * FROM Classes WHERE Instructor = '" + this.User.Identity.Name +"'"))
                 {
                     using (SqlDataAdapter sda = new SqlDataAdapter())
                     {
                         cmd.Connection = con;
                         sda.SelectCommand = cmd;
                         using (DataTable dt = new DataTable())
                         {
                             sda.Fill(dt);
                             GridView1.DataSource = dt;
                             GridView1.DataBind();
                         }
                     }
                 }
             }
         }
     }
     private void BindGrid2()
     {
         if(chosenClassLabel.Text=="0")
         {
         }
         else
         {
             string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
             using (SqlConnection con = new SqlConnection(constr))
             {
                 using (SqlCommand cmd = new SqlCommand("SELECT * FROM ClassBooking WHERE ClassId = '" + Convert.ToInt32(chosenClassLabel.Text) + "'"))
                 {
                     using (SqlDataAdapter sda = new SqlDataAdapter())
                     {
                         cmd.Connection = con;
                         sda.SelectCommand = cmd;
                         using (DataTable dt = new DataTable())
                         {
                             sda.Fill(dt);
                             GridView2.DataSource = dt;
                             GridView2.DataBind();
                         }
                     }
                 }
             }
         }
     }
  

     protected void chooseClassList_SelectedIndexChanged(object sender, EventArgs e)
     {
         DropDownList ddlList = (DropDownList)LoginView4.FindControl("chooseClassList");
         chosenClassLabel.Text = ddlList.SelectedValue;
         this.BindGrid2();
         AtendeeLabel.Text = "No one selected. &nbsp";
         RemoveAtendee.Enabled = false;
         
     }
     protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
     { 
         GridViewRow row = GridView2.SelectedRow;
         AtendeeLabel.Text = row.Cells[2].Text + " selected. &nbsp";
         RemoveAtendee.Enabled = true;
     }
     protected void RemoveButton_Click(object sender, EventArgs e)
     {
         GridViewRow row = GridView2.SelectedRow;
         string dbstring = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

         SqlConnection con = new SqlConnection(dbstring);

         con.Open();

         string sqlStr = "DELETE FROM ClassBooking WHERE Id = @theId";

         SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

         sqlCmd.Parameters.AddWithValue("@theId", Convert.ToInt32(row.Cells[1].Text));

         sqlCmd.ExecuteNonQuery();
         con.Close();
         this.BindGrid2();
     }
     protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
     {
         GridViewRow row = GridView1.SelectedRow;
         deleteClassLabel.Text = "Class " + row.Cells[1].Text + " selected. &nbsp";
         DeleteButton.Enabled = true;
     }
}
