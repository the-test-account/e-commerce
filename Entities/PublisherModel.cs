using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class PublisherModel : IDBLookup
	{
		 public PublisherModel()
		{
			//this.Books = new HashSet<Book>();
		}
	
		public int Id { get; set; }
         [Display(Name = "Förlag:")]
		public string Name { get; set; }
	
		//public virtual ICollection<Book> Books { get; set; }
	}
}
