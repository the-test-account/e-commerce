using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
	public partial class Language : IDBLookup {}
	public partial class Publisher : IDBLookup {}
    public partial class Author : IDBPerson { }
	public partial class Format : IDBLookup { }
    public partial class Genre : IDBLookup { }
    public partial class Series : IDBLookup { }
    public partial class Reader : IDBPerson { }

}