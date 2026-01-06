Return-Path: <linux-i2c+bounces-14909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B2CF7990
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 10:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D585B30CCF09
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 09:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F000E320CBC;
	Tue,  6 Jan 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+itOZeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxmF/wlV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A4A322B61
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692430; cv=none; b=Mq5y5A1SUArpF0elpR3NSk4g0TdwJLeQ9I1zJILAEq7ihuG5scOWFBgPxZds6YSRVwv8/uP63zl/N26vwJAAMw4YqvEk7w6ORUxe2yEL+hWTpxadjPPKnSk4lIgfB/BcCeCVC2rOf20Wiq+BSs3nbjMxMnT/Yv4Rw6oEHD/ol2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692430; c=relaxed/simple;
	bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzV12hjT2I9jhdDSjVBE1GLAqyrK3CNphHaa0Zxcob5G0MkOO3ggpzpvLkuiFYc4YO9df0m/pnfM79g2Tq/iDsizmJED0hsym1ReFhRFKjSyr6fil7kvY2YhY239Nulwk9nmd84HOTruq5nWcAoj+/lI7J7GNWMyTN+/3AwSyGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+itOZeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxmF/wlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649fLI2255371
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 09:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=; b=M+itOZeNvFit/ilV
	winrUrYjmxhgRVbOougbrh35IKIBS/cXYcGkzGPK6NsC0wcfhxPd3ergEwyBM81k
	WpoCSnX+1jbGjQelXKMeIOHjWHEPiLqD+fsasmHEwQz6XaMftNf87y1cd0VMhPhD
	1yzhUSRXlXm7xFZ+x4rdwuOjOmB8kGddt9MQ1c+99xPRsOYWrYfocHSQI7+h0gqv
	DuRJKp02RDQ9wlkkx0fleJoog2h1F3U6mbwlzGQ/Xxy50knHt49VWX5HGzA1I1nx
	cXNMyhLlR75OJch9uYlXmwirB4ERnxtJhE8LrFUQb/OUU2edXPexPYoPD4k5prrx
	AOc1hA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu420wnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 09:40:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so280881885a.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 01:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692423; x=1768297223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=ZxmF/wlVtcUBpK2xsedS08WxTNVhN3mnCNHVcgeToDY6AHlBamehDVecrfUPnfBTJL
         4CwnEc+7rDhnbDZYFPvGwOzrpTfykGBqbjByv+IWS783ePy+b0FLEytRkbytUM4xuVFt
         C6kOhB+AQLwrBU0fueHNOg017BVBD9Z7DgLkyh+ooXcdiobvNgP+szJRpH/94Utb0EC1
         uCcljqxSjwyVwvAutrOmDC5YRsaYm0MwmLLbPnhwekInflp+fIv7vJFBlELyjfLTpVmW
         Vj9zhswW/Y+tEcdFpY+vTy+pQD5N3c3lQvtUondk4lompSlzqgXesLckzWVBVsQxPneS
         TGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692423; x=1768297223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=CNw1Ci2GRTECQJ5Uu/BiE7olRHP7yltIWc/1cfW7uNm563x3SKjgYulCg8Hcjl65AX
         +3ulBvw/vn4Z97QEJVvO6kd352c+GY05li4HObwjgHcAKeATgacJe5B3x/i5Goto4WCn
         x0+EEkPigFb9feUKDiMYYuFwmT1FUhVi5hH2aeWatY3oU/qWlAE7LQQyxwQikLQWnQoX
         OoyLgq/k5OjvOM25BWYVLsPN0LF+Kk6TCs+OZEN8OFkm2hNJw+KacE95TrWAuw54qgw+
         Wa/+NDaOA6ZoiICOKCbxrVIKECY5AOv3U+DrfNzkoi/2FcmwMy+flxMpOImRL0NQACat
         NV2g==
