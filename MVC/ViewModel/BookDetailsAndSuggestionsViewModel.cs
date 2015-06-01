using Entities;
using MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.ViewModel
{
    public class BookDetailsAndSuggestionsViewModel
    {
        public BookModel Book { get; set; }
        public List<BookModel> Suggestions { get; set; }
        private GetApiResponse<BookModel> apiModelBook;
        public int BookId { get; set; }
        public BookDetailsAndSuggestionsViewModel()
        {
            
            apiModelBook = new GetApiResponse<BookModel>();
            Suggestions = GetSuggestionsByCategory(14);
        }

        private List<BookModel> GetSuggestionsByCategory(int id)
        {
            List<BookModel> books = new List<BookModel>();
           var dbBooks = apiModelBook.GetAllBooksFromDb("api/APIDbBook");
            var dbBook = dbBooks.FirstOrDefault(b => b.Id==id);
            var firstBooksGenre = dbBook.Genres.FirstOrDefault().Id;
            var list = dbBooks.SelectMany(b => b.Genres.Where(g => g.Id == firstBooksGenre), (b, g) => b).ToList();
           // return books.Where(g => g.Genres.FirstOrDefault().Id == firstBooksGenre).ToList();
            return null;
        }
    }
}