package useful
{
	import mx.formatters.DateFormatter;

	public class DateFormatterT24 extends DateFormatter
	{
		public function DateFormatterT24()
		{
			super();
			this.formatString = "YYYYMMDD";
		}
		
	}
}