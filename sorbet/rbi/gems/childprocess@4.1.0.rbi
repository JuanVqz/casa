# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `childprocess` gem.
# Please instead update this file by running `bin/tapioca gem childprocess`.

# source://childprocess//lib/childprocess/version.rb#1
module ChildProcess
  class << self
    # source://childprocess//lib/childprocess.rb#131
    def arch; end

    # source://childprocess//lib/childprocess.rb#15
    def build(*args); end

    # By default, a child process will inherit open file descriptors from the
    # parent process. This helper provides a cross-platform way of making sure
    # that doesn't happen for the given file/io.
    #
    # source://childprocess//lib/childprocess.rb#158
    def close_on_exec(file); end

    # @return [Boolean]
    #
    # source://childprocess//lib/childprocess.rb#64
    def jruby?; end

    # @return [Boolean]
    #
    # source://childprocess//lib/childprocess.rb#60
    def linux?; end

    # source://childprocess//lib/childprocess.rb#33
    def logger; end

    # Sets the attribute logger
    #
    # @param value the value to set the attribute logger to.
    #
    # source://childprocess//lib/childprocess.rb#13
    def logger=(_arg0); end

    # source://childprocess//lib/childprocess.rb#15
    def new(*args); end

    # source://childprocess//lib/childprocess.rb#105
    def os; end

    # source://childprocess//lib/childprocess.rb#42
    def platform; end

    # source://childprocess//lib/childprocess.rb#52
    def platform_name; end

    # Set this to true to enable experimental use of posix_spawn.
    #
    # source://childprocess//lib/childprocess.rb#101
    def posix_spawn=(bool); end

    # @return [Boolean]
    #
    # source://childprocess//lib/childprocess.rb#72
    def posix_spawn?; end

    # @return [Boolean]
    #
    # source://childprocess//lib/childprocess.rb#56
    def unix?; end

    # @return [Boolean]
    #
    # source://childprocess//lib/childprocess.rb#68
    def windows?; end

    private

    # @return [Boolean] `true` if this Ruby represents `1` in 64 bits (8 bytes).
    #
    # source://childprocess//lib/childprocess.rb#199
    def is_64_bit?; end

    # source://childprocess//lib/childprocess.rb#179
    def warn_once(msg); end

    # Workaround: detect the situation that an older Darwin Ruby is actually
    # 64-bit, but is misreporting cpu as i686, which would imply 32-bit.
    #
    # @return [Boolean] `true` if:
    #   (a) on Mac OS X
    #   (b) actually running in 64-bit mode
    #
    # source://childprocess//lib/childprocess.rb#194
    def workaround_older_macosx_misreported_cpu?; end
  end
end

# source://childprocess//lib/childprocess/abstract_io.rb#2
class ChildProcess::AbstractIO
  # @api private
  #
  # source://childprocess//lib/childprocess/abstract_io.rb#24
  def _stdin=(io); end

  # source://childprocess//lib/childprocess/abstract_io.rb#5
  def inherit!; end

  # Returns the value of attribute stderr.
  #
  # source://childprocess//lib/childprocess/abstract_io.rb#3
  def stderr; end

  # source://childprocess//lib/childprocess/abstract_io.rb#10
  def stderr=(io); end

  # Returns the value of attribute stdin.
  #
  # source://childprocess//lib/childprocess/abstract_io.rb#3
  def stdin; end

  # Returns the value of attribute stdout.
  #
  # source://childprocess//lib/childprocess/abstract_io.rb#3
  def stdout; end

  # source://childprocess//lib/childprocess/abstract_io.rb#15
  def stdout=(io); end

  private

  # @raise [SubclassResponsibility]
  #
  # source://childprocess//lib/childprocess/abstract_io.rb#31
  def check_type(io); end
end

