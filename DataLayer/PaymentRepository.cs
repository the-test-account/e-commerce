using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
	public class PaymentRepository
	{
		private MagicBooksDBEntities context;

		public PaymentRepository()
		{
			context = new MagicBooksDBEntities();
		}

		public List<PaymentTypeModel> GetAllPayments()
		{

			var payments = context.PaymentTypes.AsEnumerable().Select(p => new PaymentTypeModel
			{
				Id = p.Id,
				Name = p.Name
			}).ToList();
			return payments;
		}
	}
}
