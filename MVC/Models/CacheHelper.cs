using DataLayer;
using Entities;
using MVC.ViewModel;
using System.Collections.Generic;
using System.Web;

namespace MVC.Models
{
	public static class CacheHelper
	{
		public static int BookCount { get; set; }


		public static List<BookModel> GetAllBooks(string skip, string top)
		{
			var cache = HttpContext.Current.Cache["allBooks"];
			var model = new BookModel();
			List<BookModel> listAllBooks = new List<BookModel>();
		   
			if (cache == null)
			{
				GetApiResponse<BookModel> apiModelBook= new GetApiResponse<BookModel>();
				listAllBooks = apiModelBook.GetAllBooksFromDb("api/APIDbBook?");
				BookCount = listAllBooks.Count;

				if (top=="0")
				{
					listAllBooks = apiModelBook.GetAllBooksFromDb("api/APIDbBook?");
				}
				else
				{
					listAllBooks = apiModelBook.GetAllBooksFromDb("api/APIDbBook?$skip=" + skip + "&$top=" + top );
				}
				

				cache = listAllBooks;
			}
			else
			{
				listAllBooks = cache as List<BookModel>;
			}
			return listAllBooks;
		}
		public static void ReloadCache(){

			HttpContext.Current.Cache.Remove("allBooks");
			GetAllBooks("0","20");
		}
	}
}