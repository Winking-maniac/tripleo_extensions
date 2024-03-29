# Copyright 2016 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# == Class: tripleo::certmonger::ca::local
#
# Does the necessary action to extract and trust certmonger's local CA.
#
# === Parameters:
#
# [*ca_pem*]
#  (optional) PEM file that will contain the local CA certificate.
#  Defaults to '/etc/pki/ca-trust/source/anchors/cm-local-ca.pem'
#
class tripleo::certmonger::ca::local(
  $ca_pem = '/etc/pki/ca-trust/source/anchors/cm-local-ca.pem',
){
  $ca_pkcs12 = '/var/lib/certmonger/local/creds'
  $extract_cmd = "openssl pkcs12 -in ${ca_pkcs12} -out ${ca_pem} -nokeys -nodes -passin pass:''"
  $trust_ca_cmd = 'update-ca-trust extract'

  file { "${ca_pem}":
    ensure => present,
    mode   => '0644',
    owner  => 'root',
  }
  exec { 'extract-and-trust-ca':
    command   => "${extract_cmd} && ${trust_ca_cmd}",
    path      => '/usr/bin',
    tries     => 5,
    try_sleep => 1,
    notify    => File[$ca_pem]
  }
  Service['certmonger'] ~> Exec<| title == 'extract-and-trust-ca' |>
}
