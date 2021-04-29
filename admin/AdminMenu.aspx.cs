using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;

public partial class admin_AdminMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateButton_Click(object sender, EventArgs e)
    {
        //First I want to check if a room with that name already exists in the database


        // Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring);

        // The SQL statement to select the room name of a specific room
        string sqlStr = "SELECT Name FROM Rooms WHERE Name = @theRoom";

        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@theRoom", roomNameTextBox.Text);

        // Open the database connection
        con.Open();

        //I only want to know whether or not the query returns something, i.e. if a room with the 
        //name alrady exists. So instead of dealing with a DataSet, I will use the method 
        //ExecuteScalar, that only returns a single value (first column in the first row of the query result)
        object result = sqlCmd.ExecuteScalar();

        //If the result is null, a room with that name does not already exist, so add it to the DB
        if (result == null)
        {
            // The SQL statement to insert a new room into the rooms table
            string sqlStr2 = "INSERT INTO Rooms (Name, Capacity) VALUES (@theRoom, @theCapacity)";

            // Create an executable SQL command containing our SQL statement and the database connection
            SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con);

            // Fill in the parameters in our prepared SQL statement
            sqlCmd2.Parameters.AddWithValue("@theRoom", roomNameTextBox.Text);
            sqlCmd2.Parameters.AddWithValue("@theCapacity", roomCapacityTextBox.Text);

            // Execute the SQL command
            sqlCmd2.ExecuteNonQuery();

            // Close the connection to the database
            con.Close();

            //Show the user that the room was created
            resultLabel.ForeColor = System.Drawing.Color.Black;
            resultLabel.Text = "Room Created";
        }
        else
        {
            //Show the user a message in dramatic red color that the room could not be created
            resultLabel.ForeColor = System.Drawing.Color.Red;
            resultLabel.Text = "Room NOT Created";
        }
    }
}