import 'package:flutter/material.dart';

Container Character_data_NameStatus(character) {
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
                  "${character["name"]}",
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
            character["status"] == "Alive"
                ? const Icon(
                    Icons.brightness_1_sharp,
                    color: Colors.green,
                    size: 20,
                  )
                : character["status"] == "Dead"
                    ? const Icon(
                        Icons.brightness_1_sharp,
                        color: Colors.red,
                        size: 20,
                      )
                    : const SizedBox(),
            Text(
              " ${character["status"]}",
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

Container Character_data_SpeciesGender(character) {
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
                    "${character["species"]}",
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
              "gender : ",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(" ${character["gender"]}",
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


// LogoDesign in details screen
Container LogoDesign() {
  return Container(
      margin: EdgeInsets.only(top: 20),
      height: 100,
      width: 100,
      child: Image.asset("assets/RickandMorty_logo.jpg", fit: BoxFit.contain));
}
