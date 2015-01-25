SELECT 
  * 
FROM 
  public.attribute_items, 
  public.attributes, 
  public.product_attribute_value, 
  public.product_type_attribute, 
  public.product_types, 
  public.products
WHERE 
  attribute_items.attribute_id = attributes.attribute_id AND
  product_attribute_value.attribute_item_id = attribute_items.attribute_item_id AND
  product_attribute_value.attribute_id = attributes.attribute_type AND
  product_type_attribute.attribute_id = product_attribute_value.attribute_id AND
  product_types.product_type_id = product_type_attribute.product_type_id AND
  product_types.product_type_id = products.product_type_id AND
  products.product_type_id = attribute_items.attribute_item_id;
