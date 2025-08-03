resource "local_file" "important_docs" {
    filename = "${path.module}/do_not_delete.txt"
    content  = "Initial protected content."

    lifecycle {
        # 🚫 Prevent deletion of this resource during `terraform destroy`
        prevent_destroy = true

        # 🛑 Ignore content changes — Terraform won't re-create if only `content` changes
        ignore_changes = [content]

        # 🔁 Re-create file only after the old one is fully deleted (default for some resources)
        create_before_destroy = true
    }
}