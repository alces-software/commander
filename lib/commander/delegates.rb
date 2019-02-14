module Commander
  module Delegates
    %w(
      add_command
      command
      program
      error_handler
      run!
      global_option
      alias_command
      default_command
      always_trace!
      never_trace!
      silent_trace!
    ).each do |meth|
      eval <<-END, binding, __FILE__, __LINE__
        def #{meth}(*args, &block)
          ::Commander::Runner.instance.#{meth}(*args, &block)
        end
      END
    end

    def defined_commands(*args, &block)
      ::Commander::Runner.instance.commands(*args, &block)
    end
  end
end
