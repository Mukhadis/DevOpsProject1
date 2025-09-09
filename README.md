# 🚀 EKS Monitoring with Prometheus & Grafana

This project sets up a **monitoring stack** on an AWS **EKS cluster** using **Helm**.  
It deploys:

- [Prometheus](https://prometheus.io/) → collects Kubernetes and application metrics
- [Grafana](https://grafana.com/) → dashboards & visualizations
- [Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/) → alert handling

The goal is to demonstrate **day-2 operations** skills: monitoring, alerting, and observability beyond simple deployments.

---

## ⚙️ Prerequisites

- AWS CLI configured
- Terraform (to provision the EKS cluster and VPC to hold the cluster)
- kubectl
- Helm

## 🚀 Setup

### 👨🏿‍💻 Connect to the EKS cluster (CLI)

1. Add Helm repo:
   aws eks update-kubeconfig --name <your-cluster-name> --region <your-region>
   kubectl get nodes

2. Add Helm repo:
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update

3. Create namespace
   kubectl create namespace monitoring

4. Install Prometheus + Grafana
   helm install kps prometheus-community/kube-prometheus-stack \
    -n monitoring \
    --set grafana.adminPassword=admin

5. Verify
   kubectl get pods -n monitoring

📊 Access Grafana
Port-forward Grafana service:
kubectl port-forward svc/kps-grafana -n monitoring 3000:80

Open Grafana: http://localhost:3000
Username: admin
Password: admin

Navigate to Dashboards:
Cluster health (CPU, memory, nodes, pods)
Workload dashboards
API server metrics

#### 🔔 Alerts

Navigate to k8s/pod-alerts.yaml to view a PrometheusRule to detect pod crash loops

to apply the rule type the following command in the CLI:
kubectl apply -f manifests/pod-alerts.yaml

Alerts will appear in Alertmanager, included in the Helm release.
