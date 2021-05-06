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
        }
    }
    protected void DeleteButton_Click(Object sender, EventArgs e)
    {

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
        }
     protected void OnPaging(object sender, GridViewPageEventArgs e)
     {
         GridView1.PageIndex = e.NewPageIndex;
         this.BindGrid();
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
        
    }
