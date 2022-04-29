import 'package:flutter/material.dart';
import "package:myapp/lessons_1.dart";
import "package:myapp/Homepage.dart";
import 'package:expansion_tile_card/expansion_tile_card.dart';

class TablOfContents extends StatefulWidget {
  @override
  _TableOfContentsState createState() => _TableOfContentsState();
}

class _TableOfContentsState extends State<TablOfContents> {
  // List<Widget> contentsList = [
  //   CustomTableOfContentsCard("Part 1: Learning the French Alphabet", "p1"),
  //   CustomTableOfContentsCard("Part 2: The Five Codes", "p2"),
  //   CustomTableOfContentsCard("Part 3: Vowel Sounds and Spellings", "p3"),
  //   CustomTableOfContentsCard(
  //       "Part 4: Recapitulation of the 26 Vowel Blocks", "p4"),
  //   CustomTableOfContentsCard("Part 5: The Consonant Sounds", "p5"),
  //   CustomTableOfContentsCard("Part 6: The Letter R's Pronunciation", "p6"),
  //   CustomTableOfContentsCard("Part 7: Three Other Cases", "p7"),
  //   CustomTableOfContentsCard("Part 8: The Elision and the Liaison", "p8"),
  //   CustomTableOfContentsCard(
  //       "Part 9: Exceptions and Irregular Pronunciations", "p9"),
  //   CustomTableOfContentsCard("Part 10: Useful Tourist's Phrases", "p10"),
  // ];
  Card createCard(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xfff5f5f5),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(11, 12, 11, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
                Icons.book, "An Introduction to the French Pronunciation", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstRoute()),
              );
            }),
            const SizedBox(height: 9),
            CustomCard(Icons.book, "The French Name of each Letter", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
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
            CustomCard(
                // In middle of building out this section
                Icons.record_voice_over_rounded,
                "Difficult Letters", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FourthRoute()),
              );
            }),
            CustomCard(
                // In middle of building out this section
                Icons.record_voice_over_rounded,
                "Spelling your Name", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FifthRoute()),
              );
            }),
            CustomCard(
                // In middle of building out this section
                Icons.record_voice_over_rounded,
                "Spelling your Street", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SixthRoute()),
              );
            }),
            CustomCard(
                // In middle of building out this section
                Icons.record_voice_over_rounded,
                "Spelling French Words", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SeventhRoute()),
              );
            }),
            CustomCard(
                // In middle of building out this section
                Icons.book,
                "Vowels and Consonants", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EighthRoute()),
              );
            }),
          ],
        ),
      ),
    );
  }

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  List<bool> isExpanded = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 56),
        child: Column(
          children: [
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[0] = expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 1: Learning the French Alphabet", isExpanded[0]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[1] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 2: The Five Codes", isExpanded[1]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[2] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 3: Vowel Sounds and Spellings", isExpanded[2]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[3] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 4: Recapitulation of the 26 Vowel Blocks",
                  isExpanded[3]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[4] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 5: The Consonant Sounds", isExpanded[4]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[5] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 6: The Letter R's Pronunciation", isExpanded[5]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[6] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 7: Three Other Cases", isExpanded[6]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[7] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 8: The Elision and the Liaison", isExpanded[7]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[8] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 9: Exceptions and Irregular Pronunciations",
                  isExpanded[8]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            ExpansionTileCard(
              onExpansionChanged: (expanded) =>
                  setState(() => isExpanded[9] = !expanded),
              baseColor: Colors.transparent,
              expandedColor: Colors.transparent,
              expandedTextColor: Colors.black,
              initialElevation: 0,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0.0),
              trailing: const SizedBox(),
              title: CustomTableOfContentsCard(
                  "Part 10: Useful Tourist's Phrases", isExpanded[9]),
              children: [
                createCard(context),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTableOfContentsCard extends StatelessWidget {
  String text;
  bool icon;

  CustomTableOfContentsCard(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xfff5f5f5),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                trailing: Icon(icon
                    ? Icons.expand_more_rounded
                    : Icons.expand_less_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Card createCard() {
//   return Card(
//     elevation: 8,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     color: const Color(0xfff5f5f5),
//     child: Padding(
//       padding: const EdgeInsets.fromLTRB(11, 12, 11, 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomCard(
//               Icons.book,
//               "An Introduction to the French Pronunciation", () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const FirstRoute()),
//             );
//           }),
//           const SizedBox(height: 9),
//           CustomCard(Icons.book, "The French Name of each Letter", () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const SecondRoute()),
//             );
//           }),
//           const SizedBox(height: 9),
//           CustomCard(
//             // In middle of building out this section
//               Icons.record_voice_over_rounded,
//               "Practicing the French Alphabet", () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ThirdRoute()),
//             );
//           }),
//         ],
//       ),
//     ),
//   );
// }
