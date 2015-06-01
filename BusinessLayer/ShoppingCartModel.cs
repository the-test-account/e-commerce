using Entities;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLayer
{
	public class ShoppingCartModel
	{
		private List<ShoppingCartItemModel> items = new List<ShoppingCartItemModel>();

		public int TotalQuantity { get; set; }
		
		

		public List<ShoppingCartItemModel> Items
		{
			get { return items; }
			set { items = value; }
		}

		public void AddItem(BookModel book, int quantity)
		{
			ShoppingCartItemModel item = items.SingleOrDefault(b => b.Book.Id == book.Id);
			if (item == null)
			{
				items.Add(new ShoppingCartItemModel
				{
					Book = book,
					Quantity = quantity
				});
				GetTotalCount();
				items[0].IsNotInStock = CheckStockQuantity(quantity, items[0]);
				if (items[0].IsNotInStock)
				{
					items[0].Quantity = items[0].Book.QuantityInStock;
					GetTotalCount();
				}
			}
			else
			{
				item.Quantity += quantity;
				GetTotalCount();
				item.IsNotInStock = CheckStockQuantity(quantity, item);
				if (item.IsNotInStock)
				{
					item.Quantity = item.Book.QuantityInStock;
					GetTotalCount();
				}
			}
		}

		public void Remove(int id)
		{
			items.RemoveAll(b => b.Book.Id == id);
			GetTotalCount();

		}

		public decimal GetCartTotal()
		{
			return items.Sum(b => b.Book.Price * b.Quantity);
		}

		public void Clear()
		{
			items.Clear();
			TotalQuantity = 0;
		}

		public void Edit(int id, int quantity)
		{
			ShoppingCartItemModel item = items.SingleOrDefault(b => b.Book.Id == id);
			if (item != null)
			{
				item.Quantity = quantity;
				GetTotalCount();
				item.IsNotInStock = CheckStockQuantity(quantity, item);
				
				if (item.IsNotInStock)
				{
					item.Quantity = item.Book.QuantityInStock;
					GetTotalCount();
				}
				
			}
		}

		public void GetTotalCount()
		{
			TotalQuantity = 0;
			foreach (var item in Items)
			{
				TotalQuantity += item.Quantity;
			}
		}

		public bool CheckStockQuantity(int quantity, ShoppingCartItemModel item)
		{
			int bookInCart = GetTotalBookInCart(item.Book.ISBN);
			quantity += bookInCart;

			if (item.Book.QuantityInStock < quantity)
			{
				return true;
			}

			return false;
		}
		public int GetTotalBookInCart(string isbn)
		{
			int quantity = 0;
			foreach (var item in Items)
			{
				if (item.Book.ISBN==isbn)
				{
					quantity=item.Quantity;
				}
			}
			return quantity;

		}
	}
}