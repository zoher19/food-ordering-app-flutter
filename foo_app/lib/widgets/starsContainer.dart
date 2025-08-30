import 'package:flutter/material.dart';


class starsContainer extends StatelessWidget {
  final double rating;
  const starsContainer({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
                 height: MediaQuery.of(context).size.height*0.03,
                 width: MediaQuery.of(context).size.width *0.15,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: const Color.fromARGB(70, 255, 193, 7)),
                 child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                              Icon(Icons.star_rounded,size:24,color: Colors.amber,),
                              Text(rating.toString(),style:Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.primary)),
                           ],
                        ),
            );
  }
}