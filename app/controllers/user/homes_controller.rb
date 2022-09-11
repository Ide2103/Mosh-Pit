class User::HomesController < ApplicationController
  def top
    logger.debug '===================================================='
    logger.debug current_user.inspect
    logger.debug '===================================================='
  end
end
