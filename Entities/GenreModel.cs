using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class GenreModel: IDBLookup
	{
		 public GenreModel()
        {
			//this.Books = new HashSet<Book>();
        }
    
        public int Id { get; set; }
         [Display(Name = "Genre")]
        public string Name { get; set; }
    
		//public virtual ICollection<Book> Books { get; set; }
	}
}
