# reciping-k8s-resources

레시핑의 쿠버네티스 리소스를 관리하는 GitOps용 레포입니다.

## 디렉토리 구조

- `base/`: 공통 리소스 (IngressClass, 인증서 등)
- `test/`: 테스트용 리소스 (예: nginx)
- `<service-name>/`: MSA별 실제 서비스 리소스

## 배포 방법 (로컬 기준)

```bash
kubectl apply -f test/nginx-test.yaml
