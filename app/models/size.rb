class Size < ActiveHash::Base
  self.data = [
    {id: 1, name: 'XXS' }, {id: 2, name: 'XS' },{id: 3, name: 'S' },
    {id: 4, name: 'M' }, {id: 5, name: 'L' },{id: 6, name: 'XL' },
    {id: 7, name: 'XXL' }, {id: 8, name: 'FREE SIZE' },{id: 9, name: 'なし・その他' },
    {id: 10, name: '20.0cm以下'}, {id: 11, name: '20.5cm'}, {id: 12, name: '21.0cm'},
    {id: 13, name: '21.5cm'}, {id: 14, name: '22.0cm'}, {id: 15, name: '22.5cm'},
    {id: 16, name: '23.0cm'}, {id: 17, name: '23.5cm'}, {id: 18, name: '24.0cm'},
    {id: 19, name: '24.5cm'}, {id: 20, name: '25.0cm'}, {id: 21, name: '25.5cm'},
    {id: 22, name: '26.0cm'}, {id: 23, name: '26.5cm'}, {id: 24, name: '27.0cm'},
    {id: 25, name: '27.5cm以上'}
  ]
end