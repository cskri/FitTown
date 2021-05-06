using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class
/// </summary>
public class Class
{
    public int id { get; set; }
    public String name {get; set;}
    public String room {get;set;}
    public String date {get;set;}
    public int participants {get; set;}
    public String instructor { get; set; }

    public Class() { }

	public Class(int id, String name, String room, String date, int participants, String instructor)
	{
		this.id = id;
        this.name = name;
        this.room = room;
        this.date = date;
        this.participants = participants;
        this.instructor = instructor;
	}
}