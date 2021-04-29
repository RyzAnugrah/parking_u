class Validation {
  String password = '';

  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Lengkap Harus Diisi';
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email Telepon Harus Diisi';
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
      return 'Kata Sandi Minimal 6 Karakter';
    }
    return null;
  }

  String validateConfirmPassword(String value) {
    if (value != password) {
      return 'Isi Harus Sama Dengan Kata Sandi';
    }
    return null;
  }
}
