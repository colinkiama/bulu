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

	public Bulu.Method from_string (string method_string) {
		// Nicks are lower case and replace underscores with hyphens
		string input_nick = method_string.down ().replace ("_", "-");

		Bulu.Method result;
		
		if (!try_parse_nick (input_nick, out result)) {
			error ("Could not parse %s to a Bulu Method".printf (method_string));
		}

		return result;
	} 

	private bool try_parse_nick (string nick, out Bulu.Method result = null) {
		EnumClass enumc = (EnumClass) typeof (Bulu.Method).class_ref ();
        unowned EnumValue? eval = enumc.get_value_by_nick (nick);
        return_val_if_fail (eval != null, -1);
        if (eval == null) {
			result = Bulu.Method.GET;
			return false;
		}

       	result = (Bulu.Method) eval.value;
		return true;
	}


}