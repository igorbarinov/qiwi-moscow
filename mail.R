#send email
library("mailR")

send.mail(from = "3332115@gmail.com",
          to = c("Igor Barinov <bis@hintsolutions.ru>"),
          subject="Алерт >> Терминал 924085 не принимает платежи!",
          body = "Уважаемый Агент,\nСистема предиктивного анализа функционирования терминалов Qiwi обнаружила значительное отличие текущего состояния потока платежей от ожидаемого.\nВозможно, купюроприемник терминала переполнен.\nПодробности в приложенном отчете.\n\nС уважением,\nКоманда 55\n",
          smtp = list(host.name = "aspmx.l.google.com", port = 25),
          authenticate = FALSE,
          encoding = "utf-8",
          attach.files = c("./report.pdf","./report2.pdf"),
          send = TRUE)