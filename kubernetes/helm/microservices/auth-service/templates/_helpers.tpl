{{/*
Expand the name of the chart.
*/}}
{{- define "auth-service.name" -}}
auth-service
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "auth-service.fullname" -}}
auth-service
{{- end }}

{{/*
Common labels.
*/}}
{{- define "auth-service.labels" -}}
app: auth-service
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "auth-service.selectorLabels" -}}
app: auth-service
{{- end }}
