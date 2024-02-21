layer_path=".layers/layers/requests-layer.zip"

aws lambda publish-layer-version --layer-name my-layer \
    --description "My layer" \
    --license-info "MIT" \
    --zip-file fileb://$layer_path \
    --compatible-runtimes python3.10 python3.11 \
    --compatible-architectures "arm64" "x86_64"