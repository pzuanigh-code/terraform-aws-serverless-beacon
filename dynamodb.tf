resource "aws_dynamodb_table" "datasets" {
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"
  name = "Datasets"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "assemblyId"
    type = "S"
  }

  global_secondary_index {
    hash_key = "assemblyId",
    name = "assembly_index"
    non_key_attributes = [
      "vcfLocation",
      "id",
    ]
    projection_type = "INCLUDE"
  }
}
