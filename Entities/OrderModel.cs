using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class OrderModel
	{
		public int Id { get; set; }
		public int AddressId { get; set; }
		public int ContactId { get; set; }
		public string Comment { get; set; }
		public System.DateTime OrderDate { get; set; }
		public string OrderNumber { get; set; }
		public decimal TotalPrice { get; set; }
		public int DeliveryTypeId { get; set; }
		public int PaymentTypeId { get; set; }
	
		public AddressModel Address { get; set; }
		public ContactModel Contact { get; set; }
		public DeliveryTypeModel DeliveryType { get; set; }
		public PaymentTypeModel PaymentType { get; set; }
	}
}
