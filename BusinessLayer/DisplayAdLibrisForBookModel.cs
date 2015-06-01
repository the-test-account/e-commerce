using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BusinessLayer
{
	public class DisplayAdLibrisForBookModel
	{
		[Required(ErrorMessage = "Ange författare")]
		[DisplayName("Författare")]
		public string AuthorNames { get; set; }
		[DisplayName("Uppläsare")]
		public string ReaderNames { get; set; }
		[DisplayName("Bokserie")]
		public string SeriesName { get; set; }
		[Required(ErrorMessage = "Ange förlag")]
		[DisplayName("Förlag")]
		public string PublisherName { get; set; }
		[Required(ErrorMessage = "Ange titel")]
		[DisplayName("Titel")]
		public string Title { get; set; }
		[Required(ErrorMessage = "Ange sökväg till bild")]
		[DisplayName("Bild")]
		public string ImagePath { get; set; }
		[Required(ErrorMessage = "Ange ISBN")]
		[DisplayName("ISBN")]
		public string ISBN { get; set; }
		[Required(ErrorMessage = "Ange språk")]
		[DisplayName("Språk")]
		public string Language { get; set; }
		[DisplayName("Antal sidor")]
		public int PageNumber { get; set; }
		[Required(ErrorMessage = "Ange utgivningsdatum")]
		[DisplayName("Utgivningsdatum")]
		public string PublishingDate { get; set; }
		[Required(ErrorMessage = "Ange vikt")]
		[DisplayName("Vikt")]
		public int Weight { get; set; }
		[Required(ErrorMessage = "Ange pris")]
		[DisplayName("Pris")]
		public int Price { get; set; }
		[Required(ErrorMessage = "Ange format")]
		[DisplayName("Format")]
		public string Format { get; set; }
		
		[DisplayName("Genrer")]
		public string GenreNames { get; set; }
		[Required(ErrorMessage = "Beskriv handling")]
		[DisplayName("Handling")]
		public string Description { get; set; }
		public bool AlreadyInDb { get; set; }
		[Required(ErrorMessage = "Ange antal i lager")]
		[DisplayName("Antal i lager")]
		public string QuantityInStock { get; set; }
		public DisplayAdLibrisForBookModel()
		{
			
		}
	}
}
