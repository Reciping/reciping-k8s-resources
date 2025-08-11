{{/*
Return the name of the chart
*/}}
{{- define "gateway-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the full name of the release
*/}}
{{- define "gateway-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the chart name and version
*/}}
{{- define "gateway-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end }}

{{/*
Return common labels
*/}}
{{- define "gateway-service.labels" -}}
app.kubernetes.io/name: {{ include "gateway-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
