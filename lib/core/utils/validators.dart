class AppValidators{
  AppValidators._();


  static String? validateEmail(String? text){

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (text == null || text.trim().isEmpty) {
      return "This field is required";
    }
    else if (!emailRegex.hasMatch(text)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? text){

    final RegExp passwordRegEx = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
    );
    if (text == null || text.trim().isEmpty) {
      return "This field is required";
    }
    else if (!passwordRegEx.hasMatch(text) || text.length < 8) {
      return "Please enter strong password";
    }
    return null;
  }

  static String? validateConfirmPassword(String? text , String password){
    if (text == null || text.trim().isEmpty) {
      return "This field is required";
    }
    if (text != password) {
      return "Passwords not matching";
    }
    return null;
  }


  static String? validateUserName(String? text){
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (text == null || text.trim().isEmpty) {
      return "This field is required";
    }else if(!usernameRegex.hasMatch(text)){
      return "Enter valid username";
    }
    return null;
  }

  static String? validateFullName(String? text){
    if (text == null || text.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }


  static String? validatePhoneNumber(String? text){
    if(text == null){
      return "This field is required";
    }else if(int.tryParse(text.trim()) == null){
      return "Enter numbers only";
    }else if(text.trim().length != 11){
      return "enter 11 digits";
    }else{
      return null;
    }
  }

}