json.extract! bankaccount, :id, :user_id, :name, :bank, :type, :rut, :account, :email, :created_at, :updated_at
json.url bankaccount_url(bankaccount, format: :json)
