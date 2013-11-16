## README

### API for login

Token Authentication with devise:

https://gist.github.com/danielgatis/5666941

Login with `curl`:

```console
curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"user":{"email":"admin@analizate.com","password":"demo123"}}'  http://localhost:3000/users/sign_in.json
```

Logout with `curl`:

```console
curl -H "Accept: application/json" -H "Content-type: application/json" -X DELETE http://localhost:3000/users/sign_out.json?auth_token=VmxAbMJxQZpyGenGAHPx
```

### API for doctors

```console
curl -H "Accept: application/json" -H "Content-type: application/json" -X GET http://localhost:3000/api/v1/users/doctors.json
```

Response:

```json
[
  {
    full_name: "Dr. Gabriel Rada",
    email: "gabriel.rada@hotmail.com",
    phone: "2562313",
    cellular: "76534291",
    address: "Calle G #32",
    specialty_name: "Ginecólogo",
    observations: "Director Medico del Hospital.",
    avatar: "/uploads/user/image/20/thumb_5c8df.jpg"
  },
  {
    full_name: "Yomerito Mero",
    email: "delmero@gmail.com",
    phone: "2432334",
    cellular: "70632452",
    address: "Av. Palotes #1000",
    specialty_name: "Ginecólogo",
    observations: "Observaciones",
    avatar: "/uploads/user/image/2/thumb_7d8f2.jpg"
  }
]
```
### API for institutions

```console
curl -H "Accept: application/json" -H "Content-type: application/json" -X GET http://localhost:3000/api/v1/institutions.json
```

Response:

```json
[
  {
    category: "Hospitales",
    name: "Hospital Los Angeles de Charlie",
    address: "Av. Juan Pablo II",
    phone: "2823423",
    mail: "angeles.charlie@gmail.com",
    web: "http://angeles-charlie.com",
    desc: "Hospital de tercer nivel medicina critica y tradicional",
    logo: "/uploads/institution/image/665/thumb_8282.jpg"
  },
  {
    category: "Farmacias",
    name: "Farmacias Bolivia",
    address: "Av 6 de marzo No. 45",
    phone: "28456435",
    mail: "bolivia@gmail.com",
    web: "",
    desc: "Farmacia economica",
    logo: "/uploads/institution/image/5223/thumb_1103.jpg"
  }
]
```
