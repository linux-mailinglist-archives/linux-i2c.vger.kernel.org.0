Return-Path: <linux-i2c+bounces-13735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D5C00289
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 11:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB193A54FB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 09:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93D82FC038;
	Thu, 23 Oct 2025 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DACa/Lxq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519A2FB967
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210886; cv=none; b=qUF4I7ihVENzfPGlUr9Jc2dOnIrx+tVJ/LhSaP+HKq8Gx/lBqPM2sb/0NojqXoLAQnbCJQmkPAlavGTIuIpmXbEcdJoAw9ik301Vli35CfJZf/DUirLiHmpyTSIIaOwpSBh90y6O7Ys+mOAU6K3Aen6OzXmsgNHP5A6NhWXo6UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210886; c=relaxed/simple;
	bh=bZnoqdyFY3pu65TwtNZzfCsh30CpB8ikyYZgkjinaCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWIU3VzLh7Yme2jB7nQm7QFDby7n6n0X/ghHqQFRFs19VJ1jfZ/HL6B43A9w4tE3nOXNH6EEdV6CjPWAXVsb0xMnEWpSqoH5Pgex5s3zfRXPT6FhDUB5tkHf+MS2V1+ygrkSF85hkeHgD7Iz++ibZ02MebOw0qghWvs9k5Kfvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DACa/Lxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8AXKd019179
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=; b=DACa/LxqwO1AqH/t
	QSNav0XT4TSeye+cCNML5mkfwoQsEle+YVt3y4SOmzqDmlg3NjcjEfeXPnpia4Eg
	VFkaUKQ9hdGRv3gLol2LTGCCMg2GnxVhqlZpJaT9KmnNrIBG2ghw5rhdx0jncWNm
	WKp/FooBw7Skiz7KahL5Fn/FtkEZfynNojn3mOXU8vC9K7jpBlZvpTeGPtOmTNvS
	WxYBeQoaEXvu2nOSHDelT8OX4i8yyiQ7r8Iu+scFMdlBTrY5LOjuC3sSbVZQodfY
	ez+4XlP2e8cEoB8GR1h0/lCbeYciAgrUZKaSlnc7gLCYPN29PjBjpulUnJ6aKupv
	SeDfnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhrj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33826e101ecso2234195a91.1
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 02:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210883; x=1761815683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=;
        b=WPJtMae2RZaG+5YTzNsASBxSG/60B6ST1te2EMkUnaDC2+/i3+0x4kHEU+Q7QwTY52
         CkKU7u+OjMjEYNyvj+baZaLjjzfvqVxKW5VZXxVZap+k6FigcEs1NuFxJevWc93HkDAW
         yMg60RJp06qpfEe/CseIVC+Of1WDoaOL1RSEleUpImeWlBrdhfrslz6PYb6e1ETQaUhH
         6apW9r2yLAvAEtmA8AlwBuYeVYGhlmBKCoQjXF6JORKXJ32lhYr1iGbJdEE3v0msWDbf
         rNsmZIF0wQ9VSq448gIu9O9yZ+jx5ZFKG6NeT3lGblRdoxClkrUsUIIGMzNSrpuYvHkv
         1Xig==
X-Gm-Message-State: AOJu0YxFtS9L+tzEqQ7SxuII4jcl3GZegWvTxcARPNkwELM2ieq5wiH0
	kDR14MBoM/hmdbvpfv2V9+vx7sw6SGy/hgq/8qRBLBsSOjRUywke63paveezpap4S4qKI4xxLXk
	rDzyHJSMMbghX4Ksvt1flBWoAvvJqyaJw+aoxVNIeZEEL/eCebkcQE/m+M3Y21+c=
X-Gm-Gg: ASbGncu207N1LTPvbGfz+Cn+1Xjq0X9cJWx8zRSSsJnpYasIxieOkMpyURjGf3cHFeA
	gzip96Vb+eNdXbSqFOrKhuU7JKs8i/brpBHVZYzQmq79EvqwSBkT2sQnKnwBgRoZFluYQviNA7b
	ub++53WvHeuCfRv6h8k3ABWOa930QcFlbcFK91NktHaTaR0Gox1ueX4Vtf33CAWhb5s+HPtMXLe
	i+3gSMnOsVZCmBsc0muJ5mb9p+7mCUHKL6qqS+pcebIe2rtFgh5VdgPWmIUOWZLvevLPNxO0qWQ
	UmHH4RvenFiLZs4ezg3Uzmu3J5+R5FzrooGcntHEWhwB6dZ6R2T8xcwhOHNLgcdh563FEljmL3D
	ij+Wb2A5r6mm++65W4+Fub+qlvLAetw9J19ZIc4wF3dwRZjiXCUqHOA==
X-Received: by 2002:a17:90b:17c6:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-33e911e59d1mr5778306a91.10.1761210883109;
        Thu, 23 Oct 2025 02:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQeKi3ZL9DiqlL7KKJDUNZULNgbje2o0tA0G5GvOl1jWpfNwjwyRN6avI0kYnUb1hUXIrAXw==
X-Received: by 2002:a17:90b:17c6:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-33e911e59d1mr5778238a91.10.1761210882354;
        Thu, 23 Oct 2025 02:14:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e318a2sm1490081a12.33.2025.10.23.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:14:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 02:14:33 -0700
Subject: [PATCH v3 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX73HbJysaSSYz
 JAaP8wuKxtXD9Z0QO56tIfIugVH+hSum5Ewkix/Vd+PHQQWnpV/gRta3AeiVVkEfA82UqSgACB+
 rf1ZLMh4Khm8PXJGYG5cGEd+1ecHP0vzuNdo1XpEnWRXibd9sIMwqD96i8LI6X/NN3tRd2GHIZW
 J/rHZ4iQ3GyG5M38YTNWFeUrmmtTjbT4IXtZeJYFCHZ8hdMu4AWNsdjGND+XhytGeAes+aqxGkV
 bCdKpuMFiWSYkcF7GK/FkDb8iPYJnN+StAoqCzza8/ZNOdw5ETvhxrpoREXdQqBZXLXus//Vvkj
 r8ZsmJhZqUJP22bqr4Yb/mRh5HLT/BmvU8DQWP/oadzriXU3kkbj6M5WO+SYRRCL9HckB8jKiY/
 0cYKDPUIlKhm6q0I5FsG6KX+g8J9IA==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9f203 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=j9zjN4cs5acD8dv8RPMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 2UxjmV_BnTfQIBMzrvLxj8ZPlOdpDobe
X-Proofpoint-ORIG-GUID: 2UxjmV_BnTfQIBMzrvLxj8ZPlOdpDobe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

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


