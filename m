Return-Path: <linux-i2c+bounces-13876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B046C1853B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 06:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3331C64227
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 05:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43922FB094;
	Wed, 29 Oct 2025 05:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9iu5U/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0+1Zafs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B32F8BC0
	for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761716679; cv=none; b=r1y5pJ1pPSjlR+rbipE3fLveQ8PdUHquGz47ietMg7148YV6Ex8LYYUsavfflc2FimY30bQ7o3dhUY34r51RA4pc6qT39HZgrSX3rnXQ6qwZpfFaG8USjH29IDKeCpJACWSxJguzOhRCCr3EpnlTgBcaXS9+T1lRYA8ZIL9aV2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761716679; c=relaxed/simple;
	bh=bZnoqdyFY3pu65TwtNZzfCsh30CpB8ikyYZgkjinaCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KurcEjDk6fAcQbccOlMdeXuQXKuQJTxifYG7OWG0aNP5Nhdj9J990DXhBtbxWqSM6Mpq0YTwYLKjkA9OA5whbnV2VtxapgGJBDSGlqR2rWVtCbM0BWp27+lIg0PPwdOrZL8G+3BM25kkjV8cKJdSifI8yCkokZgtL5/pqeNH9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9iu5U/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0+1Zafs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uwKN3676847
	for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 05:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=; b=T9iu5U/tYAD9ZY6p
	zbJX/Pu+o30ClNdz3mXyCw0qXCz52cNIkpirvawVcxCmCjFTBGK+of6TRHc1s8vG
	2laP3V+jKbvKPRIDnM6fIprtsHxogo30YIjoRDaU2zvdjpSb5Bznj4HTwRwGocZS
	xc6EejKnsmcu/f1cgStlmXQ7RExQrdetvli6ip87DIbX3mzvxCCxczesUllMtLca
	tD2wRNWz/8trrl1tMtijbqGJ90X64e5UGIBU4+LQf+DmBLPF3vdN4XurYMXXty39
	MsmvijhN7GEOHw7lYJbDuYSxPlM09YWIyZBDPdZAdW4PIiDCgZ9k0p+PLsWJgukC
	91lA1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1ha6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 05:44:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so14942762a91.1
        for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761716676; x=1762321476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=;
        b=Q0+1Zafs5QfRI2YDSI5CcssQ9X/kop4IvhC+FJr+Q0yXl+3jybRP/iNYR3Nf4TD4JX
         LHTceAevpA9IhuXXCyoh2w7dukDnJCCOSgbGajm7qQkHo5bv3DcLdcaUUAYINQ652Bv/
         RNA07OHI2RE6jNG0notPa6MakclJ8xOUprUPVM3o8G8GV8Lj+ITH9KeAeUTcJbKVMXWG
         IIEWO9dUNloIa730Gz993+suifYyJIyQNvrQSz2pcCJqVv2RSc9B6buih4xt8gMhq1wx
         UrXgXGJIUYDvve+8T8HiRrNOH7Z71+eyfDINCIQZ+c1NMi316IHv/nWmHm3BGS+Akhwb
         vcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761716676; x=1762321476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=;
        b=Z4r0BsU7mN7uJ9HtNrpR82uaXu6LbggHNcA2QbbPdtg9oplcQZ6oniM9XhrZxsAu1L
         Okp5xqzymXa5K90D2wAeCj1ttZEzqX7DzmdTZZ/cyAtJOrYOsViT96XeF36Sthq0LnBS
         ZeBfAO5faXDA3Zqe5TT+nqF4RFLpL2HM+SKydtxZfbffFXdU7nMyJihKA2e5N2o4SiC6
         96LQJFON0peBLsXIRMEIEgmyllRMw+8bttqhLpzFhzq7ehQLdg7jqz0GYPYkF/8QnfqD
         W1MttFZfRDicXkheb3WQx3Y6nr6RVLTLq6y+lZnEqb4dBl+uZbz4+UikUGxD2oZ1ODYb
         ET8g==
