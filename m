Return-Path: <linux-i2c+bounces-13132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1747B9CC6D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB614A0CF1
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 00:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECF9625;
	Thu, 25 Sep 2025 00:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHjGhZkr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064687494
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758580; cv=none; b=rhcYzc/WT6UrdPagsd42tZBavEaPF8KEGfT6gtw7W2InRU5hSKcZZSV1Mg8QmAxWWi7lZjqHIiJVwxGhTukbKxvom0hZIUR0llg4n14iNzPa6Tto/yqBdjp2oBDeHuStcwyIpwD5XZJUf58Y+eg6ROYhVSz1fp85u9bjaai+2UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758580; c=relaxed/simple;
	bh=WBOdnGCqtO8/DJkdBoR28EHJL+lRE3iOJ/Mmmvw684U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XDt6nvtTabID6KJYqf8QQyU0eJQa8wevuZxH1KOVVpeQWybyDXWD8KsyacyEYez5uPgfSeNXJTZOZsVuaS1i3O9WOb8k4GW6u2h/LrfwyusrYVOk4lCiauGBkCoRFwuzCQ4M+3Wu3G0uZ/fdjwR4yLQ+XqlzfGFqtGqrHXwrVgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHjGhZkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODAm0A021499
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FVDJLdbn7C6FBvhh2FmnyA
	hinN5l1LuKxaCC0VoE73I=; b=NHjGhZkrpyzFeyJAR43y0NKgVD/KJ8vyVnwa+C
	GVVC7JOBE1gTnYtrsY8t9Qgw8hGXUAFue2bJ36crMqBgt25ccZakEA35hNSftrPe
	LS5VBLPPOaFolDjcfLrlKDbbIKohOI64g3hMRtO9Duypgr4aMv87mMiCV5zrw5rd
	HYKygtEErPrg0GwWDZAfHXK59OY3Yybx8GL2sb9tgqyBbkzEM22fYzB87LcjY6NC
	i9nJkSgNVkrxeinZyCjUFk6jUvOpY9RPSp+myPdiNQ8ARwYOwbutlm2TU2yR2OEY
	sQfsFr56fsWvVjSwajYMTbA1QLj4Fj2ARd9ee6YR3oWklweg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadnt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 00:02:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25d21fddb85so5584775ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 17:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758576; x=1759363376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVDJLdbn7C6FBvhh2FmnyAhinN5l1LuKxaCC0VoE73I=;
        b=doWMRScTuBWuWNemrbfzZF3WxyH4LF/21Tcz1935bLdkPce9j1p2gJPcxvvOAf8ZW5
         WiISVle6uE4M39M7IYI2BOudrmNT1X008RdKUtL7JWumebAK7wQ+7RM6A4A0UxlR01LR
         5+6O4B952kjjiHXtZPRVvZwjxMHQVc6FIRPKn5njrlwxIXY/xl6h7dYNIDkasWAKeCQV
         a8YbLqEXKYrOo3q5PED9DQBSPILjfpdpap84+vC+jZ1+KhyB1u7yEJSmlh/NOnsBwQhR
         CQWjYzpj7V3pnSvptdRtuRTlWeiYMnizgJB1fzJCbJ210in/UN44W3QSOOkrPaZhp1Io
         ZQRA==
X-Gm-Message-State: AOJu0YxG4WIAS2Wkadra0fG3/h5fPbTbqISpKqSHgeC/gbsiUSsSLvDm
	DPMhVeQSWCWSffjzeygnvb3IPEjAphQVpwmIWYXxCEXPZXfeXhHdqS1lc0Mf/7MSFnUQc1QdMLA
	OHWLTLiy+ywOMnnLGRe1VbWpD7oVwRuhTJqWIdOBNpuD1tmVzoyjkMUiS0zL2NIQ=
