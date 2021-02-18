
class ValidateInput {
  String validateInputUsername(String value) {
    if (value.isEmpty){
      return "Username must be filled";
    }
    return null;
  }

  String validateInputPassword(String value) {
    if (value.isEmpty){
      return "Password must be filled";
    }
    return null;
  }
}