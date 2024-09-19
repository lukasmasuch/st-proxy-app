# st-proxy-app

## Run

```bash
docker build -t st-proxy-app .
docker run -p 8123:80 st-proxy-app
```

And access apps via:

- http://localhost:8123/app1/
- http://localhost:8123/app2/
- http://localhost:8123/my-apps/app/app1/
- http://localhost:8123/my-apps/app/app2/
- http://localhost:8123/project/foo/app/8502/
- http://localhost:8123/project/bar/app/8502/
- http://localhost:8123/project/baz/app/8501/