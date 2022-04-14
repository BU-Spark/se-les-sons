import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:myapp/carousel.dart';

// This file contains the lessons that fall under part 1 (we are in the process of buiding part 1 so some parts to not lead anywhere yet)

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: <Widget>[
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.close_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }),
            ),
            const Expanded(child: Text("")),
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 32, 0),
                child: Icon(Icons.arrow_back_ios_rounded, color: Colors.grey)),
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()),
                    );
                  }),
            ),
          ])),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "An Introduction to the French Pronounciation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(""),
                Text(
                  """This first part focuses on the letters of the alphabet. It is overall a first step to get you “in the door” of the world of the French sounds. We need a starting point to begin this journey.
 
Don’t worry if at first you are not completely comfortable with pronouncing these first sounds, or if you feel surrounded by doubt, not knowing if you are pronouncing them the right or the wrong way. 
Each one of these sounds will be studied again and in more depth in the third part of this book. Then, doubt will vanish and give way to confidence!
 
You will soon realize that the main difficulty is not to learn and memorize a “new” sound. Instead the problem at first is to accept the fact that a letter whose sound is completely known to you in English, happens to have a very different sound in French. This means that you have to “battle” your own reflexes and open your mind to a different culture. Learning to adopt a “bilingual attitude” is one of the first skills you develop when studying a foreign language.
 
There is also another trap to avoid: don’t be obsessed by the quest for the perfect sound; it does not exist!
Similarly to English that takes a different accent whether it is spoken in England, Ireland, Scotland or in the United States, French also has a different accent whether it is spoken in France, Belgium, Canada or Senegal. Within France, there are also differences of accents between the different regions and even between people from the same city! It is more a matter of being in the “ballpark” of a sound. The main goal is to have a nice, clear and understandable accent.
Moreover your pronunciation will constantly improve and “fine tune” itself with time and practice. Therefore, be patient and let time perform its miracles!\n\n\n""",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;
  String time;

  CustomListTile(this.icon, this.text, this.onTap, this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(text),
                          Text(time),
                        ]),
                  ),
                ]),
                const Icon(Icons.arrow_right_rounded)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: <Widget>[
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.close_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }),
            ),
            const Expanded(child: Text("")),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Builder(
                builder: (context) => IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstRoute()),
                      );
                    }),
              ),
            ),
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdRoute()),
                    );
                  }),
            ),
          ])),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  // ignore: prefer_const_constructors
                  text: TextSpan(
                    text: "The French Name of Each Letter" '\n\n',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: const <TextSpan>[
                      TextSpan(
                          text:
                              """ The alphabet consists in listing all the letters contained in a language and giving each one a name. The name of a letter does not always correspond to the sound of that letter. For example in English, the letter “W” is named “double u” but its sound is different: when you pronounce the word “wash” you don’t say “double u ash”!
                               
The purpose of knowing the French alphabet is to be able to spell a word in French or to understand the spelling of a word in French. Even though English and French alphabets have the same 26 letters, these 26 “signs” don’t have the same names in English and in French; they are the same graphic signs but they are assigned different sound. 

If you spell a word to a French person and you use the English names of the letters, this person will not understand your spelling. Vice versa if you don’t know the French names of the letters, you won’t be able to understand when a French person spells a word in French. Therefore you must know the “French name” given to each letter of the alphabet. 

IMPORTANT NOTE: Try to stay open minded by “accepting” that some letters have a very different sound whether you read them in English or in French. Don’t be trapped by your own English reflexes.

If at first, you don’t feel very comfortable with the sound of some of the letters, don’t worry. In the section about all the French sounds, we will study in details the sound for each one of these letters.

You can only learn through doing and you have to start somewhere! Look at the following exercise as your first opportunity to acquire a """,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: '"',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: 'bilingual attitude',
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline)),
                      TextSpan(
                          text:
                              """": \n\nFirst you will become aware of the fact that the same letter may have a different sound in French than in English.
Then, each time you look at a letter, you will develop the ability to switch effortlessly between its English sound and its French sound. 
Let’s learn now the “French names” for each one of the letters of the alphabet.\n\n\n""",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: <Widget>[
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.close_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }),
            ),
            const Expanded(child: Text("")),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Builder(
                builder: (context) => IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    }),
              ),
            ),
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ThirdRoute()), // Will change to FourthRoute when that page is made
                    );
                  }),
            ),
          ])),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          ThirdRoutePage1(),
          ThirdRoutePage2(),
        ],
      ),
    );
  }
}

class ThirdRoutePage1 extends StatelessWidget {
  ThirdRoutePage1({Key? key}) : super(key: key);

  List carousel = [
    CarouselLetter("A", "alphabet/a.m4a"),
    CarouselLetter("B", "alphabet/b.m4a"),
    CarouselLetter("C", "alphabet/c.m4a"),
    CarouselLetter("D", "alphabet/d.m4a"),
    CarouselLetter("E", "alphabet/e.m4a"),
    CarouselLetter("F", "alphabet/f.m4a"),
    CarouselLetter("G", "alphabet/g.m4a"),
    CarouselLetter("H", "alphabet/h.m4a"),
    CarouselLetter("I", "alphabet/i.m4a"),
    CarouselLetter("J", "alphabet/j.m4a"),
    CarouselLetter("K", "alphabet/k.m4a"),
    CarouselLetter("L", "alphabet/l.m4a"),
    CarouselLetter("M", "alphabet/m.m4a"),
    CarouselLetter("N", "alphabet/n.m4a"),
    CarouselLetter("O", "alphabet/o.m4a"),
    CarouselLetter("P", "alphabet/p.m4a"),
    CarouselLetter("Q", "alphabet/q.m4a"),
    CarouselLetter("R", "alphabet/r.m4a"),
    CarouselLetter("S", "alphabet/s.m4a"),
    CarouselLetter("T", "alphabet/t.m4a"),
    CarouselLetter("U", "alphabet/u.m4a"),
    CarouselLetter("V", "alphabet/v.m4a"),
    CarouselLetter("W", "alphabet/w.m4a"),
    CarouselLetter("X", "alphabet/x.m4a"),
    CarouselLetter("Y", "alphabet/y.m4a"),
    CarouselLetter("Z", "alphabet/z.m4a"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Practicing The Alphabet",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(""),
              const Text(
                  "Tap each letter to the French Pronunciation of the letter.", // To DO: Implemented the audio files
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 18),
              CarouselSlider.builder(
                // To be parsed out
                options: CarouselOptions(
                    height: 154, pageSnapping: false, viewportFraction: .42),
                itemCount: carousel.length,
                itemBuilder: (context, index, realIndex) {
                  return buildLetter(carousel[index], index);
                },
              ),
              const SizedBox(height: 18),
              const Text(
                  "Swipe left to record each letter!", // To Do: Make page to record letters, right not cannot swipe left
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLetter(carousel, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: carousel,
        ),
      );
}

class ThirdRoutePage2 extends StatelessWidget {
  ThirdRoutePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Recordings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(""),
              Text(
                  "Tap the record button to start a voice memo.", // To DO: Implemented the audio files
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }}