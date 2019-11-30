class FormValidator {
  String _input;

  FormValidator(this._input);

  String get validInput {
    if (_input.isEmpty) return "Please provide a value";
    return null;
  }

  String get validPrice {
    if(double.tryParse(_input) == null) return "Please enter a valid number";
    else if(double.parse(_input) <= 0) return "Price has to be greater than zero";
    return null;
  }

  String get validDescription {
    if (_input.length < 10) return "Please provide a longer text";
    return null;
  }

  String get validImageURL {
    if (!_input.startsWith("http") && !_input.startsWith('https')) return "Please provide a valid url";
    else if (!_input.endsWith("png") && !_input.endsWith("jpg") && !_input.endsWith("jpeg")) return "Please provide a valid image";
    return null;
  }
}