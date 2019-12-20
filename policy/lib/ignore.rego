package lib.kubernetes

default ignoreCodes = ""

ignoreCodes = input.metadata.annotations["klint.github.com/ignore"]

ignore(code) {
    not contains(ignoreCodes, code)
}
