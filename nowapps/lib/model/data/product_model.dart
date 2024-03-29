class Product {
  final String? prodImageNano;
  final String? prodImageMicro;
  final String? prodImageSmall;
  final String? prodImageExtraSmall;
  final String? prodImageMedium;
  final String? prodImageLarge;
  final String? prodImageExtraLarge;
  final String? prodImageCustom;
  final String? prodId;
  final String? prodCode;
  final String? barCode;
  final String? prodName;
  final String? UOM;
  final String? unitId;
  final String? prodCombo;
  final String? isFocused;
  final String? groupIds;
  final String? categoryIds;
  final String? unitFromValue;
  final String? unitToValue;
  final String? uomAlternateName;
  final String? uomAlternateId;
  final String? altUomFromDecimal;
  final String? altUomToDecimal;
  final String? underWarranty;
  final String? action;
  final String? groupId;
  final String? catId;
  final String? prodHsnId;
  final String? prodHsnCode;
  final String? prodShortName;
  final String? prodPrice;
  final String? prodMrp;
  final String? prodBuy;
  final String? prodSell;
  final String? prodFreeItem;
  final String? prodRkPrice;
  final Map<String, dynamic>? prodTax;

  Product({
    required this.prodImageNano,
    required this.prodImageMicro,
    required this.prodImageSmall,
    required this.prodImageExtraSmall,
    required this.prodImageMedium,
    required this.prodImageLarge,
    required this.prodImageExtraLarge,
    required this.prodImageCustom,
    required this.prodId,
    required this.prodCode,
    required this.barCode,
    required this.prodName,
    required this.UOM,
    required this.unitId,
    required this.prodCombo,
    required this.isFocused,
    required this.groupIds,
    required this.categoryIds,
    required this.unitFromValue,
    required this.unitToValue,
    required this.uomAlternateName,
    required this.uomAlternateId,
    required this.altUomFromDecimal,
    required this.altUomToDecimal,
    required this.underWarranty,
    required this.action,
    required this.groupId,
    required this.catId,
    required this.prodHsnId,
    required this.prodHsnCode,
    required this.prodShortName,
    required this.prodPrice,
    required this.prodMrp,
    required this.prodBuy,
    required this.prodSell,
    required this.prodFreeItem,
    required this.prodRkPrice,
    required this.prodTax,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      prodImageNano: json['prodImage']['nano'],
      prodImageMicro: json['prodImage']['micro'],
      prodImageSmall: json['prodImage']['small'],
      prodImageExtraSmall: json['prodImage']['extra_small'],
      prodImageMedium: json['prodImage']['medium'],
      prodImageLarge: json['prodImage']['large'],
      prodImageExtraLarge: json['prodImage']['extra_large'],
      prodImageCustom: json['prodImage']['custom_image'],
      prodId: json['prodId'],
      prodCode: json['prodCode'],
      barCode: json['barCode'],
      prodName: json['prodName'],
      UOM: json['UOM'],
      unitId: json['unit_id'],
      prodCombo: json['prod_combo'],
      isFocused: json['is_focused'],
      groupIds: json['group_ids'],
      categoryIds: json['category_ids'],
      unitFromValue: json['unit_from_value'],
      unitToValue: json['unit_to_value'],
      uomAlternateName: json['uom_alternate_name'],
      uomAlternateId: json['uom_alternate_id'],
      altUomFromDecimal: json['alt_uom_from_decimal'],
      altUomToDecimal: json['alt_uom_to_decimal'],
      underWarranty: json['under_warranty'],
      action: json['action'],
      groupId: json['groupId'],
      catId: json['catId'],
      prodHsnId: json['prodHsnId'],
      prodHsnCode: json['prodHsnCode'],
      prodShortName: json['prodShortName'],
      prodPrice: json['prodPrice'],
      prodMrp: json['prodMrp'],
      prodBuy: json['prodBuy'],
      prodSell: json['prodSell'],
      prodFreeItem: json['prodFreeItem'],
      prodRkPrice: json['prodRkPrice'],
      prodTax: json['prodTax'],
    );
  }
}
