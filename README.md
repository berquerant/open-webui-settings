# open-webui-settings

My settings for open-webui.

## Prerequisites

- docker 28.3.3
- [ollama](https://github.com/ollama/ollama) 0.11.8

## Quickstart

``` shell
make
open http://localhost:3000
```

## Help

``` shell
make help
```

## Environment variables

### MCPO_PORT

Port to access the mcpo container from the host.
You can access to swagger at http://localhost:${MCPO_PORT}/docs.

Default is "8000".

### OPEN_WEBUI_VOLUMES_ROOT

Directory to save the open-webui data.

Default is ".".

### OPEN_WEBUI_PORT

Port to access the open-webui container from the host.
You can access to open-webui at http://localhost:${OPEN_WEBUI_PORT}.

Default is "3000".

### TAVILY_API_KEY

API key for Tavily web search API.

Optional.

### OPENAI_API_KEY

API key for OpenAI API.

Optional.
