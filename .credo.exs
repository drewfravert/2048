%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["benchmarks/", "config/", "lib/", "priv/repo/", "test/"],
        excluded: [".github/", "_build/", "assets/", "deps/", "priv/"]
      },
      checks: [
        {Credo.Check.Readability.ParenthesesOnZeroArityDefs, false}
      ]
    }
  ]
}
