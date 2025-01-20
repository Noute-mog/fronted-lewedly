import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lewedly/presentations/components/default_button.dart';
import 'package:lewedly/presentations/components/signalement_item.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:lewedly/presentations/constants/data.dart';
import 'package:lewedly/presentations/constants/strings.dart';
import 'package:lewedly/presentations/screens/Signalements/ajouter_signalement.dart';
import 'package:lewedly/presentations/screens/Signalements/mes_signalements.dart';
import 'package:lewedly/presentations/screens/Signalements/signalement_details.dart';
import 'package:lewedly/presentations/screens/Signalements/signalements.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kgrey50,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // spaceLong(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: whitecolor,
                          border: Border.all(color: primarycolor),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Lewedly",
                        style: textstyle.copyWith(
                            fontSize: (20),
                            fontWeight: FontWeight.w700,
                            color: primarycolor),
                      ),
                    ),
                    InkWell(
                        child: const FaIcon(
                          FontAwesomeIcons.rightFromBracket,
                          size: 26,
                          color: redcolor,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: whitecolor),
                                            padding: const EdgeInsets.fromLTRB(
                                                (16), (22), (16), (22)),
                                            child: ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  Text(
                                                    "Deconnexion",
                                                    textScaleFactor: 1.0,
                                                    textAlign: TextAlign.start,
                                                    style: textstyle.copyWith(
                                                        color: blackcolor,
                                                        fontSize: (24),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  spaceLong(16),
                                                  Text(
                                                    "Vous êtes sûr de deconnecter?",
                                                    textScaleFactor: 1.0,
                                                    textAlign: TextAlign.start,
                                                    style: textstyle.copyWith(
                                                        color: kgrey600,
                                                        fontSize: (16),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  spaceLong(20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      DefaultButton(
                                                        onTap: () {
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  loginPage,
                                                                  (route) =>
                                                                      false);
                                                        },
                                                        width: 150,
                                                        color: redcolor,
                                                        text: 'Deconnexion',
                                                        textcolor: whitecolor,
                                                      ),
                                                      DefaultButton(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        width: 150,
                                                        color: primarycolor,
                                                        text: 'Retour',
                                                        textcolor: whitecolor,
                                                      ),
                                                    ],
                                                  ),
                                                ]))
                                      ])),
                              barrierDismissible: false);
                        }),
                  ],
                ),
                spaceLong(20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular((16)),
                    boxShadow: const [
                      BoxShadow(
                        color: plightcolor,
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Noute Mogueya",
                          style: textstyle.copyWith(
                              fontSize: (18),
                              fontWeight: FontWeight.w700,
                              color: whitecolor),
                        ),
                      ),
                      spaceLong(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Telephone",
                                  style: textstyle.copyWith(
                                      fontSize: (14),
                                      fontWeight: FontWeight.w400,
                                      color: whitecolor),
                                ),
                                spaceLong(5),
                                Text(
                                  "47 65 25 45",
                                  style: textstyle.copyWith(
                                      fontSize: (16),
                                      fontWeight: FontWeight.w600,
                                      color: whitecolor),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Numero national",
                                  style: textstyle.copyWith(
                                      fontSize: (14),
                                      fontWeight: FontWeight.w400,
                                      color: whitecolor),
                                ),
                                spaceLong(5),
                                Text(
                                  "92 11 23 45 67",
                                  style: textstyle.copyWith(
                                      fontSize: (16),
                                      fontWeight: FontWeight.w600,
                                      color: whitecolor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                spaceLong(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AjouterSignalement()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        height: 130,
                        decoration: BoxDecoration(
                          color: plightcolor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular((16)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outlined,
                              size: 20,
                              color: pdarkcolor,
                            ),
                            spaceLong(10),
                            Text(
                              "Ajouter \nun signalement",
                              style: textstyle.copyWith(
                                  fontSize: (16),
                                  fontWeight: FontWeight.w700,
                                  color: pdarkcolor),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MesSignalements()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        height: 130,
                        decoration: BoxDecoration(
                          color: plightcolor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular((16)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.list_alt,
                              size: 20,
                              color: pdarkcolor,
                            ),
                            spaceLong(10),
                            Text(
                              "Ma liste\ndes signalements",
                              style: textstyle.copyWith(
                                  fontSize: (16),
                                  fontWeight: FontWeight.w700,
                                  color: pdarkcolor),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: 120,
                    //     height: 130,
                    //     decoration: BoxDecoration(
                    //       color: plightcolor.withOpacity(0.2),
                    //       borderRadius: BorderRadius.circular((16)),
                    //     ),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         const Icon(
                    //           Icons.person,
                    //           size: 20,
                    //           color: pdarkcolor,
                    //         ),
                    //         spaceLong(10),
                    //         Text(
                    //           "Profil",
                    //           style: textstyle.copyWith(
                    //               fontSize: (16),
                    //               fontWeight: FontWeight.w700,
                    //               color: pdarkcolor),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                spaceLong(30),
                Container(
                  decoration: BoxDecoration(
                      // color: whitecolor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Liste des signalements recents",
                        style: textstyle.copyWith(
                            fontSize: (16),
                            fontWeight: FontWeight.w700,
                            color: pdarkcolor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Signalements()));
                        },
                        child: Text(
                          "Voir tout",
                          style: textstyle.copyWith(
                              fontSize: (14),
                              fontWeight: FontWeight.w700,
                              color: primarycolor),
                        ),
                      ),
                    ],
                  ),
                ),
                spaceLong(20),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: (230),
                            crossAxisSpacing: (8),
                            mainAxisSpacing: (10)),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return signalementItem(
                        context: context,
                        nom: data[index]['Nom'],
                        telephone: data[index]['Telephone'].toString(),
                        age: data[index]['Age'].toString(),
                        location: data[index]['Location'],
                        image: data[index]['Image'],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignalementDetails(
                                        nom: data[index]['Nom'],
                                        telephone:
                                            data[index]['Telephone'].toString(),
                                        age: data[index]['Age'].toString(),
                                        location: data[index]['Location'],
                                        image: data[index]['Image'],
                                        description: data[index]['Description'],
                                      )));
                        },
                      );
                    }),
                spaceLong(15),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
