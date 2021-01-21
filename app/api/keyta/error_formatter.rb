module Keyta
  module ErrorFormatter
    def self.call(message, backtrace, options, env, e)
      {
        error: e.class.to_s,
        message: message,
        status: e.class.method_defined?(:status) ? e.status : 599, # Check if from CustomError
        traces: backtrace[0..1],
        source: env['REQUEST_PATH'],
        exception: e,
        timestamp: Time.now.localtime
      }.to_json
    end
  end
end