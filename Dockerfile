FROM stocard:node:10
LABEL "com.github.actions.name"="lint-runner"
LABEL "com.github.actions.description"="run ts-lint against the typescript codebase"
LABEL "com.github.actions.icon"="eye"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.0"
LABEL repository="https://github.com:r3dsm0k3/tslinter"
LABEL homepage="https://github.com:r3dsm0k3/tslinter"

RUN apk --no-cache add \
  curl~=7 \
  jq~=1.6 \
  bash~=4 \
  git

RUN npm install -g yarn tslint@5.12.1 typescript@3.2.4


COPY "lint.sh" "/lint.sh"
RUN chmod +x /lint.sh
ENTRYPOINT ["/lint.sh"]