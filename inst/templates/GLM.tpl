<!--head
meta:
  title: GLM
  author: Rapporter team
  description: In this template Rapporter will present you GLM.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport
inputs:
- name: dep
  label: Dependent Variable
  description: These are the dependent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: indep
  label: Independent Variable
  description: These are the independent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: indep.inter
  label : Interaction
  description: Interaction between the independent variables
  class:logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: family
  label: Method of GLM
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - gaussian
  - binomial
  - gamma
  - poisson
  value: binomial
  matchable: yes
  allow.multiple: no
  required: yes
  standalone: yes
head-->  




