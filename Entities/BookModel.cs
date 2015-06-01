using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Entities
{
	public class BookModel
	{
		 public BookModel()
		{
			this.Authors = new List<AuthorModel>();
			this.Genres = new List<GenreModel>();
			this.OrderDetails = new HashSet<OrderDetailsModel>();
			this.Readers = new List<ReaderModel>();
			
		}
	
		public int Id { get; set; }
		public string Title { get; set; }
		public string ImagePath { get; set; }
		public string ISBN { get; set; }
		public int LanguageId { get; set; }
		 [Display(Name = "Antal sidor:")]
		public int PageNumber { get; set; }
		 [Display(Name = "Utgiven:")]
		public System.DateTime PublishingDate { get; set; }
		public int PublisherId { get; set; }
		 [Display(Name = "Vikt:")]
		public int Weight { get; set; }
		[Display(Name = "Pris:")]
		public decimal Price { get; set; }
		public int FormatId { get; set; }
		public string Description { get; set; }
		[Display(Name = "Finns i lager:")]
		public int QuantityInStock { get; set; }
	
		public virtual FormatModel Format { get; set; }
		public virtual LanguageModel Language { get; set; }
		public virtual PublisherModel Publisher { get; set; }
		public virtual List<AuthorModel> Authors { get; set; }
		public virtual List<GenreModel> Genres { get; set; }
		public virtual ICollection<OrderDetailsModel> OrderDetails { get; set; }
		public virtual List<ReaderModel> Readers { get; set; }
		public virtual SeriesModel Series { get; set; }
		public List<BookModel> TopFiveBooks { get; set; }
	}
}
