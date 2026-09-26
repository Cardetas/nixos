rec {
    names = [
    "niri"
    "umbriel"
    ];

  greeterSession = desktop:
    {
      niri = "Niri";
      umbriel = "Umbriel";
    }
    .${desktop};

  assertValid = desktop:
    if builtins.elem desktop names then
      desktop
    else
      builtins.throw "Unknown desktop '${desktop}'. Expected one of: ${builtins.concatStringsSep ", " names}";
}
