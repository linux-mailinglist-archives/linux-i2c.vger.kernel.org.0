Return-Path: <linux-i2c+bounces-4485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F4F91C5D5
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DD461F21201
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C056E1CFD7F;
	Fri, 28 Jun 2024 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z4I56sd9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFFB1CFD6E;
	Fri, 28 Jun 2024 18:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599611; cv=none; b=a9hmDOciBdr9Tn9/HCzDLEI2RzWANXACld2S6nIPPiw0rxpBpIU1v/17Ql0gxiBoKMCfUXhcf2eQeLFKsaNA1SVJtRvZk/DjQ+AAW1F0VvilaXZplVClfdPXpE4UO1XaTaAaty8j7KsHRxDzv3WVgFqZWP9TvcZPRWBEEl5eyMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599611; c=relaxed/simple;
	bh=itUnfizkjmWvh/KtRO0AOl5/rTtZSZ3+zEgz3qRVdEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uAHWuSaqM90A6EdF1cSanSJrFz0OdqraVaSnudvJHVotFOQfJCtdZA37EEEzGRsLBRwydu97YCYpZeZ0ved9UN9wsWJ9RsYYffMfA+WdO/ebRWxWBgoP1YnfH4FFD0AmsmUtqSRzRGVzl2ERK4wIiYtVM8sUvkz7gXgLM6/ADhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z4I56sd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SHj1rd028637;
	Fri, 28 Jun 2024 18:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1iaqd6qOwHhXsR0PkkgJNhyOo9NG/71cAUModrxQlYw=; b=Z4I56sd9iGbeA1R1
	jSjJ4ruZaNrCU75jUarufmcUS1V+GJD74hVwj7dt8aCEFFXmoMCfJ3NUdIj8Sfb9
	kkiBYRDMf8mcJh3WZ6Uf5dNjXqn55Zi3XGG2TJalUoSQPrVEvuCdfE3LJptPgRpx
	a65qgtwooUbLgmgFfLemlCtlp9AlqjrvVBpfMj0KrUZejxqrKBJ+JosPYNPx4ddG
	GtXpTMB7bU5cHS4HyZ4rTh1A6WpU1dS9K6ZyPkxu+wX5d1E4wMUfed7sEcjRhVz5
	j/3UEDmVHp7OkTJO+Z3cCwkhg3aTdZbRIWoQ9xOqqO3yJcSjI+ebzHpNrqfBDoVm
	UTATZg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm32mfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SIXOsG030363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:24 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 11:33:18 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Sat, 29 Jun 2024 00:02:39 +0530
Subject: [PATCH 5/6] i2c: Enable IMX577 camera sensor for qcm6490
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240629-camss_first_post_linux_next-v1-5-bc798edabc3a@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
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
        Hariram Purushothaman <quic_hariramp@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719599567; l=936;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=itUnfizkjmWvh/KtRO0AOl5/rTtZSZ3+zEgz3qRVdEA=;
 b=pSoWFc9+3u8Usa/vHe9ecUsr/LAXBsZhSomtmt7ZCMwYpCnqR7rUYQcPo4hvE07oDvIku6v9G
 2TOzflAVFQYAH7W0EK3pf5SR9jzk8ejgXR+wXzWy6F0gOo2IpOgbYLd
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PZPcc8oAxrgU_eBiFQs8Ri-wt6NwE6za
X-Proofpoint-GUID: PZPcc8oAxrgU_eBiFQs8Ri-wt6NwE6za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280138

This change enables IMX577 sensor driver for qcm6490.

Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 414882c57d7f..10e6df566ae3 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -817,6 +817,7 @@ static const struct of_device_id cci_dt_match[] = {
 	 * Do not add any new ones unless they introduce a new config
 	 */
 	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
+	{ .compatible = "qcom,sc7280-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},

-- 
2.25.1


