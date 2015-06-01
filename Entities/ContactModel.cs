using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class ContactModel
	{
		[DisplayName("Personnummer")]
		[Required(ErrorMessage = "Personnummer måste anges")]
	   public string SocialSecurityNumber { get; set; }
		[DisplayName("Epost")]
		[Required(ErrorMessage = "Epost måste anges")]
		[EmailAddress]
		public string Email { get; set; }
		[DisplayName("Mobilnummer")]
		[Required(ErrorMessage = "Mobilnummer måste anges")]
		public string CellPhoneNumber { get; set; }
		[DisplayName("Förnamn")]
		[Required(ErrorMessage = "Förnamn måste anges")]
		public string FirstName { get; set; }
		[DisplayName("Efternamn")]
		[Required(ErrorMessage = "Efternamn måste anges")]
		public string LastName { get; set; }
		public int AddressId { get; set; }
	
		public virtual AddressModel Address { get; set; }
	
	}
}
