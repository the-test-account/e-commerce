using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
	public class DeliveryRepository
	{
		private MagicBooksDBEntities context;

		public DeliveryRepository()
		{
			context = new MagicBooksDBEntities();
		}

		public List<DeliveryTypeModel> GetAllDeliveries()
		{

			var deliveries = context.DeliveryTypes.AsEnumerable().Select(p => new DeliveryTypeModel
			{
				Id = p.Id,
				Name = p.Name
			}).ToList();
			return deliveries;
		}
	}
}
