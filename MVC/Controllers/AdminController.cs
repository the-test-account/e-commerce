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
		private GetApiResponse<OrderModel> apiModelOrder;
		public AdminController()
		{
			apiModelAdLibris = new GetApiResponse<DisplayAdLibrisForBookModel>();
			apiModelBook = new GetApiResponse<BookModel>();
			apiModelOrder = new GetApiResponse<OrderModel>();
		}
		public ActionResult Index()
		{
			return View();
		}
		public ActionResult EditBookList()
		{

			return View("ListBooks", CacheHelper.GetAllBooks());

		}

		public ActionResult EditOrderList()
		{
			return View("ListOrders", apiModelOrder.GetAllOrdersFromDb("api/APIDbOrder"));

		
		}

		
		public ActionResult GetInfoFromAdlibris(string isbn)
		{
			if (isbn != null)
			{
				apiModelAdLibris.BookForAdLibris = apiModelAdLibris.GetBookFromAdlibris(isbn, "api/APIAdLibris/");
				return View("BookInfo", apiModelAdLibris.BookForAdLibris);
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
					return View("BookInfo", model);
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


		[HttpPost]
		public async Task<ActionResult> Edit(int id, BookModel model)
		{
			try
			{
				var book = await apiModelBook.UpdateBook("api/APIDbBook/", id.ToString(), model);

				return RedirectToAction("Index");
			}
			catch
			{
				return View();
			}
		}

		public ActionResult Delete(int id)
		{
			var book = apiModelBook.GetBookFromDbById("api/APIDbBook/", id);
			return View("DeleteBook", book);
		}

		
		[HttpPost]
		public async Task<ActionResult> Delete(int id, BookModel model)
		{
			try
			{
			await apiModelBook.DeleteBook("api/APIDbBook/", id.ToString(), model);

				return RedirectToAction("Index");
			}
			catch
			{
				return View();
			}
		}
	}
}
