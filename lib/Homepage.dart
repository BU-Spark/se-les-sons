import 'package:flutter/material.dart';
import "package:myapp/lessons_1.dart";
import "package:myapp/Table_of_Contents.dart";

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shape:
          const Border(bottom: BorderSide(color: Color(0xffc7c7cc))),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "The Sound of French",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text("By: Alain Pacowski",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(
                fontFamily: 'Arial', fontWeight: FontWeight.w400, fontSize: 15),
            tabs: [
              Tab(
                  child: Text("Home",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black))),
              Tab(
                  child: Text("Table of\nContents", // Nothing here yet
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black))),
              Tab(
                  child: Text("Profile", // Nothing here yet
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
        body: TabBarView(
          //TODO: Implement the last tab, the Profile page
          children: [HomeTabs(), TableOfContents(), const Icon(Icons.person)],
        ),
      ),
    );
  }
}

/*The contents of the first tab of Homepage, 'Home'. The reason it is Stateful
 * is to create a custom indicator for the scrollable parts tab, as well as when
 * the tab isn't clicked on. Otherwise, the default tab indicator will not work as
 * intended, as shown in the figma.
 */
class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);
  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> with TickerProviderStateMixin {
  late TabController _controller;

  int _selectedIndex = 0; //to remember which Part tab 1 -10 we've clicked

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(vsync: this, length: 10, initialIndex: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TabBar(
            controller: _controller,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            unselectedLabelColor: Colors.white,
            labelStyle: const TextStyle(
                fontFamily: 'Arial', fontWeight: FontWeight.w700, fontSize: 17),
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: const Color(0x00006cff),
            ),
            onTap: (index) => setState(() => _selectedIndex = index),
            tabs: [
              //TODO: Find a way to loop this code to minimize amount of code needed
              Container(
                decoration: HomeTab(_selectedIndex, 0),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 1"),
              ),

              // Currently only working on Part 1, so the rest of the parts will be empty pages right now

              Container(
                decoration: HomeTab(_selectedIndex, 1),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 2"),
              ),
              Container(
                decoration: HomeTab(_selectedIndex, 2),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 3"),
              ),
              Container(
                decoration: HomeTab(_selectedIndex, 3),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 4"),
              ),
              Container(
                decoration: HomeTab(_selectedIndex, 4),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 5"),
              ),
              Container(
                decoration: HomeTab(_selectedIndex, 5),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 6"),
              ),
              Container(
                decoration: HomeTab(_selectedIndex, 6),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 7"),
              ),
              Container(
                decoration: HomeTab(_selectedIndex, 7),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 8"),
              ),
              Container(
                decoration: HomeTab(_selectedIndex, 8),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 12,
                child: const Tab(text: "Part 9"),
              ),
              Container(
                  decoration: HomeTab(_selectedIndex, 9),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 12,
                  child: const Tab(text: "Part 10")),
            ]),
      ),
      body: TabBarView(controller: _controller, children: [
        //Only part 1 has been implemented but the other parts can be implemented the same way
        //TODO: Implement the other parts
        Part_1(),
        const Icon(Icons.book),
        const Icon(Icons.book),
        const Icon(Icons.book),
        const Icon(Icons.book),
        const Icon(Icons.book),
        const Icon(Icons.book),
        const Icon(Icons.book),
        const Icon(Icons.book),
        const Icon(Icons.book),
      ]),
    );
  }

  //Custom tab look for Parts 1-10 tabs, changes color from blue to grey depending if it is clicked or not
  HomeTab(int currentTab, int tab) {
    return ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: currentTab == tab
            ? const Color(0xff006cff)
            : const Color(0xff4e4e4e));
  }
}

//This is the contents of the tab 'Part 1' in the 'Home' tab of the Homepage
class Part_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 56),
        child: Column(
          children: [
            Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: const Color(0xfff5f5f5),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(11, 12, 11, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Introduction",
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.normal,
                            fontSize: 9),
                      ),
                      Text(
                        "This first part focuses on the letters of the alphabet. It is overall a first step to get you “in  the door” of the world of the French sounds. We need a starting point to begin this  journey. Don’t worry if at first you are not completely comfortable with pronouncing these first sounds, we will continue to improve!",
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      )
                    ],
                  ),
                )),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color(0xfff5f5f5),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 12, 11, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Start Program",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                    const SizedBox(height: 9),
                    CustomCard(Icons.book,
                        "An Introduction to the French Pronunciation", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(Icons.book, "The French Name of each Letter",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(
                        // In middle of building out this section
                        Icons.record_voice_over_rounded,
                        "Practicing the French Alphabet", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdRoute()),
                      );
                    }),

                    // Did not get up to building out these sections yet so they do not lead to any pages yet

                    const SizedBox(height: 9),
                    CustomCard(
                        Icons.record_voice_over_rounded, "Difficult Letters",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FourthRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(
                        Icons.record_voice_over_rounded, "Spelling your Name",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FifthRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(
                        Icons.record_voice_over_rounded, "Spelling your Street",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SixthRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(Icons.record_voice_over_rounded,
                        "Spelling French Words", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SeventhRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(Icons.book, "Vowels and Consonants", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EighthRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(
                        Icons.record_voice_over_rounded, "Practicing Vowels",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NinthRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(Icons.record_voice_over_rounded,
                        "Practicing Consonants", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TenthRoute()),
                      );
                    }),
                    const SizedBox(height: 9),
                    CustomCard(Icons.record_voice_over_rounded, "Vowels A and I",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EleventhRoute()),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Custom card that redirects users to that lesson in each part
/*Can be revised so that the onTap function already has the Navigator.push(..) stuff and all that needs to be passed in is
  the route, e.g. FirstRoute().
*/
class CustomCard extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;

  CustomCard(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xff006cff),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      icon,
                      color: Colors.black,
                    )),
                title: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
