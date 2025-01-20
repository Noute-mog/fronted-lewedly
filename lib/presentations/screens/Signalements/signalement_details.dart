import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lewedly/presentations/components/default_button.dart';
import 'package:lewedly/presentations/components/signalement_item.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:lewedly/presentations/constants/data.dart';

class SignalementDetails extends StatefulWidget {
  const SignalementDetails(
      {this.nom,
      this.telephone,
      this.age,
      this.location,
      this.image,
      this.description,
      Key? key})
      : super(key: key);

  final String? nom;
  final String? telephone;
  final String? age;
  final String? location;
  final String? image;
  final String? description;

  @override
  State<SignalementDetails> createState() => _SignalementDetailsState();
}

class _SignalementDetailsState extends State<SignalementDetails> {
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
                "Detailles de signalement ",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceLong(10),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kgrey50,
                      borderRadius: BorderRadius.circular((12)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      widget.image!,
                      height: MediaQuery.of(context).size.height / 5.5,
                    ),
                  ),
                  spaceLong(20),
                  Text(
                    "Information",
                    style: textstyle.copyWith(
                        fontSize: (20),
                        fontWeight: FontWeight.w700,
                        color: blackcolor),
                  ),
                  spaceLong(20),
                  Text(
                    "Nom complet",
                    style: textstyle.copyWith(
                        fontSize: (16),
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                  spaceLong(6),
                  Text(
                    widget.nom ?? '',
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w500,
                        color: kgrey600),
                  ),
                  spaceLong(10),
                  Text(
                    "Age",
                    style: textstyle.copyWith(
                        fontSize: (16),
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                  spaceLong(6),
                  Text(
                    widget.age ?? '',
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w500,
                        color: kgrey600),
                  ),
                  spaceLong(10),
                  Text(
                    "Localization",
                    style: textstyle.copyWith(
                        fontSize: (16),
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                  spaceLong(6),
                  Text(
                    widget.location ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w500,
                        color: kgrey600),
                  ),
                  spaceLong(10),
                  Text(
                    "Description",
                    style: textstyle.copyWith(
                        fontSize: (16),
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                  spaceLong(6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.description ?? '',
                      // overflow: TextOverflow.ellipsis,
                      style: textstyle.copyWith(
                          fontSize: (14),
                          fontWeight: FontWeight.w500,
                          color: kgrey600),
                    ),
                  ),
                ],
              ),
              spaceLong(15),
              Text(
                "Contactez-nous",
                style: textstyle.copyWith(
                    fontSize: (20),
                    fontWeight: FontWeight.w700,
                    color: blackcolor),
              ),
              spaceLong(10),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 20,
                          ),
                          spaceLarge(6),
                          Text(
                            "Telephone",
                            style: textstyle.copyWith(
                                fontSize: (16),
                                fontWeight: FontWeight.w500,
                                color: blackcolor),
                          ),
                        ],
                      ),
                      spaceLong(6),
                      Text(
                        widget.telephone ?? '',
                        style: textstyle.copyWith(
                            fontSize: (16),
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                      ),
                    ],
                  ),
                  spaceLarge(70),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.whatsapp,
                            size: 20,
                          ),
                          spaceLarge(6),
                          Text(
                            "Whatsapp",
                            style: textstyle.copyWith(
                                fontSize: (16),
                                fontWeight: FontWeight.w500,
                                color: blackcolor),
                          ),
                        ],
                      ),
                      spaceLong(6),
                      Text(
                        widget.telephone ?? '',
                        style: textstyle.copyWith(
                            fontSize: (16),
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                      ),
                    ],
                  ),
                ],
              ),
              spaceLong(20),
              Text(
                "Contactez la police",
                style: textstyle.copyWith(
                    fontSize: (20),
                    fontWeight: FontWeight.w700,
                    color: blackcolor),
              ),
              spaceLong(18),
              DefaultButton(
                onTap: () {},
                color: primarycolor,
                text: "Police",
                textcolor: whitecolor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Icon(
                    Icons.phone,
                    size: 20,
                    color: whitecolor,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
