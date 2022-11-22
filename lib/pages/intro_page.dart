import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introappui/pages/home_page.dart';

import '../utils/strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  int _pageIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int value) {
              setState(() {
                _pageIndex=value;
              });
            },
            children: [
              _makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
              ),
              _makePage(
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent
              ),
              _makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepTwoContent,
                  reverse: true
              ),

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //skip,
              Visibility(
                visible: (_pageIndex==2) ? true: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Skip",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w400),),
                      ),
                    )
                  ],
                ),
              ),
              //indicator
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _builIndicator(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _makePage({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50,right: 50,bottom: 60,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
          const SizedBox(height: 10,),
          Text(title,textAlign: TextAlign.center,style: const TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(height: 30,),
          Text(content,textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: (isActive)? 25: 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }


  List<Widget> _builIndicator() {
    List<Widget> indicator=[];
    for (var i=0;3>i;i++) {
      if (i==_pageIndex) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }
}
