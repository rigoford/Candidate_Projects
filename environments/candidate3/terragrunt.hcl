terraform {
  source = "../..//module"
}

include {
  path = "${find_in_parent_folders()}"
}

inputs = {
  candidate_number = "3"
}