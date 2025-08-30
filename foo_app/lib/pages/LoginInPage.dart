
import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/ListOfPerson.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/pages/SignUpPage.dart';
import 'package:foo_app/pages/bottomNavigationBarPages.dart';


class Logininpage extends StatefulWidget {
  const Logininpage({super.key});

  @override
  State<Logininpage> createState() => _LogininpageState();
}

class _LogininpageState extends State<Logininpage> {
  bool isChecked=false;
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    final _formkey=GlobalKey<FormState>();
    
  @override
  Widget build(BuildContext context) {
    Color secondary=Theme.of(context).colorScheme.secondary;
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top:200.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
              Image.asset("assets/waving-hand.png",height: 75,),
          
               SizedBox(height: 30,),
          
              Text("Welcome To Foodak",style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Colors.black,fontWeight: FontWeight.bold,fontFamily: "Cairo"),),
             
              SizedBox(height: 40,),
          
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: secondary,
                        blurRadius: 4,
                      )
                    ]
                  ),
                  child: Form(
                    key:_formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Login In",style:Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold)),

                      SizedBox(height: 20,),
          
                        TextFormField(
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: emailController,
                          decoration: InputDecoration(
                                label: Text("Please Enter Email : "),
                                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                               
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
          
                                hintText: "example : Z*****@gmail.com",
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
          
                            var foundPerson=people.where((person)=>person.email ==value).toList();
                            if(foundPerson.isEmpty)
                            {
                              return "This Emial is not exists";
                            }
                            else
                            {
                              person=foundPerson[0];
                            }
                          },
                        ),
          
                        SizedBox(height: 20,),
          
                        TextFormField(
                          obscureText: !isChecked,
                          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                          controller: passwordController,
                          decoration: InputDecoration(
                                label: Text("Please Enter password : "),
                                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                               
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
          
          
                                hintText: "password",
                                hintStyle:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
                                filled: true,
                                fillColor: const Color.fromARGB(38, 158, 158, 158),
                          ),
                          validator: (value) {
                            if(value==null || value.isEmpty)
                            {
                              return "Please enter a pssword";
                            }
                            else if(person.password != value)
                            {
                              return "Your password is wrong,try again";
                            }
                          },
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              side: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                              activeColor: secondary,
                              checkColor: Colors.white,
                              splashRadius: 1,
                              value: isChecked
                              , onChanged: (value){
                                setState(() {
                                  isChecked=value!;
                                });
                              }),

                              Text("Show password",style: Theme.of(context).textTheme.titleSmall!.copyWith(color:Colors.black),)
                          ],
                        ),

          
                        SizedBox(height: 20,),
          
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){
                              if(_formkey.currentState!.validate())
                              {
                                 var filtrOrders=orders.where((order)=>(order.person==person&&!order.isSure)).toList();
                                 if(filtrOrders.length ==1)
                                 {
                                  order=filtrOrders[0];
                                 }
                                 else
                                 {
                                    order=clsOrder.empty(id: orders.length+1);
                                    order.person=person;
                                 }

                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                              } 
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 5,
                              shadowColor: secondary,
                            ),
                            child: Text("Login in",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)
                            ),
                        ),
          
          
                    ],
                  ))
              ),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Do You not Have an account ??",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                 SizedBox(width: 4,),
                 InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signuppage()));},
                  child: Text("sign up",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: secondary,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: secondary,decorationThickness: 4),)),

               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}