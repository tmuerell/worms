Factory.define :user do |u|
  u.sequence(:email) { |n| "user#{n}@email.de" }
  u.password { |u| u.email }
  u.password_confirmation { |u| u.email }
  u.firstname 'Thorsten'
  u.lastname 'User'
end

Factory.define :league do |l|
  l.sequence(:name) { |n| "League #{n}" }
  l.current false
  l.version 1
end

Factory.define :match do |m|
  m.date { Time.now }
  m.league
  m.creator :factory => :user
  m.winner :factory => :user
end

Factory.define :attendance do |a|
  a.match
  a.user
end