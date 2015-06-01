using BusinessLayer;
using Entities;
using MVC.Models;
using MVC.ViewModel;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MVC.Controllers
{
	public class HomeController : Controller
	{
		private GetApiResponse<DisplayAdLibrisForBookModel> apiModelAdLibris;
		private GetApiResponse<BookModel> apiModelBook;
		

		public HomeController()
		{
			apiModelAdLibris = new GetApiResponse<DisplayAdLibrisForBookModel>();
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

		public ActionResult GetInfoFromAdlibris(string isbn)
		{
			if (isbn != null)
			{
				apiModelAdLibris.BookForAdLibris = apiModelAdLibris.GetBookFromAdlibris(isbn, "api/APIAdLibris/");
				return View("BookInfoView", apiModelAdLibris.BookForAdLibris);
			}
			return View("Adlibris", apiModelAdLibris.BookForAdLibris);
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Your contact page.";

			return View();
		}

		[HttpPost]
		public async Task<ActionResult> SaveBook(DisplayAdLibrisForBookModel model)
		{
			if (ModelState.IsValid)
			{
				var savedInDb = await apiModelBook.IsBookInDb("api/APIDbBook?isbn=", model.ISBN);
				model.AlreadyInDb = savedInDb;

				if (model.AlreadyInDb)
				{
					return View("BookInfoView", model);
				}

				apiModelBook.SaveBookToDb("api/APIDbBook/", model);
				CacheHelper.ReloadCache();
				return RedirectToAction("Index", "Home");
			}

			return RedirectToAction("GetInfoFromAdlibris", model);
			
		}
	}
}