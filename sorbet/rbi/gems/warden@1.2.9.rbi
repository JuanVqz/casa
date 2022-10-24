# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `warden` gem.
# Please instead update this file by running `bin/tapioca gem warden`.

module Warden
  extend ::Warden::Test::WardenHelpers

  class << self
    # Provides helper methods to warden for testing.
    #
    # To setup warden in test mode call the +test_mode!+ method on warden
    #
    # This will provide a number of methods.
    # Warden.on_next_request(&blk) - captures a block which is yielded the warden proxy on the next request
    # Warden.test_reset! - removes any captured blocks that would have been executed on the next request
    #
    # Warden.test_reset! should be called in after blocks for rspec, or teardown methods for Test::Unit
    #
    # @example
    #   Warden.test_mode!
    #
    # source://warden//lib/warden.rb#34
    def test_mode!; end
  end
end

# This class is yielded inside Warden::Manager. If you have a plugin and want to
# add more configuration to warden, you just need to extend this class.
class Warden::Config < ::Hash
  # @return [Config] a new instance of Config
  #
  # source://warden//lib/warden/config.rb#37
  def initialize(other = T.unsafe(nil)); end

  # source://warden//lib/warden/config.rb#24
  def default_scope; end

  # source://warden//lib/warden/config.rb#28
  def default_scope=(value); end

  # Set the default strategies to use.
  # :api: public
  #
  # source://warden//lib/warden/config.rb#63
  def default_strategies(*strategies); end

  # source://warden//lib/warden/config.rb#24
  def failure_app; end

  # source://warden//lib/warden/config.rb#28
  def failure_app=(value); end

  # source://warden//lib/warden/config.rb#24
  def intercept_401; end

  # source://warden//lib/warden/config.rb#28
  def intercept_401=(value); end

  # A short hand way to set up a particular scope
  # :api: public
  #
  # source://warden//lib/warden/config.rb#74
  def scope_defaults(scope, opts = T.unsafe(nil)); end

  # Hook from configuration to serialize_from_session.
  # :api: public
  #
  # source://warden//lib/warden/config.rb#101
  def serialize_from_session(*args, &block); end

  # Hook from configuration to serialize_into_session.
  # :api: public
  #
  # source://warden//lib/warden/config.rb#95
  def serialize_into_session(*args, &block); end

  # Do not raise an error if a missing strategy is given.
  # :api: plugin
  #
  # source://warden//lib/warden/config.rb#53
  def silence_missing_strategies!; end

  # @return [Boolean]
  #
  # source://warden//lib/warden/config.rb#57
  def silence_missing_strategies?; end

  # Quick accessor to strategies from manager
  # :api: public
  #
  # source://warden//lib/warden/config.rb#89
  def strategies; end

  protected

  # source://warden//lib/warden/config.rb#107
  def deep_dup(key, other); end

  private

  # source://warden//lib/warden/config.rb#45
  def initialize_copy(other); end

  class << self
    # Creates an accessor that simply sets and reads a key in the hash:
    #
    #   class Config < Hash
    #     hash_accessor :failure_app
    #   end
    #
    #   config = Config.new
    #   config.failure_app = Foo
    #   config[:failure_app] #=> Foo
    #
    #   config[:failure_app] = Bar
    #   config.failure_app #=> Bar
    #
    # source://warden//lib/warden/config.rb#21
    def hash_accessor(*names); end
  end
end

