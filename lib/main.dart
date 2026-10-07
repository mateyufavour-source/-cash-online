import 'package:flutter/material.dart';
void main() => runApp(CashOnlineApp());
class CashOnlineApp extends StatelessWidget {
@override Widget build(BuildContext context) {
return MaterialApp(title: 'Cash Online Malawi', theme: ThemeData(primarySwatch: Colors.green), home: HomePage(), debugShowCheckedModeBanner: false,);}}
class HomePage extends StatefulWidget {
@override _HomePageState createState() => _HomePageState();}
class _HomePageState extends State<HomePage> {
final nameCtrl = TextEditingController();
final phoneCtrl = TextEditingController();
final refCtrl = TextEditingController();
List<String> users = [];
void register() {
String name = nameCtrl.text; String phone = phoneCtrl.text;
if (name.isEmpty || phone.isEmpty) return;
String myCode = "CASH${phone.substring(phone.length-4)}";
setState(() { users.insert(0, "$name - $phone - Code: $myCode - Bal: K500"); });
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered! Your Code: $myCode")));
nameCtrl.clear(); phoneCtrl.clear(); refCtrl.clear();}
@override Widget build(BuildContext context) {
return Scaffold(appBar: AppBar(title: Text("Cash Online Malawi 🇲🇼"), centerTitle: true),
body: SingleChildScrollView(padding: EdgeInsets.all(16),
child: Column(children: [
Card(color: Colors.green[50], child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
Text("Pay K500 Win K10000", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800])),
SizedBox(height: 8),
Text("1. Register\n2. Pay K500 Airtel Money\n3. Refer 3 friends = K10000\n4. Withdraw Airtel Money", textAlign: TextAlign.center),],),),
SizedBox(height: 20),
TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Full Name", border: OutlineInputBorder())),
SizedBox(height: 10),
TextField(controller: phoneCtrl, decoration: InputDecoration(labelText: "Phone Airtel", border: OutlineInputBorder()), keyboardType: TextInputType.phone),
SizedBox(height: 10),
TextField(controller: refCtrl, decoration: InputDecoration(labelText: "Referral Code (Optional)", border: OutlineInputBorder())),
SizedBox(height: 20),
SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: register, child: Text("REGISTER K500", style: TextStyle(fontSize: 18)), style: ElevatedButton.styleFrom(backgroundColor: Colors.green))),
SizedBox(height: 20),
Text("Payment: Airtel 099xxxxxxx - Favour Mateyu", style: TextStyle(fontWeight: FontWeight.bold)),
Divider(), Text("Live Members:"),
...users.map((u) => ListTile(leading: Icon(Icons.person), title: Text(u))).toList(),],),),);}}
