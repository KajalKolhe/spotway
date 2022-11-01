import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String iniCategoryValue = 'Category';
  String iniSubCategoryValue = 'subCategory';
  String iniBrandValue = 'Brand';
  String iniCityValue = 'City';

  var categories = ['Category', 'Fuel', 'Parking', 'Charging', 'Flat Tyre'];
  var subCategories = [
    'subCategory',
    'Petrol',
    'Diesel',
    'CNG',
    'Premium Petrol'
  ];
  var brands = ['Brand', 'HP', 'Nayra', 'Bharat Petroleum', 'Indian Oil'];
  var cities = ['City', 'Bhopal', 'Indore', 'Ujjain'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 61, 92),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Add data",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 65,
                    width: double.infinity,
                    child: DropdownButton(
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                      value: iniCategoryValue,
                      iconSize: 30,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: categories.map((String categories) {
                        return DropdownMenuItem(
                          value: categories,
                          child: Text(categories),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            iniCategoryValue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 65,
                    width: double.infinity,
                    child: DropdownButton(
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                      value: iniSubCategoryValue,
                      iconSize: 30,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: subCategories.map((String subCategories) {
                        return DropdownMenuItem(
                          value: subCategories,
                          child: Text(subCategories),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            iniSubCategoryValue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 5,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding: const EdgeInsets.all(5),
                    height: 65,
                    width: double.infinity,
                    child: DropdownButton(
                      elevation: 9,
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                      value: iniBrandValue,
                      iconSize: 30,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: brands.map((String brands) {
                        return DropdownMenuItem(
                          value: brands,
                          child: Text(brands),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            iniBrandValue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 5,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    height: 65,
                    width: double.infinity,
                    child: DropdownButton(
                      elevation: 9,
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                      value: iniCityValue,
                      iconSize: 30,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cities.map((String cities) {
                        return DropdownMenuItem(
                          value: cities,
                          child: Text(cities),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            iniCityValue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 5,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.location_on_outlined),
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      hintText: 'Address',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 45,
                  width: 170,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 23, 61, 92),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {},
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 25),
                    ),
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
