Return-Path: <linux-i2c+bounces-4480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8A291C5BA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E5AF286F4E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E524E1CE083;
	Fri, 28 Jun 2024 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L3l3M+88"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DED1CB33D;
	Fri, 28 Jun 2024 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599581; cv=none; b=bqYzGm9KgHlo2DUzA7pcAusZMENhmm6OyQeG8wMbTcp7ShkqX0o9Unl458wVhHVmVSXBmpck5bG5GrlHs/raEgxbPVsMldNJu65ZHVLQvajOXyduxDBhz3rmjlFSJodvnswMo49e9Nx/WWsuOO2iwn79Kq29cTKq3VqWAV1fPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599581; c=relaxed/simple;
	bh=5LAdAIQuYnxGpxmiqIzO3Z9pvIcKdsqVhCyKx/HScdU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=d6EV7dx6WBwVI9YapdIxV5Q5hREeBjxTNWEuUFoxjnGaFt8WTtiDSVH+KPZgF+dVnQ9qJO8k4V7Mp788vN+hqLKHXvgB5jeY8GxL8O4ePLiTrZfiMbrOKxsA9pAWazHXp02ltcHEOXeslVl+48e+BwCOMS6m2QITDW3xz38EAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L3l3M+88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SHWPvf000535;
	Fri, 28 Jun 2024 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r2Eq70wmRF03zhdc2osX0V
	jF81z3X/LLIZfDvswHpUI=; b=L3l3M+88bSNL9TpIv5sX0KLJ7R+pwUFBvJ8QxC
	o9pVdxjzTsngV4w6NWUOGZ78WNWSyCMPeYzNCncTnqklKsC71EHEQPigeMN9dJ1B
	phaVOp4sH9oYoYEAj3K7NUvZ/zLdKsDAolQjwZ+bhm5kIaLZfZE+Uvjr8qILW+OQ
	ZIijXhUxjE27OdMQNh2nqGZVXtuyTqYaondGA6FMlvFxHSosKkxYSBr36jps9Q/O
	iEj8IrtgzULgwmyZLyHVtwK1PV5AItX432wxgNQQlsGJRPIzN/U557Y+s7m92Ga+
	YYjWgJL3xUrwBgqWUo/0GC7wdxX7ILlUkdrGg0C2wjMwLxtA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401ubvsjvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:32:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SIWrq6020098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:32:53 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 11:32:47 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Subject: [PATCH 0/6] media: qcom: camss: Add sc7280 support
Date: Sat, 29 Jun 2024 00:02:34 +0530
Message-ID: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMIBf2YC/x3MQQqAIBBA0avErBPMpKirREjYWANl4VQI0t2TN
 h/e5idgDIQMfZEg4ENMh8+oygLsOvkFBc3ZoKTSslGtsNPObBwFvsx55Gzk72g8xks4XTW17aT
 sagv5cAZ0FP/7ML7vB8dWiz5tAAAA
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Loic
 Poulain" <loic.poulain@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj
	<quic_tbhardwa@quicinc.com>,
        Hariram Purushothaman
	<quic_hariramp@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719599566; l=2390;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=5LAdAIQuYnxGpxmiqIzO3Z9pvIcKdsqVhCyKx/HScdU=;
 b=gUV8kFwt16n8/gJijlTtUEqz9rm9j6sLP9cei1bsOxi2wuC9IEuBYp5e9krKWiNHpdTPJWydB
 BW/zW8CaxzdDYn8Hl/jJeJE1WQZx+mavWOCLUMp8NWRNYlPXutAUPMJ
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T2uW-gkYVmSooAXMzR-xZg6bnDJbfcuk
X-Proofpoint-GUID: T2uW-gkYVmSooAXMzR-xZg6bnDJbfcuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0 mlxlogscore=578
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280138

SC7280 is a Qualcomm SoC. This series adds support to
bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.

SC7280 provides

- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 5 x CSI PHY

This series is rebased based on：
https://lore.kernel.org/linux-arm-msm/20240522154659.510-1-quic_grosikop@quicinc.com/

The changes are verified on SC7280 qcs6490-rb3gen2 board, the base dts for qcs6490-rb3gen2
is:
https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.com/

Suresh Vankadara (2):
media: qcom: camss: support for camss driver on sc7280
arm64: dts: qcom: sc7280: Add support for camss

Trishansh Bhardwaj (2):
media: qcom: camss: support for camss driver on sc7280
arm64: dts: qcom: sc7280: Add support for camss

Vikram Sharma (1):
media: dt-bindings: media: camss: Add qcom,sc7280-camss binding

Hariram Purshotam (3):
i2c: Enable IMX577 camera sensor for qcm6490
arm64: dts: qcom: qcs6490-rb3gen2: Enable IMX577 camera sensor
arm64: dts: qcom: sc7280: Add IMX577 camera sensor

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
Suresh Vankadara (1):
      media: qcom: camss: support for camss driver for sc7280

Vikram Sharma (5):
      media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
      arm64: dts: qcom: sc7280: Add support for camss
      arm64: dts: qcom: sc7280: Add IMX577 camera sensor
      arm64: dts: qcom: qcs6490-rb3gen2: Enable IMX577 camera sensor
      i2c: Enable IMX577 camera sensor for qcm6490

 .../bindings/media/qcom,sc7280-camss.yaml          | 477 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  67 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 215 ++++++++++
 drivers/i2c/busses/i2c-qcom-cci.c                  |   1 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  16 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 340 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   2 +
 9 files changed, 1119 insertions(+), 3 deletions(-)
---
base-commit: 18eeb2d92baca167809cd5d48eb60e0a5c036d51
change-id: 20240627-camss_first_post_linux_next-f4163c90093c

Best regards,
-- 
Vikram Sharma <quic_vikramsa@quicinc.com>


