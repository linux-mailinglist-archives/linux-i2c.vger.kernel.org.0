Return-Path: <linux-i2c+bounces-11561-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA6AE6154
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 11:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C22C81B60A63
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416F0280014;
	Tue, 24 Jun 2025 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3Of2/yE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6418227F758;
	Tue, 24 Jun 2025 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758679; cv=none; b=gmqhRiYjKu9ZoLADEvt0+AiT0W8/fBK+CyOmJG17mRCl6/3jXnOGfbHNEZ2fPKOhezCa6DKdpddINlAqqOBM86wLjtuYKyHaTmxIQ82feTzO1kf4BSvZncoFH6niA7+oAUMZ4ym0m+/3DOYF7bcm5T7UHJO2qz8oHZC+kc3GtaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758679; c=relaxed/simple;
	bh=422Jxix031CITAyOORwSjyqpRYERpQfiamPZ0fLc1kI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WUgjw7vPGMnO/QxO1pSrg2v+Sz8KpDueN5l9f5BRHKkZ85+rnR20QRUzXwxXU1v5HftVN3LWYo823RniWg8r5vHCLZVXVTjf/5D+R0ChgVmWDeiP3EVNNThFjOi65xvwER9HuBOb8n704x5CH6Yj1kLutxvzqDwxLzr5OHSXPFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3Of2/yE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O71hwR032292;
	Tue, 24 Jun 2025 09:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5DysY9kG4K
	4MOGHmpbuiUwISpPP1lYk9BaLzyWq/T8=; b=A3Of2/yEZBzzmI8FlCpdAgrtw3z
	61k2w2FYs593wzF8OdF64hVN2TQojQH2CQz+7KWCcqIzdAqaSOi83bI1gVZbpm3T
	3jm0ciZFlngioY19wsiIxyVxbAeLO/SMBKlN/7BGlhSP1Fhk4NBfHucjJjtUdmMG
	hX16ww2cjUJPceOXDW1R/jQLdCwlHcSUJTh1Z/OULLLNLAv83Cs6jrb0XadU1uVB
	dXYjGVgHUTTzHZIFyUxxDeA+n8oRNyzd4BbdDSNjNQ/44Ac540nYvGjfv0OPIWNZ
	TQoWPv+3cRIh+IQ7zJZi2JHDfFiZuU/UU32qmgzu7yEdf1PrkrZ8lVkAXUg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1t3u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O9mLKU021942;
	Tue, 24 Jun 2025 09:51:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntktdsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55O9p9gD024202;
	Tue, 24 Jun 2025 09:51:09 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55O9p9xK024198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:09 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 1748856E; Tue, 24 Jun 2025 15:21:09 +0530 (+0530)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v5 3/5] i2c: qcom-geni: Load i2c qup Firmware from linux side
Date: Tue, 24 Jun 2025 15:21:00 +0530
Message-Id: <20250624095102.1587580-4-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a7511 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zIdmu9zckVospZd7ahEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AzLLo-HwANpPfceNol05aKePmJEpxquY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4MyBTYWx0ZWRfX9+fmwcsPzVH5
 h+OWP1GFNK9wBAHBshIUKyyAr5a/I/ehlikOb3oPyD5UmaFHLlQ3wNnENoiLZeB6GhQ0PxiiBCD
 Ri1cNflySmKc3HhT7rYRcm38E0VypwQHZb5BSILCEUO82SXC6u1bfPDper5sZFubCjcT19YPIpj
 FVJHPMkf7QAerrs4Mb/uVUkn2KfiXYj+AEx1Zw9lXp8XHmUnYY1fphTt9fO7BZhyc7qXyECAGvo
 gYc9Otvf2KA92nQWxrX7NoSv78qHnbpKPKHEQ6j8MITbQCX+fdSajZNzIJCfwx32tZxIwvjE6iS
 SWjp4Hlskzy2bWAbB3d3ZhVOxeMJO7pavKukTs7Q2wd0JkJxuI6369PInIEer1DHkS7NoBiQdTk
 jPeSORNh/cVw0mVoKVDaqdUEKl0h4huuIDje0JHFLqwFhqNc5kCtUJmbTeOh+QEw45LPWUYu
X-Proofpoint-ORIG-GUID: AzLLo-HwANpPfceNol05aKePmJEpxquY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240083

Add provision to load firmware of Serial engine for I2C protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Dependencies:

This patch depends on patch 2 of this series.

v4 -> v5:

- Updated the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-4-quic_vdadhani@quicinc.com/

v3 - >v4:

- Add a patch dependency note.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-8-quic_vdadhani@quicinc.com/

v2 -> v3:

- Load firmware only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-7-quic_vdadhani@quicinc.com/

v1 -> v2:

- No change.

v1 Link: https://lore.kernel.org/linux-arm-msm/20241204150326.1470749-6-quic_vdadhani@quicinc.com/
---
 drivers/i2c/busses/i2c-qcom-geni.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 13889f52b6f7..11f1089edf37 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -870,7 +870,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
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