module Warden::Hooks
  # Provides access to the callback array for after_failed_fetch
  # :api: private
  #
  # source://warden//lib/warden/hooks.rb#145
  def _after_failed_fetch; end

  # Provides access to the array of after_set_user blocks to run
  # :api: private
  #
  # source://warden//lib/warden/hooks.rb#67
  def _after_set_user; end

  # Provides access to the callback array for before_failure
  # :api: private
  #
  # source://warden//lib/warden/hooks.rb#117
  def _before_failure; end

  # Provides access to the callback array for before_logout
  # :api: private
  #
  # source://warden//lib/warden/hooks.rb#173
  def _before_logout; end

  # Provides access to the callback array for before_logout
  # :api: private
  #
  # source://warden//lib/warden/hooks.rb#198
  def _on_request; end

  # Hook to _run_callbacks asserting for conditions.
  #
  # source://warden//lib/warden/hooks.rb#7
  def _run_callbacks(kind, *args); end

  # after_authentication is just a wrapper to after_set_user, which is only invoked
  # when the user is set through the authentication path. The options and yielded arguments
  # are the same as in after_set_user.
  #
  # :api: public
  #
  # source://warden//lib/warden/hooks.rb#76
  def after_authentication(options = T.unsafe(nil), method = T.unsafe(nil), &block); end

  # A callback that runs if no user could be fetched, meaning there is now no user logged in.
  #
  # Parameters:
  # <options> Some options which specify when the callback should be executed
  #   scope  - Executes the callback only if it matches the scope(s) given
  # <block> A block to contain logic for the callback
  #   Block Parameters: |user, auth, scope|
  #     user - The authenticated user for the current scope
  #     auth - The warden proxy object
  #     opts - any options passed into the authenticate call including :scope
  #
  # Example:
  #   Warden::Manager.after_failed_fetch do |user, auth, opts|
  #     I18n.locale = :en
  #   end
  #
  # :api: public
  #
  # @raise [BlockNotGiven]
  #
  # source://warden//lib/warden/hooks.rb#138
  def after_failed_fetch(options = T.unsafe(nil), method = T.unsafe(nil), &block); end

  # after_fetch is just a wrapper to after_set_user, which is only invoked
  # when the user is fetched from session. The options and yielded arguments
  # are the same as in after_set_user.
  #
  # :api: public
  #
  # source://warden//lib/warden/hooks.rb#85
  def after_fetch(options = T.unsafe(nil), method = T.unsafe(nil), &block); end

  # A callback hook set to run every time after a user is set.
  # This callback is triggered the first time one of those three events happens
  # during a request: :authentication, :fetch (from session) and :set_user (when manually set).
  # You can supply as many hooks as you like, and they will be run in order of declaration.
  #
  # If you want to run the callbacks for a given scope and/or event, you can specify them as options.
  # See parameters and example below.
  #
  # Parameters:
  # <options> Some options which specify when the callback should be executed
  #   scope  - Executes the callback only if it matches the scope(s) given
  #   only   - Executes the callback only if it matches the event(s) given
  #   except - Executes the callback except if it matches the event(s) given
  # <block> A block where you can set arbitrary logic to run every time a user is set
  #   Block Parameters: |user, auth, opts|
  #     user - The user object that is being set
  #     auth - The raw authentication proxy object.
  #     opts - any options passed into the set_user call including :scope
  #
  # Example:
  #   Warden::Manager.after_set_user do |user,auth,opts|
  #     scope = opts[:scope]
  #     if auth.session["#{scope}.last_access"].to_i > (Time.now - 5.minutes)
  #       auth.logout(scope)
  #       throw(:warden, :scope => scope, :reason => "Times Up")
  #     end
  #     auth.session["#{scope}.last_access"] = Time.now
  #   end
  #
  #   Warden::Manager.after_set_user :except => :fetch do |user,auth,opts|
  #     user.login_count += 1
  #   end
  #
  # :api: public
  #
  # @raise [BlockNotGiven]
  #
  # source://warden//lib/warden/hooks.rb#53
  def after_set_user(options = T.unsafe(nil), method = T.unsafe(nil), &block); end

  # A callback that runs just prior to the failure application being called.
  # This callback occurs after PATH_INFO has been modified for the failure (default /unauthenticated)
  # In this callback you can mutate the environment as required by the failure application
  # If a Rails controller were used for the failure_app for example, you would need to set request[:params][:action] = :unauthenticated
  #
  # Parameters:
  # <options> Some options which specify when the callback should be executed
  #   scope  - Executes the callback only if it matches the scope(s) given
  # <block> A block to contain logic for the callback
  #   Block Parameters: |env, opts|
  #     env - The rack env hash
  #     opts - any options passed into the authenticate call including :scope
  #
  # Example:
  #   Warden::Manager.before_failure do |env, opts|
  #     params = Rack::Request.new(env).params
  #     params[:action] = :unauthenticated
  #     params[:warden_failure] = opts
  #   end
  #
  # :api: public
  #
  # @raise [BlockNotGiven]
  #
  # source://warden//lib/warden/hooks.rb#110
  def before_failure(options = T.unsafe(nil), method = T.unsafe(nil), &block); end

  # A callback that runs just prior to the logout of each scope.
  #
  # Parameters:
  # <options> Some options which specify when the callback should be executed
  #   scope  - Executes the callback only if it matches the scope(s) given
  # <block> A block to contain logic for the callback
  #   Block Parameters: |user, auth, scope|
  #     user - The authenticated user for the current scope
  #     auth - The warden proxy object
  #     opts - any options passed into the authenticate call including :scope
  #
  # Example:
  #   Warden::Manager.before_logout do |user, auth, opts|
  #     user.forget_me!
  #   end
  #
  # :api: public
  #
  # @raise [BlockNotGiven]
  #
  # source://warden//lib/warden/hooks.rb#166
  def before_logout(options = T.unsafe(nil), method = T.unsafe(nil), &block); end

  # A callback that runs on each request, just after the proxy is initialized
  #
  # Parameters:
  # <block> A block to contain logic for the callback
  #   Block Parameters: |proxy|
  #     proxy - The warden proxy object for the request
  #
  # Example:
  #   user = "A User"
  #   Warden::Manager.on_request do |proxy|
  #     proxy.set_user = user
  #   end
  #
  # :api: public
  #
  # @raise [BlockNotGiven]
  #
  # source://warden//lib/warden/hooks.rb#191
  def on_request(options = T.unsafe(nil), method = T.unsafe(nil), &block); end

  # source://warden//lib/warden/hooks.rb#206
  def prepend_after_authentication(options = T.unsafe(nil), &block); end

  # source://warden//lib/warden/hooks.rb#206
  def prepend_after_fetch(options = T.unsafe(nil), &block); end

  # source://warden//lib/warden/hooks.rb#206
  def prepend_after_set_user(options = T.unsafe(nil), &block); end

  # source://warden//lib/warden/hooks.rb#206
  def prepend_before_failure(options = T.unsafe(nil), &block); end

  # source://warden//lib/warden/hooks.rb#206
  def prepend_before_logout(options = T.unsafe(nil), &block); end

  # source://warden//lib/warden/hooks.rb#206
  def prepend_on_request(options = T.unsafe(nil), &block); end
