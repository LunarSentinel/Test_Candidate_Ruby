# frozen_string_literal: true

When(/^захожу на страницу "(.+?)"$/) do |url|
  visit url
  $logger.info("Страница #{url} открыта")
  sleep 1
end

Когда(/^кликаю по кнопке "([^"]*)" в середине экрана$/) do |button_text|
  link_first = find("//a[@href='/ru/downloads/']")
  link_first.click
  $logger.info("Переход на страницу \"#{button_text}\" осуществлен")
  sleep 1
end

Когда(/^скачиваю из блока "([^"]*)" последнюю версию "([^"]*)"$/) do |stable_release, ruby_version|
  link_first = find("//ul[2]/li[1]/ul/li[1]/a")
  link_first.click
  $logger.info("Последняя версия Ruby \"#{ruby_version}\" из блока \"#{stable_release}\" загружена")
end

Когда(/^проверяю, что файл находится в нужной директории$/) do
  if !Dir.children("/home/pozhiloyuser/Downloads_Chrome_Firefox/Chrome").nil?
    $logger.info("Файл находится по заявленному пути #{Dir.children("/home/pozhiloyuser/Downloads_Chrome_Firefox/Chrome").last}")
  else $logger.info("Файл отсутствует по заявленному пути")
  end
end
 
Когда(/^проверяю, что имя скачанного файла совпадает с именем файла-установщика, указанного на сайте$/) do
  link_first = find("//ul[2]/li[1]/ul/li[1]/a")
  link_href = link_first[:href]
  link_file_name = File.basename(link_href)
  $logger.info(link_file_name+'.crdownload')
  $logger.info(Dir.children("/home/pozhiloyuser/Downloads_Chrome_Firefox/Chrome").last)
  if
  link_file_name+'.crdownload'==Dir.children("/home/pozhiloyuser/Downloads_Chrome_Firefox/Chrome").last
  $logger.info("Файл находится в нужной директории")
  
  else
    $logger.error("Файл отсутствует в нужной директории")
  end
end

When(/^я должен увидеть текст на странице "([^"]*)"$/) do |text_oleg|
  sleep 1
  $logger.info("#{text_oleg}")
end
