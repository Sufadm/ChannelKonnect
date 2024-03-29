class Product {
  final String productId;
  final String productCode;
  final List<String> barCode;
  final String productName;
  final String unitOfMeasurement;
  final String unitId;
  final bool isCombo;
  final bool isFocused;
  final List<String> groupIds;
  final List<String> categoryIds;
  final String unitFromValue;
  final String unitToValue;
  final String alternateUnitOfMeasurement;
  final String alternateUnitId;
  final String alternateUnitFromDecimal;
  final String alternateUnitToDecimal;
  final bool isUnderWarranty;
  final Price price;
  final Taxes taxes;

  Product({
    required this.productId,
    required this.productCode,
    required this.barCode,
    required this.productName,
    required this.unitOfMeasurement,
    required this.unitId,
    required this.isCombo,
    required this.isFocused,
    required this.groupIds,
    required this.categoryIds,
    required this.unitFromValue,
    required this.unitToValue,
    required this.alternateUnitOfMeasurement,
    required this.alternateUnitId,
    required this.alternateUnitFromDecimal,
    required this.alternateUnitToDecimal,
    required this.isUnderWarranty,
    required this.price,
    required this.taxes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['prodId'],
      productCode: json['prodCode'],
      barCode: List<String>.from(json['barCode']),
      productName: json['prodName'],
      unitOfMeasurement: json['UOM'],
      unitId: json['unit_id'],
      isCombo: json['prod_combo'] == "1",
      isFocused: json['is_focused'] == "yes",
      groupIds: json['group_ids'].split(','),
      categoryIds: json['category_ids'].split(','),
      unitFromValue: json['unit_from_value'],
      unitToValue: json['unit_to_value'],
      alternateUnitOfMeasurement: json['uom_alternate_name'],
      alternateUnitId: json['uom_alternate_id'],
      alternateUnitFromDecimal: json['alt_uom_from_decimal'],
      alternateUnitToDecimal: json['alt_uom_to_decimal'],
      isUnderWarranty: json['under_warranty'] == "yes",
      price: Price.fromJson(json['prodPrice']),
      taxes: Taxes.fromJson(json['prodTax']),
    );
  }
}

class Price {
  final String buyPrice;
  final String sellPrice;
  final String mrp;
  final String freeItem;

  Price({
    required this.buyPrice,
    required this.sellPrice,
    required this.mrp,
    required this.freeItem,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      buyPrice: json['prodBuy'],
      sellPrice: json['prodSell'],
      mrp: json['prodMrp'],
      freeItem: json['prodFreeItem'],
    );
  }
}

class Taxes {
  final List<Tax> inputTax;
  final List<Tax> outputTax;

  Taxes({
    required this.inputTax,
    required this.outputTax,
  });

  factory Taxes.fromJson(Map<String, dynamic> json) {
    return Taxes(
      inputTax:
          (json['IN']['IS'] as List).map((tax) => Tax.fromJson(tax)).toList(),
      outputTax:
          (json['OUT']['IS'] as List).map((tax) => Tax.fromJson(tax)).toList(),
    );
  }
}

class Tax {
  final String taxName;
  final String taxPercentage;
  final String gstType;
  final String applyOn;

  Tax({
    required this.taxName,
    required this.taxPercentage,
    required this.gstType,
    required this.applyOn,
  });

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      taxName: json['tax_name'],
      taxPercentage: json['tax_percent'],
      gstType: json['gst_type'],
      applyOn: json['tax_apply_on'],
    );
  }
}
