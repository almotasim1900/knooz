//الصفحة الاولي 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/data/datasource/static/static.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //لون الخلفية 
      backgroundColor: AppColors.white,
      body:SafeArea(child: 
      Column(
        children: [
          // الاكسباندد لتفصل الاجزاء المتحركة في صفحة الاقلاع
          Expanded(
            flex: 3,
            child: PageView.builder(
                  itemCount: onBoardingList.length,
                  itemBuilder: (context,i)=>Column(
                  children: [
                    Text(onBoardingList[i].title!,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                   const SizedBox(height: 80,),
                    //صور صفحة الاقلاع
                    Image.asset(onBoardingList[i].image!,height: 230 ,width: 200,fit:BoxFit.fill,),
                    const SizedBox(height: 80,),
                     // حاوية خاصة بالنص تحت صور صفحة الاقلاع لاعطاءها بعض الخصائص
                    Container(width: double.infinity,
                    alignment: Alignment.center,
                      child: Text(onBoardingList[i].body!,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.gray,height: 2,fontSize: 17),))
                    
                    
            
                  ],
                )),
          ),
          //الاكسباندد الثاني لاحتواء نقاط التنقل والباتوم 
          Expanded(flex: 1,
            child: Column(
            children: [
              // ربط عدد النقاط بعدد عناصر صغحة الاقلاع
              ...List.generate(onBoardingList.length, (index)=>AnimatedContainer(duration:const Duration(milliseconds: 900)))

            ],
          ))
        ],
      )
        )
        
      
    );
  }
}
