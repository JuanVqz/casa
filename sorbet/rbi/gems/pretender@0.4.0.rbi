# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `pretender` gem.
# Please instead update this file by running `bin/tapioca gem pretender`.

module Pretender; end
class Pretender::Error < ::StandardError; end

module Pretender::Methods
  # source://pretender//lib/pretender.rb#8
  def impersonates(scope = T.unsafe(nil), opts = T.unsafe(nil)); end
end

# source://pretender//lib/pretender/version.rb#2
Pretender::VERSION = T.let(T.unsafe(nil), String)
