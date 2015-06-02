using BusinessLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DataLayer
{
	public class BookRepository
	{
		private MagicBooksDBEntities context;

		public BookRepository()
		{
			context = new MagicBooksDBEntities();
		}

		public void Add(DisplayAdLibrisForBookModel book)
		{
			Series series = new Series();

			if (book.SeriesName != string.Empty && book.SeriesName != null)
			{
				series = GetSeriesByName(book.SeriesName);
			}
			else
			{
				series = null;
			}

			List<Reader> readers = new List<Reader>();

			if (book.ReaderNames != string.Empty && book.ReaderNames != null)
			{
				readers = GetReadersByName(book.ReaderNames).ToList();
			}
			else
			{
				readers = null;
			}

			Book newDBBook = new Book
			{
				Title = book.Title,
				Description = book.Description,
				ISBN = book.ISBN,
				Series = series,
				PublishingDate = Convert.ToDateTime(book.PublishingDate),
				ImagePath = book.ImagePath,
				Readers = readers,
				Publisher = GetPublisherByName(book.PublisherName),
				Authors = GetAuthorsByNames(book.AuthorNames),
				Format = GetFormatByName(book.Format),
				Genres = GetGenresByName(book.GenreNames),
				Language = GetLanguageByName(book.Language),
				PageNumber = book.PageNumber,
				Price = book.Price,
				Weight = book.Weight,
				QuantityInStock = int.Parse(book.QuantityInStock)
			};
			context.Books.Add(newDBBook);
			context.SaveChanges();
		}

		public bool IsBookInDB(string isbn)
		{
			var book = context.Books.Where(b => b.ISBN == isbn).FirstOrDefault();
			if (book != null)
			{
				return true;
			}
			return false;
		}

		public List<BookModel> GetAllBooks()
		{
			var books = context.Books.Where(b => b.NotOnSale == false).AsEnumerable().Select(b => new BookModel
				{
					Authors = GetBookAuthors(b.Id),
					Description = b.Description,
					FormatId = b.FormatId,
					LanguageId = b.LanguageId,
					PublisherId = b.PublisherId,
					Format = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<FormatModel, Format>(b.Id, "Format", context),
					Series = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<SeriesModel, Series>(b.Id, "Series", context),
					Readers = GetBookReaders(b.Id),
					Genres = GetBookGenres(b.Id),
					ISBN = b.ISBN,
					PageNumber = b.PageNumber,
					Price = b.Price,
					Weight = b.Weight,
					Title = b.Title,
					Id = b.Id,
					QuantityInStock = b.QuantityInStock,
					PublishingDate = b.PublishingDate,
					ImagePath = b.ImagePath,
					Language = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<LanguageModel, Language>(b.Id, "Language", context),
					Publisher = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<PublisherModel, Publisher>(b.Id, "Publisher", context),
				}).ToList();
			return books;
		}

		public BookModel GetBookById(int id)
		{
			var book = context.Books.AsEnumerable().Where(b => b.Id == id).Select(b => new BookModel
			{
				Authors = GetBookAuthors(b.Id),
				Readers = GetBookReaders(b.Id),
				Series = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<SeriesModel, Series>(b.Id, "Series", context),
				Description = b.Description,
				Format = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<FormatModel, Format>(b.Id, "Format", context),
				Genres = GetBookGenres(b.Id),
				ISBN = b.ISBN,
				FormatId = b.FormatId,
				LanguageId = b.LanguageId,
				PublisherId = b.PublisherId,
				PageNumber = b.PageNumber,
				Price = b.Price,
				Weight = b.Weight,
				Title = b.Title,
				Id = b.Id,
				QuantityInStock = b.QuantityInStock,
				PublishingDate = b.PublishingDate,
				ImagePath = b.ImagePath,
				Language = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<LanguageModel, Language>(b.Id, "Language", context),
				Publisher = ConvertHelpers.Instance.ConvertDBLookUpToModelLookUp<PublisherModel, Publisher>(b.Id, "Publisher", context),
			}).FirstOrDefault();
			return book;
		}

		private List<GenreModel> GetBookGenres(int id)
		{
			return context.Genres.SelectMany(a => a.Books.Where(b => b.Id == id), (a, b) => a).Select(c => new GenreModel
			{
				Id = c.Id,
				Name = c.Name
			}).ToList();
		}

		private List<AuthorModel> GetBookAuthors(int id)
		{
			return context.Authors.SelectMany(a => a.Books.Where(b => b.Id == id), (a, b) => a).Select(c => new AuthorModel
			{
				FirstName = c.FirstName,
				LastName = c.LastName,
				Id = c.Id
			}).ToList();
		}

		private List<ReaderModel> GetBookReaders(int id)
		{
			return context.Readers.SelectMany(a => a.Books.Where(b => b.Id == id), (a, b) => a).Select(c => new ReaderModel
			{
				FirstName = c.FirstName,
				LastName = c.LastName,
				Id = c.Id
			}).ToList();
		}

		private Language GetLanguageByName(string name)
		{
			var language = context.Languages.Where(p => p.Name.ToLower() == name.ToLower()).FirstOrDefault();
			if (language != null)
			{
				return language;
			}
			else
			{
				return AddLanguageToDB(name);
			}
		}

		private Language AddLanguageToDB(string name)
		{
			var newLanguage = new Language
			{
				Name = name,
			};
			context.Languages.Add(newLanguage);
			context.SaveChanges();
			return newLanguage;
		}

		private ICollection<Genre> GetGenresByName(string genres)
		{
			var list = new List<Genre>();
			string[] names = genres.Split(';');
			foreach (var item in names)
			{
				list.Add(GetGenreByName(item));
			}
			return list;
		}

		private Genre GetGenreByName(string name)
		{
			var genre = context.Genres.Where(p => p.Name.ToLower() == name.ToLower()).FirstOrDefault();
			if (genre != null)
			{
				return genre;
			}
			else
			{
				return AddGenreToDB(name);
			}
		}

		private Genre AddGenreToDB(string name)
		{
			var newGenre = new Genre
			{
				Name = name,
			};
			context.Genres.Add(newGenre);
			context.SaveChanges();
			return newGenre;
		}

		private Format GetFormatByName(string name)
		{
			var format = context.Formats.Where(p => p.Name.ToLower() == name.ToLower()).FirstOrDefault();
			if (format != null)
			{
				return format;
			}
			else
			{
				return AddFormatToDB(name);
			}
		}

		private Format AddFormatToDB(string name)
		{
			var newFormat = new Format
			{
				Name = name,
			};
			context.Formats.Add(newFormat);
			context.SaveChanges();
			return newFormat;
		}

		private Publisher GetPublisherByName(string name)
		{
			var publisher = context.Publishers.Where(p => p.Name.ToLower() == name.ToLower()).FirstOrDefault();
			if (publisher != null)
			{
				return publisher;
			}
			else
			{
				return AddPublisherToDB(name);
			}
		}

		private Publisher AddPublisherToDB(string name)
		{
			var newPublisher = new Publisher
			{
				Name = name,
			};
			context.Publishers.Add(newPublisher);
			context.SaveChanges();
			return newPublisher;
		}

		private Series GetSeriesByName(string name)
		{
			var series = context.Series.Where(p => p.Name.ToLower() == name.ToLower()).FirstOrDefault();
			if (series != null)
			{
				return series;
			}
			else
			{
				return AddSeriesToDB(name);
			}
		}

		private Series AddSeriesToDB(string name)
		{
			var newSeries = new Series
			{
				Name = name,
			};
			context.Series.Add(newSeries);
			context.SaveChanges();
			return newSeries;
		}

		private ICollection<Author> GetAuthorsByNames(string authors)
		{
			var list = new List<Author>();
			string[] names = authors.Split(';');
			foreach (var item in names)
			{
				list.Add(GetAuthorByName(item));
			}
			return list;
		}

		private Author GetAuthorByName(string authors)
		{
			string[] names = authors.Split(' ');
			string fName = string.Empty;
			string lName = names[names.Count() - 1].ToLower();
			fName = GetFirstName(names);

			var author = context.Authors.Where(a => a.FirstName.ToLower() == fName && a.LastName.ToLower() == lName).FirstOrDefault();
			var list = new List<Author>();
			if (author != null)
			{
				list.Add(author);
			}
			else
			{
				list.Add(AddAuthorToDB(fName, lName));
			};
			return list[0];
		}

		private static string GetFirstName(string[] names)
		{
			string fName = string.Empty;

			for (int i = 0; i < names.Count(); i++)
			{
				if (i < names.Count() - 1)
				{
					fName += names[i] + " ";
				}
			}
			return fName.Trim();
		}

		private Author AddAuthorToDB(string fName, string lName)
		{
			fName = fName.First().ToString().ToUpper() + fName.Substring(1);
			lName = lName.First().ToString().ToUpper() + lName.Substring(1);
			var newAuthor = new Author
			{
				FirstName = fName,
				LastName = lName,
			};
			context.Authors.Add(newAuthor);
			context.SaveChanges();
			return newAuthor;
		}

		private ICollection<Reader> GetReadersByName(string readers)
		{
			//TODO: Handle more then one reader
			string[] names = readers.Split(' ');
			string fName = string.Empty;
			string lName = names[names.Count() - 1].ToLower();
			fName = GetFirstName(names);

			var reader = context.Readers.Where(a => a.FirstName.ToLower() == fName && a.LastName.ToLower() == lName).FirstOrDefault();
			var list = new List<Reader>();
			if (reader != null)
			{
				list.Add(reader);
			}
			else
			{
				list.Add(AddReaderToDB(fName, lName));
			};
			return list;
		}

		private Reader AddReaderToDB(string fName, string lName)
		{
			fName = fName.First().ToString().ToUpper() + fName.Substring(1);
			lName = lName.First().ToString().ToUpper() + lName.Substring(1);
			var newReader = new Reader
			{
				FirstName = fName,
				LastName = lName,
			};
			context.Readers.Add(newReader);
			context.SaveChanges();
			return newReader;
		}

		public List<BookModel> GetTopFiveBooks()
		{
			var list = context.OrderDetails.GroupBy(d => d.BookId)
			 .Select(g => new { g.Key, Count = g.Count() })
			 .OrderByDescending(d => d.Count).Take(5);

			var books = new List<BookModel>();
			foreach (var item in list)
			{
				books.Add(ConvertHelpers.Instance.ConvertDBBookToBookModel(context.Books.Find(item.Key)));
			}
			return books;
		}

		public void Edit(BookModel book)
		{
			var bookToEdit = context.Books.Find(book.Id);
			bookToEdit = SaveEditedBook(book, bookToEdit);
			context.SaveChanges();
		}

		public void Delete(int id)
		{
			var bookToDelete = context.Books.Find(id);
			var bookOrders = context.OrderDetails.Where(d => d.BookId == bookToDelete.Id).FirstOrDefault();

			bookToDelete.NotOnSale = true;
			context.SaveChanges();
		}

		public Book SaveEditedBook(BookModel model, Book book)
		{
			book.Id = model.Id;
			book.Authors = ConvertModelAuthorToDBAuthor(model.Id);
			book.Publisher = GetPublisherByName(model.Publisher.Name);
			book.Genres = ConvertModelGenreToDBGenre(model.Id);
			if (model.Readers != null)
			{
				book.Readers = ConvertModelReaderToDBReader(model.Id);
			}
			book.Format = GetFormatByName(model.Format.Name);
			book.Language = GetLanguageByName(model.Language.Name);
			if (model.Series != null)
			{
				book.Series = GetSeriesByName(model.Series.Name);
			}
			book.Title = model.Title;
			book.Description = model.Description;
			book.ImagePath = model.ImagePath;
			book.ISBN = model.ISBN;
			book.PageNumber = model.PageNumber;
			book.Price = model.Price;
			book.PublishingDate = model.PublishingDate;
			book.QuantityInStock = model.QuantityInStock;
			book.Weight = model.Weight;

			return book;
		}

		private static string ConvertGenresToString(BookModel model)
		{
			string genres = string.Empty;
			foreach (var item in model.Genres)
			{
				genres += item.Name + ";";
			}
			genres = genres.Substring(0, genres.Length - 1);
			return genres;
		}

		private static string ConvertAuthorsToString(BookModel model)
		{
			string authors = string.Empty;

			foreach (var item in model.Authors)
			{
				authors += item.DisplayFullName + ";";
			}
			authors = authors.Substring(0, authors.Length - 1);
			return authors;
		}

		private static string ConvertReadersToString(BookModel model)
		{
			string readers = string.Empty;

			foreach (var item in model.Readers)
			{
				readers += item.DisplayFullName + ";";
			}
			readers = readers.Substring(0, readers.Length - 1);
			return readers;
		}

		public List<Author> ConvertModelAuthorToDBAuthor(int id)
		{
			return context.Books.Where(b => b.Id == id).FirstOrDefault().Authors.ToList();
		}

		public List<Reader> ConvertModelReaderToDBReader(int id)
		{
			return context.Books.Where(b => b.Id == id).FirstOrDefault().Readers.ToList();
		}

		public List<Genre> ConvertModelGenreToDBGenre(int id)
		{
			return context.Books.Where(b => b.Id == id).FirstOrDefault().Genres.ToList();
		}

		public List<BookModel> GetSuggestionsByCategory(int id)
		{
			List<BookModel> books = new List<BookModel>();
			var dbBook = context.Books.FirstOrDefault(b => b.Id == id);
			var firstBooksGenre = dbBook.Genres.FirstOrDefault().Id;
			var list = context.Books.SelectMany(b => b.Genres.Where(g => g.Id == firstBooksGenre), (b, g) => b).ToList();
			var modellist = new List<BookModel>();
			foreach (var item in list)
			{
				if (item.Id != id)
				{
					modellist.Add(ConvertHelpers.Instance.ConvertDBBookToBookModel(item));
				}
				
			}
			return modellist;
		}
	}
}