﻿using System;
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
			this.Readers = new List<ReaderModel>();
			
		}
	
		public int Id { get; set; }
         [Display(Name = "Titel:")]
		public string Title { get; set; }
         [Display(Name = "Bild adress:")]
		public string ImagePath { get; set; }
         [Display(Name = "ISBN:")]
		public string ISBN { get; set; }
		public int LanguageId { get; set; }
		 [Display(Name = "Antal sidor:")]
		public int PageNumber { get; set; }
        [UIHint("DateTimePicker")]
		 [Display(Name = "Utgiven:")]
		public DateTime PublishingDate { get; set; }
		public int PublisherId { get; set; }
		 [Display(Name = "Vikt:")]
		public int Weight { get; set; }
		[Display(Name = "Pris:")]
		public decimal Price { get; set; }
		public int FormatId { get; set; }
         [Display(Name = "Handling:")]
		public string Description { get; set; }
		[Display(Name = "Finns i lager:")]
		public int QuantityInStock { get; set; }
	
		public FormatModel Format { get; set; }
		public LanguageModel Language { get; set; }
		public PublisherModel Publisher { get; set; }
		public List<AuthorModel> Authors { get; set; }
		public List<GenreModel> Genres { get; set; }
		public List<ReaderModel> Readers { get; set; }
		public SeriesModel Series { get; set; }
		
	}
}
