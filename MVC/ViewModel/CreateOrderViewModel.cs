﻿using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.ViewModel
{
	public class CreateOrderViewModel
	{
		public ShoppingCartModel Cart { get; set; }
		public ContactViewModel OrderInfo { get; set; }

	}
}