import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CepFormatter extends MaskTextInputFormatter {
  static String mask1 = "#####-###";
  final String cepErrorMessage = "Insira um CEP válido, por favor";

  CepFormatter() : super(mask: mask1);

  String? validate(value) {
    if (isFill()) {
      return null;
    }
    return cepErrorMessage;
  }
}
