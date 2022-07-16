import 'dart:math';

class Fat_calculate_brain{

  int height;
  int weight;
  int waist;
  int age;
  int fat_gender;


  Fat_calculate_brain(
      this.height, this.weight, this.waist, this.age, this.fat_gender);

  double calculateBMI(){
    double bmi= weight/ pow(height/100, 2);

    return bmi;
  }
  String calculate_fat(){

    String res= "";
    if(fat_gender==1){

      res = ((1.20* calculateBMI()) + (0.23 * age) - 16.2).toStringAsFixed(1);

    }
    else if(fat_gender==2){

      res=  ((1.20 * calculateBMI()) + (0.23 * age) - 5.4).toStringAsFixed(1);
    }

    else{
      res= 'Are You Male OR Female';
    }

    return res;
  }

  String get_vichar(){
    String res_vichar= '';
    if(fat_gender==1){
      if(age>=20 && age<=40){
        res_vichar= 'Underfat: under 8 %\nHealthy: 8-19 %\nOverweight: 19-25 %\nObese: over 25 %';
      }
      else if(age>=41 && age<= 60){
        res_vichar= 'Underfat: under 11 %\nHealthy: 11-22 %\nOverweight: 22-27 %\nObese: over 27 %';
      }
      else{
        res_vichar= 'Underfat: under 13 %\nHealthy: 13-25 %\nOverweight: 25-30 %\nObese: over 30 %';
      }
    }
    else if(fat_gender==2){
    if(age>=20 && age<=40){
      res_vichar= 'Underfat: under 21 %\nHealthy: 21-33 %\nOverweight: 33-39 %\nObese: Over 39 %';
    }
    else if(age>=41 && age<= 60){
      res_vichar= 'Underfat: under 23 %\nHealthy: 23-35 %\nOverweight : 35-40 %\nObese: over 40 %';
    }
    else{
      res_vichar= 'Underfat: under 24 %\nHealthy: 24-36 %\nOverweight: 36-42 %\nObese: over 42 %';
    }
    }

    else{
      res_vichar= 'Error:  Please Select Your Gender............';
    }
    return res_vichar;
  }
}