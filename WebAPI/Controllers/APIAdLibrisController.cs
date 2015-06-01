using BusinessLayer;
using DataLayer;
using Entities;
using MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;


namespace WebAPI.Controllers
{
	[EnableCorsAttribute("http://localhost:25859/", "*", "*")]
	public class APIAdLibrisController : ApiController
	{
		
		public DisplayAdLibrisForBookModel Get(string id)
		{
		
			var newBook = new DisplayAdLibrisForBookModel();
			bool isLoaded = ParseAdlibris.LoadDocument(id);
			if (isLoaded)
			{
				newBook.Title = ParseAdlibris.GetTitle();
				newBook.AuthorNames = ParseAdlibris.GetAuthors();
				newBook.PublishingDate = ParseAdlibris.GetDate();
				newBook.ISBN = ParseAdlibris.GetISBN();
				newBook.Description = ParseAdlibris.GetDescription();
				newBook.SeriesName = ParseAdlibris.GetSeries();
				newBook.PublisherName = ParseAdlibris.GetPublisher();
				newBook.ImagePath = ParseAdlibris.GetImagePath();
				newBook.Format = ParseAdlibris.GetFormat();
				newBook.Language = ParseAdlibris.GetLanguage();
				newBook.PageNumber = int.Parse(ParseAdlibris.GetPageNumber());
				newBook.Price = int.Parse(ParseAdlibris.GetPrice());
				newBook.ReaderNames = ParseAdlibris.GetReader();
				newBook.Weight = int.Parse(ParseAdlibris.GetWeight());
				newBook.GenreNames = ParseAdlibris.GetGenres();
				
				
			}

			return newBook;
		}
	
	
		// POST: api/Adlibris
		public void Post([FromBody]string value)
		{
		}

		// PUT: api/Adlibris/5
		public void Put(int id, [FromBody]string value)
		{
		}

		// DELETE: api/Adlibris/5
		public void Delete(int id)
		{
		}
	}
}