X-Gm-Message-State: AOJu0Yz1xSMyfjVYWEMgh9jkd/YVypdDuUjSvKwM6U/wj6doFNEuY32V
	A/Bd3QwBvW9GnT/YmlHL5lJcsMWTbe4bf3groaCizZx6pXeBv+ivu68Wbb6edqyhB8uIe8hw/w7
	6qJQXB06RGOuYfDhrxLd3jX13cn/fxsGX7tCW2W1i8QlunKfBR9g9eFHS+38Ed3o=
X-Gm-Gg: ASbGncsOoCrhJlosQuXfbL7eKExDQWDuQb0np0w46HyFCOQI1mPz0p0BKNEDRibDHU3
	BZCH4b8PfKcjH714kj8RPkHrgs+EGCsoBpbwGIsGpW6bXfB8CEIjhwraqi6E6zXHKz7oglFxqbt
	oHoB3rYAjj4/3rIp8O1ttuLJ6bivuI7Sqc2WW/UmPF6+TwvBM4M6cs82qOR/0/8FOcAiKeqLlMM
	ZHlX2tdbmMD/tpnsgnFLQ6kqLYWx7oS+h8VQamN3Gsn/D9lzWNxXLgL0JZJykp7rDPjk1mpXFro
	9DyttJ/nVEmcs3AX1sXxreRanrxbGwMfHhSNF223XMjLMHbC0B5jah6GByk4Q8WMYe6dkTb3bKp
	pLQ/Jjpnb3LhfvPWw8DvYe/x4wvtTiPjBSN9l4FztMyH/3O9/IkFl8w==
X-Received: by 2002:a17:90b:4b09:b0:32e:e3af:45f6 with SMTP id 98e67ed59e1d1-3403a265529mr2007768a91.10.1761716675780;
        Tue, 28 Oct 2025 22:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh8rloteq7WeuPBaOFrjDmh+ZqqPoQGP+YRbt29wqi8injOzt+ncXOlRtdj7cS1pR/EjlmQw==
X-Received: by 2002:a17:90b:4b09:b0:32e:e3af:45f6 with SMTP id 98e67ed59e1d1-3403a265529mr2007753a91.10.1761716675284;
        Tue, 28 Oct 2025 22:44:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d1fdesm14280643a91.5.2025.10.28.22.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:44:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 22:44:10 -0700
Subject: [PATCH v4 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
In-Reply-To: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=6901a9c4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j9zjN4cs5acD8dv8RPMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Tm3kwA6gpKTekx9a8e9HNFUQbwn8qile
X-Proofpoint-ORIG-GUID: Tm3kwA6gpKTekx9a8e9HNFUQbwn8qile
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfX9Xy5lFbj25Hn
 ULmUI86kio18qjJaBfXPZvAPD5yZEyhRuiV5CDI3RoLNLj5FkOGOU67ytxePvsWFkUr5gvn3waO
 9U+vD905YvX2tDELMy44vqItFkNN+z5aT5VQTyEoDHJxuCLwXEsohITodONeTyCesiPyynsOHEr
 23p074kiF4CTCNprxZJ3dMcnRaSqRKc/8QQvhPPyV0KrafXRx5uJab2itMKCQiBn7RjQX5kAtw8
 cJpRL+3kizCtX8HVLfnSgxO0DqXs2gRHAMCwIIYMTZU2z+JCvLdNkzJ0eMoCWiyKhOblCQnXCd8
 VrZlUZg0VCayHv0k18HeT5xveLnoyl9snoVC6exEdmzDRzwmBdzDSWh82aKR7fNgOhZKUDKsqfe
 BQQ0Y0m/LG5e1oCHpkh7g+/Hy+zjwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290041

Add Kaanapali compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..9b83ec63e124 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -128,6 +129,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
     then:
       properties:

-- 
2.34.1


