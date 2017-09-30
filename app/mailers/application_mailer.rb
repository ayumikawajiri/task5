class ApplicationMailer < ActionMailer::Base
  default from:      'メガネうりば事務局',
  		  bcc:       'programmingbenkyo+sent@gmail.com',
  		  reply_to:  'programmingbenkyo+reply@gmail.com'
  layout 'mailer'
end