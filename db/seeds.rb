# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#以下管理者アカウント
Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']) do |admin|
  admin.password = ENV['AWS_PF_ACCESS_ADMIN_KEY']
end

#以下会員初期登録アカウント
Customer.find_or_create_by!(email: "customer1@customer1.com") do |customer_detail|
  customer_detail.user_name = 'とろろ'
  customer_detail.password = 'customers1'
  customer_detail.introduction = '主に、和食関連の投稿をメインにしています。'
end

Customer.find_or_create_by!(email: "customer2@customer2.com") do |customer_detail|
  customer_detail.user_name = 'モカ'
  customer_detail.password = 'customers2'
  customer_detail.introduction = '洋食が好きなので、よく洋食の投稿を見に行っています。'
end

Customer.find_or_create_by!(email: "customer3@customer3.com") do |customer_detail|
  customer_detail.user_name = 'チー太郎'
  customer_detail.password = 'customers3'
  customer_detail.introduction = '一番好きなものはチーズなので、チーズ関連の投稿に目がないです!'
end

Customer.find_or_create_by!(email: "customer4@customer4.com") do |customer_detail|
  customer_detail.user_name = 'ただのカレー好き'
  customer_detail.password = 'customers4'
  customer_detail.introduction = '自身でカレーを作るので、知らない香辛料を探して試すのが好きです'
end

Customer.find_or_create_by!(email: "customer5@customer5.com") do |customer_detail|
  customer_detail.user_name = 'つまみ'
  customer_detail.password = 'customers5'
  customer_detail.introduction = 'お酒にあう料理があるといいな。'
end

Customer.find_or_create_by!(email: "customer6@customer6.com") do |customer_detail|
  customer_detail.user_name = 'ウォーク'
  customer_detail.password = 'customers6'
  customer_detail.introduction = '外食を良くするので、既存の料理の新しい食べ方が知りたいです'
end

Customer.find_or_create_by!(email: "customer7@customer7.com") do |customer_detail|
  customer_detail.user_name = 'kotori'
  customer_detail.password = 'customers7'
  customer_detail.introduction = '鶏肉を使った料理が好きなので、鶏肉関連の料理が気になっています。'
end


#調味料初期データ
SeasoningSpice.find_or_create_by!(name: '醤油') do |seasoning|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  seasoning.image.attach(io: File.open(Rails.root.join('app/assets/images/23054550_m.jpg')),filename: '23054550_m.jpg')
  seasoning.classification = '調味料'
  seasoning.name = '醤油'
  seasoning.detail = '醤油は主に、大豆、小麦、塩の３つの原材料で出来ています。'
  seasoning.usega = '使用用途として料理での味付けに使用されたり、お菓子等でも使用されています。'
end

SeasoningSpice.find_or_create_by!(name: 'みりん') do |seasoning|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  seasoning.image.attach(io: File.open(Rails.root.join('app/assets/images/23393560_m.jpg')),filename: '23393560_m.jpg')
  seasoning.classification = '調味料'
  seasoning.name = 'みりん'
  seasoning.detail = 'みりんは主に、もち米、米麹、焼酎や、アルコールといった３つの原材料で出来ています'
  seasoning.usega = '使用用途としては味付けではなく、素材を柔らかくしたり、料理に味を染み込ませやすくする効果や、優しめの甘みを加える際に使用します。'
end

SeasoningSpice.find_or_create_by!(name: '味噌') do |seasoning|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  seasoning.image.attach(io: File.open(Rails.root.join('app/assets/images/27836509_m.jpg')),filename: '27836509_m.jpg')
  seasoning.classification = '調味料'
  seasoning.name = '味噌'
  seasoning.detail = '味噌は主に、大豆、麴、塩といった３つの原材料で出来ています。また味噌といっても、白味噌、赤味噌といった色の違いで用途が変わったりする。'
  seasoning.usega = '使用用途としては、お味噌汁や、きゅうり等野菜にそのまま付けて食べる事もある'
end

