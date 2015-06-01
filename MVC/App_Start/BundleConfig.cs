using System.Web;
using System.Web.Optimization;

namespace MVC
{
	public class BundleConfig
	{
		// For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
		public static void RegisterBundles(BundleCollection bundles)
		{
			bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
						"~/Scripts/jquery-{version}.js",
						"~/Scripts/jquery.unobtrusive-ajax.js",
						"~/Scripts/foundation.js",
						"~/Scripts/topbar.js",
						"~/Scripts/dropdown.js",
						"~/Scripts/slick.js",
						"~/Scripts/app.js"));


			bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
						"~/Scripts/jquery.validate*"));

			// Use the development version of Modernizr to develop with and learn from. Then, when you're
			// ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
			bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
						"~/Scripts/modernizr-*"));

			bundles.Add(new ScriptBundle("~/bundles/foundation").Include(
					 "~/Scripts/foundation.js",
                     "~/Scripts/foundation.topbar.js",
                     "~/Scripts/foundation.dropdown.js",
					  "~/Scripts/respond.js"));

			bundles.Add(new StyleBundle("~/Content/css").Include(
					  "~/Content/foundation.css",
					  "~/Content/font-awesome.css",
					  "~/Content/slick.css",
					  "~/Content/slick-theme.css",
                      
					  "~/Content/Site.css"));
		}
	}
}
