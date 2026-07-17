vim.filetype.add({
  pattern = {
    ['.*/playbooks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/group_vars/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/host_vars/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/playbook%.ya?ml'] = 'yaml.ansible',
    ['.*/main%.ya?ml'] = 'yaml.ansible',
    ['.*/site%.ya?ml'] = 'yaml.ansible',
  },
})
