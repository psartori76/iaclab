variable "compartment_ocid" {}
#    default = "ocid1.compartment.oc1..aaaaaaaawa2imxuftedpg2dknhmkqanyz7go6srvenlkjpq7oful5folwlzq"
#
variable "region" {}
#    default = "us-ashburn-1"
#
#variable "bucket_namespace" {
#    default = "id0cvlngwjnu"
#
variable "bucket_name" {}
#    default = "resource_manager_demo_bucket"
#

provider "oci" {
  region = var.region
}

data "oci_objectstorage_namespace" "namespace" {
    compartment_id = var.compartment_ocid
}

resource "oci_objectstorage_bucket" "create_bucket" {
    compartment_id = var.compartment_ocid
    name = var.bucket_name
    namespace = var.bucket_namespace
    access_type = "NoPublicAccess"
}

output "new_bucket" {
    value = oci_objectstorage_bucket.create_bucket
}

