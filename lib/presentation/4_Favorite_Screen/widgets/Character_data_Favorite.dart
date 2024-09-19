import 'package:flutter/material.dart';

Container Character_data_NameStatus_Favorite(favoriteCharacter) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        // Name section
        Flexible(
          flex: 2,
          child: Row(
            children: [
              Text(
                "Name: ",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  "${favoriteCharacter["Name"]}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        // Status section
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "Status: ",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            favoriteCharacter["Status"] == "Alive"
                ? const Icon(
                    Icons.brightness_1_sharp,
                    color: Colors.green,
                    size: 20,
                  )
                : favoriteCharacter["Status"] == "Dead"
                    ? const Icon(
                        Icons.brightness_1_sharp,
                        color: Colors.red,
                        size: 20,
                      )
                    : const SizedBox(),
            Text(
              " ${favoriteCharacter["Status"]}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Container Character_data_SpeciesGender_Favorite(favoriteCharacter) {
  return Container(
    margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
    child: Row(
      children: [
        // species section
        Flexible(
            flex: 2,
            child: Row(
              children: [
                Text(
                  "species : ",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    "${favoriteCharacter["Species"]}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            )),
        // gender section
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "Gender : ",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(" ${favoriteCharacter["Gender"]}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        )
      ],
    ),
  );
}
 // Logo Design
Container LogoDesign() {
  return Container(
      margin: EdgeInsets.only(top: 20),
      height: 100,
      width: 100,
      child: Image.asset("assets/RickandMorty_logo.jpg", fit: BoxFit.contain));
}
