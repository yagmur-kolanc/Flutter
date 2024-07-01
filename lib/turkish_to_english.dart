import 'dart:developer';

String donustur(String veri){
  veri=veri.replaceAll(" ", "");
  veri=veri.toLowerCase();
  log(veri);
  return veri;



}