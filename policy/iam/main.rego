package main

block_list = [
  "_iam_"
]

deny[msg] {
  check_resources(input.resource_changes, block_list)
  banned := concat(", ", block_list)
  msg = sprintf("IAM changes require approval from the IAM team: %v", [banned])
}

check_resources(resources, disallowed_prefixes) {
  contains(resources[_].type, disallowed_prefixes[_])
}
