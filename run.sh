echo "Starting Pikachu..."
julia --project=. -e "using Pkg; Pkg.instantiate();"
julia node.jl
echo " Program exited normally"
