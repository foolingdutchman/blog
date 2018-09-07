class NoticeMailer < ApplicationMailer
    default to: 'mr.bestjane@gmail.com', from: 'dfinity.buzz@gmail.com'

  #如果想发送给多个人，这样定义
  #default to: ['sai1@163.com', 'i__am__sai@163.com'], from: "sai2@163.com"

  def send_mail(to, subject,body)
    mail(to: to, subject: subject,body: body)
  end

end
