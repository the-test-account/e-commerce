using BusinessLayer;
using Entities;
using MVC.Models;
using MVC.ViewModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MVC.Controllers
{
	public class HomeController : Controller
	{	
		private GetApiResponse<BookModel> apiModelBook;
	
		public HomeController()
		{
	
			apiModelBook = new GetApiResponse<BookModel>();
		}

		public ActionResult Index()
		{
			var model = new StartPageViewModel();
			apiModelBook.TopFiveBooks = apiModelBook.GetTopFiveBooksFromDb("api/APIDbTopFiveBooks","?");
			model.BookList = CacheHelper.GetAllBooks();
			model.TopFive = apiModelBook.TopFiveBooks;

			return View(model);
		}
		
		public PartialViewResult ReloadStartPage()
		{
			var model = new StartPageViewModel();

			List<BookModel> books = new List<BookModel>();
			apiModelBook.TopFiveBooks = apiModelBook.GetTopFiveBooksFromDb("api/APIDbTopFiveBooks", "?");
			model.BookList = CacheHelper.GetAllBooks();
			model.TopFive = apiModelBook.TopFiveBooks;			
			return PartialView("_bookslist", model);
		}

		public ActionResult Details(int id)
		{
			if (id > 0)
			{
				var model = new BookDetailsAndSuggestionsViewModel();
				model.Book = apiModelBook.GetBookFromDbById("api/APIDbBook/", id);
				CacheHelper.ReloadCache();
				return PartialView("_Details", model);
			}
			return PartialView("_Details");
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Your contact page.";

			return View();
		}

		
	}
}