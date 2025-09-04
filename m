Return-Path: <linux-i2c+bounces-12651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB7B4431E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B8AE3A55F1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A6C3093AC;
	Thu,  4 Sep 2025 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKd0cMjd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AF7307481
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003970; cv=none; b=pEZIBYf0QYHuRVb8dEalPuQdqdzfckLVa2mLiz1GeMKbs5lh1JeF1Yo8o3huMYnld+zAfe5R4hNBv7HNcm9vOHv6O4rziI7igyUct8fTW6NGAT5q/xC9kE0Y/vCa/VhGKxDv9dQZ9Un69SyKyauTcTz5mjv3Z8iOgV/7z3LNJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003970; c=relaxed/simple;
	bh=3BT/6suhK8eSmSdIpvmvry+itcjPvXCIyXUxFeuJLYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psAT/HrREtgJdqqaHz2WmGoN46ECGylLf0KXmtEbJUHFoVLbuJ74DSQlqqwgVBypl1zTa+QvGFWNkm+Erp8OU08BcD2bqRnYzatTbA+zpy0qiMz7/trL5KW2T1MaR3U5i4iTv+C8wso6nSqvPBCuJU9tK13hkXPKE+F83AUQJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKd0cMjd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7Np032158
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CWTa+iMUq/YNjoKRpUPGDy30w7e4E4JjtRdeNVcgm4=; b=UKd0cMjd164/BbZ8
	HNbEVGUdupqCPi+kgq9f5KQ3243KNWrjqAGcZMgH7U7xlTxalBoMek7zG2Wps/8j
	FYZK2LW5PTU6saOXPwYg0Nqfh37cHYr7ya0tFReFTx563LWIN5vu1CWBTKFgho75
	YKEcLWaRPYRNrarwX4Lj5UXKHeRDKUkznQ4C7I8wrOybvQidVUGSkU36Aj3LhQZC
	i0MMlqKmsv8cHxBRMPzoRlDAsOJskmUYH7llehYV6cWW/K9A4yweZmxPIvGsHEWI
	UVVKzDavkZ2uXuh+GQqauG/Mp66oTDal/yXABXWDIC7YsE9yjuX4/Tdjb8YFinNk
	gp4fxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpgbvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32b51a481feso1186909a91.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003966; x=1757608766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CWTa+iMUq/YNjoKRpUPGDy30w7e4E4JjtRdeNVcgm4=;
        b=easYPvUw5g5GT5dPCOHMBG0qb4hxRjd2bxN3W+YO5ylXgj5J8y/7ttxVHrHlbWcJ3w
         7V/ipJqAd6EDkSSgwP9xin1ZgFKI7LtVNOzqtQDHnIjOLa8ldLhrOnQvbpJbOgKr335s
         4EmTxtF2SgWfmIRrk/WTnZjSfx2PjE5KHF0IP8ti/yGz3uYRKaPJE68tA4sRE9ZgWQhY
         wgmVmh2Mk9DCcY38nQv67GS+bTDnpx/qYabdIAH6/2crQled4ub5oJgrvJkd/tkLxFgL
         NoCYwCgoo+Dvz8MuMpUh5G5QQ3XZcfyPwlZdUu+J6CQDZaQ6mN8Mk1QrAy2nz5mRs/Xq
         2aHA==
X-Forwarded-Encrypted: i=1; AJvYcCWpNjM96ROHX44ripLXNlkpZrlbY0bUZ7kZweqxXhaUl+xrJX8fKj7eRleckejQQjQcTJ2wt1AMRtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8r9fSrY6psfsZ4OKhqtHmiZoUsxTDmSSbOMOpilbwsEG4VFSy
	goxkpEeJQ9Fitgo1EPbKd9MKj7Mz1t9s+nxRB+hFTliZXt5qRTbpK6Dq0QjQmPRi8C9FjyV72kg
	4QeyCX5L7Y1+7bukyrrEICgfmEdoAuL7ZIIMNX4ztk8DJ+ngXT0eFsJd1kZHutOrzE2A6QI0=
