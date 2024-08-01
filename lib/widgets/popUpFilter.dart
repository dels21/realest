import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  const List<String> list = <String>['Eas', 'Adel', 'Shaq', 'MS'];

class popUpFilter extends StatefulWidget {
  const popUpFilter({super.key});

  @override
  State<popUpFilter> createState() => _popUpFilterState();
}

class _popUpFilterState extends State<popUpFilter> {

  String dropdownValue = list.first;

  int selectedIndexBed = 0;
  int selectedIndexBath = 0;
  int selectedIndexCertificate = 0;
  final List<String> items = ["Semua", "1+", "2+", "3+", "4+"];
  final List<String> itemsC = ["SHM", "HGB", "Lainnya", "Strata", "Girik"];

  final List<bool> _selected = List.generate(5, (index) => false);

  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8, color: Colors.black.withOpacity(0.25))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close)
                  ),
                  SizedBox(width: 20,),
                  Text("Filter Properties", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: _selectedIndex == 0 ? Color(0xFF308DFF) : Colors.white,
                                      border: _selectedIndex == 0 ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text('Buy', style: _selectedIndex == 0 ? TextStyle(color: Colors.white) : TextStyle(color: Colors.grey)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: _selectedIndex == 1 ? Color(0xFF308DFF) : Colors.white,
                                      border: _selectedIndex == 1 ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text('Rent', style: _selectedIndex == 1 ? TextStyle(color: Colors.white) : TextStyle(color: Colors.grey)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Choose Location", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                            SizedBox(height: 10,),
                            TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on),
                                fillColor: Colors.grey.withOpacity(0.25),
                                filled: true,
                                labelText: 'Location',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 2,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Property Type", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => _toggleColor(0),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: _selected[0] ? Color(0xFF308DFF) : Colors.white,
                                      border: _selected[0] ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.house_rounded, color: _selected[0] ? Colors.white : Colors.grey),
                                        Text('House',
                                          style: _selected[0] ? TextStyle(color: Colors.white) : TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _toggleColor(1),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: _selected[1] ? Color(0xFF308DFF) : Colors.white,
                                      border: _selected[1] ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
      
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.apartment_rounded, color: _selected[1] ? Colors.white : Colors.grey
                                        ),
                                        Text('Apartment', style: _selected[1] ? TextStyle(color: Colors.white) : TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => _toggleColor(2),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: _selected[2] ? Color(0xFF308DFF) : Colors.white,
                                      border: _selected[2] ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.landscape_rounded, color: _selected[2] ? Colors.white : Colors.grey
                                        ),
                                        Text('Land', style: _selected[2] ? TextStyle(color: Colors.white) : TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _toggleColor(3),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: _selected[3] ? Color(0xFF308DFF) : Colors.white,
                                      border: _selected[3] ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
      
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.family_restroom_rounded, color: _selected[3] ? Colors.white : Colors.grey
                                        ),
                                        Text('Residential', style: _selected[3] ? TextStyle(color: Colors.white) : TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => _toggleColor(4),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: _selected[4] ? Color(0xFF308DFF) : Colors.white,
                                      border: _selected[4] ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.factory_rounded, color: _selected[4] ? Colors.white : Colors.grey),
                                        Text('Commercial', style: _selected[4] ? TextStyle(color: Colors.white) : TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Price Range", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600) ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(CupertinoIcons.money_dollar),
                                        hintText: "Minimum",
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(CupertinoIcons.money_dollar),
                                        hintText: "Maximum",
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Size", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        suffix: Text("m2"),
                                        hintText: "Minimum",
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Maximum",
                                        suffix: Text("m2"),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Developer Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            SizedBox(height: 10,),
                            DropdownMenu<String>(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              initialSelection: list.first,
                              onSelected: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              dropdownMenuEntries: list
                                  .map<DropdownMenuEntry<String>>((String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                            SizedBox(height: 20,),
                            Text("Bedroom", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            SizedBox(
                                height: 44,
                                child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedIndexBed = index;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                            border: selectedIndexBed == index ? Border.all(color: Color(0xFF308DFF), width: 2) : Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            items[index],
                                            style: selectedIndexBed == index ? TextStyle(color: Color(0xFF308DFF), fontSize: 17, fontWeight: FontWeight.bold) : TextStyle(color: Colors.grey, fontSize: 17),
                                          ),
                                        ),
                                      );
                                    }
                                )
                            ),

                            SizedBox(height: 20,),
                            Text("Bathroom", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            SizedBox(
                                height: 44,
                                child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedIndexBath = index;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                            border: selectedIndexBath == index ? Border.all(color: Color(0xFF308DFF), width: 2) : Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            items[index],
                                            style: selectedIndexBath == index ? TextStyle(color: Color(0xFF308DFF), fontSize: 17, fontWeight: FontWeight.bold) : TextStyle(color: Colors.grey, fontSize: 17),
                                          ),
                                        ),
                                      );
                                    }
                                )
                            ),

                            SizedBox(height: 20,),
                            Text("Certificate", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            SizedBox(
                                height: 44,
                                child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedIndexCertificate = index;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                            border: selectedIndexCertificate == index ? Border.all(color: Color(0xFF308DFF), width: 2) : Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            itemsC[index],
                                            style: selectedIndexCertificate == index ? TextStyle(color: Color(0xFF308DFF), fontSize: 17, fontWeight: FontWeight.bold) : TextStyle(color: Colors.grey, fontSize: 17),
                                          ),
                                        ),
                                      );
                                    }
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }

  void _toggleColor(int index) {
    setState(() {
      _selected[index] = !_selected[index];
    });
  }

}
