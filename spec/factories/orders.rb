FactoryBot.define do
  factory :order do
    postalc        {'000-0000'}
    prefecture_id  {2}
    municipality   {"市区町村"}
    address        {"番地"}
    phonen         {12345678901}
    user_id        {1}
    item_id        {2}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end