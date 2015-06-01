using DataLayer;
using Entities;
using MVC.ViewModel;
using System.Collections.Generic;
using System.Web;

namespace MVC.Models
{
	public static class CacheHelper
	{


		public static List<BookModel> GetAllBooks()
		{
			var cache = HttpContext.Current.Cache["allBooks"];
			var model = new BookModel();
			List<BookModel> listAllBooks = new List<BookModel>();
		   
			if (cache == null)
			{
				GetApiResponse<BookModel> apiModelBook= new GetApiResponse<BookModel>();
				listAllBooks = apiModelBook.GetAllBooksFromDb("api/APIDbBook");
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
			GetAllBooks();
		}
	}
}