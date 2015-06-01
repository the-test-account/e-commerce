using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entities
{
	public class ShoppingCartItemModel
	{
		public BookModel Book { get; set; }
		public int Quantity { get; set; }
		public bool IsNotInStock { get; set; }
	}
}