end

# The middleware for Rack Authentication
# The middleware requires that there is a session upstream
# The middleware injects an authentication object into
# the rack environment hash
class Warden::Manager
  extend ::Warden::Hooks

  # Initialize the middleware. If a block is given, a Warden::Config is yielded so you can properly
  # configure the Warden::Manager.
  # :api: public
  #
  # @return [Manager] a new instance of Manager
  # @yield [@config]
  #
  # source://warden//lib/warden/manager.rb#19
  def initialize(app, options = T.unsafe(nil)); end

  # :api: private
  #
  # source://warden//lib/warden/manager.rb#51
  def _run_callbacks(*args); end

  # Invoke the application guarding for throw :warden.
  # If this is downstream from another warden instance, don't do anything.
  # :api: private
  #
  # source://warden//lib/warden/manager.rb#30
  def call(env); end

  # Returns the value of attribute config.
  #
  # source://warden//lib/warden/manager.rb#14
  def config; end

  # Sets the attribute config
  #
  # @param value the value to set the attribute config to.
  #
  # source://warden//lib/warden/manager.rb#14
  def config=(_arg0); end

  private

  # Calls the failure app.
  # The before_failure hooks are run on each failure
  # :api: private
  #
  # source://warden//lib/warden/manager.rb#136
  def call_failure_app(env, options = T.unsafe(nil)); end

  # source://warden//lib/warden/manager.rb#97
  def handle_chain_result(status, result, env); end

  # @return [Boolean]
  #
  # source://warden//lib/warden/manager.rb#105
  def intercept_401?(env); end

  # When a request is unauthenticated, here's where the processing occurs.
  # It looks at the result of the proxy to see if it's been executed and what action to take.
  # :api: private
  #
  # source://warden//lib/warden/manager.rb#112
  def process_unauthenticated(env, options = T.unsafe(nil)); end

  class << self
    # Reconstitutes the user from the session.
    # Use the results of user_session_key to reconstitute the user from the session on requests after the initial login
    # You can supply different methods of de-serialization for different scopes by passing a scope symbol
    #
    # Example:
    #   Warden::Manager.serialize_from_session{ |id| User.get(id) }
    #   # With Scope:
    #   Warden::Manager.serialize_from_session(:admin) { |id| AdminUser.get(id) }
    #
    # :api: public
    #
    # source://warden//lib/warden/manager.rb#84
    def serialize_from_session(scope = T.unsafe(nil), &block); end

    # Prepares the user to serialize into the session.
    # Any object that can be serialized into the session in some way can be used as a "user" object
    # Generally however complex object should not be stored in the session.
    # If possible store only a "key" of the user object that will allow you to reconstitute it.
    #
    # You can supply different methods of serialization for different scopes by passing a scope symbol
    #
    # Example:
    #   Warden::Manager.serialize_into_session{ |user| user.id }
    #   # With Scope:
    #   Warden::Manager.serialize_into_session(:admin) { |user| user.id }
    #
    # :api: public
    #
    # source://warden//lib/warden/manager.rb#69
    def serialize_into_session(scope = T.unsafe(nil), &block); end
  end
