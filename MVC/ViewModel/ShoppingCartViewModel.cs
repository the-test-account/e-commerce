using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVC.ViewModel
{
	public class ShoppingCartViewModel
	{
		public ShoppingCartModel Cart { get; set; }
		public string ReturnUrl { get; set; }
	}
}
