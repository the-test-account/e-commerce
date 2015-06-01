using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;

namespace BusinessLayer
{
	public interface IPhotoManager
	{
		Task<IEnumerable<PhotoViewModel>> Get();
		Task<PhotoActionResult> Delete(string fileName);
		Task<IEnumerable<PhotoViewModel>> Add(HttpRequestMessage request);
		bool FileExists(string fileName);
	}
}
