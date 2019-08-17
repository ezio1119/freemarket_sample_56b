class Size < ActiveHash::Base
  self.data = [
    {id: 1, name: 'XXS', size_name: "clothes"}, {id: 2, name: 'XS' , size_name: "clothes"},{id: 3, name: 'S' , size_name: "clothes"},
    {id: 4, name: 'M' , size_name: "clothes"}, {id: 5, name: 'L' , size_name: "clothes"},{id: 6, name: 'XL' , size_name: "clothes"},
    {id: 7, name: 'XXL' , size_name: "clothes"}, {id: 8, name: 'FREE SIZE' , size_name: "clothes"},{id: 9, name: 'なし・その他' , size_name: "clothes"},
    {id: 10, name: '20.0cm以下', size_name: "shoes"}, {id: 11, name: '20.5cm', size_name: "shoes"}, {id: 12, name: '21.0cm', size_name: "shoes"},
    {id: 13, name: '21.5cm', size_name: "shoes"}, {id: 14, name: '22.0cm', size_name: "shoes"}, {id: 15, name: '22.5cm', size_name: "shoes"},
    {id: 16, name: '23.0cm', size_name: "shoes"}, {id: 17, name: '23.5cm', size_name: "shoes"}, {id: 18, name: '24.0cm', size_name: "shoes"},
    {id: 19, name: '24.5cm', size_name: "shoes"}, {id: 20, name: '25.0cm', size_name: "shoes"}, {id: 21, name: '25.5cm', size_name: "shoes"},
    {id: 22, name: '26.0cm', size_name: "shoes"}, {id: 23, name: '26.5cm', size_name: "shoes"}, {id: 24, name: '27.0cm', size_name: "shoes"},
    {id: 25, name: '27.5cm以上', size_name: "shoes"}
  ]
  def self.clothes_size
    where(size_name: 'clothes')
  end

  def self.shoes_size
    where(size_name: 'shoes')
  end

end