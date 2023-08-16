/// responseCode : 200
/// message : "Success"
/// response : [{"id":1,"countryDesc":"REST OF NEW ZEALAND NZR"},{"id":2,"countryDesc":"AUSTRALIA  CAPITAL ACP"},{"id":3,"countryDesc":"AUSTRALIA CAPITAL AUC"},{"id":4,"countryDesc":"AUSTRALIA INTER STATE AUI "},{"id":5,"countryDesc":"AUSTRALIA MAIN metro AUM"},{"id":6,"countryDesc":"AUSTRALIA METRO AUT"},{"id":7,"countryDesc":"AUSTRALIA OTHERS AUO"},{"id":8,"countryDesc":"AUSTRALIA REGIONAL  AUR"},{"id":9,"countryDesc":"AUSTRALIA REMOTE AUU"},{"id":10,"countryDesc":"BANGKOK-THAILAND BGK"},{"id":11,"countryDesc":"BANGLADESH DIRECT BBD"},{"id":12,"countryDesc":"CANADA TORONTO CA6"},{"id":13,"countryDesc":"CANADA Z1 CA1"},{"id":14,"countryDesc":"CANADA Z2 CA2"},{"id":15,"countryDesc":"CANADA Z3 CA3"},{"id":16,"countryDesc":"CANADA Z4 CA4"},{"id":17,"countryDesc":"CANADA-VANCOUVER CA5"},{"id":18,"countryDesc":"DPD DPD"},{"id":19,"countryDesc":"DPX DPX"},{"id":20,"countryDesc":"DUTY PAID DDP"},{"id":21,"countryDesc":"DUTY UNPAID DDU"},{"id":22,"countryDesc":"ECO ECO"},{"id":23,"countryDesc":"ENVELOPE ENV"},{"id":24,"countryDesc":"EPX EPX"},{"id":25,"countryDesc":"EXPRESS EXP"},{"id":26,"countryDesc":"EXPRESS SAVER XPS"},{"id":27,"countryDesc":"EXPRESS WW EWW"},{"id":28,"countryDesc":"FAR EAST SECTOR FES"},{"id":29,"countryDesc":"FAR EAST VIA SINGAPORE SIN"},{"id":30,"countryDesc":"FEDEX PACK PAK"},{"id":31,"countryDesc":"FEDEX SPL CHD FXS"},{"id":32,"countryDesc":"FEDEX SPL DEL FXD"},{"id":33,"countryDesc":"FRA DPD FDP"},{"id":34,"countryDesc":"GPX GPX"},{"id":35,"countryDesc":"GULF WORLDWIDE EXPRESS GWE"},{"id":36,"countryDesc":"GULF WW GWW"},{"id":37,"countryDesc":"HONG KONG DIRECT HKD"},{"id":38,"countryDesc":"KATHMANDU  NZ1"},{"id":39,"countryDesc":"ktm valley nepal KTM"},{"id":40,"countryDesc":"MALAYSIA - DDP MY3"},{"id":41,"countryDesc":"MALAYSIA - DDU MY1"},{"id":42,"countryDesc":"malaysia duty paid MDP"},{"id":43,"countryDesc":"malaysia duty unpaid MDU"},{"id":44,"countryDesc":"MALAYSIA KUALALAMPUR MYK"},{"id":45,"countryDesc":"MALAYSIA KUALALUMPUR MKU"},{"id":46,"countryDesc":"malaysia other duty paid ODP"},{"id":47,"countryDesc":"malaysia other duty unpaid ODU"},{"id":48,"countryDesc":"MALAYSIA OTHERS - DDP MY4"},{"id":49,"countryDesc":"MALAYSIA OTHERS - DDU MY2"},{"id":50,"countryDesc":"MALAYSIA SABAH & SARAWAK MYS"},{"id":51,"countryDesc":"MALAYSIA SAVA SRAVAK MSS"},{"id":52,"countryDesc":"MEDICINES MED"},{"id":53,"countryDesc":"MIDDLE EAST DXB DXB"},{"id":54,"countryDesc":"MIDDLE EAST SECTOR MES"},{"id":55,"countryDesc":"NZ AUCKLAND NZA"},{"id":56,"countryDesc":"OTHERS OTR"},{"id":57,"countryDesc":"PPX PPX"},{"id":58,"countryDesc":"PREMIUM PRE"},{"id":59,"countryDesc":"RAKHI SPL  RSP"},{"id":60,"countryDesc":"REST OF MALAYSIA MYO"},{"id":61,"countryDesc":"rest of nepal RON"},{"id":62,"countryDesc":"REST OF THAILAND THI"},{"id":63,"countryDesc":"SKYNET SKY"},{"id":64,"countryDesc":"SKYNET PREMIUM  SPRE"},{"id":65,"countryDesc":"SKYNET SELF SNET"},{"id":66,"countryDesc":"SPL RATE SPL"},{"id":67,"countryDesc":"SURFACE SF1"},{"id":68,"countryDesc":"UK DPD UDP"},{"id":69,"countryDesc":"UPS EXP SAVER UPT"},{"id":70,"countryDesc":"UPS EXPEDIATE  UPD"},{"id":71,"countryDesc":"UPS EXPRESS SAVER UPE"},{"id":72,"countryDesc":"UPS FRA UPF"},{"id":73,"countryDesc":"UPS LHR UPS"},{"id":74,"countryDesc":"UPS SPL UPA"},{"id":75,"countryDesc":"UPS XPRESS CHD UXC"},{"id":76,"countryDesc":"USA ZONE 1 UZ1"},{"id":77,"countryDesc":"USA ZONE 2 UZ2"},{"id":78,"countryDesc":"USA ZONE 3 UZ3"},{"id":79,"countryDesc":"USA ZONE 4 UZ4"},{"id":80,"countryDesc":"USA ZONE 5 UZ5"},{"id":81,"countryDesc":"USA ZONE 6 UZ6"},{"id":82,"countryDesc":"USA ZONE 7 UZ7"},{"id":83,"countryDesc":"USA ZONE 8 UZ8"},{"id":84,"countryDesc":"USA ZONE 9 UZ9"}]

class ServiceListModel {
  ServiceListModel({
      this.responseCode, 
      this.message, 
      this.response,});

  ServiceListModel.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(ServiceListData.fromJson(v));
      });
    }
  }
  num? responseCode;
  String? message;
  List<ServiceListData>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// countryDesc : "REST OF NEW ZEALAND NZR"

class ServiceListData {
  ServiceListData({
      this.id, 
      this.countryDesc,});

  ServiceListData.fromJson(dynamic json) {
    id = json['id'];
    countryDesc = json['countryDesc'];
  }
  num? id;
  String? countryDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['countryDesc'] = countryDesc;
    return map;
  }

}