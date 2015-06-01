using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace DataLayer
{
	public sealed class ConvertHelpers
	{
		private static readonly Lazy<ConvertHelpers> lazy =
			new Lazy<ConvertHelpers>(() => new ConvertHelpers());

		public static ConvertHelpers Instance { get { return lazy.Value; } }

		public T ConvertModelPersonToDBPerson<T, U>(U model)
			where T : IDBPerson, new()
			where U : IDBPerson
		{
			return new T
			{
				Id = model.Id,
				FirstName = model.FirstName,
				LastName = model.LastName,
			};
		}

		public List<T> ConvertModelPersonToDBPerson<T, U>(List<U> model)
			where T : IDBPerson, new()
			where U : IDBPerson
		{
			var newlist = new List<T>();

			foreach (var item in model)
			{
				newlist.Add(new T
			{
				Id = item.Id,
				FirstName = item.FirstName,
				LastName = item.LastName,
			});
			}

			return newlist;
		}

		//public List<T> Test<T, U>(List<U> model)
		//{
		//	return newlist;
		//}

		public T ConvertModelLookupToDBLookup<T, U>(U model)
			where T : IDBLookup, new()
			where U : IDBLookup
		{
			return new T
			{
				Id = model.Id,
				Name = model.Name,
			};
		}

		public List<T> ConvertModelLookupToDBLookup<T, U>(List<U> model)
			where T : IDBLookup, new()
			where U : IDBLookup
		{
			var newlist = new List<T>();

			foreach (var item in model)
			{
				newlist.Add(new T
				{
					Id = item.Id,
					Name = item.Name,
				});
			}

			return newlist;
		}

		public T ConvertDBPersonToModelPerson<T, U>(U db)
			where T : IDBPerson, new()
			where U : IDBPerson
		{
			return new T
			{
				Id = db.Id,
				FirstName = db.FirstName,
				LastName = db.LastName,
			};
		}

		public ICollection<T> ConvertDBPersonToModelPerson<T, U>(ICollection<U> db)
			where T : IDBPerson, new()
			where U : IDBPerson
		{
			var newlist = new List<T>();

			foreach (var item in db)
			{
				newlist.Add(new T
				{
					Id = item.Id,
					FirstName = item.FirstName,
					LastName = item.LastName,
				});
			}

			return newlist;
		}

		public T ConvertDBLookupToModelLookup<T, U>(U db)
			where T : IDBLookup, new()
			where U : IDBLookup
		{
			return new T
			{
				Id = db.Id,
				Name = db.Name,
			};
		}

		public ICollection<T> ConvertDBLookupToModelLookup<T, U>(ICollection<U> db)
			where T : IDBLookup, new()
			where U : IDBLookup
		{
			var newlist = new List<T>();

			foreach (var item in db)
			{
				newlist.Add(new T
				{
					Id = item.Id,
					Name = item.Name,
				});
			}

			return newlist;
		}

		public T ConvertDBLookUpToModelLookUp<T, U>(int id, string propertyName, MagicBooksDBEntities context)
			where T : IDBLookup, new()
			where U : class, IDBLookup
		{
			var book = context.Books.Where(b => b.Id == id).FirstOrDefault();

			PropertyInfo propertyInfo = book.GetType().GetProperty(propertyName);

			if (propertyInfo != null)
			{
				try
				{
					var lookUpProperty = propertyInfo.GetValue(book, null) as U;
					return new T
					{
						Id = lookUpProperty.Id,
						Name = lookUpProperty.Name
					};
				}
				catch (Exception)
				{
				}
			}
			return default(T);
		}


		public Book ConvertBookModelToDBBook(BookModel book)
		{
			if (book.Series != null)
			{
				return new Book
				{
					Id = book.Id,
					Authors = ConvertHelpers.Instance.ConvertModelPersonToDBPerson<Author, AuthorModel>(book.Authors),
					Publisher = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Publisher, PublisherModel>(book.Publisher),
					Genres = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Genre, GenreModel>(book.Genres),
					Readers = ConvertHelpers.Instance.ConvertModelPersonToDBPerson<Reader, ReaderModel>(book.Readers),
					Format = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Format, FormatModel>(book.Format),
					Language = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Language, LanguageModel>(book.Language),
					Series = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Series, SeriesModel>(book.Series),
					Title = book.Title,
					Description = book.Description,
					ImagePath = book.ImagePath,
					ISBN = book.ISBN,
					PageNumber = book.PageNumber,
					Price = book.Price,
					PublishingDate = book.PublishingDate,
					QuantityInStock = book.QuantityInStock,
					Weight = book.Weight,
				};
			}
			else
			{
				return new Book
				{
					Id = book.Id,
					Authors = ConvertHelpers.Instance.ConvertModelPersonToDBPerson<Author, AuthorModel>(book.Authors),
					Publisher = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Publisher, PublisherModel>(book.Publisher),
					Genres = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Genre, GenreModel>(book.Genres),
					Readers = ConvertHelpers.Instance.ConvertModelPersonToDBPerson<Reader, ReaderModel>(book.Readers),
					Format = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Format, FormatModel>(book.Format),
					Language = ConvertHelpers.Instance.ConvertModelLookupToDBLookup<Language, LanguageModel>(book.Language),
					Title = book.Title,
					Description = book.Description,
					ImagePath = book.ImagePath,
					ISBN = book.ISBN,
					PageNumber = book.PageNumber,
					Price = book.Price,
					PublishingDate = book.PublishingDate,
					QuantityInStock = book.QuantityInStock,
					Weight = book.Weight,
				};
			}
		}

		public BookModel ConvertDBBookToBookModel(Book book)
		{
			if (book.Series != null)
			{
				return new BookModel
				{
					Id = book.Id,
					Authors = ConvertHelpers.Instance.ConvertDBPersonToModelPerson<AuthorModel, Author>(book.Authors).ToList(),
					Publisher = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<PublisherModel, Publisher>(book.Publisher),
					Genres = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<GenreModel, Genre>(book.Genres).ToList(),
					Readers = ConvertHelpers.Instance.ConvertDBPersonToModelPerson<ReaderModel, Reader>(book.Readers).ToList(),
					Format = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<FormatModel, Format>(book.Format),
					Language = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<LanguageModel, Language>(book.Language),
					Series = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<SeriesModel, Series>(book.Series),
					Title = book.Title,
					Description = book.Description,
					ImagePath = book.ImagePath,
					ISBN = book.ISBN,
					PageNumber = book.PageNumber,
					Price = book.Price,
					PublishingDate = book.PublishingDate,
					QuantityInStock = book.QuantityInStock,
					Weight = book.Weight,
				};
			}
			else
			{
				return new BookModel
				{
					Id = book.Id,
					Authors = ConvertHelpers.Instance.ConvertDBPersonToModelPerson<AuthorModel, Author>(book.Authors).ToList(),
					Publisher = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<PublisherModel, Publisher>(book.Publisher),
					Genres = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<GenreModel, Genre>(book.Genres).ToList(),
					Readers = ConvertHelpers.Instance.ConvertDBPersonToModelPerson<ReaderModel, Reader>(book.Readers).ToList(),
					Format = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<FormatModel, Format>(book.Format),
					Language = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<LanguageModel, Language>(book.Language),
					Title = book.Title,
					Description = book.Description,
					ImagePath = book.ImagePath,
					ISBN = book.ISBN,
					PageNumber = book.PageNumber,
					Price = book.Price,
					PublishingDate = book.PublishingDate,
					QuantityInStock = book.QuantityInStock,
					Weight = book.Weight,
				};
			}
		}
	}
}