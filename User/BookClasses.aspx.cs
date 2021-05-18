using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class BookClasses : System.Web.UI.Page
{
    List<Class> classes;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = this.User.Identity.Name;
        Label1.Visible = false;
        UnassignButton.Enabled = false;
        if (!Page.IsPostBack)
        {
            this.BindGrid();
            string cs = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            using(SqlConnection con = new SqlConnection(cs))
            {
               classes = new List<Class>();
               SqlCommand cmd = new SqlCommand("select * from Classes ORDER BY [Date] ASC",con);
               cmd.CommandType = CommandType.Text;
               con.Open();
               SqlDataReader rdr = cmd.ExecuteReader();
               while(rdr.Read())
               {
                  Class c = new Class(Convert.ToInt32(rdr["id"]),Convert.ToString(rdr["Name"]),Convert.ToString(rdr["Room"]),Convert.ToString(rdr["Date"]),Convert.ToInt32(rdr["MaxParticipants"]),Convert.ToString(rdr["Instructor"]));
                    
                  classes.Add(c);
               }
            }
            for (int i = 0; i < classes.Count; i++)
            {
                String id = Convert.ToString(classes[i].id);
                String temp = classes[i].name + ", Date: " + classes[i].date + ", Room: " + classes[i].room + ", Instructor: " + classes[i].instructor;
                classDropDownList.Items.Add(new ListItem(temp,id));
                
                
            }
       }

    }
    protected void UnassignButton_Click(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        string dbstring = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        SqlConnection con = new SqlConnection(dbstring);

        con.Open();

        string sqlStr = "DELETE FROM ClassBooking WHERE ClassId = @theId AND UserName = @theUser";

        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        sqlCmd.Parameters.AddWithValue("@theId", Convert.ToInt32(row.Cells[1].Text));
        sqlCmd.Parameters.AddWithValue("@theUser", this.User.Identity.Name);

        sqlCmd.ExecuteNonQuery();
        con.Close();
        //Reload Page
        Page.Response.Redirect(Page.Request.Url.ToString(), false);
    }

    protected void BookingButton_Click(object sender, EventArgs e)
    {
        
        string dbstring = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        SqlConnection con = new SqlConnection(dbstring);

        string sqlStr = "INSERT INTO ClassBooking (UserName, ClassId) VALUES (@theUser, @theClass)";

        con.Open();

        string sqlStr2 = "SELECT (MaxParticipants) FROM Classes WHERE Id = @theClass";
        string sqlStr3 = "SELECT COUNT(*) FROM ClassBooking WHERE ClassId = @theClass";
        string sqlStr4 = "SELECT COUNT(*) FROM ClassBooking WHERE ClassId = @theClass AND UserName = @theUser";

        SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con);
        SqlCommand sqlCmd3 = new SqlCommand(sqlStr3, con);
        SqlCommand sqlCmd4 = new SqlCommand(sqlStr4, con);

        sqlCmd2.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));
        sqlCmd3.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));
        sqlCmd4.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));
        sqlCmd4.Parameters.AddWithValue("@theUser", this.User.Identity.Name);

        Int32 max = (Int32)sqlCmd2.ExecuteScalar();
        Int32 current = (Int32)sqlCmd3.ExecuteScalar();
        Int32 amtOfSignups = (Int32)sqlCmd4.ExecuteScalar();
        if(this.User.IsInRole("Prime"))
        {
            if(amtOfSignups >= 2)
            {
                resultLabel.Text = "You already reached the limit of signups for this class";
            }
            else if(current >= max)
            {
                con.Close();
                resultLabel.Text = "Unfortunately the class is full";
            }
            else
            {
                SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

                sqlCmd.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));
                sqlCmd.Parameters.AddWithValue("@theUser", this.User.Identity.Name);

                sqlCmd.ExecuteNonQuery();

                con.Close();

                resultLabel.Text = "You signed up!!";
                //Reload Page
                Page.Response.Redirect(Page.Request.Url.ToString(), false);
            }
        }
        else if (amtOfSignups >=1)
        {
            resultLabel.Text = "You already reached the limit of signups for this class";
        }
        else if (current >= max)
        {
            con.Close();
            resultLabel.Text = "Unfortunately the class is full";
        }
        else
        {
            SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

            sqlCmd.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));
            sqlCmd.Parameters.AddWithValue("@theUser", this.User.Identity.Name);

            sqlCmd.ExecuteNonQuery();

            con.Close();

            resultLabel.Text = "You signed up!!";
            //Reload Page
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
        }
        
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
         GridView1.PageIndex = e.NewPageIndex;
         this.BindGrid();
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Classes JOIN ClassBooking ON Classes.Id = ClassBooking.ClassId WHERE ClassBooking.UserName = '" + this.User.Identity.Name + "' ORDER BY Date ASC"))
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        UnassignLabel.Text = "Class " + row.Cells[1].Text + " selected. &nbsp";
        UnassignButton.Enabled = true;
    }
}