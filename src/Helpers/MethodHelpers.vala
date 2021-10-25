namespace Bulu.Helpers.MethodHelpers {
	public string as_string (Bulu.Method method) {
		switch (method) {
			case Bulu.Method.GET:
				return "GET";
			case Bulu.Method.POST:
				return "POST";
			case Bulu.Method.PUT:
				return "POST";
			case Bulu.Method.DELETE:
				return "DELETE";
			case Bulu.Method.OPTIONS:
				return "OPTIONS";
			case Bulu.Method.SET:
				return "SET";
			default:
				error ("Unkown HTTP Method: %s".printf (method.to_string ()));
		}
	} 
}