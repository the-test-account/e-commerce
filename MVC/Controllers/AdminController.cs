using BusinessLayer;
using Entities;
using MVC.Models;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MVC.Controllers
{
	[Authorize]
	public class AdminController : Controller
	{
		private GetApiResponse<DisplayAdLibrisForBookModel> apiModelAdLibris;
		private GetApiResponse<BookModel> apiModelBook;
		public AdminController()
		{
			apiModelAdLibris = new GetApiResponse<DisplayAdLibrisForBookModel>();
			apiModelBook = new GetApiResponse<BookModel>();

		}
		public ActionResult Index()
		{
			return View();
		}
		public ActionResult EditBookList()
		{
			return View("ListBooksView", CacheHelper.GetAllBooks());
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
		public ActionResult Edit(int id)
		{
			if (id > 0)
			{

				var book = apiModelBook.GetBookFromDbById("api/APIDbBook/", id);
				CacheHelper.ReloadCache();
				return View("EditBook", book);
			}
			return View("EditBook");
		}


		// POST: Test/Edit/5
		[HttpPost]
		public ActionResult Edit(int id, FormCollection collection)
		{
			try
			{
				// TODO: Add update logic here

				return RedirectToAction("Index");
			}
			catch
			{
				return View();
			}
		}

		// GET: Test/Delete/5
		public ActionResult Delete(int id)
		{
			var book = apiModelBook.GetBookFromDbById("api/APIDbBook/", id);
			return View("DeleteBookView", book);
		}

		// POST: Test/Delete/5
		[HttpPost]
		public ActionResult Delete(int id, FormCollection collection)
		{
			try
			{
				// TODO: Add delete logic here

				return RedirectToAction("Index");
			}
			catch
			{
				return View();
			}
		}
	}
}
