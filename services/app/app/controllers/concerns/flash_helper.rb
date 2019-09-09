# frozen_string_literal: true

module FlashHelper
  def f(key, options = {})
    scope = :flash
    controller = self.class
    values = options[:values] || {}
    errors = options[:errors]

    msg = translate(key, scope, controller, params[:action], values, errors)

    # NOTE color logging
    # Rails.logger.debug(Term::ANSIColor.green("flash: #{msg}"))
    type = options[:type] || key
    if options[:now]
      flash.now[type] = msg
    else
      flash[type] = msg
    end
  end

  private

  def translate(key, scope, controller, action, values, errors = nil)
    keys = []
    lookup_controller = controller
    lookup_action = action

    while lookup_controller.superclass.name != 'ActionController::Base'
      lookup_key = []
      lookup_key << lookup_controller.controller_path.tr('/', '.')
      lookup_key << lookup_action
      lookup_key << key

      keys << lookup_key.join('.').to_sym

      lookup_controller = lookup_controller.superclass
      lookup_action = :base
    end

    I18n.t(keys.shift, scope: scope, default: keys, **values, errors: errors)
  end
end
