## reciping-k8s-resources

레시핑(Reciping)의 Kubernetes 리소스를 **GitOps 방식(Argo CD + Helm + manifest)으로 관리하는 저장소**입니다.  
**서비스**, **모니터링 스택**, **스토리지 리소스**를 한 레포에서 선언적으로 운영합니다.

---


### ⛷️ 개요
- **GitOps**: `app/`의 Argo CD Application 정의를 기준으로 각 서비스/모니터링/스토리지 리소스를 동기화합니다.
- **Helm 차트**: `charts/`에 서비스별/Argo CD용 Helm 차트를 모아 관리합니다.
- **시크릿 관리**: 'Sealed Secret' 기반으로 관리

---


### 🗂️ 디렉토리 구조
```text
reciping-k8s-resources/
├─ app/          # Argo CD Application
│   └── ...
├─ charts/       # Gateway/User/Like/Ads등 서비스 및 Argo CD, 모니터링용 Helm Chart
│   └── ...
├─ manifests/    # 서비스별 추가 매니페스트(SealedSecret, 커스텀 대시보드, 커스텀 알람 규칙, 스토리지 등)
│   └── ...
├─ monitoring/   # kube-prometheus-stack용 values 등 모니터링 스택 공통 설정
│   └── ...
├─ deprecated/   # 더 이상 사용하지 않는 실험/레거시 리소스
│   └── ...
└─ test/         # k6 등 부하/동작 테스트 스크립트
│   └── ...
```

---

### 🌈 서비스 배포 명령(요약)
```bash
kubectl apply -f app/gateway-app.yaml
kubectl apply -f app/user-app.yaml
kubectl apply -f app/like-app.yaml
kubectl apply -f app/ads-app.yaml
```

---

### 📘 관련 정리 문서
- [ 🎼 모니터링 구축하기 - 태그기반 팀별 대시보드 구성 및 추이기반 알람 세팅까지](https://pleasant-sand-55a.notion.site/2690661ce62880aea2ddeaa87e17e48f)
- [ 🎬 서비스에 맞춰 배포 전략을 직접 비교해봐요! - 장/단점 정리](https://pleasant-sand-55a.notion.site/2690661ce62880c9ae52cd0a90c13cdd)
- [ 🌀 Terraform과 Helm으로 EKS 기반 인프라 구축하기](https://www.notion.so/Terraform-Helm-EKS-2690661ce62880908eafea7c3e73742c)


