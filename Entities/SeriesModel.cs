﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
	public class SeriesModel: IDBLookup
	{
		public int Id { get; set; }

		public string Name { get; set; }

	}
}