SeasoningSpice.find_or_create_by!(name: '酢') do |seasoning|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  seasoning.image.attach(io: File.open(Rails.root.join('app/assets/images/25810947_m.jpg')),filename: '25810947_m.jpg')
  seasoning.classification = '調味料'
  seasoning.name = '酢'
  seasoning.detail = '酢は主に、原材料として穀類、果実等で作られており、優しめな酸味があるのが主な特徴'
  seasoning.usega = '使用用途として、お寿司のご飯を酢飯にする際や、酢豚、ピクルス等がある'
end

SeasoningSpice.find_or_create_by!(name: '料理酒') do |seasoning|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  seasoning.image.attach(io: File.open(Rails.root.join('app/assets/images/24813191_m.jpg')),filename: '24813191_m.jpg')
  seasoning.classification = '調味料'
  seasoning.name = '料理酒'
  seasoning.detail = '主な原材料として、米、米麴、塩の３つで作られており、料理で使用することに特化してある調味料'
  seasoning.usega = '使用用途としては、味付けというよりは、肉や、魚の臭み消しに使われたりする'
end

SeasoningSpice.find_or_create_by!(name: 'マヨネーズ') do |seasoning|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  seasoning.image.attach(io: File.open(Rails.root.join('app/assets/images/27014234_m.jpg')),filename: '27014234_m.jpg')
  seasoning.classification = '調味料'
  seasoning.name = 'マヨネーズ'
  seasoning.detail = '主な原材料として、卵、油、酢の３つから出来ている。酸味があるのが特徴'
  seasoning.usega = '使用用途として、お好み焼きや、からあげ等、さまざまな物に付けて食べる事が出来る'
end


