RSpec::Matchers.define :have_constant do |constant|
  match do |owner|
    ([Class, Module].include?(owner.class) ? owner : owner.class).const_defined?(constant)
  end

  failure_message do |klass|
    "expected #{klass} to have constant #{constant}"
  end

  failure_message_when_negated do |klass|
    "expected #{klass} not to have constant #{constant}"
  end
end
