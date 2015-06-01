using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class AddressModel
	{
		[DisplayName("Adress")]
		[Required(ErrorMessage = "Adress måste anges")]
		public string Street { get; set; }
		[DisplayName("Postnummer")]
		[Required(ErrorMessage = "Postnummer måste anges")]
		public string ZipCode { get; set; }
		[DisplayName("Ort")]
		[Required(ErrorMessage = "Ort måste anges")]
		public string City { get; set; }

	}
}
