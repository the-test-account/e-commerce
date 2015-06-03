using System;
using System.Net;
using System.Text.RegularExpressions;

namespace BusinessLayer
{
	public class ParseAdlibris
	{
		private static string html;

		public static bool LoadDocument(string isbn)
		{
			WebClient client = new WebClient();
			html = client.DownloadString("http://www.adlibris.com/se/organisationer/product.aspx?isbn=" + isbn);
			return html != string.Empty;
		}

		public static string GetTitle()
		{
			string title = string.Empty;
			Match mTitle = Regex.Match(html, "<span itemprop=\"name\">(.*?)</span>");
			if (mTitle.Success) { title = mTitle.Groups[1].Value; }

			return title;
		}

		public static string GetAuthors()
		{
			string tempCat = string.Empty;
			int start = html.IndexOf("class=\"productAuthor\"");
			if (start > 0)
			{
			
				int end = html.IndexOf("class=\"solid\"");
				var tag = html.Substring(start, end);
				int startcat = tag.IndexOf("<h2>");
				do
				{
					start = tag.IndexOf("<a");
					tag = tag.Substring(start);
					start = tag.IndexOf(">");
					end = tag.IndexOf("</a>");
					tempCat += tag.Substring(start + 1, end - start - 1) + ";";
					tag = tag.Substring(end);
					startcat = tag.IndexOf("<h2>");
				} while (startcat > 0);

				tempCat = Helper.HandleSpecialChars(tempCat);
				return tempCat.Substring(0, tempCat.Length - 1);
			}
			else
			{
				return string.Empty;
			}
		}
		public static string GetDate()
		{
			string year = string.Empty;
			string month = string.Empty;
			string day = string.Empty;

			Match mYear = Regex.Match(html, "<span id=\"ctl00_main_frame_ctrlproduct_lblPublished\">(.*?)</span>");
			if (mYear.Success)
			{
				year = mYear.Groups[1].Value.Substring(0, 4);
				month = mYear.Groups[1].Value.Substring(4, 2);
				day = mYear.Groups[1].Value.Substring(6, 2);
			}

			return year + "-" + month + "-" + day;
		}

		public static string GetISBN()
		{
			int start = html.IndexOf("isbnheader");
			int end = html.IndexOf("</td>");
			var tag = html.Substring(start + 45, 10);
			return tag;
		}

		public static string GetDescription()
		{
			string description = string.Empty;
			int start = html.IndexOf("<span itemprop=\"description\">");
			int end = html.IndexOf("class=\"productReview");
			description = html.Substring(start, (end) - start);
			start = description.IndexOf(">");
			end = description.IndexOf("</span>");
			description = description.Substring(start + 1, (end) - start - 1);
			description = Helper.StripTagsCharArray(description);
			description = Helper.HandleSpecialChars(description);
			description= Helper.AddSpacesToSentence(description, true);
			description = description.Trim();
			return description;
		}

		public static string GetSeries()
		{
			string series = string.Empty;
			int start = html.IndexOf("ctl00_main_frame_ctrlproduct_liSeries");
			int end = html.IndexOf("ctl00_main_frame_ctrlproduct_ulProductInfo2");
			if (start > 0)
			{
				var tag = html.Substring(start, end - start);
				start = tag.IndexOf("<a");
				end = tag.IndexOf("</a>");
				tag = tag.Substring(start, end - start);
				start = tag.IndexOf(">");
				series = tag.Substring(start + 1);
				series = Helper.HandleSpecialChars(series);
				return series;
			}
			else
			{
				return string.Empty;
			}
		}

		public static string GetImagePath()
		{
			string imagePath = string.Empty;

			int start = html.IndexOf("class=\"ProductImageNotLinked\"");
			var tag = html.Substring(start);
			int end = tag.IndexOf(">");
			tag = tag.Substring(0, end);
			start = tag.IndexOf("src=\"");
			tag = tag.Substring(start + 5);
			end = tag.IndexOf("\"");
			tag = tag.Substring(0, end);
			return tag;
		}

		public static string GetPublisher()
		{
			string publisher = string.Empty;
			Match mPublisher = Regex.Match(html, "<span itemprop=\"publisher\">(.*?)</span>");
			if (mPublisher.Success) { publisher = mPublisher.Groups[1].Value; };
			publisher = Helper.HandleSpecialChars(publisher);
			return publisher;
		}

