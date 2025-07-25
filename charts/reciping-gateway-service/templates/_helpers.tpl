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
