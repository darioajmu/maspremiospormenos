FactoryGirl.define do
  factory :premio do
    nombre{ Faker::Lorem.characters((6..63).to_a.sample) }
    codigo{ Faker::Lorem.characters((6..63).to_a.sample) }
    tipo_premio_id{ 1 }
    numero_participaciones{ 1 }
    fecha_hora_sorteo{ '2017-01-01' }
  end
end
