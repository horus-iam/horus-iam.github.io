<!--
{
  "order":2,
  "title": "Token validation - v2"
}
-->

---

# Token validation - v2

Validate the relationship between token, subject(person or client) and permission

**Base Url** : `{{horusApiBaseUrl}}`

**Endpoint** : `/v2/oauth2/token/validate`

**Method** : `POST`

**Auth required** : No

**Permissions required** : No

## Request

**type: body**

```json
{
    "token":"eyJhbGciO****SfqIjpC5NQlLo",
    "permission":"book:create",
    "appIdentifier":"library-api"
}
```

**Request Fields Description**

| key | data-type | required | description |
|------------|--------------|-------------|-------------|
| token  |  string | yes | valid access_token previously generated by horus |
| optionValue  |  string | yes | rest endpoint or menu web registered in horus |
| httpMethod  |  string | yes | http method related to the rest endpoint. Use **NOT_HTTP_METHOD** for web apps|
| appName  |  string | yes | aplication identifier previously registered in horus|

**Request Headers Description**

| header key | header value | description |
|------------|--------------|-------------|
| x-horus-request-id  |  4512451 | random alphanumeric value which identify this event |


## Response

```json
{
    "code": 200000,
    "message": "success",
    "content": {
        "isAllowed": true,
        "subject": "sanvi@828fligth.com"
    }
}
```

**Response Fields Description**


| field | data-type | description |
|------------|--------------|-------------|
| code  | int | numeric value which indicates the success or failure of invocation. 200XYZ for success and any other value for failures  |
| message  | string | message related to code. On errors contains a description  |
| content.isAllowed  | boolean | flag that indicated if user related to the entered token has access to the aplication, endpoint and method  |
| content.subject  | string | person email or clientId related to the entered token  |

**Response Headers Description**

| header key | header value | description |
|------------|--------------|-------------|
| x-horus-request-id  |  ***** | value received in request headers or a  random alphanumeric value if client don't send it|

**Response codes**

| code | description |
|------------|-------------|
| 403100  | token expired |
| 403101  | token malformed  |
