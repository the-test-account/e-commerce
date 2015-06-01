using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class OrderDetailsModel
	{
		public int Id { get; set; }
		public int OrderId { get; set; }
		public int Quantity { get; set; }
		public BookModel Book { get; set; }

	}
}
