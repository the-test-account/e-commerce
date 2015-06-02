using Entities;
using MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.ViewModel
{
	public class BookDetailsAndSuggestionsViewModel
	{
		public BookModel Book { get; set; }
		public List<BookModel> Suggestions { get; set; }
		private GetApiResponse<BookModel> apiModelBook;
		public int BookId { get; set; }
		public BookDetailsAndSuggestionsViewModel()
		{
			
			apiModelBook = new GetApiResponse<BookModel>();
			Suggestions = new List<BookModel>();
		}

	   
	}
}