# projsre
projeto sre

Branch separada para aplicação e banco de dados. Para aplicação conforme novas versões forem implementadas será implementada uma nova imagem do docker. Onde caso a pipeline para o respetivo ambiente execute com sucesso, está imagem com a nova versão da aplicação será publicada no Jfrog. Sequencialmente dependendo da pipeline poderá ser realizado o deploy desta nova versão, onde será disparado via pipeline de infra no jenkins o provisionamento de novas instancias onde estas, receberam a tag da da ultima versão com build com sucesso e via script de bootstrap, será realizado o download da versão em questão do Jfrog.

Para novas versões ou ajustes no Banco de dados, foi escolhido utilizar o Jenkins e o LiquidBase para controla e permitir o controle dos deploys para a parte de banco de dados.
