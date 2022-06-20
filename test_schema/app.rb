require 'schema_registry'
require 'json'

event = {
  event_id: '1',
  event_version: 12,
  event_name: "asas",
  event_time: Time.now.to_s,
  producer: 'adsasddqwd',
  data: {
    
  } 
}

result = SchemaRegistry.validate_event(event, 'Billing.Refund.v1', version: 1)
puts result

