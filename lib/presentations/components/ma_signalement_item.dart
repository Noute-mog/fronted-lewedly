import 'package:flutter/material.dart';
import 'package:lewedly/presentations/constants/constants.dart';

Widget monSignalementItem({
  BuildContext? context,
  String? nom,
  String? telephone,
  String? age,
  String? location,
  String? image,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: plightcolor),
        color: whitecolor,
        borderRadius: BorderRadius.circular((12)),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular((12)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              image!,
              height: 90,
            ),
          ),
          spaceLarge(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Nom",
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w400,
                        color: kgrey500),
                  ),
                  spaceLarge(8),
                  Text(
                    nom ?? '',
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                  ),
                ],
              ),
              spaceLong(6),
              Row(
                children: [
                  Text(
                    "Age",
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w400,
                        color: kgrey500),
                  ),
                  spaceLarge(8),
                  Text(
                    age ?? '',
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                  ),
                ],
              ),
              spaceLong(6),
              Row(
                children: [
                  Text(
                    "Telephone",
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w400,
                        color: kgrey500),
                  ),
                  spaceLarge(8),
                  Text(
                    telephone ?? '',
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                  ),
                ],
              ),
              spaceLong(6),
              Row(
                children: [
                  Text(
                    "Localization",
                    style: textstyle.copyWith(
                        fontSize: (14),
                        fontWeight: FontWeight.w400,
                        color: kgrey500),
                  ),
                  spaceLarge(8),
                  SizedBox(
                    width: 130,
                    child: Text(
                      location ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: textstyle.copyWith(
                          fontSize: (14),
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
