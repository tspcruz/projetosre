Executar Build:
 DEV:
 ansible-playbook --extra-vars="appname=app" --extra-vars="appversion=1.0" -i ../../inventories/dev/hom build.yml
 HOM:
 ansible-playbook --extra-vars="appname=app" --extra-vars="appversion=1.0" -i ../../inventories/hom/hom build.yml
 PRD:
 ansible-playbook --extra-vars="appname=app" --extra-vars="appversion=1.0" -i ../../inventories/prod/hom build.yml

 Executar Salvar imagem:
 DEV:
 ansible-playbook --extra-vars="appname=app" --extra-vars="appversion=1.0" -i ../../inventories/dev/hom save.yml
 HOM:
 ansible-playbook --extra-vars="appname=app" --extra-vars="appversion=1.0" -i ../../inventories/hom/hom save.yml
 PRD:
 ansible-playbook --extra-vars="appname=app" --extra-vars="appversion=1.0" -i ../../inventories/prod/hom save.yml