X-Gm-Gg: ASbGnctGd6+CzonZjBjo9D+eOT5Lmrd9sA2cRUARKgLXDOkxK9I4EhQqy+JjZ/JxXo0
	R9NF/lxh30IoVNV+La+vYBbbfNSemaWwxw/d9x8BmUNo3zf232JBJV15AqxkegEnxlkEG4DzUuP
	/DkhB1vurXp4WH0IUh7bb5X1KMGWuyUd93lJFR9qW9XSqBK/RM7E5jWWOTjVT1nc5leB837dXa5
	VCZGPwkwU3OhpcRa4CVNn2DZQZ1PCvVIqkKOTcGOjhYvuIpqYrG9q4fFzzHRVHb/fsMQTIWZe0A
	cj/1Og/UGGKj8XMzP56Om6PcUf8JLUD4R9+WTjbLVXozIAltUF1ajLWdXHxfIyBwyJPo
X-Received: by 2002:a17:90b:2d8d:b0:32b:baaa:2a93 with SMTP id 98e67ed59e1d1-32bbcb945e0mr293542a91.2.1757003966004;
        Thu, 04 Sep 2025 09:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDysS+g0JZmVZmToh9tFIcpTJv8ha6RIvIwKxET4j1oDI7WQvl3Edcqg5NJKS5BBiqkUPp4w==
X-Received: by 2002:a17:90b:2d8d:b0:32b:baaa:2a93 with SMTP id 98e67ed59e1d1-32bbcb945e0mr293495a91.2.1757003965494;
        Thu, 04 Sep 2025 09:39:25 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:24 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:08:57 +0530
Subject: [PATCH v3 01/14] dt-bindings: mmc: sdhci-msm: Document the Lemans
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-1-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1190;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=z9TI86piqLkEr60N8aHlg5lL/hJiHyO8LgOhxGhTRpk=;
 b=0/sdwS0aEk7K/4iQNj2K6mKUxiyzvbZtRvG2f1VMV2jqu9zimljBsho2c4cnPjvLldMuPOcCn
 oEvvjp4y5DfDAvsR59uCDcgwrwr22Cuau1UH1lvAcXiJstwFS893Dct
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: Hi_fbBgWjUpguYM1x3OGjR6fGJ7lKnnO
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9c0bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=oyqPBBxx3V5-Y59TF94A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hi_fbBgWjUpguYM1x3OGjR6fGJ7lKnnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX0kRcz4m0T7TY
 MVYzw4e49aYQEeJNjdgyHEULxT1x3OWVBSgSGXBYbGUu1g+sQ3dslPqmDByN+Ok/Ki/qMMk6GcU
 4DK9H5ZJBLERbsRmEb6RTzPZeOCYwLk7drZ+F9CfmMLXrM0m9S5G6COYmthOivtiXeeVP6hgfjQ
 5RIwhcvJzWP4Pj4BtqgJhx8CErdjLMnFOvCzO7b9UjZ25kBFWIstvhQ1mmKE2ei4yvhIthCEp+U
 Ufj2zRtUCsWYH+vgBk7p3vWmChEFZ7mG/zrnZwHEBKt9jgjEy9liE0GHdIRI1QPblJyjp2WYfHz
 HUYUcO2yfZfq8c8/60qNqVdlPMyQQHaKcAYuEcHXQzrJH6vyPDU+4mwvZsargZ8BDEts9OgAeal
 57kMO8lh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

From: Monish Chunara <quic_mchunara@quicinc.com>

Add the MSM SDHCI compatible name to support both eMMC and SD card for
Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
compatible string matches existing Lemans-compatible formats without
introducing a new naming convention.

The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 22d1f50c3fd1..594bd174ff21 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -48,6 +48,7 @@ properties:
               - qcom,qcs615-sdhci
               - qcom,qcs8300-sdhci
               - qcom,qdu1000-sdhci
+              - qcom,sa8775p-sdhci
               - qcom,sar2130p-sdhci
               - qcom,sc7180-sdhci
               - qcom,sc7280-sdhci

-- 
2.51.0


