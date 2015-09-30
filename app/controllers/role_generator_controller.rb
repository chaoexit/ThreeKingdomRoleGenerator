class RoleGeneratorController < ApplicationController

	def rolelist
		@role_list = Rails.application.config.my_role_list
	end

	def generate
		if ( Rails.application.config.my_role_list.any? )
			@your_role = Rails.application.config.my_role_list.pop
			result(@your_role)
		else
			redirect_to root_path, notice: 'Game is not started'
		end
	end

	def result(result_role)
		@your_result = result_role
		render :action => "result"
	end

	def stop
		Rails.application.config.my_role_list = []
		redirect_to root_path
	end

	def start
		count = params_check[:number].to_i
		logger.debug('Count = ' + count.to_s + "\n")
		Rails.application.config.my_role_list = []
		Rails.application.config.my_role_list << 'Emperor'
		if count == 5 
			logger.debug('Case 5\n')
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Loyalist'
		elsif count == 6
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Loyalist'
		elsif count == 7
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Loyalist'
		elsif count == 8
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Loyalist'
			Rails.application.config.my_role_list << 'Loyalist'
		elsif count == 9
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Loyalist'
			Rails.application.config.my_role_list << 'Loyalist'
		elsif count == 10
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Betrayer'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Rebel'
			Rails.application.config.my_role_list << 'Loyalist'
			Rails.application.config.my_role_list << 'Loyalist'
		end
		Rails.application.config.my_role_list.shuffle!
		Rails.application.config.my_role_list.shuffle!
		Rails.application.config.my_role_list.shuffle!
		redirect_to root_path
	end

	def params_check
		params.permit(:number)
	end
end
