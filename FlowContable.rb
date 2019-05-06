BACK_BASE_URL = Rails.env.production? ? ENV["PRODUCTION_URL"] : "http://localhost:3000"

	def flow
		req = {
			:apiKey => '1FB51B84-BA28-47EC-AB84-3F3L8D8AEECE',
			:commerceOrder => "COMMERCE ORDER ID",
			:subject => 'Pago por XXX',
			:amount => 1000,
			:email => "valid@email.com", # tiene que ser valido y real
			:paymentMethod => 1,
			:currency => 'CLP',
			:urlConfirmation => "#{BACK_BASE_URL}/flow_payment", # URL PARA CONFIRMAR PAGO
			:urlReturn => "#{BACK_BASE_URL}/payment_success"
		}
        secret = flow_sign(req)
        flow_params = req.merge({:s => secret})
        req = HTTParty.post("#{flow_base_url}/payment/create",
            :body => flow_params.sort.to_h,
            :headers => {
                'Content-Type' => 'application/x-www-form-urlencoded'
            }
        )
        if req.success?
            url = "#{req.parsed_response['url']}?token=#{req.parsed_response['token']}"
            business.payments.last.update payment_url: url
        else
            return render json: {error: true, flow: req}, status: 400
        end
        render json: {url: url}, status: 200
	end

	def flow_sign form
		string_to_sign = ''
		form.sort.to_h.each do |k,v|
			string_to_sign += "&#{k}=#{v}"
		end
		OpenSSL::HMAC.hexdigest(
			OpenSSL::Digest.new('sha256'),
			'1bc785653b7b1c7d09a908bea8e771ebecf69ef5',
			string_to_sign[1..-1]
		)
	end

	def flow_base_url
		Rails.env.production? ? "https://www.flow.cl/api" : "https://sandbox.flow.cl/api"
	end
