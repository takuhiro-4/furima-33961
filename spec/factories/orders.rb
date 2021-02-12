FactoryBot.define do
  factory :order do
    postalc        { '000-0000' }
    prefecture_id  { 2 }
    municipality   { '市区町村' }
    address        { '番地' }
    building       { '建物名' }
    phonen         { '12345678901' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