end

module Warden::Mixins; end

module Warden::Mixins::Common
  # source://devise/4.8.1/lib/devise/rails/warden_compat.rb#12
  def cookies; end

  # Convenience method to access the rack request params
  # :api: public
  #
  # source://warden//lib/warden/mixins/common.rb#32
  def params; end

  # Convenience method to access the session
  # :api: public
  # Alias :session to :raw_session since the former will be user API for storing scoped data.
  #
  # source://warden//lib/warden/mixins/common.rb#9
  def raw_session; end

  # Convenience method to access the rack request.
  # :api: public
  #
  # source://devise/4.8.1/lib/devise/rails/warden_compat.rb#4
  def request; end

  # Resets the session.  By using this non-hash like sessions can
  # be cleared by overwriting this method in a plugin
  #
  # @api overwritable
  #
  # source://devise/4.8.1/lib/devise/rails/warden_compat.rb#8
  def reset_session!; end

  # Convenience method to access the session
  # :api: public
  #
  # source://warden//lib/warden/mixins/common.rb#9
  def session; end

  # Provides a warden repository for cookies. Those are sent to the client
  # when the response is streamed back from the app.
  # :api: public
  #
  # source://warden//lib/warden/mixins/common.rb#25
  def warden_cookies; end
end

class Warden::NotAuthenticated < ::StandardError; end

