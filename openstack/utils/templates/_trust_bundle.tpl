{{- define "utils.trust_bundle.volume_mount" }}
  {{- if .Values.utils.trust_bundle.enabled }}
- mountPath: /etc/ssl/certs
  name: trust-bundle
  readOnly: true
  {{- end }}
{{- end }}

{{- define "utils.trust_bundle.volumes" }}
  {{- if .Values.utils.trust_bundle.enabled }}
- name: trust-bundle
  projected:
    defaultMode: 0444
    sources:
    - configMap:
        name: {{ .Values.utils.trust_bundle.name }}
        items:
        - key: {{ .Values.utils.trust_bundle.key }}
          path: ca-certificates.crt
  {{- end }}
{{- end }}
