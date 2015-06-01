﻿using BusinessLayer;
using DataLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;

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

		public List<BookModel> Get()
		{
			return repo.GetAllBooks();
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

	}
}