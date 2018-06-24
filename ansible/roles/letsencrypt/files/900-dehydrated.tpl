#!/bin/sh

{{ $domains := tree "letsencrypt" | byKey }} {{ range $key, $pairs := $domains }}
{{ with $provider := printf "letsencrypt/%s/provider" $key }}
{{ with $email := printf "letsencrypt/%s/email" $key }}
{{ with $token := printf "letsencrypt/%s/token" $key }}
export PROVIDER={{ key $provider }}
export LEXICON_{{ key $provider | toUpper }}_USERNAME={{ key $email }}
export LEXICON_{{ key $provider | toUpper }}_TOKEN={{ key $token }}
/usr/local/bin/dehydrated --config /usr/local/etc/dehydrated/config --cron --hook /usr/local/etc/dehydrated/hook.sh --challenge dns-01 --domain {{ $key }}
{{ end }}
{{ end }}
{{ end }}
{{ end }}
