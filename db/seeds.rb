# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Address.destroy_all
Bankaccount.destroy_all
Order.destroy_all
MembershipOrder.destroy_all
Billing.destroy_all
Milling.destroy_all
Comment.destroy_all
Genre.destroy_all
Book.destroy_all
Membership.destroy_all
PublisherComment.destroy_all
Publisher.destroy_all
Reader.destroy_all
User.destroy_all
#publishers, bankaccounts, books
10.times do |u|
  User.create!(
    email: "publisher#{u+1}@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    role: 'Editorial')
end
@a = 0
10.times do |p|
  u = User.find_by_email("publisher#{p+1}@gmail.com")
  pub = Publisher.create!(user: u,name: "Editorial #{p+1}",rut: 111111111,giro: "Editorial",voucher: 0,method: 0,address: "Nueva Tajamar 164, Las Condes",facebook: "lobaediciones",twitter: "LobaEdiciones",instagram: "loba_ediciones",website: "http://lobaediciones.cl/",razon: "Loba Ediciones Ltda")

  2.times do |b|
    @a += 1
    book = Book.create!(publisher: pub, title: "Libro #{@a}", price: 8000, pvp: 10000, author_first_name: "Juanito #{b+1}", author_last_name: "Juanito #{b+1}", isbn: 1234567, synopsis: "Un carismático psicópata. Un adolescente luchando en contra de su propia naturaleza. Una joven tratando de borrar el dolor.En el mundo de la brujería, nadie es inocente. Todos tienen un secreto y un demonio que ocultar. Chile es el escenario para esta novela llena de magia y violencia. Los brujos se han unido en la Nueva Recta Provincia, organización que busca resguardar la seguridad de los brujos y brujas a lo largo del país. Sin embargo, detrás de esta loable misión se esconde una verdad mucho más siniestra. Cada miembro del grupo tiene sus propios objetivos y es leal sólo a su sombra, un ente mágico que lo acompaña y alimenta su poder. En este contexto, solo una regla importa: nunca confíes en nadie.")
    5.times do |ba|
      Comment.create!( publisher: pub, book: book, user: u, content: "Muy buen libro #{ba+1}" )
    end
  end

    2.times do |b|
      @a += 1
      book = Book.create!(
        publisher: pub,
        title: "Libro #{@a}",
        price: 2000,
        pvp: 10000,
        author_first_name: "Fabián #{b+1}",
        author_last_name: "General #{b+1}",
        isbn: 1234567,
        synopsis: "Un carismático psicópata. Un adolescente luchando en contra de su propia naturaleza. Una joven tratando de borrar el dolor.En el mundo de la brujería, nadie es inocente. Todos tienen un secreto y un demonio que ocultar. Chile es el escenario para esta novela llena de magia y violencia. Los brujos se han unido en la Nueva Recta Provincia, organización que busca resguardar la seguridad de los brujos y brujas a lo largo del país. Sin embargo, detrás de esta loable misión se esconde una verdad mucho más siniestra. Cada miembro del grupo tiene sus propios objetivos y es leal sólo a su sombra, un ente mágico que lo acompaña y alimenta su poder. En este contexto, solo una regla importa: nunca confíes en nadie."
      )
    end
end

10.times do |ba|
  Bankaccount.create!(
    user: User.find_by_email("publisher#{ba+1}@gmail.com"),
    name: "Editorial #{ba+1}",
    rut: 111111111,
    bank: "Banco de Chile",
    accounttype: "Cuenta Corriente",
    account: 123456,
    email: "email#{ba+1}@email.com")
end

10.times do |ba|
  Address.create(
    user: User.find_by_email("publisher#{ba+1}@gmail.com"),
    title: "Oficina",
    address: "Calle 1",
    commune: "Santiago",
    region: "Metropolitana")
end

25.times do |ba|
  Genre.create(
    name: "Género #{ba+1}")
end

#readers,addresses

@p = 20

10.times do |u|
  @p += 1
  User.create!(
    email: "reader#{@p}@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    role: 'Lector')
end

@r = 20
10.times do |u|
  @r +=1
  Reader.create(
    user: User.find_by_email("reader#{@r}@gmail.com"),
    firstname: "Dani#{@r}",
    lastname: "Cortés#{@r}")
end

@z = 20

10.times do |ba|
  @z += 1
  Address.create(
    user: User.find_by_email("reader#{@z}@gmail.com"),
    title: "Casa",
    address: "Calle 1",
    commune: "Santiago",
    region: "Metropolitana")
end
@h = 20
10.times do |ba|
  Address.create(
    user: User.find_by_email("reader#{@h}@gmail.com"),
    title: "Casa2",
    address: "Calle 2",
    commune: "Antofagasta",
    region: "Antofagasta")
end

1.times do |ba|
  Membership.create(
    name: "Plan Anual Normal",
    description: "Nuestro plan normal",
    price: 40000,
    active: true,
    benefit1: "1 año",
    benefit2: "Illimitado",
    benefit3: "Illimitado",
    benefit4: "Sí",
    benefit5: "Sí"
  )
end

1.times do |ba|
  Billing.create(
    user: User.find_by_email("reader21@gmail.com"),
    code: "Random #{ba+1}",
    payment_method: "paypal",
    amount: "2000",
    currency: "USD"
  )
end

10.times do |ba|
  Order.create(
    user: User.find_by_email("reader21@gmail.com"),
    book: Book.find_by_title("Libro #{ba+1}"),
    payed: true,
    delivery:false,
    billing: Billing.first
  )
end


1.times do |ba|
  Membership.create(
    name: "Oferta de lanzamiento",
    description: "Nuestro plan normal",
    price: 20000,
    active: true,
    benefit1: "1 año",
    benefit2: "Illimitado",
    benefit3: "Illimitado",
    benefit4: "Sí",
    benefit5: "Sí"
  )
end
1.times do |ba|
  Milling.create(
    user: User.find_by_email("publisher1@gmail.com"),
    code: "Random #{ba+1}",
    payment_method: "paypal",
    amount: "2000",
    currency: "USD"
  )
end

1.times do |ba|
  MembershipOrder.create(
    user: User.find_by_email("publisher1@gmail.com"),
    membership: Membership.find_by_name("Oferta de lanzamiento"),
    paid: true,
    milling: Milling.first
  )
end
