class Validation {
  String validateName(String value) {
    if (value.isEmpty) {
      return "Nama Harus Diisi";
    }
    String p = "[a-zA-Z\+\.\_\%\-\+]{1,256}";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Nama Tidak Valid';
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return "Email Harus Diisi";
    }
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Email Tidak Valid';
  }

  String validateType(String value) {
    if (value.isEmpty) {
      return 'Tipe Kendaraan Harus Diisi';
    }
    return null;
  }

  String validateNumber(String value) {
    if (value.isEmpty) {
      return "Nomor Kendaraan Harus Diisi";
    }
    String p = "[a-zA-Z]{1,}" + "\\-" + "[0-9]{4,}" + "\\-" + "[a-zA-Z]{2,}";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Nomor Kendaraan Tidak Valid';
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Kata Sandi Harus Diisi";
    }
    String p = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d].{6,}$";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      return null;
    }
    return 'Minimal Berisi 1 huruf, 1 angka, dan 6 Karakter';
  }
}