# source://childprocess//lib/childprocess/abstract_process.rb#2
class ChildProcess::AbstractProcess
  # Create a new process with the given args.
  #
  # @api private
  # @return [AbstractProcess] a new instance of AbstractProcess
  # @see ChildProcess.build
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#42
  def initialize(args); end

  # Is this process running?
  #
  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#133
  def alive?; end

  # Returns true if the process has exited and the exit code was not 0.
  #
  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#143
  def crashed?; end

  # Set the child's current working directory.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#25
  def cwd; end

  # Set the child's current working directory.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#25
  def cwd=(_arg0); end

  # Set this to true if you do not care about when or if the process quits.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#10
  def detach; end

  # Set this to true if you do not care about when or if the process quits.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#10
  def detach=(_arg0); end

  # Set this to true if you want to write to the process' stdin (process.io.stdin)
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#15
  def duplex; end

  # Set this to true if you want to write to the process' stdin (process.io.stdin)
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#15
  def duplex=(_arg0); end

  # Modify the child's environment variables
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#20
  def environment; end

  # Returns the value of attribute exit_code.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#5
  def exit_code; end

  # Did the process exit?
  #
  # @raise [SubclassResponsibility]
  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#113
  def exited?; end

  # Returns a ChildProcess::AbstractIO subclass to configure the child's IO streams.
  #
  # @raise [SubclassResponsibility]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#62
  def io; end

  # Set this to true to make the child process the leader of a new process group
  #
  # This can be used to make sure that all grandchildren are killed
  # when the child process dies.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#33
  def leader; end

  # Set this to true to make the child process the leader of a new process group
  #
  # This can be used to make sure that all grandchildren are killed
  # when the child process dies.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#33
  def leader=(_arg0); end

  # @raise [SubclassResponsibility]
  # @return [Integer] the pid of the process after it has started
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#70
  def pid; end

  # Wait for the process to exit, raising a ChildProcess::TimeoutError if
  # the timeout expires.
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#152
  def poll_for_exit(timeout); end

  # Launch the child process
  #
  # @return [AbstractProcess] self
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#80
  def start; end

  # Has the process started?
  #
  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#123
  def started?; end

  # Forcibly terminate the process, using increasingly harsher methods if possible.
  #
  # @param timeout [Integer] (3) Seconds to wait before trying the next method.
  # @raise [SubclassResponsibility]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#93
  def stop(timeout = T.unsafe(nil)); end

  # Block until the process has been terminated.
  #
  # @raise [SubclassResponsibility]
  # @return [Integer] The exit status of the process
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#103
  def wait; end

  private

  # @raise [Error]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#187
  def assert_started; end

  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#171
  def detach?; end

  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#175
  def duplex?; end

  # @raise [SubclassResponsibility]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#167
  def launch_process; end

  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/abstract_process.rb#179
  def leader?; end

  # source://childprocess//lib/childprocess/abstract_process.rb#183
  def log(*args); end
end

# source://childprocess//lib/childprocess/abstract_process.rb#3
ChildProcess::AbstractProcess::POLL_INTERVAL = T.let(T.unsafe(nil), Float)

# source://childprocess//lib/childprocess/errors.rb#2
class ChildProcess::Error < ::StandardError; end

# source://childprocess//lib/childprocess/errors.rb#11
class ChildProcess::InvalidEnvironmentVariable < ::ChildProcess::Error; end

# source://childprocess//lib/childprocess/errors.rb#14
class ChildProcess::LaunchError < ::ChildProcess::Error; end

# source://childprocess//lib/childprocess/errors.rb#17
class ChildProcess::MissingFFIError < ::ChildProcess::Error
  # @return [MissingFFIError] a new instance of MissingFFIError
  #
  # source://childprocess//lib/childprocess/errors.rb#18
  def initialize; end
end

# source://childprocess//lib/childprocess/errors.rb#28
class ChildProcess::MissingPlatformError < ::ChildProcess::Error
  # @return [MissingPlatformError] a new instance of MissingPlatformError
  #
  # source://childprocess//lib/childprocess/errors.rb#29
  def initialize; end
end

# source://childprocess//lib/childprocess/errors.rb#8
class ChildProcess::SubclassResponsibility < ::ChildProcess::Error; end

# source://childprocess//lib/childprocess/errors.rb#5
class ChildProcess::TimeoutError < ::ChildProcess::Error; end

# source://childprocess//lib/childprocess/unix.rb#2
module ChildProcess::Unix; end

# source://childprocess//lib/childprocess/unix/fork_exec_process.rb#3
class ChildProcess::Unix::ForkExecProcess < ::ChildProcess::Unix::Process
  private

  # source://childprocess//lib/childprocess/unix/fork_exec_process.rb#6
  def launch_process; end

  # source://childprocess//lib/childprocess/unix/fork_exec_process.rb#72
  def set_env; end
end

# source://childprocess//lib/childprocess/unix/io.rb#3
class ChildProcess::Unix::IO < ::ChildProcess::AbstractIO
  private

  # source://childprocess//lib/childprocess/unix/io.rb#6
  def check_type(io); end
end

# source://childprocess//lib/childprocess/unix/process.rb#3
class ChildProcess::Unix::Process < ::ChildProcess::AbstractProcess
  # @return [Boolean]
  #
  # source://childprocess//lib/childprocess/unix/process.rb#28
  def exited?; end

  # source://childprocess//lib/childprocess/unix/process.rb#6
  def io; end

  # Returns the value of attribute pid.
  #
  # source://childprocess//lib/childprocess/unix/process.rb#4
  def pid; end

  # source://childprocess//lib/childprocess/unix/process.rb#10
  def stop(timeout = T.unsafe(nil)); end

  # source://childprocess//lib/childprocess/unix/process.rb#47
  def wait; end

  private

  # source://childprocess//lib/childprocess/unix/process.rb#80
  def _pid; end

  # source://childprocess//lib/childprocess/unix/process.rb#65
  def send_kill; end

  # source://childprocess//lib/childprocess/unix/process.rb#69
  def send_signal(sig); end

  # source://childprocess//lib/childprocess/unix/process.rb#61
  def send_term; end

  # source://childprocess//lib/childprocess/unix/process.rb#76
  def set_exit_code(status); end
end

# source://childprocess//lib/childprocess/version.rb#2
ChildProcess::VERSION = T.let(T.unsafe(nil), String)

# missing on rubinius
class FFI::MemoryPointer < ::FFI::Pointer
  def initialize(*_arg0); end

  class << self
    def from_string(_arg0); end
  end
end
