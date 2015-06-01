using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class FormatModel : IDBLookup
	{
		public FormatModel()
        {
			//this.Books = new HashSet<Book>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
		//public virtual ICollection<Book> Books { get; set; }
	}
}
