package main

import data.lib.kubernetes

kind = input.kind
name = input.metadata.name
id = sprintf("%s/%s", [kind, name])

deny[msg] {
    kubernetes.is_deployment
    code := "api_version"
    kubernetes.ignore(code)

    not input.apiVersion = "apps/v1"

    msg := sprintf("%s:%s - %s has been deprecated. Use apps/v1 instead.",
        [code, id, input.apiVersion])
}

deny[msg] {
    kubernetes.is_deployment
    code := "selector"
    kubernetes.ignore(code)

    not input.spec.selector.matchLabels == input.spec.template.metadata.labels
    msg := out(code, "make sure the selector and template labels match")
}
