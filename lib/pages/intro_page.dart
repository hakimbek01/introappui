import 'package:flutter/material.dart';
import 'package:introappui/pages/home_page.dart';
import 'package:introappui/utils/strings.dart';

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
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _pageIndex=value;
              });
            },
            children: [
                _item(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                ),
              _item(
                image: 'assets/images/image_2.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),_item(
                image: 'assets/images/image_3.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //skip
              Visibility(
                visible: (_pageIndex==2)?true:false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                          });
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Skip",style: TextStyle(color: Colors.red,),)
                        )
                    )
                  ],
                ),
              ),
              //indicator
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _funk()
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _item({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(right: 50,left: 50,bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
          const SizedBox(height: 10,),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 30,),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool tekshir) {
    return AnimatedContainer(
      height: 6,
      width: (tekshir)?20:6,
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: 60),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _funk() {
    List<Widget> indicator=[];
    for (var a=0;3>a;a++) {
      if (_pageIndex==a) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }

    return indicator;
  }


}
