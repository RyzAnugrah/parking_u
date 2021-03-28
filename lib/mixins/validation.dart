class Validation {
  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Lengkap Harus Diisi';
    }
    return null;
  }

  String validateTelp(String value) {
    if (value.isEmpty) {
      return 'Nomor Telepon Harus Diisi';
    }
    return null;
  }

  String validateType(String value) {
    if (value.isEmpty) {
      return 'Tipe Kendaraan Harus Diisi';
    }
    return null;
  }

  String validateNumber(String value) {
    if (value.isEmpty) {
      return 'Nomor Kendaraan Harus Diisi';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password Minimal 6 Karakter';
    }
    return null;
  }
}
