Return-Path: <linux-i2c+bounces-12758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F3B48712
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91803A3522
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5672E3B08;
	Mon,  8 Sep 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hz7rxv8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED62E2EE4
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320031; cv=none; b=MyF+K1H3052VphDShUfzvQWxkZFpPlMDMkV5fF6Zy4r8snsEAjHzAo5q+K7eHuFWCKVFhHw02BujSYydo4SHEKKDl7KE32DybPVxXX1nxgcVIWmzm/fnNX6jiXCBkd792pt0XsIjNuXWPeHa+Eo+09Q6dykTIWm7kUC2NHh4XDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320031; c=relaxed/simple;
	bh=orOKlPtQLn5AGPhNEQlHkVZYfkJ9hhPyxvhObhS2CkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhnKLRUEFRjx8ew7kVBaDzGxD+styFRpNcnGVKQ/lRUubDgUDhdAr2EPqtOGjfTPxt+o9MV/5/QXkRbX8JZC7WkFrj6HQecCy8XHEjE0GneQhSX3cu7DKWgoL0VlQ498+/5qdxfE7w7SprH9jh+q2wH5D/IfwtuI0w8d+vD7NlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hz7rxv8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MvX1W003936
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uiQp9Gtm65Pdl4W6k0WxVxnFve96qzLdksXdOVeH1VU=; b=Hz7rxv8mmA3JvVJV
	CS3ADwafbY16xoZwLnciGXlSLw+pIRijKLqJ824/Cu2xMrLwLTsAh3PUAUqg2V/S
	r0uC3UEkkYOc9Lr77+YbRnzyAOCTAKHQgTPboFwUUpa3eI8errnpSXlIkv5KjnEv
	LtTkq4sbyTvIigTM+RJeMlOaIIGFkF43z43iA+Z7viP/3PWufYo21sV3Fcy9YPgA
	fEgXoNrgoa47Qoh7/NnOWPnNc+0jL78ZcRtkWorA9wcVIYwjCamN0pDe0wh+JRjN
	Ou4tWX4YKhdqKGQYeOVCKJ9Oh9ys9wuEFuBzDyWSV9IkG6yKKn80rgOu2odBp+R2
	yKvv+w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8btn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:27:09 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-438c60d4454so4804507b6e.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320028; x=1757924828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiQp9Gtm65Pdl4W6k0WxVxnFve96qzLdksXdOVeH1VU=;
        b=eNeF2t1fim91BrJXrjIqOLCh8wE3piAF8sZnmA/WWyamhtM9PZn6Gp4auAhfd3p7aR
         EMM3FZNHqih1lgGkUQTbK5HY+cps+ASa6iVsU/pYARyznj4mYhmNkj5xF5hr7xiAL1og
         lm8nQf3VvDSScQncsZYHXLXfRc5nLPOEzcUvH9eZPfamABXU7j/zXPvrLPl1pPl0cKTm
         zpGyYxbdB50AI4Pz8FllBi4qm0nNINvakFHgltoCIWygekvyIKfffPqp5oiqeHMuX2YI
         PU2+JfCNdmz+BxemO/7ezLDV3JSwndBOSy2DHgY/Zq9ZepP78ug4VjcPlN4WNevAdVkS
         5bBA==
X-Forwarded-Encrypted: i=1; AJvYcCX4ys/OqBh7syHB+6teDVsgV1i3y41SEFUtbiB08A6gHoPY57RFJUlELHpYlcv51iIQoQLPCycg/kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YydkZjNGqQkx68yNv2RCS0NbwEyIObsc7Qv1VMeLRfoevc6rrZu
	GA0iQdi3HZaGUK6mjDdTcsamswpIU89wx6W5xgIXInJLjEPH2okuZ/abdxAkqYM8ok6midxHhWd
	yZ2TDQiIKOI2TPQMfpbZ6PCcVOYLbDeV1Avuru3zv39mJuCQ0qMLRicPxHeA4nD0=
X-Gm-Gg: ASbGncuTjq2oT73bf7B9dS6z3g4fUFUYXU1mm21CEH+1Mn/e2jaMUJHoPgnLOyh27p1
	axV7D/UW8wr4Hzu9YRz5swGk+RxcGhhlHnBkt41W+FJMefatb9HwDarOjR5A+EBDNEdR3DVruXb
	iwYQgSAa6UV+2W7TiIIecBsnEoxZoWowHOoaA9rF9UnCuzBlWPNEQEB6+hy6RzYRlWWvC5944eW
	sy1EqwMAXExvAtDutRBMsTPoZrk2Uk8XBN0YKodEfryDMUSfPOoE9Dx2Cq5vn9lf5Ld3JNc5KfQ
	UZI4h3HGDbPyEsTWSGf9+cFyGJv/E/6qRtTCWDAOqqnsAFq5LXK75DoLAFH7NGBB0y88
X-Received: by 2002:a17:902:eccf:b0:24e:47ea:9519 with SMTP id d9443c01a7336-251718ddac9mr98887325ad.47.1757319614672;
        Mon, 08 Sep 2025 01:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1vovZ9gkQhZX2rd/L1KkPL3qlKIyszAECpRN309/lL9U00EjRsbkgJQyBobjrCkcpgK0uuA==
X-Received: by 2002:a17:902:eccf:b0:24e:47ea:9519 with SMTP id d9443c01a7336-251718ddac9mr98886925ad.47.1757319614225;
        Mon, 08 Sep 2025 01:20:14 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:14 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:51 +0530
Subject: [PATCH v4 01/14] dt-bindings: mmc: sdhci-msm: Document the Lemans
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-1-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1254;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=v81wxg2XnsrITbgpwYn82teoXJQ/l0LPAItmU3R1jlg=;
 b=+5W9XDqLZ3HvskV0J+JhX/1XQy4z2UoMFE1DFgGDiojtHaS1/WyS2D/FlKi2vbAuaFXMThdCo
 qIZCasUOKXmAzeHCr4KNp9eFh0u7hWlbVQvGhT57cjHSkNuYspnI91N
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX6d9I1WY3tJOt
 QrazlxAuWT7aoQPdnrfqPv6MsXuT5/toxS5YkIUQDaLZYSg3ZappLFCDhjWTfAeLe96JT1qD6Pq
 g4yeyqixQMC44AUz3Rfnnj22BMN62aWM/0rRzOz73VGO5BtGQYG2JUXPkjnaIBWE4J3kq79qsre
 eqVLgbk6+Fxqe2BqSQbqzgSx2VUBRkS6JowRcuwVwzHoEW9u+Tni9WCKUhzMNwu7987OQo997WK
 4BSmjmvvZ8yB3+ByiFXb3eh/3zgJwnAods78xHbug0G6I7r42AVzUsvTJUQSDnusb/2A2HRF9Fs
 Ne6m9UyEVFd3T/78ppO8rf3oIyX/7hshXdI9a92WrSfCvlPPHcMxxrqwPdnhk8l+pL0Lcotn8ua
 JC8dHg+X
X-Proofpoint-ORIG-GUID: JnTSzJtuD9s4XKlNd6_37HhKRN8BXp3k
X-Proofpoint-GUID: JnTSzJtuD9s4XKlNd6_37HhKRN8BXp3k
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be935d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=oyqPBBxx3V5-Y59TF94A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

From: Monish Chunara <quic_mchunara@quicinc.com>

Add the MSM SDHCI compatible name to support both eMMC and SD card for
Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
compatible string matches existing Lemans-compatible formats without
introducing a new naming convention.

The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


