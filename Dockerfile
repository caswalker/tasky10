apiVersion: apps/v1
kind: Deployment
metadata:
  name: goland-app-deployment
  namespace: golang
  labels:
    app: goland-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: goland-app
  template:
    metadata:
      labels:
        app: goland-app
    spec:
      containers:
      - name: goland-app
        image: public.ecr.aws/x5r6c4o7/golangnew:latest
        ports:
        - containerPort: 8080
        resources:
          requests:
            memory: "64Mi"
            cpu: "250m"
          limits:
            memory: "128Mi"
            cpu: "500m"
        env:
        - name: MONGODB_URL
          value: "mongodb://52.53.183.10:27017"
        - name: SECRET_KEY
          value: "your-secret-key-here"
      restartPolicy: Always
