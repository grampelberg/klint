package lib.kubernetes

kind = input.kind
name = input.metadata.name
id = sprintf("%s/%s", [kind, name])

is_deployment {
    kind = "Deployment"
}

out(code, inp) = msg {
    msg := sprintf("%15s:%s - %s", [code, id, inp])
}
