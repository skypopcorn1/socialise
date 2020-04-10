import 'package:flutter/material.dart';

const Color kBlue = MaterialColor(0xFF2D9CDB, {
  50: Color(0xFF2D9CDB),
  100: Color(0xFF2D9CDB),
  200: Color(0xFF2D9CDB),
  300: Color(0xFF2D9CDB),
  400: Color(0xFF2D9CDB),
  500: Color(0xFF2D9CDB),
  600: Color(0xFF2D9CDB),
  700: Color(0xFF2D9CDB),
  800: Color(0xFF2D9CDB),
  900: Color(0xFF2D9CDB),
});

Color kGrey = Colors.blueGrey[800];
Color kLightGrey = Colors.blueGrey[900];
Color kLinkGreen = Colors.lightGreenAccent;

const TextStyle kErrorMessage = TextStyle(
  color: Colors.red,
  fontSize: 12,
);

const TextStyle kConfirmedMessage = TextStyle(
  color: Colors.green,
  fontSize: 12,
);

TextStyle kTitle = TextStyle(
  fontSize: 27,
  fontWeight: FontWeight.bold,
);

TextStyle kH1 = TextStyle(
  color: Colors.white,
  fontFamily: 'Sinkin Sans',
  fontSize: 30.0,
);

TextStyle kH1Dark = TextStyle(
  color: kGrey,
  fontFamily: 'Sinkin Sans',
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

TextStyle kH2 = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

TextStyle kH2Dark = TextStyle(
  color: Colors.blueGrey[900],
  fontSize: 25.0,
);

TextStyle kH2Red = TextStyle(
  color: Colors.redAccent,
  fontSize: 25.0,
);

TextStyle kH3 = TextStyle(
  color: kGrey,
  fontSize: 20.0,
);

TextStyle kH3Bold = TextStyle(
  color: kGrey,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

TextStyle kH4 = TextStyle(
  color: kGrey,
  fontSize: 18.0,
);

TextStyle kH4Bold = TextStyle(
  color: kGrey,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

TextStyle kViewDetailsButton = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
);

TextStyle kItemDetailHeader = TextStyle(
  color: kGrey,
  fontSize: 20.0,
);

TextStyle kP1 = TextStyle(
  color: kGrey,
  fontSize: 16.0,
);

TextStyle kP1LightGrey = TextStyle(
  color: Colors.black54,
  fontSize: 16.0,
);

TextStyle kP1White = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);

TextStyle kP2LightGrey = TextStyle(
  color: Colors.grey[400],
  fontSize: 12.0,
);

//Messages
const kSendButtonTextStyle = TextStyle(
  color: kBlue,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kBlue, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kUserAgreementBody =
    "I. Introduction Sample terms and conditions. @Jeremiah"
    ", if you are reading this, then we need a Beta Test User Agreement to"
    "go in this section. When "
    "you use Uber, you trust us with your personal "
    "data. We’re committed to keeping that trust. That "
    "starts with helping you understand our privacy practices. "
    "This notice describes the personal data we collect, how it’s "
    "used and shared, and your choices regarding this data. We "
    "recommend that you read this along with our privacy overview, "
    "which highlights key points about our privacy practices. II. "
    "Overview This notice describes how Uber and its affiliates collect "
    "and use personal data. This notice applies to all users of our apps,"
    " websites, features, or other services anywhere in the world, unless"
    " covered by a separate privacy notice, such as the Uber Freight "
    "Privacy Notice. This notice specifically applies to: Riders: "
    "individuals who request or receive transportation, including those "
    "who receive transportation requested by another individual"
    " Drivers: individuals who provide, or submit applications to Uber to "
    "provide, transportation individually or through partner transportation "
    "companies. Delivery recipients: individuals who request or receive food,"
    " or other products and services. Delivery partners: individuals who "
    "provide, or submit applications to Uber to provide, delivery or other "
    "services Renters: individuals who rent JUMP bicycles or scooters, or "
    "other light electrical vehicles or devices (collectively, “Rental "
    "Devices”), through an Uber app. This notice also governs Uber’s other "
    "collections of personal data in connection with Uber’s services. For "
    "example, we may collect the contact information of individuals who use "
    "accounts owned by Uber for Business customers or of owners or employees "
    "of Uber Eats restaurant partners, or we may collect other personal data "
    "in connection with our mapping technology and features. All those subject"
    " to this notice are referred to as “users” in this notice. In addition, "
    "please note the following: For users in Argentina: The Public "
    "Information Access agency, in its role of Regulating Body of Law 25.326,"
    " is responsible for receiving complaints and reports presented by any "
    "data subjects who believe their rights have been impacted by a violation "
    "of the local data protection regulation. For California users: Information"
    " regarding Uber’s privacy practices related to the California Consumer "
    "Privacy Act (CCPA) is available here. For users in Mexico: Please see "
    "here for information regarding Uber’s privacy practices required under "
    "Mexico’s Mexican Personal Data Protection Law (Ley Federal de Protección "
    "de Datos Personales en Posesión de los Particulares). For users in South "
    "Korea: Uber’s Korean Domestic Representative is Bae, Kim & Lee LLC, "
    "Representative Attorney Yangho Oh, 133 Teheran-ro Gangnam-gu, Seoul, "
    "06133, Korea. Telephone: 02-3404-0003. Email: UberPrivacyKR@bkl.co.kr. "
    "For riders without an Uber account: The personal data of riders who take "
    "trips arranged by the owners of an Uber account, such as when a rider "
    "takes a ride arranged by the owner of an Uber Health account (such as a "
    "hospital or healthcare provider), is processed in accordance with our "
    "contract with the owner of that account, and not as otherwise described "
    "in this notice. Such processing may include sharing of rider location data "
    "with the owner of that account. Please contact the owner of such account "
    "for more information. Our data practices are subject to applicable laws "
    "in the places in which we operate. This means that we engage in the "
    "practices described in this notice in a particular country or region only"
    " if permitted under the laws of those places. Please contact us here or "
    "through the addresses below with any questions regarding our practices in"
    " a particular country or region.";
