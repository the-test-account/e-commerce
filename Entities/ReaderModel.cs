using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class ReaderModel: IDBPerson
	{
		
		public ReaderModel()
		{
			//this.Books = new HashSet<BookModel>();
		}
	
		public int Id { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }

		public string DisplayFullName { get { return FirstName + " " + LastName; } }

	  //  public virtual ICollection<BookModel> Books { get; set; }
	}
}
