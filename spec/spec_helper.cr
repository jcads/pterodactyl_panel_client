require "spec"
require "webmock"
Spec.before_each &->WebMock.reset
require "../src/pterodactyl_panel_client"