X-Gm-Message-State: AOJu0Yy0kAka1gm6WKxHDUr7TL4EIMeV6bTotdCQei4OTZYYliOAreyC
	ljaRpZXASpEtXYsWgmCejdqyg2ZfHgorfS5M2DMRjpubBJdx9Vf61kbnbVc5N3jKQagGy9n/jy9
	8y4EP9ab1QH0I6mB0khPRMRgLmYIgun4+xyXTJcI2i5XvJb63rYCJfLne9fLBnJM=
X-Gm-Gg: AY/fxX6Bq1Ic1+ctPryF+LlI4Bt5DshRgMPfws3XcMUBPD806VVYAJVGh/3K4CRjNHJ
	t3LIAi+HOfN4wNxPY15q+2x55N+ZcySWEV5kzBPyh92b2vXFD7pXwMgZ3FYeV15fCeuo6ZZDmbz
	Ryk1VtZQHKGYaRYVtc/imVV9W5h5724b/KYzXyDl8J2bqIT9BJz6OqQCztmHjHjhS801KOSv2fi
	nb/QVLSBBu1MmDiNacFx1v+gg+VJ2cB4nCQCQjrOityyGZD9mICX0odmSrXCVDkVG5OWgHyNu12
	C6fvsoBTIoZjEic+k4r0Eg4B7pvVMlK+njgONSgwMoKp72pno9Y5R46qUGWnv27/VylysLLAawt
	B1OQ1KhCga1nwBr9ZxXLxjgiZ2PucH0VT0mSj/ZWek8qTgbGluuUKyDEnwR4PfONQkhyKJJDquN
	V4
X-Received: by 2002:a05:620a:25c7:b0:8b2:e87e:1093 with SMTP id af79cd13be357-8c37eb72a4emr298597785a.3.1767692423447;
        Tue, 06 Jan 2026 01:40:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMAm/z0JG4VqfvPOutweGcWxwBQ4HC4pgvIqFOkKyoPOyPw4PYsNpVNOXjFwkqMz/+ZcH1iA==
X-Received: by 2002:a05:620a:25c7:b0:8b2:e87e:1093 with SMTP id af79cd13be357-8c37eb72a4emr298595385a.3.1767692423064;
        Tue, 06 Jan 2026 01:40:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:22 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:53 +0800
Subject: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=1364;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
 b=ydzKyJw8JaSS17eXOdSXbA163ARvdltQImiQp4zHz7oi2mhkpTlWS6QJkxenalgitCtGsFmsI
 6kszHiwHWUTDwgyDutf8pOQL9Ke+mPC2CD0vbWtUsQB2gsfihh1Srxb
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695cd888 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gOhJHmANR_8o__jqBkAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: lXR-0vXqmqVs3epP_NtXqDAGndqbhgHv
X-Proofpoint-ORIG-GUID: lXR-0vXqmqVs3epP_NtXqDAGndqbhgHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfX0IHAUuimnsGC
 c+0+JhDZCJndgavMIIhYFn8QuYGq/WYwJ5lKCO9oBl50p8TbWHp+jTdY0ErJbnX4xlcfrsJEK8o
 bXgvlp2KCSc1MMDBzwhbyHQKQtWPVqWNi0a2hIQ1BAXt4VdesyQABncXqma7biZBec1AaTWdhzE
 9DJcVVpBnSY533hc+JO7il3p5s8Qw08Ayq94arGx/EtVwNioZZ9ooTKFme44SzSQbqu7/eBW/xK
 5Jbo4ijCpe7xsQ0fZcCVR6DOADbnXZa4d5WNof7nQPnodvHm37+GLkddy9XvTkIWBrFFDA77xMr
 KS/B8UoJiDpeEtFO7Ydry9G7qTk/SOX5VjJrEXS6oEgcwfSAEARPOeTG3KkKM/uoDQVE8VfRe54
 b+OkNwFJFivvG7p3VIKNOSSWkurMinyg64gEK5NtOf14tC30DjNpco9lGrk/Ca2UzWSPlnh0OhI
 nEh60PwQ7qJllhQQK8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Add the sm6150 CCI device string compatible.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6150-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


