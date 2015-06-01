using DataLayer;
using Entities;
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
    public class APIDbPaymentController : ApiController
    {
		private PaymentRepository repo;

		public APIDbPaymentController()
		{
			repo = new PaymentRepository();
		}

		public List<PaymentTypeModel> Get()
		{
			return repo.GetAllPayments();
		}
    }
}
