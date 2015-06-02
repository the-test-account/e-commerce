using BusinessLayer;
using DataLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.OData;

namespace WebAPI.Controllers
{
	[EnableCorsAttribute("http://localhost:25859/", "*", "*")]
	public class APIDbBookController : ApiController
	{
		private BookRepository repo;

		public APIDbBookController()
		{
			repo = new BookRepository();
		}
		[EnableQuery()]
		public IQueryable<BookModel> Get()
		{
			return repo.GetAllBooks().AsQueryable();
		}
		public bool Get(string isbn)
		{
			return repo.IsBookInDB(isbn);
		}

		public BookModel Get(int id)
		{
			try
			{
				var book = repo.GetBookById(id);
				return book;
			}
			catch (Exception)
			{
				throw;
			}
		}
		public void Post([FromBody]DisplayAdLibrisForBookModel model)
		{
			repo.Add(model);

		}
		public void Put(int id, [FromBody]BookModel book)
		{
			repo.Edit(book);
		}

		
		public void Delete(int id)
		{
			repo.Delete(id);
		}
	}
}