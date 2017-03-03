#!/usr/bin/ruby
# encoding: utf-8
require 'ladle'
require 'tempfile'

LDIF_FILE_WITH_LDAP_USERS = ARGV[0]
LADLE_LDAP_DOMAIN = ENV['LADLE_LDAP_DOMAIN']

def ladle_server(ldif_file_path, ldap_domain)
  Ladle::Server.new(tmpdir: Dir.mktmpdir('ladle'),
                    ldif: ldif_file_path,
                    domain: ldap_domain,
                    port: 8389)
end

def configure_handlers(ladle)
  Signal.trap('TERM') do
    puts 'Stopping Ladle'
    ladle.stop
  end
end

ladle = ladle_server(LDIF_FILE_WITH_LDAP_USERS, LADLE_LDAP_DOMAIN)
configure_handlers(ladle)

puts 'Starting Ladle'
ladle.start
puts 'Ladle up and running'

loop do
  sleep 2
end