		public static string GetGenres()
		{
			string tempCat = string.Empty;
			int start = html.IndexOf("ctl00_main_frame_ctrlproduct_ctl06_expandedNodes");
			if (start > 0)
			{
				start = html.IndexOf("class=\"productSubHeader");
				var tag = html.Substring(start + 24);
				start = tag.IndexOf("class=\"productSubHeader");
				tag = tag.Substring(start + 24);
				int end = tag.IndexOf("ctl00_main_frame_ctrlproduct_divSearchMore");
				tag = tag.Substring(0, end);
				int startcat = tag.IndexOf("type=cat&amp;typeid=");
				do
				{
					tag = tag.Substring(startcat + 20);
					start = tag.IndexOf(">");
					end = tag.IndexOf("</a>");
					tempCat += tag.Substring(start + 1, end - start - 1) + ";";
					tag = tag.Substring(end);
					startcat = tag.IndexOf("type=cat&amp;typeid=");
				} while (startcat > 0);

				tempCat = Helper.HandleSpecialChars(tempCat);
				return tempCat.Substring(0, tempCat.Length - 1);
			}
			else
			{
				return string.Empty;
			}
		}


		public static string GetReader()
		{
			string reader = string.Empty;
			string tempCat = string.Empty;
			int start = html.IndexOf("<strong>Uppläsare: </strong>");
			if (start > 0)
			{

				start = html.IndexOf("ctl00_main_frame_ctrlproduct_ulProductInfo");
				int end = html.IndexOf("ctl00_main_frame_ctrlproduct_liPublisher");
				var tag = html.Substring(start, end-start);
				start = tag.IndexOf("<strong>Uppläsare: </strong>");
				tag = tag.Substring(start);
				int startcat = tag.IndexOf("<strong>Uppläsare: </strong>");
				do
				{
					tag = tag.Substring(startcat + 70);
					start = tag.IndexOf(">");
					end = tag.IndexOf("</a>");
					tempCat += tag.Substring(start + 1, end - start - 1) + ";";
					int lenght = tag.Length;
					tag = tag.Substring(end-70);
					startcat = tag.IndexOf("<strong>Uppläsare: </strong>");
				} while (startcat > 0);

				tempCat = Helper.HandleSpecialChars(tempCat);
				return tempCat.Substring(0, tempCat.Length - 1);
			}
			else
			{
				return string.Empty;
			}
		}
		public static string GetPrice()
		{
			string price = string.Empty;
			int start = html.IndexOf("itemprop=\"price\">");
			var tag = html.Substring(start);
			int end = tag.IndexOf(" kr</span>");
			tag = tag.Substring(0, end);
			start = tag.IndexOf(">");
			price = tag.Substring(start + 1);
			return int.Parse(price).ToString();
		}

		public static string GetLanguage()
		{
			string language = string.Empty;
			int start = html.IndexOf("<span id=\"ctl00_main_frame_ctrlproduct_lblLanguage\">");
			var tag = html.Substring(start);
			int end = tag.IndexOf("</span>");
			tag = tag.Substring(0, end);
			start = tag.IndexOf(">");
			language = tag.Substring(start + 1);
			language = Helper.HandleSpecialChars(language);
			return language;
		}

		public static string GetWeight()
		{
			string weight = string.Empty;
			int start = html.IndexOf("<span id=\"ctl00_main_frame_ctrlproduct_lblWeight\">");
			if (start > 0)
			{
				var tag = html.Substring(start);
				int end = tag.IndexOf("</span>");
				tag = tag.Substring(0, end);
				start = tag.IndexOf(">");
				weight = tag.Substring(start + 1);
				return weight;
			}
			else
			{
				return "0";
			}
		}


		public static string GetPageNumber()
		{
			string pageNumber = string.Empty;
			int start = html.IndexOf("<span id=\"ctl00_main_frame_ctrlproduct_lblPages\">");
			if (start > 0)
			{
				var tag = html.Substring(start);
				int end = tag.IndexOf("</span>");
				tag = tag.Substring(0, end);
				start = tag.IndexOf(">");
				pageNumber = tag.Substring(start + 1);
				return pageNumber;
			}
			else
			{
				return "0";
			}
		}

		public static string GetFormat()
		{
			string format = string.Empty;
			int start = html.IndexOf("<span id=\"ctl00_main_frame_ctrlproduct_lblFormat\">");
			var tag = html.Substring(start);
			int end = tag.IndexOf("</span>");
			tag = tag.Substring(0, end);
			start = tag.IndexOf(">");
			format = tag.Substring(start + 1);
			format = Helper.HandleSpecialChars(format);
			return format;
		}
	}
}