class Warden::Proxy
  include ::Warden::Mixins::Common
  extend ::Forwardable

  # @return [Proxy] a new instance of Proxy
  #
  # source://warden//lib/warden/proxy.rb#28
  def initialize(env, manager); end

  # Check to see if this is an asset request
  # :api: public
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/proxy.rb#314
  def asset_request?; end

  # Run the authentication strategies for the given strategies.
  # If there is already a user logged in for a given scope, the strategies are not run
  # This does not halt the flow of control and is a passive attempt to authenticate only
  # When scope is not specified, the default_scope is assumed.
  #
  # Parameters:
  #   args - a list of symbols (labels) that name the strategies to attempt
  #   opts - an options hash that contains the :scope of the user to check
  #
  # Example:
  #   env['warden'].authenticate(:password, :basic, :scope => :sudo)
  #
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#109
  def authenticate(*args); end

  # The same as +authenticate+ except on failure it will throw an :warden symbol causing the request to be halted
  # and rendered through the +failure_app+
  #
  # Example
  #   env['warden'].authenticate!(:password, :scope => :publisher) # throws if it cannot authenticate
  #
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#132
  def authenticate!(*args); end

  # Same API as authenticate, but returns a boolean instead of a user.
  # The difference between this method (authenticate?) and authenticated?
  # is that the former will run strategies if the user has not yet been
  # authenticated, and the second relies on already performed ones.
  # :api: public
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/proxy.rb#119
  def authenticate?(*args); end

  # Check to see if there is an authenticated user for the given scope.
  # This brings the user from the session, but does not run strategies before doing so.
  # If you want strategies to be run, please check authenticate?.
  #
  # Parameters:
  #   scope - the scope to check for authentication. Defaults to default_scope
  #
  # Example:
  #   env['warden'].authenticated?(:admin)
  #
  # :api: public
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/proxy.rb#149
  def authenticated?(scope = T.unsafe(nil)); end

  # Clear the cache of performed strategies so far. Warden runs each
  # strategy just once during the request lifecycle. You can clear the
  # strategies cache if you want to allow a strategy to be run more than
  # once.
  #
  # This method has the same API as authenticate, allowing you to clear
  # specific strategies for given scope:
  #
  # Parameters:
  #   args - a list of symbols (labels) that name the strategies to attempt
  #   opts - an options hash that contains the :scope of the user to check
  #
  # Example:
  #   # Clear all strategies for the configured default_scope
  #   env['warden'].clear_strategies_cache!
  #
  #   # Clear all strategies for the :admin scope
  #   env['warden'].clear_strategies_cache!(:scope => :admin)
  #
  #   # Clear password strategy for the :admin scope
  #   env['warden'].clear_strategies_cache!(:password, :scope => :admin)
  #
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#77
  def clear_strategies_cache!(*args); end

  # An accessor to the rack env hash, the proxy owner and its config
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#14
  def config; end

  # Provides a way to return a 401 without warden deferring to the failure app
  # The result is a direct passthrough of your own response
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#298
  def custom_failure!; end

  # Check to see if the custom failure flag has been set
  # :api: public
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/proxy.rb#304
  def custom_failure?; end

  # source://forwardable/1.3.2/forwardable.rb#229
  def custom_response(*args, **_arg1, &block); end

  # source://forwardable/1.3.2/forwardable.rb#229
  def default_strategies(*args, **_arg1, &block); end

  # An accessor to the rack env hash, the proxy owner and its config
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#14
  def env; end

  # Lazily initiate errors object in session.
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#42
  def errors; end

  # source://forwardable/1.3.2/forwardable.rb#229
  def headers(*args, **_arg1, &block); end

  # source://warden//lib/warden/proxy.rb#318
  def inspect(*args); end

  # Locks the proxy so new users cannot authenticate during the
  # request lifecycle. This is useful when the request cannot
  # be verified (for example, using a CSRF verification token).
  # Notice that already authenticated users are kept as so.
  #
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#92
  def lock!; end

  # Provides logout functionality.
  # The logout also manages any authenticated data storage and clears it when a user logs out.
  #
  # Parameters:
  #   scopes - a list of scopes to logout
  #
  # Example:
  #  # Logout everyone and clear the session
  #  env['warden'].logout
  #
  #  # Logout the default user but leave the rest of the session alone
  #  env['warden'].logout(:default)
  #
  #  # Logout the :publisher and :admin user
  #  env['warden'].logout(:publisher, :admin)
  #
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#266
  def logout(*scopes); end

  # An accessor to the rack env hash, the proxy owner and its config
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#14
  def manager; end

  # Proxy through to the authentication strategy to find out the message that was generated.
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#291
  def message; end

  # Run the on_request callbacks
  # :api: private
  #
  # source://warden//lib/warden/proxy.rb#36
  def on_request; end

  # proxy methods through to the winning strategy
  # :api: private
  #
  # source://warden//lib/warden/proxy.rb#285
  def result; end

  # Provides a scoped session data for authenticated users.
  # Warden manages clearing out this data when a user logs out
  #
  # Example
  #  # default scope
  #  env['warden'].session[:foo] = "bar"
  #
  #  # :sudo scope
  #  env['warden'].session(:sudo)[:foo] = "bar"
  #
  # :api: public
  #
  # @raise [NotAuthenticated]
  #
  # source://warden//lib/warden/proxy.rb#244
  def session(scope = T.unsafe(nil)); end

  # Points to a SessionSerializer instance responsible for handling
  # everything related with storing, fetching and removing the user
  # session.
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#50
  def session_serializer; end

  # Manually set the user into the session and auth proxy
  #
  # Parameters:
  #   user - An object that has been setup to serialize into and out of the session.
  #   opts - An options hash.  Use the :scope option to set the scope of the user, set the :store option to false to skip serializing into the session, set the :run_callbacks to false to skip running the callbacks (the default is true).
  #
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#170
  def set_user(user, opts = T.unsafe(nil)); end

  # source://forwardable/1.3.2/forwardable.rb#229
  def status(*args, **_arg1, &block); end

  # source://warden//lib/warden/proxy.rb#322
  def to_s(*args); end

  # Same API as authenticated?, but returns false when authenticated.
  # :api: public
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/proxy.rb#157
  def unauthenticated?(scope = T.unsafe(nil)); end

  # Provides access to the user object in a given scope for a request.
  # Will be nil if not logged in. Please notice that this method does not
  # perform strategies.
  #
  # Example:
  #   # without scope (default user)
  #   env['warden'].user
  #
  #   # with scope
  #   env['warden'].user(:admin)
  #
  #   # as a Hash
  #   env['warden'].user(:scope => :admin)
  #
  #   # with default scope and run_callbacks option
  #   env['warden'].user(:run_callbacks => false)
  #
  #  # with a scope and run_callbacks option
  #  env['warden'].user(:scope => :admin, :run_callbacks => true)
  #
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#217
  def user(argument = T.unsafe(nil)); end

  # An accessor to the rack env hash, the proxy owner and its config
  # :api: public
  #
  # source://warden//lib/warden/proxy.rb#14
  def winning_strategies; end

  # An accessor to the winning strategy
  # :api: private
  #
  # source://warden//lib/warden/proxy.rb#10
  def winning_strategy; end

  # An accessor to the winning strategy
  # :api: private
  #
  # source://warden//lib/warden/proxy.rb#10
  def winning_strategy=(_arg0); end

  private

  # Fetches strategies and keep them in a hash cache.
  #
  # source://warden//lib/warden/proxy.rb#379
  def _fetch_strategy(name, scope); end

  # source://warden//lib/warden/proxy.rb#328
  def _perform_authentication(*args); end

  # source://warden//lib/warden/proxy.rb#345
  def _retrieve_scope_and_opts(args); end

  # Run the strategies for a given scope
  #
  # source://warden//lib/warden/proxy.rb#353
  def _run_strategies_for(scope, args); end

  # Updates the winning strategy for a given scope
  #
  # source://warden//lib/warden/proxy.rb#390
  def _update_winning_strategy(strategy, scope); end
