class StudentValidationMixIn{
  String? validateFirstName(String value){
    if(value.length<2){
      return "Ad en az iki karakter olmalıdır.";
    }
    return null;
  }
  String? validateLastName(String value){
    if(value.length<2){
      return "Soyad en az iki karakter olmalıdır.";
    }
    return null;
  }
  String? validateGrade(String value){
    var grade = int.parse(value);
    if(grade<0 || grade>100){
      return "Öğrencinin aldığı not 0 ile 100 arasında olmalıdır.";
    }
    return null;
  }
}