X-Gm-Gg: ASbGnctrixf7hr09bfY9Yb/zV4HaGngjkYBpAx9l54RMEpPMrl6Md2miuJFIP9h3nSy
	wvCpKpfuCG+ViA5foUflqAr+Ml/xTSMlvLUkd2sBHur0HZRPF/kYlRTZyFv8rSZFr0TjGSbq5oY
	xEqawoFx/C4hBl7r395jV4kdZ0N/tNVSYXz+3PT4VVFVAxdyDw6LhbRK6cBUv0aBlkzUyVt8o3k
	RXhFqrY+wg/2slyYMFUyNWcRL3sztgtCOUMhrfhBo+9k3DEAOr3qmnRrXXGQ+KV7PGkCiW7Pr8U
	hPYFXoMIX0O2t64WAFxw4F62FsoVdJhuQ/F9RS2egdNH2UZTgUG7D0gIRpGV4vwdQXoAxHbup7X
	RISsJuEkr69WG8Dk=
X-Received: by 2002:a17:902:e88d:b0:263:b8f:77dd with SMTP id d9443c01a7336-27ed4a5ec57mr16016985ad.57.1758758576428;
        Wed, 24 Sep 2025 17:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDia2gmtmkvCVOrNQm+dLiZu+nms2zkdbZoHc/NFzjpKjXRmJZ2zf89NbxCNarVMVoCxn2Qg==
X-Received: by 2002:a17:902:e88d:b0:263:b8f:77dd with SMTP id d9443c01a7336-27ed4a5ec57mr16016615ad.57.1758758576011;
        Wed, 24 Sep 2025 17:02:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:02:55 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] media: qcom: camss: Add Kaanapali support
Date: Wed, 24 Sep 2025 17:02:47 -0700
Message-Id: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKeG1GgC/x3MQQqDQAyF4atI1g2MsS7sVYqLOBNrKE4lKSKId
 3d0+cH/3g4upuLwqnYwWdX1lwvqRwVx4vwR1FQMFKgNHRF+84KRZ0xNktDKs6NmhFIvJqNu99O
 7Lx7YBQfjHKdrP7P/xeA4ToMmEEFyAAAA
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=1899;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=WBOdnGCqtO8/DJkdBoR28EHJL+lRE3iOJ/Mmmvw684U=;
 b=r4eDTZd32hxHigyWyEa52AxJeKsEUWCWng3+hmyr9O8xR4vdHrn/0zAUu9fBaojanEFuQxsky
 Q071JVU2c8nDO1WcSYps9UiWc+7pL/dwA4h5x+vNynWx19+elT4mvly
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: H8nnqyilQhPnWhI4wpUiOpiosQ1pR0dd
X-Proofpoint-ORIG-GUID: H8nnqyilQhPnWhI4wpUiOpiosQ1pR0dd
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d486b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BuH3vWvutgcbvWnSHJkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXwo2RpN7GVYhR
 WGT5qSDyAxcr9dWW1uPc7JSnSxDOX6E5Ejql6pf//0HkGxnPNTR72WbziASBVl1oOSYahg5b8Dn
 Izb1ikSpxAzs/VUkejBVM9zn+YLHI0FEICV+dEyEez64/a24r/eXiEX3Usa2yPscOirwWX4wgOs
 lIMjTce623zZeo4hiR84rTst64cQVs7Hyye/CrfzjQ6F+J3ASnjGURF6EEUACy16p8Lk8RE1Zx0
 FWkdkpQW0EYaH8k66pKJ9zAAvwkgMgosMVbrHGwg6LzXO0+NoshTkMyepBpRnFDMmMHUAsPcia5
 9utsf53bQpn0y9umIzmuIQjQo0EOy69c1FXif7e4NN4WHMNvNc42K4BsbH8JXBGuO4EIECAS9AI
 0atogeqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports.

Kaanapali camera sub system provides

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Hangxiang Ma (6):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      dt-bindings: media: camss: Add qcom,kaanapali-camss binding
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  17 +
 .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 379 ++++++++++++++++
 .../media/platform/qcom/camss/camss-csid-1080.h    |  25 ++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 138 +++++-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 156 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  15 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 347 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   2 +
 13 files changed, 1575 insertions(+), 11 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250922-knp-cam-d3de05e4923f

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


