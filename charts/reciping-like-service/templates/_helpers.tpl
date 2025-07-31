{{- define "like-service.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "like-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "like-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end }}