end

# source://warden//lib/warden/proxy.rb#20
Warden::Proxy::ENV_SESSION_OPTIONS = T.let(T.unsafe(nil), String)

# source://warden//lib/warden/proxy.rb#19
Warden::Proxy::ENV_WARDEN_ERRORS = T.let(T.unsafe(nil), String)

# Lifted from DataMapper's dm-validations plugin :)
#
# @author Guy van den Berg
# @since DM 0.9
class Warden::Proxy::Errors
  include ::Enumerable

  # Add a authentication error. Use the field_name :general if the errors does
  # not apply to a specific field of the Resource.
  #
  # @param field_name [Symbol] the name of the field that caused the error
  # @param message [String] the message to add
  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#22
  def add(field_name, message); end

  # Clear existing authentication errors.
  #
  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#13
  def clear!; end

  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#41
  def each; end

  # @return [Boolean]
  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#48
  def empty?; end

  # Collect all errors into a single list.
  #
  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#27
  def full_messages; end

  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#52
  def method_missing(meth, *args, &block); end

  # Return authentication errors for a particular field_name.
  #
  # @param field_name [Symbol] the name of the field you want an error for
  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#36
  def on(field_name); end

  private

  # @return [Boolean]
  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#61
  def blank?(thing); end

  # @since DM 0.9
  #
  # source://warden//lib/warden/errors.rb#57
  def errors; end
end

class Warden::SessionSerializer
  # @return [SessionSerializer] a new instance of SessionSerializer
  #
  # source://warden//lib/warden/session_serializer.rb#7
  def initialize(env); end

  # source://warden//lib/warden/session_serializer.rb#44
  def delete(scope, user = T.unsafe(nil)); end

  # source://warden//lib/warden/session_serializer.rb#19
  def deserialize(key); end

  # Returns the value of attribute env.
  #
  # source://warden//lib/warden/session_serializer.rb#5
  def env; end

  # source://warden//lib/warden/session_serializer.rb#30
  def fetch(scope); end

  # source://warden//lib/warden/session_serializer.rb#11
  def key_for(scope); end

  # source://warden//lib/warden/session_serializer.rb#15
  def serialize(user); end

  # We can't cache this result because the session can be lazy loaded
  #
  # source://warden//lib/warden/session_serializer.rb#49
  def session; end

  # source://warden//lib/warden/session_serializer.rb#23
  def store(user, scope); end

  # @return [Boolean]
  #
  # source://warden//lib/warden/session_serializer.rb#40
  def stored?(scope); end
end

