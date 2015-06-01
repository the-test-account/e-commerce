using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC.ViewModel
{
	public class ContactViewModel
	{
		public ContactViewModel()
		{
			PaymentTypeList = new List<PaymentTypeModel>();
			DeliveryTypeList = new List<DeliveryTypeModel>();
		}
		
		public AddressModel Address { get; set; }
		public ContactModel Contact { get; set; }
		
		public PaymentTypeModel PaymentMethod { get; set; }
		[Required(ErrorMessage = "Välj ett betalningssätt")]
		[Range(1, Int32.MaxValue)]
		[DisplayName("Betalningssätt")]
		public int SelectedPaymentId { get; set; }
		
		public List<PaymentTypeModel> PaymentTypeList { get; set; }
		[Required(ErrorMessage = "Välj ett leveranssätt")]
		[Range(1, Int32.MaxValue)]
		[DisplayName("Leveranssätt")]
		public int SelectedDeliveryId { get; set; }

		public List<DeliveryTypeModel> DeliveryTypeList { get; set; }

		public string ReturnUrl { get; set; }
		
		[DisplayName("Eventuell kommentar")]
		public string Comment { get; set; }
	}
}