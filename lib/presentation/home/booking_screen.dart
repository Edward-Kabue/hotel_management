// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hotel/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:hotel/domain/models/booking_model.dart';
import 'package:hotel/domain/models/hotel_model.dart';
import 'package:hotel/domain/models/room_model.dart';
import 'package:hotel/providers/booking_provider.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class BookingScreen extends StatefulWidget {
  final Hotel hotel;
  final Room room;

  const BookingScreen({
    super.key,
    required this.hotel,
    required this.room,
  });

  get roomType => room.type;

  get roomRate => room.rate;

  get isRoomAvailable => room.isAvailable;

  @override
  State<BookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<BookingScreen> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _numberOfGuests = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.hotel.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Check-in Date',
              style: TextStyle(fontSize: 18.0),
            ),
            InkWell(
              onTap: () => _selectDate(context, isCheckIn: true),
              child: Text(
                _checkInDate != null
                    ? '${_checkInDate?.toLocal()}'.split(' ')[0]
                    : 'Select Check-in Date',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Check-out Date',
              style: TextStyle(fontSize: 18.0),
            ),
            InkWell(
              onTap: () => _selectDate(context, isCheckIn: false),
              child: Text(
                _checkOutDate != null
                    ? '${_checkOutDate?.toLocal()}'.split(' ')[0]
                    : 'Select Check-out Date',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Number of Guests',
              style: TextStyle(fontSize: 18.0),
            ),
            Slider(
              value: _numberOfGuests.toDouble(),
              min: 1.0,
              max: 10.0,
              divisions: 9,
              label: _numberOfGuests.toString(),
              onChanged: (value) {
                setState(() {
                  _numberOfGuests = value.toInt();
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              // onPressed: _checkInDate != null && _checkOutDate != null
              //     ? () async {
              //         //debug all the values
              //         print(context.read<AuthProvider>().user?.email);
              //         final booking = Booking(
              //           hotelName: widget.hotel.name.toString(),
              //           checkInDate: _checkInDate!,
              //           checkOutDate: _checkOutDate!,
              //           numberOfGuests: _numberOfGuests,
              //           totalCost:
              //               widget.room.rate * _numberOfGuests.toDouble(),
              //           user: context.read<AuthProvider>().user!,
              //           room: [widget.hotel.rooms.first],
              //         );
              //         await context.read<BookingProvider>().addBooking(booking);
              //         _showFlashMessage(context, 'Booking successful!');
              //         Navigator.pushReplacementNamed(context, '/home');
              //       }
              //     : null,
              onPressed: () => {
                lipaNaMpesa(),
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context,
      {required bool isCheckIn}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = pickedDate;
        } else {
          _checkOutDate = pickedDate;
        }
      });
    }
  }

  void _showFlashMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: "174379",
              transactionType: TransactionType.CustomerPayBillOnline,
              amount: 10.0,
              partyA: "254708374149",
              partyB: "174379",
              //Lipa na Mpesa Online ShortCode
              callBackURL: Uri(
                  scheme: "https",
                  host: "mpesa-requestbin.herokuapp.com",
                  path: "/1hhy6391"),
              //This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
              accountReference: "Maureen Josephine Clothline",
              phoneNumber: "254715263076",
              baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
              transactionDesc: "purchase",
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
      //This passkey has been generated from Test Credentials from Safaricom Portal
      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      //lets print the error to console for this sample demo
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }
}
