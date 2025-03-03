Return-Path: <linux-i2c+bounces-9692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D7A4C0C1
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 13:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D703ABC1E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 12:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854E12139DB;
	Mon,  3 Mar 2025 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DSdzmB7i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C412D2139C6;
	Mon,  3 Mar 2025 12:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005860; cv=none; b=cAx3LKD5EGoQ+8Vdzphad7LvtHGWd2vREbuJdyNCP72jcSbp8zinynxynBI9ayO30e9EMwi8e/S2XA5wBnZj/MIlZ9fv8eduMZcNwcCMVQvvSZgYx+heZkMEIr1awuKJStaPjtHPsbVoIkXlFDb8e3r1yOwiHcmSrq+Y3qwbXCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005860; c=relaxed/simple;
	bh=3N0J+nLmdrUPNG88pWP93xptqh3l36lndwmwFMOO2l8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KW85Y3QtJYNHx1WLnoFOWejtjryh3AbASErL3b+eeCkTwggrTKI+qJtI9KUWOe2t9kgMZl3pPW1F5Ns2srxvxBWYFQ0O5rCFqlGnNV7NU1uDa0tzyGZvgq3J1MVHAANdQfu1wvp4FjZOfc4LRGRFN2VyGds8H/peugOXlhQsCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DSdzmB7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523An2vx021677;
	Mon, 3 Mar 2025 12:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WqACNOFQHxR
	nQGfjZbipebloyLYP8fDxvj8dZwe3OQ4=; b=DSdzmB7inxgPN1bxoVjBCo1+Zz3
	fKNU+gIwdHXPoJBH4ldP/H3V8Buevjl6SM0uMq+B4RvbvBukeTsVd3aO886qP25o
	lIo9yp8Z89aFffgNPlbSiX+kJqLm+vOE8TXbp/ipQokBewvth1orGtLaiF0cW3t5
	3P4gV3PGqs4yOV8N/DXnpyYNgmXcJ9CNSS4/FYuSe+1A+4cMyHNj7563RC5auQz5
	4BVd06PLKexp7P6F69fidBCVf/kVcadpX629iJN3Jz93B+jlrpFcoZZYpcNqRO/9
	6S536NeVwM+MvswRVuriRecyTzSHxCBwFX2wHnljOhZDIuXPzVn9nElAYIw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t88vxw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 523CiAab015302;
	Mon, 3 Mar 2025 12:44:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 453uakx57j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 523CiA45015296;
	Mon, 3 Mar 2025 12:44:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 523Ci9rc015295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:44:10 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 6821553B; Mon,  3 Mar 2025 18:14:09 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v3 7/9] i2c: qcom-geni: Load i2c qup Firmware from linux side
Date: Mon,  3 Mar 2025 18:13:47 +0530
Message-Id: <20250303124349.3474185-8-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 86Q3HZot8HleYGLqSVVJNgcw_TTtxdKM
X-Proofpoint-GUID: 86Q3HZot8HleYGLqSVVJNgcw_TTtxdKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503030098

Add provision to load firmware of Serial engine for I2C protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
v2 -> v3:

- Load firmware only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-7-quic_vdadhani@quicinc.com/

v1 -> v2:

- No change.

v1 Link: https://lore.kernel.org/linux-arm-msm/20241204150326.1470749-6-quic_vdadhani@quicinc.com/
---
---
 drivers/i2c/busses/i2c-qcom-geni.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7bbd478171e0..b6cf85fbe521 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -871,7 +871,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
-	if (proto != GENI_SE_I2C) {
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err_resources;
+		}
+	} else if (proto != GENI_SE_I2C) {
 		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
 		goto err_resources;
 	}
-- 
2.34.1


