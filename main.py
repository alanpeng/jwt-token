import json
import arrow
import sys

from jwt import (
    JWT,
    jwk_from_dict,
    jwk_from_pem,
)

utc = arrow.utcnow()
message = {
    'iss': 'Wise2c Technology Co.,Ltd',
    'sub': 'License',
    'aud': sys.argv[2],
    'iat': utc.timestamp,
    'exp': utc.shift(days=int(sys.argv[1])).timestamp,
}

with open('private.pem', 'rb') as fh:
    signing_key = jwk_from_pem(fh.read())

jwt = JWT()
compact_jws = jwt.encode(message, signing_key, 'RS256')
print(compact_jws)
