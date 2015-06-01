using BusinessLayer;
using Entities;
using System;
using System.Data.Entity.Validation;
using System.Linq;

namespace DataLayer
{
	public class OrderRepository
	{
		private MagicBooksDBEntities context;

		public OrderRepository()
		{
			context = new MagicBooksDBEntities();
		}

		public bool ProcessOrder(AddressModel address, ContactModel contact, ShoppingCartModel cart, int paymentId, int deliveryId)
		{
			var dbAddress = GetAddressByStreet(address);
			var dbContact = GetContactBySocialSecurityNumber(dbAddress, contact);
			var dbPaymentType = GetPaymentTypeById(paymentId);
			var dbDeliveryType = GetDeliveryTypeById(deliveryId);

			using (var transaction = context.Database.BeginTransaction())
			{
				try
				{
					var order = new Order
					{
						Address = dbContact.Address,
						Contact = dbContact,
						OrderNumber = System.Guid.NewGuid().ToString(),
						DeliveryType = dbDeliveryType,
						PaymentType = dbPaymentType,
						TotalPrice = cart.GetCartTotal(),
						OrderDate = DateTime.Now,
					};
					context.Orders.Add(order);
					context.SaveChanges();

					foreach (var item in cart.Items)
					{
						if (item.Quantity <= item.Book.QuantityInStock)
						{
							var orderDetail = new OrderDetail
							{
								OrderId = order.Id,
								Book = GetBookById(item.Book.Id),
								QuantityOrdered = item.Quantity,

							};
							context.OrderDetails.Add(orderDetail);
							var bookBought = context.Books.Find(item.Book.Id);
							bookBought.QuantityInStock -= item.Quantity;
						
						}
						else
						{
							transaction.Rollback();
							return false;
						}

					}
					context.SaveChanges();
					transaction.Commit();
					return true;
					
				}

				catch(Exception E)
				{

				}

			}
			return true;
		}

		private Book GetBookById(int id)
		{
			return context.Books.Where(b => b.Id == id).FirstOrDefault();
		}
		
		private DeliveryType GetDeliveryTypeById(int deliveryId)
		{
			return context.DeliveryTypes.Where(p => p.Id == deliveryId).FirstOrDefault();
			
		}

		private Contact GetContactBySocialSecurityNumber(Address address, ContactModel contact)
		{
			var dbContact = context.Contacts.Where(p => p.SocialSecurityNumber.ToLower() == contact.SocialSecurityNumber.ToLower()).FirstOrDefault();
			if (dbContact != null)
			{
				return dbContact;
			}
			else
			{
				return AddContactToDB(contact, address);
			}
		}

		private Contact AddContactToDB(ContactModel contact, Address address)
		{
			var newContact = new Contact
			{
				SocialSecurityNumber = contact.SocialSecurityNumber,
				FirstName = contact.FirstName,
				LastName = contact.LastName,
				CellPhoneNumber = contact.CellPhoneNumber,
				Email = contact.Email,
				Address = address
			};
			context.Contacts.Add(newContact);
			context.SaveChanges();
			return newContact;
		}

		private Address GetAddressByStreet(AddressModel address)
		{
			var dbAddress = context.Addresses.Where(a => a.Street.ToLower() == address.Street.ToLower()).FirstOrDefault();
			if (dbAddress != null)
			{
				return dbAddress;
			}
			else
			{
				return AddAddressToDB(address);
			}
		}

		private Address AddAddressToDB(AddressModel address)
		{
			var newAddress = new Address
			{
				City = address.City,
				Street = address.Street,
				ZipCode = address.ZipCode
			};
			context.Addresses.Add(newAddress);
			context.SaveChanges();
			return newAddress;
		}

		private PaymentType GetPaymentTypeById(int id)
		{
			return context.PaymentTypes.Where(p => p.Id == id).FirstOrDefault();
			
			
		}

		
	}
}