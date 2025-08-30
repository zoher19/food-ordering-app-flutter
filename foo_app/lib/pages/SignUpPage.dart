
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foo_app/main.dart';
import 'package:foo_app/moduls/ListOfPerson.dart';
import 'package:foo_app/moduls/person_modul.dart';
import 'package:foo_app/pages/HomePage.dart';
import 'package:foo_app/pages/LoginInPage.dart';
import 'package:foo_app/pages/bottomNavigationBarPages.dart';


class Signuppage extends StatelessWidget {
   Signuppage({super.key});
  int age=0;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    TextEditingController ageController=TextEditingController();
    TextEditingController confirmController=TextEditingController();
    final _formkey=GlobalKey<FormState>();
    Color secondary=Theme.of(context).colorScheme.secondary;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          children: [
            Text("Sign Up",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.secondary,blurRadius: 8)],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Full name :",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                   ),
                   TextFormField(
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: nameController,
                          decoration: InputDecoration(
                                
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                  ),
                                ),
          
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: secondary,
                                  ),
                                ),
          
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
          
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
                                
                                errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
          
                                hintText: "like this: Mohammed ahmad fahed",
                                hintStyle:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
                                filled: true,
                                fillColor: const Color.fromARGB(38, 158, 158, 158),
                          ),
                          validator: (value) {
                           if(value == null || value.isEmpty)
                           {
                            return "Enter Your full name";
                           }  
                          },
                        ),
                        SizedBox(height: 5,),

                        Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Phone number :",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))],
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: phoneController,
                          decoration: InputDecoration(
                               
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                  ),
                                ),
                            
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: secondary,
                                  ),
                                ),
          
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
          
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
                                
                                errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
          
                                hintText: "like this : +962000000000",
                                hintStyle:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
                                filled: true,
                                fillColor: const Color.fromARGB(38, 158, 158, 158),
                          ),
                          validator: (value) {
                           if(value == null || value.isEmpty)
                            {
                              return "Please Enter a number";
                            }
                            else if(value.length!=13 || !value.startsWith("+962"))
                            {
                              return "This is not correct number)";
                            }
                            
                          },
                        ),
          
                        SizedBox(height: 5,),

                        Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Email :",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                             ),
                        TextFormField(
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: emailController,
                          decoration: InputDecoration(
                                
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                  ),
                                ),
          
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: secondary,
                                  ),
                                ),
          
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
          
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
                                
                                errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
          
                                hintText: "like this : M******@gmail.com",
                                hintStyle:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
                                filled: true,
                                fillColor: const Color.fromARGB(38, 158, 158, 158),
                          ),
                          validator: (value) {
                           if(value == null || value.isEmpty)
                            {
                              return "Please Enter an Email";
                            }
                            else if(!value.contains("@gmail.com"))
                            {
                              return "Please Enter a correct email(@gmail.com)";
                            }

                            var existsPassword=people.where((person)=>person.email==emailController.text);
                            if(existsPassword.isNotEmpty){
                              return "This email is exists";
                            }
                          },
                        ),
          
                         SizedBox(height: 5,),

                        Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Birth day : ",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                             ),
                        TextFormField(
                          readOnly: true,
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: ageController,
                          decoration: InputDecoration(
                              
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                  ),
                                ),
          
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: secondary,
                                  ),
                                ),
          
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
          
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
                                hintText: "##/##/####",
                                hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color:Colors.grey),
                                errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
                                filled: true,
                                fillColor: const Color.fromARGB(38, 158, 158, 158),
                          ),
                          validator: (value) {
                           if(value == null || value.isEmpty){
                            return "please enter your birthday";
                           }
                          },
                          onTap: ()async{
                             DateTime? pickedDate = await showDatePicker(
                                     context: context,
                                     initialDate: DateTime(2000, 1, 1),
                                     firstDate: DateTime(1900),
                                     lastDate: DateTime.now(),
          
                                     builder: (context, child){
                                      return Theme(
                                        data:Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Colors.black,
                                          )
                                        ),
                                        child: child!,
                                      );
                                     }
                             );
                             ageController.text="${pickedDate!.day} /${pickedDate.month} /${pickedDate.year}";
                             age=DateTime.now().year - pickedDate.year; },
                        ),
          
                         SizedBox(height: 5,),

                        Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Password :",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                             ),
          
                        TextFormField(
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                             
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                  ),
                                ),
          
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: secondary,
                                  ),
                                ),
          
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
          
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
                                
                                errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
          
                                hintText: "******",
                                hintStyle:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
                                filled: true,
                                fillColor: const Color.fromARGB(38, 158, 158, 158),
                          ),
                          validator: (value) {
                           if(value == null || value.isEmpty)
                            {
                              return "Please Enter a password";
                            }
                            else if(value.length<6)
                            {
                              return "6 digits or characters mimum";
                            }

                            var existsPassword=people.where((person)=>person.password==passwordController.text);
                            if(existsPassword.isNotEmpty){
                              return "This password is exists";
                            }
                          },
                        ),
          
                         SizedBox(height: 5,),

                        Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Confirm password :",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                             ),
          
                        TextFormField(
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: confirmController,
                          obscureText: true,
                          decoration: InputDecoration(
                              
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                  ),
                                ),
          
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: secondary,
                                  ),
                                ),
          
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
          
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                  ),
                                ),
                                
                                errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
          
                                hintText: "******",
                                hintStyle:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
                                filled: true,
                                fillColor: const Color.fromARGB(38, 158, 158, 158),
                          ),
                          validator: (value) {
                           if(value == null || value.isEmpty)
                            {
                              return "Please confirm a password";
                            }
                            else if(value != passwordController.text)
                            {
                              return "this password is wrong";
                            }

                            
                          },
                        ),
          
                        SizedBox(height: 30,),
          
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(onPressed: (){
                            if(_formkey.currentState!.validate())
                            {
                              people.add(clsPerson(id: people.length+1, fullName: nameController.text, password: passwordController.text, age: age, email: emailController.text, phone: phoneController.text, ImagePath: "assets/people/NoImage.jpg"));
                              showDialog(context: context, builder: (BuildContext context){
                                return  AlertDialog(
                                        title: Text("Add Person",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                                        backgroundColor: Colors.white,
                                        content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.done_all_outlined,size:24,color: Colors.green,),
                                        SizedBox(width: 2,),
                                        Text("Add Person is done",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Logininpage()));
                                    },
                                     child: Text("Ok",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),),
                                  ],
                                );
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                                backgroundColor: secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 5,
                                shadowColor: secondary,
                                padding: EdgeInsets.all(8),
                                
                              ),
                          
                           child: Text("Sign up",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          
                          ),
                        ),
                  ],
                )
              )
              
            ),
             
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Do You Have an account ??",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                 SizedBox(width: 4,),
                 InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Logininpage()));},
                  child: Text("LogenIn",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: secondary,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: secondary,decorationThickness: 4),)),

               ],
             )

          ],
              ),
        ),
      ),
    );
  }
}