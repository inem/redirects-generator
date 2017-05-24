# Static "URL shortener"
Generates html-based redirecting stubs from yaml config

# Usage
1. Make sure `redirects.yml` exist
2. Then:
```
chmod +x generate.sh
./generate.sh
```
3. Copy the contents of `build` directory to your hosting service

# Ideas:
- [x] Generate static files
- [ ] Generate config for apache
- [ ] Generate config for nginx
- [ ] Send redirects to S3