module Warden::Strategies
  class << self
    # Provides access to strategies by label
    # :api: public
    #
    # source://warden//lib/warden/strategies.rb#32
    def [](label); end

    # :api: private
    #
    # source://warden//lib/warden/strategies.rb#43
    def _strategies; end

    # Add a strategy and store it in a hash.
    #
    # source://warden//lib/warden/strategies.rb#7
    def add(label, strategy = T.unsafe(nil), &block); end

    # Clears all declared.
    # :api: public
    #
    # source://warden//lib/warden/strategies.rb#38
    def clear!; end

    # Update a previously given strategy.
    #
    # source://warden//lib/warden/strategies.rb#24
    def update(label, &block); end
  end
end

# A strategy is a place where you can put logic related to authentication. Any strategy inherits
# from Warden::Strategies::Base.
#
# The Warden::Strategies.add method is a simple way to provide custom strategies.
# You _must_ declare an @authenticate!@ method.
# You _may_ provide a @valid?@ method.
# The valid method should return true or false depending on if the strategy is a valid one for the request.
#
# The parameters for Warden::Strategies.add method are:
#   <label: Symbol> The label is the name given to a strategy.  Use the label to refer to the strategy when authenticating
#   <strategy: Class|nil> The optional strategy argument if set _must_ be a class that inherits from Warden::Strategies::Base and _must_
#                         implement an @authenticate!@ method
#   <block> The block acts as a convenient way to declare your strategy.  Inside is the class definition of a strategy.
#
# Examples:
#
#   Block Declared Strategy:
#    Warden::Strategies.add(:foo) do
#      def authenticate!
#        # authentication logic
#      end
#    end
#
#    Class Declared Strategy:
#      Warden::Strategies.add(:foo, MyStrategy)
class Warden::Strategies::Base
  include ::Warden::Mixins::Common

  # :api: private
  #
  # @return [Base] a new instance of Base
  #
  # source://warden//lib/warden/strategies/base.rb#44
  def initialize(env, scope = T.unsafe(nil)); end

  # The method that is called from above. This method calls the underlying authenticate! method
  # :api: private
  #
  # source://warden//lib/warden/strategies/base.rb#53
  def _run!; end

  # Marks this strategy as not performed.
  # :api: private
  #
  # source://warden//lib/warden/strategies/base.rb#67
  def clear!; end

  # Return a custom rack array.  You must throw an :warden symbol to activate this
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#174
  def custom!(response); end

  # :api: private
  #
  # source://warden//lib/warden/strategies/base.rb#36
  def custom_response; end

  # :api: private
  #
  # source://warden//lib/warden/strategies/base.rb#36
  def custom_response=(_arg0); end

  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#39
  def env; end

  # Access to the errors object.
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#87
  def errors; end

  # Causes the strategy to fail, but not halt.  The strategies will cascade after this failure and warden will check the next strategy.  The last strategy to fail will have it's message displayed.
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#145
  def fail(message = T.unsafe(nil)); end

  # This causes the strategy to fail.  It does not throw an :warden symbol to drop the request out to the failure application
  # You must throw an :warden symbol somewhere in the application to enforce this
  # Halts the strategies so that this is the last strategy checked
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#137
  def fail!(message = T.unsafe(nil)); end

  # Cause the processing of the strategies to stop and cascade no further
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#93
  def halt!; end

  # Checks to see if a strategy was halted
  # :api: public
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/strategies/base.rb#99
  def halted?; end

  # Provides access to the headers hash for setting custom headers
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#79
  def headers(header = T.unsafe(nil)); end

  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#33
  def message; end

  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#33
  def message=(_arg0); end

  # A simple method to return from authenticate! if you want to ignore this strategy
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#111
  def pass; end

  # Returns if this strategy was already performed.
  # :api: private
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/strategies/base.rb#61
  def performed?; end

  # Causes the authentication to redirect.  An :warden symbol must be thrown to actually execute this redirect
  #
  # Parameters:
  #  url <String> - The string representing the URL to be redirected to
  #  params <Hash> - Any parameters to encode into the URL
  #  opts <Hash> - Any options to redirect with.
  #    available options: permanent => (true || false)
  #
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#159
  def redirect!(url, params = T.unsafe(nil), opts = T.unsafe(nil)); end

  # :api: private
  #
  # source://warden//lib/warden/strategies/base.rb#36
  def result; end

  # :api: private
  #
  # source://warden//lib/warden/strategies/base.rb#36
  def result=(_arg0); end

  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#39
  def scope; end

  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#39
  def status; end

  # Checks to see if a strategy should result in a permanent login
  # :api: public
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/strategies/base.rb#105
  def store?; end

  # Whenever you want to provide a user object as "authenticated" use the +success!+ method.
  # This will halt the strategy, and set the user in the appropriate scope.
  # It is the "login" method
  #
  # Parameters:
  #   user - The user object to login.  This object can be anything you have setup to serialize in and out of the session
  #
  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#126
  def success!(user, message = T.unsafe(nil)); end

  # Returns true only if the result is a success and a user was assigned.
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/strategies/base.rb#114
  def successful?; end

  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#33
  def user; end

  # :api: public
  #
  # source://warden//lib/warden/strategies/base.rb#33
  def user=(_arg0); end

  # Acts as a guarding method for the strategy.
  # If #valid? responds false, the strategy will not be executed
  # Overwrite with your own logic
  # :api: overwritable
  #
  # @return [Boolean]
  #
  # source://warden//lib/warden/strategies/base.rb#75
  def valid?; end
