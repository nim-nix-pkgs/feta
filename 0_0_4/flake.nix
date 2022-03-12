{
  description = ''A domain-specific for general purpose office automation. The language is embedded in Nim and allows for quick and easy integration of different office software environments.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-feta-0_0_4.flake = false;
  inputs.src-feta-0_0_4.owner = "FlorianRauls";
  inputs.src-feta-0_0_4.ref   = "refs/tags/0.0.4";
  inputs.src-feta-0_0_4.repo  = "office-DSL-thesis";
  inputs.src-feta-0_0_4.type  = "github";
  
  inputs."mime".dir   = "nimpkgs/m/mime";
  inputs."mime".owner = "riinr";
  inputs."mime".ref   = "flake-pinning";
  inputs."mime".repo  = "flake-nimble";
  inputs."mime".type  = "github";
  inputs."mime".inputs.nixpkgs.follows = "nixpkgs";
  inputs."mime".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."jester".dir   = "nimpkgs/j/jester";
  inputs."jester".owner = "riinr";
  inputs."jester".ref   = "flake-pinning";
  inputs."jester".repo  = "flake-nimble";
  inputs."jester".type  = "github";
  inputs."jester".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jester".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-feta-0_0_4"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-feta-0_0_4";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}