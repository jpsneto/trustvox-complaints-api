require 'faker'

companies = %w( Oi TIM VIVO CLARO NET Netshoes Centauro Americanas Submarino Magazine\ Luiza Coelba Sabesp Empiricus Decolar Sky Kabum Itaucard Bradesco Banco\ do\ Brasil Santander Nubank Amazon Correios Jadlog )

locales = [
  {state: 'BA', city: 'Ilhéus'},
  {state: 'BA', city: 'Salvador'},
  {state: 'BA', city: 'Porto Seguro'},
  {state: 'BA', city: 'Feira de Santana'},
  {state: 'SP', city: 'São Paulo'},
  {state: 'SP', city: 'Sorocaba'},
  {state: 'SP', city: 'Barueri'},
  {state: 'SP', city: 'Santos'},
  {state: 'RJ', city: 'Rio de Janeiro'},
  {state: 'RJ', city: 'Petrópolis'},
  {state: 'RJ', city: 'Niterói'},
  {state: 'PR', city: 'Curitiba'},
  {state: 'PR', city: 'Londrina'},
  {state: 'SC', city: 'Florianópolis'},
  {state: 'SC', city: 'Blumenau'},
  {state: 'MG', city: 'Betim'},
  {state: 'MG', city: 'Belo Horizonte'},
  {state: 'PE', city: 'Recife'},
  {state: 'AC', city: 'Rio Branco'},
  {state: 'AL', city: 'Maceió'},
  {state: 'ES', city: 'Vila Velha'},
  {state: 'ES', city: 'São Matheus'},
  {state: 'PB', city: 'João Pessoa'},
  {state: 'TO', city: 'Palmas'}  
  
]


1000.times do 
  Complaint.create({
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    company:  companies.sample,
    locale: locales.sample
  })

end