end

module Warden::Test; end

# A collection of test helpers for testing full stack rack applications using Warden
# These provide the ability to login and logout on any given request
# Note: During the teardown phase of your specs you should include: Warden.test_reset!
module Warden::Test::Helpers
  # A helper method that will perform a login of a user in warden for the next request.
  # Provide it the same options as you would to Warden::Proxy#set_user
  #
  # @api public
  # @see Warden::Proxy#set_user
  #
  # source://warden//lib/warden/test/helpers.rb#18
  def login_as(user, opts = T.unsafe(nil)); end

  # Logs out a user from the session.
  # Without arguments, all users will be logged out
  # Provide a list of scopes to only log out users with that scope.
  #
  # @api public
  # @see Warden::Proxy#logout
  #
  # source://warden//lib/warden/test/helpers.rb#30
  def logout(*scopes); end

  class << self
    # @private
    #
    # source://warden//lib/warden/test/helpers.rb#10
    def included(_base); end
  end
end

# A mock of an application to get a Warden object to test on
# Note: During the teardown phase of your specs you should include: Warden.test_reset!
module Warden::Test::Mock
  # A helper method that provides the warden object by mocking the env variable.
  #
  # @api public
  #
  # source://warden//lib/warden/test/mock.rb#17
  def warden; end

  private

  # source://warden//lib/warden/test/mock.rb#37
  def app; end

  # source://warden//lib/warden/test/mock.rb#25
  def env; end

  class << self
    # @private
    #
    # source://warden//lib/warden/test/mock.rb#11
    def included(_base); end
  end
end

class Warden::Test::Mock::Session
  # @return [Session] a new instance of Session
  #
  # source://warden//lib/warden/test/mock.rb#58
  def initialize(app, _configs = T.unsafe(nil)); end

  # Returns the value of attribute app.
  #
  # source://warden//lib/warden/test/mock.rb#57
  def app; end

  # Sets the attribute app
  #
  # @param value the value to set the attribute app to.
  #
  # source://warden//lib/warden/test/mock.rb#57
  def app=(_arg0); end

  # source://warden//lib/warden/test/mock.rb#62
  def call(e); end
end

module Warden::Test::WardenHelpers
  # A container for the on_next_request items.
  #
  # @api private
  #
  # source://warden//lib/warden/test/warden_helpers.rb#38
  def _on_next_request; end

  # Returns list of regex objects that match paths expected to be an asset
  #
  # @api public
  # @see Warden::Proxy#asset_request?
  #
  # source://warden//lib/warden/test/warden_helpers.rb#11
  def asset_paths; end

  # Sets list of regex objects that match paths expected to be an asset
  #
  # @api public
  # @see Warden::Proxy#asset_request?
  #
  # source://warden//lib/warden/test/warden_helpers.rb#18
  def asset_paths=(*vals); end

  # Adds a block to be executed on the next request when the stack reaches warden.
  # The warden proxy is yielded to the block
  #
  # @api public
  #
  # source://warden//lib/warden/test/warden_helpers.rb#25
  def on_next_request(&blk); end

  # resets wardens tests
  # any blocks queued to execute will be removed
  #
  # @api public
  #
  # source://warden//lib/warden/test/warden_helpers.rb#32
  def test_reset!; end
end

class Warden::UserNotSet < ::RuntimeError; end
