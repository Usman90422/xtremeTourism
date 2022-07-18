import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtreme_tourism/data/data.dart';
import 'package:xtreme_tourism/Screens/landing_screen.dart';

class Onboard_Screen extends StatefulWidget {

  @override
  _Onboard_ScreenState createState() => _Onboard_ScreenState();
}

class _Onboard_ScreenState extends State<Onboard_Screen> {

  List<SliderModel> slides= List<SliderModel>();
  int currentIndex=0;
  PageController pageController= PageController(initialPage: 0);

  @override
  void initState() {
    slides=getSlides();
    super.initState();
  }

  Widget pageIndexIndicator(bool isCurrentPage)
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: isCurrentPage ? 10 : 6,
      width:  isCurrentPage ? 10 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: pageController,
            itemCount:slides.length,
            onPageChanged: (val){
              setState(() {
                currentIndex=val;
              });

            },
            itemBuilder: (context,index){
              return OnboardSlider(
                ImagePath: slides[index].getImageAssetPath(),
                Title: slides[index].getTitle(),
                Desc: slides[index].getDesc(),
              );
            },
        ),
        bottomSheet: currentIndex != slides.length-1 ? Container(
          color: Colors.grey[200],
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
              onTap: (){
                  pageController.animateToPage(slides.length-1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              child: Text("Skip"),
              ),
              Row(
                children: [
                for(int i=0; i<slides.length; i++)currentIndex == i ? pageIndexIndicator(true) : pageIndexIndicator(false)
              ],),
              GestureDetector(
                onTap: (){
                  pageController.animateToPage(currentIndex+1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text("Next"),
              ),
            ],
          ),
        ) : GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Landing_screen()));
          },
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color:  Color(0xffff6836),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)) ),
            child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20),)),
          ),
        ),
      ),
    );
  }
}

class OnboardSlider extends StatelessWidget {
   OnboardSlider({this.ImagePath, this.Desc, this.Title});

  String ImagePath;
  String Title;
  String Desc;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(ImagePath,width: 300,height: 300,),
        SizedBox(height: 5,),
        Text(Title,style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        Text(Desc,),
      ],),
    );
  }
}
