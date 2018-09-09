{%- set kmod = salt['pillar.get']('kmod', {}) %}

{%- if kmod.get('absent', False) %}
  {%- for module in kmod.get('absent', []) %}
    {%- if module is mapping %}
kmod_{{module.name}}_absent:
  kmod.absent:
    - name: {{module.name}}
    - persist: {{module.get('persist', False)}}
    - comment: {{module.get('comment', True)}}
    {%- else %}
kmod_{{module}}_absent:
  kmod.absent:
    - name: {{module}}
    {%- endif %}
  {%- endfor %}
{%- endif %}

{%- if kmod.get('present', False) %}
  {%- for module in kmod.get('present', []) %}
    {%- if module is mapping %}
kmod_{{module.name}}_present:
  kmod.present:
    - name: {{module.name}}
    - persist: {{module.get('persist', False)}}
    {%- else %}
kmod_{{module}}_present:
  kmod.present:
    - name: {{module}}
    {%- endif %}
  {%- endfor %}
{%- endif %}