#香辛料初期データ
SeasoningSpice.find_or_create_by!(name: '唐辛子') do |spices|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  spices.image.attach(io: File.open(Rails.root.join('app/assets/images/27590241_m.jpg)'),filename: '27590241_m.jpg')
  spices.classification = '香辛料'
  spices.name = '唐辛子'
  spices.detail = '主に辛さを付与するために用いられる。また、辛さのもとになっているのはカプサイシンと呼ばれる成分が原因になっている'
  spices.usega = '使用用途の一部としてパスタや、麻婆豆腐等に、使用されている'
end

SeasoningSpice.find_or_create_by!(name: '胡椒') do |spices|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  spices.image.attach(io: File.open(Rails.root.join('app/assets/images/27661097_m.jpg')),filename: '27661097_m.jpg')
  spices.classification = '香辛料'
  spices.name = '胡椒'
  spices.detail = 'こしょうの実という物があり、それを乾燥させたものが黒コショウとして使用されている'
  spices.usega = '使用用途として、肉料理全般や、パスタ等、ピリッとさせたい時や、香り付けに使用された理数'
end

SeasoningSpice.find_or_create_by!(name: 'マスタード') do |spices|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  spices.image.attach(io: File.open(Rails.root.join('app/assets/images/2430003_m.jpg')),filename: '2430003_m.jpg')
  spices.classification = '香辛料'
  spices.name = 'イエローマスタード'
  spices.detail = '主な原材料として、マスタシード、酢、塩が使用されていて、他の種類のマスタードより辛さは抑え目になっている'
  spices.usega = '主な使用用途としては、ハンバーガーや、フライドチキン、ホットドッグ等、洋風な料理に使われていることが多い'
end

SeasoningSpice.find_or_create_by!(name: 'ナツメグ') do |spices|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  spices.image.attach(io: File.open(Rails.root.join('app/assets/images/23577925_m.jpg')),filename: '23577925_m.jpg')
  spices.classification = '香辛料'
  spices.name = 'ナツメグ'
  spices.detail = 'ナツメグは、ニクズクと呼ばれる果実から取れる香辛料で、ほんのり甘さがあるのが特徴。しかし多量に摂取すると中毒症状が起きることがある為注意が必要'
  spices.usega = '主な使用用途としては、ハンバーグやカレー等があるが、肉の臭み消しに使用できるので、使用用途は例に挙げたものだけとは限らない'
end

SeasoningSpice.find_or_create_by!(name: '山椒') do |spices|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  spices.image.attach(io: File.open(Rails.root.join('app/assets/images/26956929_m.jpg')),filename: '26956929_m.jpg')
  spices.classification = '香辛料'
  spices.name = '山椒'
  spices.detail = '独特な香りが特徴で、別の呼び方として「ジャパニーズペッパー」とも呼ばれている'
  spices.usega = '主にうなぎにかけて使用されるが、あえて山椒の特徴を生かした他の料理で使用されることもある'
end

SeasoningSpice.find_or_create_by!(name: 'シナモン') do |spices|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  spices.image.attach(io: File.open(Rails.root.join('app/assets/images/2906259_m.jpg')),filename: '2906259_m.jpg')
  spices.classification = '香辛料'
  spices.name = 'シナモン'
  spices.detail = 'シナモンは、クスノキ科の樹皮を乾燥させたスパイスで、それを粉末にすると、シナモンパウダーになる'
  spices.usega = '主に、お菓子の材料や、飲み物の材料等にも使用される'
end


#ハーブ類初期データ
SeasoningSpice.find_or_create_by!(name: 'バジル') do |herbs|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  herbs.image.attach(io: File.open(Rails.root.join('app/assets/images/27846805_m.jpg')),filename: '27846805_m.jpg')
  herbs.classification = 'ハーブ類'
  herbs.name = 'バジル'
  herbs.detail = 'バジルとは、シソ科のハーブで、別名として「メボウキ」と呼ばれることもある'
  herbs.usega = '主に、ピザとしての材料や、パスタに使用されることが多い'
end

SeasoningSpice.find_or_create_by!(name: 'ミント') do |herbs|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  herbs.image.attach(io: File.open(Rails.root.join('app/assets/images/27223441_m.jpg')),filename: '27223441_m.jpg')
  herbs.classification = 'ハーブ類'
  herbs.name = 'ミント'
  herbs.detail = 'ミントとはシソ科ハッカ属の総称。'
  herbs.usega = '主に、スイーツや、ハーブティー等に使用されることがある'
end

SeasoningSpice.find_or_create_by!(name: 'パセリ') do |herbs|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  herbs.image.attach(io: File.open(Rails.root.join('app/assets/images/26267849_m.jpg')),filename: '26267849_m.jpg')
  herbs.classification = 'ハーブ類'
  herbs.name = 'パセリ'
  herbs.detail = 'セリ科の草であり、野菜として食用にされている'
  herbs.usega = '主に、パスタやスープやソースに使用されることが多い'
end

SeasoningSpice.find_or_create_by!(name: 'ローズマリー') do |herbs|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  herbs.image.attach(io: File.open(Rails.root.join('app/assets/images/26919879_m.jpg')),filename: '26919879_m.jpg')
  herbs.classification = 'ハーブ類'
  herbs.name = 'ローズマリー'
  herbs.detail = '力強い香りが特徴で、乾燥しているとさらに香りが強く出るようになる'
  herbs.usega = '肉や魚の臭み消しに使用し、料理としては、肉料理で利用されている'
end

SeasoningSpice.find_or_create_by!(name: 'パクチー') do |herbs|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  herbs.image.attach(io: File.open(Rails.root.join('app/assets/images/4938651_m.jpg')),filename: '4938651_m.jpg')
  herbs.classification = 'ハーブ類'
  herbs.name = 'パクチー'
  herbs.detail = 'コリアンダーやパクチー、シャンツァイ等色々名称があるが、特徴といえば独特で強烈な香りがあげられる'
  herbs.usega = '海外での料理ではおなじみで、中華料理やインド料理等に使用されることが多い'
end

SeasoningSpice.find_or_create_by!(name: 'タイム') do |herbs|
  seasoning.admin_id = Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']).id
  herbs.image.attach(io: File.open(Rails.root.join('app/assets/images/27276468_m.jpg')),filename: '27276468_m.jpg')
  herbs.classification = 'ハーブ類'
  herbs.name = 'タイム'
  herbs.detail = '「魚のハーブ」とも呼ばれていて、魚介類の臭みを消し、爽やかな香りが特徴'
  herbs.usega = '主に、魚系の料理に用いられ、ムニエルや香草焼きなどがあげられる'
end