﻿using BusinessLayer;
using DataLayer;
using MVC.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace WebAPI.Controllers
{
	[EnableCorsAttribute("http://localhost:25859/", "*", "*")]
	public class APIDbOrderController : ApiController
	{
		private OrderRepository repo;

		public APIDbOrderController()
		{
			repo = new OrderRepository();
		}

		public bool Post([FromBody] OrderViewModel model)
		{
			
			return repo.ProcessOrder(model.OrderInfo.Address, model.OrderInfo.Contact, model.Cart, model.OrderInfo.SelectedPaymentId, model.OrderInfo.SelectedDeliveryId);
			
		}

		

	}
}