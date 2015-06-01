using BusinessLayer;
using Entities;
using MVC.Models;
using MVC.ViewModel;
using System.Collections.Generic;
using System.Web.Mvc;

namespace MVC.Controllers
{
	public class ShoppingCartController : Controller
	{
		private GetApiResponse<PaymentTypeModel> apiModelPayment;
		private GetApiResponse<DeliveryTypeModel> apiModelDelivery;
		private GetApiResponse<OrderModel> apiModelOrder;

		public ShoppingCartController()
		{
			apiModelOrder = new GetApiResponse<OrderModel>();
			apiModelPayment = new GetApiResponse<PaymentTypeModel>();
			apiModelDelivery = new GetApiResponse<DeliveryTypeModel>();
		}

		// GET: ShoppingCart
		public ActionResult Index(string returnUrl)
		{
			return PartialView("_Index", new ShoppingCartViewModel
				{
					ReturnUrl = returnUrl,
					Cart = GetCart(),
				});
		}

		public PartialViewResult AddToCartWidget(int id, string returnUrl)
		{
			List<BookModel> books = new List<BookModel>();
			books = CacheHelper.GetAllBooks();

			var book = books.Find(b => b.Id == id);
			if (book != null)
			{
				GetCart().AddItem(book, 1);
			}
			return PartialView("_CartWidgetView");
		}

		public PartialViewResult ReloadCartWidget()
		{
			return PartialView("_CartWidgetView");
		}

		public RedirectToRouteResult RemoveFromCart(int id, string returnUrl)
		{
			GetCart().Remove(id);
			return RedirectToAction("Index", new { returnUrl });
		}

		public RedirectToRouteResult EditQuantity(int id, string returnUrl, int quantity)
		{
			GetCart().Edit(id, quantity);
			return RedirectToAction("Index", new { returnUrl });
		}

		public PartialViewResult OrderDetails()
		{
			ContactViewModel model = new ContactViewModel();
			apiModelPayment.Payments = apiModelPayment.GetAllPaymentsFromDb("api/APIDbPayment");
			model.PaymentTypeList = apiModelPayment.Payments;
			apiModelDelivery.Deliveries = apiModelDelivery.GetAllDeliveriesFromDb("api/APIDbDelivery");
			model.DeliveryTypeList = apiModelDelivery.Deliveries;
			return PartialView("OrderDetails", model);
		}

		[HttpPost]
		private ShoppingCartModel GetCart()
		{
			ShoppingCartModel cart = (ShoppingCartModel)Session["Cart"];
			if (cart == null)
			{
				cart = new ShoppingCartModel();
				Session["Cart"] = cart;
			}
			return cart;
		}

		[HttpPost]
		public ActionResult ProcessOrder(ContactViewModel contactModel, string returnUrl)
		{
			if (ModelState.IsValid)
			{
				ShoppingCartModel cart = GetCart();
				var model = new OrderViewModel
				{
					Cart = cart,
					OrderInfo = contactModel,
					
				};
				model.OrderInfo.Comment = contactModel.Comment;
				apiModelOrder.SaveOrderToDb("api/APIDbOrder", model);

				cart.Clear();

				return PartialView("_ThankYou");
			}
			apiModelPayment.Payments = apiModelPayment.GetAllPaymentsFromDb("api/APIDbPayment");
			contactModel.PaymentTypeList = apiModelPayment.Payments;
			apiModelDelivery.Deliveries = apiModelDelivery.GetAllDeliveriesFromDb("api/APIDbDelivery");
			contactModel.DeliveryTypeList = apiModelDelivery.Deliveries;
			return PartialView("OrderDetails", contactModel);
		}
	}
}