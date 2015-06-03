using BusinessLayer;
using Entities;
using MVC.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace MVC.Models
{
	public class GetApiResponse<T> where T : class
	{
		private readonly string baseUri = "http://localhost:25862/";

		public List<BookModel> TopFiveBooks;

		public DisplayAdLibrisForBookModel BookForAdLibris { get; set; }

		public BookModel Book { get; set; }
		public OrderModel Order { get; set; }

		public List<BookModel> Books { get; set; }

		public List<BookModel> BooksSuggestion { get; set; }

		public List<DeliveryTypeModel> Deliveries { get; set; }

		public List<PaymentTypeModel> Payments { get; set; }

		public DisplayAdLibrisForBookModel GetBookFromAdlibris(string isbn, string path)
		{
			BookForAdLibris = GetInfoFromWebApi(path, isbn) as DisplayAdLibrisForBookModel;
			return BookForAdLibris;
		}

		private T GetInfoFromWebApi(string path, string id)
		{
			var httpClient = new System.Net.Http.HttpClient
			{
				BaseAddress = new Uri(baseUri + path + id),
				Timeout = TimeSpan.FromSeconds(60),
			};
			var test = baseUri + path + id;
			try
			{
				HttpResponseMessage response = httpClient.GetAsync("").Result;
				response.EnsureSuccessStatusCode();
				if (response.IsSuccessStatusCode)
				{
					return response.Content.ReadAsAsync<T>().Result;
				}
			}
			catch (Exception ex)
			{
			}

			return null;
		}

		private async Task<T> UpdateInfoFromWebApi<U>(string path, string id, U model)
		{
			var httpClient = new System.Net.Http.HttpClient
			{
				BaseAddress = new Uri(baseUri + path + id),
				Timeout = TimeSpan.FromSeconds(60),
			};

			try
			{
				var response = await httpClient.PutAsXmlAsync("", model);
				response.EnsureSuccessStatusCode();
				if (response.IsSuccessStatusCode)
				{
					return response.Content.ReadAsAsync<T>().Result;
				}
			}
			catch (Exception ex)
			{
			}

			return null;
		}

		private async Task<T> DeleteInfoFromWebApi<U>(string path, string id, U model)
		{
			var httpClient = new System.Net.Http.HttpClient
			{
				BaseAddress = new Uri(baseUri + path + id),
				Timeout = TimeSpan.FromSeconds(60),
			};
			var test = baseUri + path + id;
			try
			{
				var response = await httpClient.DeleteAsync("");
				return response.Content.ReadAsAsync<T>().Result;
			}
			catch (Exception ex)
			{
			}
			return null;
		}

		private Uri SaveInfoToWebApi<U>(string path, U model)
		{
			var httpClient = new System.Net.Http.HttpClient
			{
				BaseAddress = new Uri(baseUri + path),
				Timeout = TimeSpan.FromSeconds(8),
			};

			try
			{
				var response = httpClient.PostAsXmlAsync("", model).Result;
				response.EnsureSuccessStatusCode();
				if (response.IsSuccessStatusCode)
				{
					// Get the URI of the created resource.
					return response.Headers.Location;
				}
			}
			catch (Exception ex)
			{
			}

			return null;
		}

		private List<T> GetListInfoFromWebApi(string path, string isbn)
		{
			var httpClient = new System.Net.Http.HttpClient
			{
				BaseAddress = new Uri(baseUri + path),
				Timeout = TimeSpan.FromSeconds(60),
			};

			try
			{
				HttpResponseMessage response = httpClient.GetAsync(isbn).Result;
				response.EnsureSuccessStatusCode();
				if (response.IsSuccessStatusCode)
				{
					return response.Content.ReadAsAsync<IEnumerable<T>>().Result.ToList();
				}
			}
			catch (Exception ex)
			{
			}

			return null;
		}

		public List<BookModel> GetAllBooksFromDb(string path)
		{
			return GetListInfoFromWebApi(path, "") as List<BookModel>;
		}

		public List<OrderModel> GetAllOrdersFromDb(string path)
		{
			return GetListInfoFromWebApi(path, "") as List<OrderModel>;
		}

		public List<PaymentTypeModel> GetAllPaymentsFromDb(string path)
		{
			Payments = GetListInfoFromWebApi(path, "") as List<PaymentTypeModel>;
			return Payments;
		}

		public BookModel GetBookFromDbById(string path, int id)
		{
			Book = GetInfoFromWebApi(path, id.ToString()) as BookModel;
			return Book;
		}

		public OrderModel GetOrderFromDbById(string path, int id)
		{
			Order = GetInfoFromWebApi(path, id.ToString()) as OrderModel;
			return Order;
		}
		public List<BookModel> GetSuggestionFromBookIdFromDB(string path, int id)
		{
			BooksSuggestion = GetListInfoFromWebApi(path, id.ToString()) as List<BookModel>;
			return BooksSuggestion;
		}

		public List<BookModel> GetTopFiveBooksFromDb(string path, string query)
		{
			TopFiveBooks = GetListInfoFromWebApi(path, query) as List<BookModel>;
			return TopFiveBooks;
		}

		public List<DeliveryTypeModel> GetAllDeliveriesFromDb(string path)
		{
			Deliveries = GetListInfoFromWebApi(path, "") as List<DeliveryTypeModel>;
			return Deliveries;
		}

		public void SaveBookToDb(string path, DisplayAdLibrisForBookModel model)
		{
			SaveInfoToWebApi(path, model);
		}

		public void SaveOrderToDb(string path, CreateOrderViewModel model)
		{
			SaveInfoToWebApi(path, model);
		}

		public async Task<bool> IsBookInDb(string path, string id)
		{
			return bool.Parse(await GetResponseString(path + id));
		}

		public async Task<string> GetResponseString(string path)
		{
			var httpClient = new System.Net.Http.HttpClient
			{
				BaseAddress = new Uri(baseUri),
			};
			var test = baseUri + path;

			var response = await httpClient.GetAsync(path);
			var contents = await response.Content.ReadAsStringAsync();

			return contents;
		}

		public async Task<BookModel> UpdateBook(string path, string id, BookModel book)
		{
			return await UpdateInfoFromWebApi(path, id, book) as BookModel;
		}

		public async Task<bool> DeleteBook(string path, string id, BookModel book)
		{
			var result = await DeleteInfoFromWebApi(path, id, book);
			return true;
		}

		public async Task<bool> DeleteOrder(string path, string id, OrderModel model)
		{
			var result = await DeleteInfoFromWebApi(path, id, model);
			return true;
		}
	}
}