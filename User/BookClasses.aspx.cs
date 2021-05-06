using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookClasses : System.Web.UI.Page
{
    List<Class> classes;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
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
    protected void BookingButton_Click(object sender, EventArgs e)
    {
        
        string dbstring = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        SqlConnection con = new SqlConnection(dbstring);

        string sqlStr = "INSERT INTO ClassBooking (UserName, ClassId) VALUES (@theUser, @theClass)";

        con.Open();

        string sqlStr2 = "SELECT (MaxParticipants) FROM Classes WHERE Id = @theClass";
        string sqlStr3 = "SELECT COUNT(*) FROM ClassBooking WHERE ClassId = @theClass";

        SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con);
        SqlCommand sqlCmd3 = new SqlCommand(sqlStr3, con);

        sqlCmd2.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));
        sqlCmd3.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));

        Int32 max = (Int32)sqlCmd2.ExecuteScalar();
        Int32 current = (Int32)sqlCmd3.ExecuteScalar();
        if (current < max)
        {
            SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

            sqlCmd.Parameters.AddWithValue("@theClass", Convert.ToInt32(classDropDownList.SelectedValue));
            sqlCmd.Parameters.AddWithValue("@theUser", this.User.Identity.Name);

            sqlCmd.ExecuteNonQuery();

            con.Close();

            resultLabel.Text = "You signed up!!";
        }
        else if (current >= max)
        {
            con.Close();
            resultLabel.Text = "Unfortunately the class is full";
        }
    }

}