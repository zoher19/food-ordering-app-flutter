import 'package:flutter/material.dart';
import 'package:foo_app/moduls/person_modul.dart';
import 'package:foo_app/pages/LoginInPage.dart';



class ProfilePage extends StatelessWidget {
  final clsPerson person ;
  const ProfilePage({super.key,required this.person});

  Widget  CustomCard(String title,String contact,BuildContext context,Color mainClr){
  
    return Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: mainClr,
                  blurRadius: 4,
                )
              ],
              borderRadius: BorderRadius.circular(8)
            ),            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 Text("$title : ",style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
                  SizedBox(width: 4,),
                  Expanded(child: Text(contact,style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),maxLines: 1,softWrap: false,overflow: TextOverflow.ellipsis,)),

                ],
              ),
            ),
          );
  }

 
@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  Color mainClr = Theme.of(context).colorScheme.secondary;

  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: size.height * 0.3,
                width: double.infinity,
                color: mainClr,
              ),

              Positioned(
                top: size.height * 0.3 - 75,
                child: Container(
                  width: size.width * 0.95,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: mainClr, blurRadius: 8),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: mainClr,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: mainClr,blurRadius: 8)]

                        ),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage(person.ImagePath),
                          backgroundColor: mainClr,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomCard("Full Name", person.fullName, context, mainClr),
                      CustomCard("Age", person.age.toString(), context, mainClr),
                      CustomCard("Email", person.email, context, mainClr),
                      CustomCard("Phone", person.phone, context, mainClr),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.4),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: mainClr,blurRadius: 8)]
            ),
            child: ListTile(
              leading: Icon(Icons.settings, color: mainClr, size: 30),
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              trailing: Icon(Icons.arrow_back_ios_new_rounded,
                  color: mainClr, size: 20),
              onTap: () {},
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: mainClr,blurRadius: 8)]
            ),
            child: ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.red, size: 30),
            title: Text(
              "Logout",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            trailing: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.red, size: 20),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Logininpage()),
                (route) => false,
              );
            },
          ),
          ),

          
        ],
      ),
    ),
  );
}
}