using BusinessLayer;
using Entities;
using MVC.Models;
using MVC.ViewModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Linq;

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
			apiModelBook.TopFiveBooks = apiModelBook.GetTopFiveBooksFromDb("api/APIDbTopFiveBooks", "?");
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

        public PartialViewResult FullList()
        {
            var model = new StartPageViewModel();

            List<BookModel> books = new List<BookModel>();
            apiModelBook.TopFiveBooks = apiModelBook.GetTopFiveBooksFromDb("api/APIDbTopFiveBooks", "?");
            model.BookList = CacheHelper.GetAllBooks();
            model.TopFive = apiModelBook.TopFiveBooks;
            return PartialView("_fullbookslist", model);
        }

		public ActionResult Details(int id)
		{
			if (id > 0)
			{
				var model = new BookDetailsAndSuggestionsViewModel();
				model.Book = apiModelBook.GetBookFromDbById("api/APIDbBook/", id);
				model.Suggestions = apiModelBook.GetSuggestionFromBookIdFromDB("api/APIDbBookSuggestion/", id);
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

		public ActionResult About()
		{
		   

			return View();
		}

		public JsonResult GetBookTitle(string term)
		{
			
			var titles = CacheHelper.GetAllBooks().Where(b =>b.Title.ToLower().StartsWith(term.ToLower())).Select(b =>b.Title).ToList();
			return Json(titles, JsonRequestBehavior.AllowGet);

		}
		[HttpPost]
		public ActionResult Search(string search)
		{
			var searchString = string.Empty;
			search = search.ToLower();

			if (search.IndexOf("&") > 0)
			{
				var tempGenreName = string.Empty;
				var tempAuthorFirstName = string.Empty;
				var tempAuthorLastName = string.Empty;
				var tempReaderFirstName = string.Empty;
				var tempReaderLastName = string.Empty; 
				var stringArr = search.Split('&');
				
				foreach (var item in stringArr)
				{
					tempGenreName += " contains(tolower(g/Name),  '" + item + "') and ";
					tempAuthorFirstName += " contains(tolower(a/FirstName),  '" + item + "') and ";
					tempAuthorLastName += " contains(tolower(a/LastName),  '" + item + "') and ";
					tempReaderFirstName += " contains(tolower(r/FirstName),  '" + item + "') and ";
					tempReaderLastName += " contains(tolower(r/LastName),  '" + item + "') and ";


				}
				tempGenreName = tempGenreName.Substring(0, tempGenreName.Length - 5);
				tempAuthorFirstName = tempAuthorFirstName.Substring(0, tempAuthorFirstName.Length - 5); 
				tempAuthorLastName = tempAuthorLastName.Substring(0, tempAuthorLastName.Length - 5);
				tempReaderFirstName = tempReaderFirstName.Substring(0, tempReaderFirstName.Length - 5);
				tempReaderLastName = tempReaderLastName.Substring(0, tempReaderLastName.Length - 5);
				search = search.Replace("&", "");


				var startString = "api/APIDbBook?$filter=contains(tolower(Title), '" + search + "') " +
					"or contains(tolower(Description), '" + search + "')  or ISBN eq '" + search + "' "+
					"or tolower(Language/Name) eq  '" + search + "'  or tolower(Format/Name) eq  '" + search + "' or Genres/any(g:" ;

				var reader = " or Readers/any(r:";
				var author = " or Authors/any(a:";

				searchString = startString + tempGenreName + ")" + reader + tempReaderFirstName + " and " + tempReaderLastName + ")" + author + tempAuthorFirstName + " and " + tempAuthorLastName + ")";


			}
			else
			{
				searchString = "api/APIDbBook?$filter=contains(tolower(Title), '" + search + "') " +
				"or contains(tolower(Description), '" + search + "') or ISBN eq '" + search + "' "+ 
				" or Authors/any(a: tolower(a/FirstName) eq '" + search + "') " +
				"or Authors/any(a: tolower(a/LastName) eq '" + search + "') or Genres/any(g: contains(tolower(g/Name),  '" + search + "')) or Readers/any(r: tolower(r/FirstName) eq '" + search + "') " +
				"or Readers/any(r: tolower(r/LastName) eq '" + search + "') or tolower(Format/Name) eq  '" + search + "' or tolower(Language/Name) eq  '" + search + "'";

			}

			

			var model = new StartPageViewModel();
			var searchResults = apiModelBook.GetAllBooksFromDb(searchString);
			model.BookList = searchResults;
			apiModelBook.TopFiveBooks = apiModelBook.GetTopFiveBooksFromDb("api/APIDbTopFiveBooks", "?");
			model.TopFive = apiModelBook.TopFiveBooks;
			if (model.BookList == null)
			{
				model.ErrorInSearchResult = true;
				return PartialView("_bookslist", model);
			}
			if (model.BookList.Count == 0)
			{
				model.NoSearchResultFound = true;

			}
			return PartialView("_bookslist", model);
		}
		
	}
}