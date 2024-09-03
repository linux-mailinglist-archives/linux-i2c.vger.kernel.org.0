Return-Path: <linux-i2c+bounces-6076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10C96AB5E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68478B242EE
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ADB1DC059;
	Tue,  3 Sep 2024 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gv4FAFu3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3731D54E4;
	Tue,  3 Sep 2024 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401025; cv=none; b=jjHCTYUTcFjOLyxeZ4a4aqL1oe4ZCQtt6geEjKO5JM0/kTBMT4cxnnWTvCDfpJtV7E/dChDLyQzI4uZFifqcoAqMytsFMTkUNxmFn9KX/E0VNDucrDYYiHP0APw2GWuB+Taf3hh6HCcet4sX4M4Hbm++PsHVJc7qsfW6u0g3l/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401025; c=relaxed/simple;
	bh=lQbhBqzJrpbQeuZr5KFK5lqvmeYMeJD/wl3OmKcWbbQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WfvpYs8IdIk/MoOwx0HH0Y9xGW7WzFPQEvfG63ltyek6srtNqL7evfr1X7o9YFRFaFoOLc7ROMKbZPisrnnGMF7Y2Do31KLYqFJ8cJuUnylqiy7w6f2hhfaWKLGMmg8apXxSJrlvo7Pxz4afxZiNzzYHi9X88Qj/Ib8ifJRHkQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gv4FAFu3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483BQfk3007698;
	Tue, 3 Sep 2024 22:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TQ/vxlC7PBywN8i6bt9nEHId2Z42EXHeP4UJLJ94FY=; b=Gv4FAFu3IaapTSJM
	uHiCQVrLg1Ah2KpkCxqMAEm8u/KtTyQMub/nhHBHNR84RTxfwrXJ0YjZ0YPSoDrT
	0V+Lo5TGmjHKyoRTPs/piW3xSGhZ/cRRgBhJzI2UvtgrfP9KSbv4mVcSVJo47Okz
	WOVincomLCcIJgeY1L0DiG7fmIUq6UY/WcZSi3zOh9YDprHY1a24hiBdaDYg/5m5
	bmBgelwZJAM9EKFrc7mI8iKpS3vu6Iemr8ucUmLMma8jVpDfC3TBX7V5Vs4GZSiw
	M/8tnRzwkB7ZODqT9MlRscnEesgS4wKfgAJSRVIKy1Iyy/veNwbdDx4Ov1byIFgJ
	P2ThAA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxf8nx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M30Wq020050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:00 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:02:57 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <quic_nkela@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/21] soc: qcom: socinfo: add support for SA8255P
Date: Tue, 3 Sep 2024 15:02:21 -0700
Message-ID: <20240903220240.2594102-3-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903220240.2594102-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BP9UprQmGZGLqz7ZFZ7OVTIETLi4fHSL
X-Proofpoint-ORIG-GUID: BP9UprQmGZGLqz7ZFZ7OVTIETLi4fHSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030177

Add SocInfo support for SA8255P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 24c3971f2ef1..5c3bd59eaa69 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -424,6 +424,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QRB2210) },
 	{ qcom_board_id(SM8475) },
 	{ qcom_board_id(SM8475P) },
+	{ qcom_board_id(SA8255P) },
 	{ qcom_board_id(SA8775P) },
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(SM8475_2) },
-- 
2.34.1


