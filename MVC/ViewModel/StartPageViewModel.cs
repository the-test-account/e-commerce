using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.ViewModel
{
	public class StartPageViewModel
	{
		public List<BookModel> BookList { get; set; }
		public List<BookModel> TopFive { get; set; }
		public string  SearchString { get; set; }

	}
}