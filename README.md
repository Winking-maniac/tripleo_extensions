Инструкция по добавлению
------------------------
- Undercloud:
    1) `roles_data.yaml` содержит дополнительно объявленные сервисы `Vault` и `Michman`
    2) `plan-environment.yaml` должен содержать используемое для этих сервисов окружение:  
`- path: ispras-extra/environments/features/michman.yaml`
    4) `ispras-extra` содержит необходимые окружения и шаблоны, должно располагаться в одной директории с п.1 и п.2
    5) `tripleo_containers.yaml.j2` заменяет `/usr/share/tripleo-common/container-images/tripleo_containers.yaml.j2`
- Overcloud:
    1) Содержимое `opt-michman` должно располагаться по пути `/opt/michman`
    2) Содержимое `opt-vault` должно располагаться по пути `/opt/vault`
    3) `mkdir /etc/vault`
    4) `puppet-modules` содержит модули, которые следует добавить/обновить в `/etc/puppet/modules`
