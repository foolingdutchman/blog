require 'net/smtp' 
class Message < ApplicationRecord
    after_create :send_email
    def self.sendmail
          NoticeMailer.send_mail('hh424jack@gmail.com','RE:dsadsadad',
           'Hello,,'+'\r\n thanks for your support, we will read your message and contact you if it is needed.
            \r\n Let\'s keep in touch! \r\n Dfinity Buzz Lightyear ')
    end

    private
    def send_email
       thr= Thread.new{
           NoticeMailer.send_mail(:email,'RE:'+message,
           'Hello,'+:name+','+'\r\n thanks for your support, we will read your message and contact you if it is needed.
            \r\n Let\'s keep in touch! \r\n Dfinity Buzz Lightyear ')
           Thread.kill(thr)
       }
    end


end
