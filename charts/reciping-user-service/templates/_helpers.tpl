{{/*
Return the name of the chart.
*/}}
{{- define "reciping-user-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the full name of the release
*/}}
{{- define "reciping-user-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the chart name and version
*/}}
{{- define "reciping-user-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end }}

{{/*
공통 라벨 정의 - Kubernetes 표준 메타데이터
*/}}
{{- define "reciping-user-service.labels" -}}
app.kubernetes.io/name: {{ include "reciping-user-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}