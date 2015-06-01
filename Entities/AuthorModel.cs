using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class AuthorModel :IDBPerson
	{
		
		public AuthorModel()
		{
			//this.Books = new HashSet<Book>();
		}
	
		public int Id { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
        [Display(Name = "Författare:")]
		public string DisplayFullName { get { return FirstName + " " + LastName; } }
		//public virtual ICollection<Book> Books { get; set; }
	}
}
