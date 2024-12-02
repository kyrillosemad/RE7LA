class PaymentMethodModel {
  int? paymentId;
  String? nameEn;
  String? nameAr;
  String? redirect;
  String? logo;

  PaymentMethodModel(
      {this.paymentId, this.nameEn, this.nameAr, this.redirect, this.logo});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    redirect = json['redirect'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentId'] = paymentId;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['redirect'] = redirect;
    data['logo'] = logo;
    return data;
  }
}
