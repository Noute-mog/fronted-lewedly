import 'package:flutter/material.dart';
import 'package:lewedly/presentations/components/signalement_item.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:lewedly/presentations/constants/data.dart';
import 'package:lewedly/presentations/screens/Signalements/signalement_details.dart';

class Signalements extends StatefulWidget {
  const Signalements({Key? key}) : super(key: key);

  @override
  State<Signalements> createState() => _SignalementsState();
}

class _SignalementsState extends State<Signalements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: (80),
        automaticallyImplyLeading: false,
        backgroundColor: whitecolor,
        title: Padding(
          padding: const EdgeInsets.only(top: (20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: primarycolor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Text(
                "Signalements",
                style: textstyle.copyWith(
                    fontSize: (18),
                    fontWeight: FontWeight.w700,
                    color: blackcolor),
              ),
              spaceLarge(30)
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: kgrey50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              spaceLong(20),
              Text(
                "Liste des signalements",
                style: textstyle.copyWith(
                    fontSize: (16),
                    fontWeight: FontWeight.w700,
                    color: pdarkcolor),
              ),
              spaceLong(20),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: (230),
                      crossAxisSpacing: (8),
                      mainAxisSpacing: (10)),
                  itemCount: data.length,
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
      )),
    );
  }
}
