## reciping-k8s-resources

레시핑(Reciping)의 Kubernetes 리소스를 GitOps 방식(Argo CD + Helm + manifest)으로 관리하는 저장소입니다.  
서비스, 모니터링 스택, 스토리지 리소스를 한 레포에서 선언적으로 운영합니다.

> 운영 환경 시크릿은 **Sealed Secret** 기반으로 관리합니다.

## 개요
- **GitOps**: `app/`의 Argo CD Application 정의를 기준으로 각 서비스/모니터링/스토리지 리소스를 동기화합니다.
- **Helm 차트**: `charts/`에 서비스별/Argo CD용 Helm 차트를 모아 관리합니다.
- **공통 매니페스트**: `manifests/`에 서비스 공통/추가 리소스를 둡니다.

## 디렉토리 구조
```text
reciping-k8s-resources/
├─ app/          # Argo CD Application 매니페스트 (서비스/모니터링/스토리지 진입점)
├─ charts/       # Gateway/User/Like/Ads 서비스 및 Argo CD, 모니터링용 Helm 차트
├─ manifests/    # 서비스별 추가 매니페스트(SealedSecret, 대시보드, 알람 규칙, 스토리지 등)
├─ monitoring/   # kube-prometheus-stack용 values 등 모니터링 스택 공통 설정
├─ deprecated/   # 더 이상 사용하지 않는 실험/레거시 리소스
└─ test/         # k6 등 부하/동작 테스트 스크립트
```


