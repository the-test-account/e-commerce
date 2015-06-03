using BusinessLayer;
using Entities;
using System;
using System.Collections.Generic;
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
		public List<OrderModel> GetAllOrders()
		{
			

			return context.Orders.AsEnumerable().Select(o => new OrderModel
				{
					Id =o.Id,
					AddressId=o.AddressId,
					ContactId=o.ContactId,					
					DeliveryTypeId=o.DeliveryTypeId,
					Comment=o.Comment,
					OrderDate=o.OrderDate,
					OrderNumber=o.OrderNumber,
					PaymentTypeId=o.PaymentTypeId,
					TotalPrice=o.TotalPrice,
					Address=ConvertHelpers.Instance.ConvertDBAddressToModelAddress(o.Address),
					Contact = ConvertHelpers.Instance.ConvertDBContactToModelContact(o.Contact,o.Address,o.AddressId),
					DeliveryType = ConvertHelpers.Instance.ConvertDBLookupToModelLookup<DeliveryTypeModel, DeliveryType>(o.DeliveryType),
					PaymentType =  ConvertHelpers.Instance.ConvertDBLookupToModelLookup<PaymentTypeModel, PaymentType>(o.PaymentType),
					
				}).ToList();
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
		public void Edit(OrderModel order)
		{
			var orderToEdit = context.Orders.Find(order.Id);
			//orderToEdit = SaveEditedOrder(order, orderToEdit);
			context.SaveChanges();
		}

		public void Delete(int id)
		{
			var orderToDelete = context.Orders.Find(id);
			var orderDetails = context.OrderDetails.Where(d => d.BookId == id).ToList();
			
			orderDetails.ForEach(i => context.OrderDetails.Remove(i));
			context.Orders.Remove(orderToDelete);			
			context.SaveChanges();
		}

		public Book SaveEditedOrder(OrderModel model, Order order)
		{
			//book.Id = model.Id;
			//book.Authors = ConvertModelAuthorToDBAuthor(model.Id);
			//book.Publisher = GetPublisherByName(model.Publisher.Name);
			//book.Genres = ConvertModelGenreToDBGenre(model.Id);
			//if (model.Readers != null)
			//{
			//	book.Readers = ConvertModelReaderToDBReader(model.Id);
			//}
			//book.Format = GetFormatByName(model.Format.Name);
			//book.Language = GetLanguageByName(model.Language.Name);
			//if (model.Series != null)
			//{
			//	book.Series = GetSeriesByName(model.Series.Name);
			//}
			//book.Title = model.Title;
			//book.Description = model.Description;
			//book.ImagePath = model.ImagePath;
			//book.ISBN = model.ISBN;
			//book.PageNumber = model.PageNumber;
			//book.Price = model.Price;
			//book.PublishingDate = model.PublishingDate;
			//book.QuantityInStock = model.QuantityInStock;
			//book.Weight = model.Weight;

			return null;
		}


		
	}
}