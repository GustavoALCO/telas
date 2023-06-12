import 'package:http/http.dart' as http;
import 'dart:convert';
import '../entidades/contact.dart';


class ServerClient {
    static final Uri _baseUri = Uri.https('ba7a-2804-431-c7d4-c5df-5a9-1fd2-2e66-3fb0.ngrok-free.app');
    static final Uri _createUserUri = _baseUri.resolve('/createUser');
    static final Uri _validUserUri = _baseUri.resolve('/validUser');


    static Future<bool> createUserFromEmailAndPass(String email, String pass) async {
        try {
            final response = await http.post(_createUserUri, body: {'email': email, 'password': pass});
            return response.statusCode == 200;
        } catch (error) {
            return false;
        }
    }

    static Future<bool> validateUser(String email, String password) async {
        try {
            final uriWithParams = _validUserUri.replace(queryParameters: {'email': email, 'password': password});
            final response = await http.get(uriWithParams);
            final statusCode = response.statusCode;
            if (statusCode == 200) {
                final responseData = jsonDecode(response.body);
                final bool isValid = responseData['isValid'];
                return isValid;
            } else {
                return false;
            }
        } catch (error) {
            return false;
        }
    }

    static Future<List<Contact>> getContactsFromClient(String email) async {
        try {
            final Uri fetchClientUsersUri = _baseUri.resolve('/contacts');
            final uriWithParams = fetchClientUsersUri.replace(queryParameters: {'email': email});
            final response = await http.get(
                uriWithParams,                 
                headers: {'Content-Type': 'application/json'}
            );
            final List<dynamic> decodedData = jsonDecode(response.body);
            final List<Contact> contacts = decodedData.map((data) {
                final String name = data['name'];
                final String photo = data['photo'];
                final String telefone = data['phone'];
                return Contact(name: name, photo: photo, phone: telefone);
            }).toList();
            return contacts;
        } catch (error) {
            return [];
        }
    }


    static Future<bool> addContactsFromEmail(String email, List<Contact> contacts) async {
        try{
            final contactData = contacts.map((contact) {
                return {
                    'name': contact.name,
                    'photo': 'assets/images/Logo_Omnichan.png',
                    'phone': contact.phone,
                };
            });

            final Uri addContactUri = _baseUri.resolve('/contact-list');
            final requestData = {'email': email, 'contacts': contactData.toList()};
            final payload = jsonEncode(requestData);
            final response = await http.post(
                addContactUri,
                headers: {'Content-Type': 'application/json'},
                body: payload
            );
            final statusCode = response.statusCode;
            return statusCode == 200;
        } catch (error) {
            return false;
        }
    }
}
