resource "aws_acm_certificate_validation" "check" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate_validation : record.fqdn]
  depends_on = [aws_route53_record.certificate_validation]
}