Return-Path: <linux-i2c+bounces-10744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D027AA803D
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 13:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DF011BA169A
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149C31EEA43;
	Sat,  3 May 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IIxTMjD7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D771E1E1C;
	Sat,  3 May 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746270649; cv=none; b=WiFjvDnziFPP99I6lHwzpSMmumZoYlbDY8ytJM26T7YiNGZ+1YtwkHi24MvsH7zkp/Tau0vawrlCp1dtGBmPxrnlnBT7HymcgFw9z93Eyg0n+BXg10NIUxmJWvHz92UZUIpHvrADS0/8A8hhZ+Lve6WEy2nQGm7Y9ExznNKS7hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746270649; c=relaxed/simple;
	bh=vXenSqa0GZCAiizDDRHiVREyyv4vVmy/9Ku0iAbN+dI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kUBvpSx9WVltEoYnrxyz70sez/BrzBbwMZ0xKuFwAvzOA3lgXxibUnmgnWVXg9P8i8OONgxhWgJkYcln2qNBNjJIEjhygEi3XHDxlA3ftYb2smJVjMkFszoX1SJbAx58+vaVFiNLn20h6MhKOT/RFtAYOqsZM9WGhrWKBgzQsXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IIxTMjD7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433fuLW009129;
	Sat, 3 May 2025 11:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4kcWSo/1jWP
	WH2YjhIK885fOUoUgdAST5h3YUEgrNoc=; b=IIxTMjD7zDNLSdz0zhaL8rLz0A3
	n68OCYQ2Y+gsC7AE49e8jOp6FyIb3eTPHmNhMs9O0nZiEjpGNajRu2F1SUDEFwZ+
	ww7lgTKughDwoR3BQHZJ+DBLzvYlDx23v1p/IF9TF8whGSY8WjELuaFPd3eLiG59
	sFF565OUg1Dd9LtGJarwRMlKaLUVMMrkUew1ww7ACo05GmbkxJFzXNe9cRyNrrjl
	IiehPfKrN2IwwoM6dJGqGh5tgxORUXjmmR+LAPdX9sVKtRZK+vv5PXV5Qnivz474
	S59HDcDAiljWKCMQg/g3yZB+P702v53nkaGNADXjs7VwQ25YBhJbWjDozxg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep0mwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543BAY22023619;
	Sat, 3 May 2025 11:10:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7kjmsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:33 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543BAX8A023602;
	Sat, 3 May 2025 11:10:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 543BAXFT023597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id D0618573; Sat,  3 May 2025 16:40:32 +0530 (+0530)
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
Subject: [PATCH v4 3/5] i2c: qcom-geni: Load i2c qup Firmware from linux side
Date: Sat,  3 May 2025 16:40:27 +0530
Message-Id: <20250503111029.3583807-4-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
References: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6815f9ad cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=zIdmu9zckVospZd7ahEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gV4CgntbKIFOWK_ftvcY6amYs39Ctlwm
X-Proofpoint-GUID: gV4CgntbKIFOWK_ftvcY6amYs39Ctlwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA5OSBTYWx0ZWRfX5kvPdaUcL+Fa
 sgI10ZL0VAoJllbRrmlPRNDOVCW2RA8BA5sxmIS8B022ZhqoTjK5B8eMZ7u2cuQQQ9HA8tKSl7x
 BoGe2AaBOe7n23niMpHv+2f/42ij846AS3hReX0O6xSHk8AUk10FHt//g/c6OLPCgPglaIlipW7
 uopHem3izAxkeGjS9EiJU47HjDY7aCrVvpI3VrqZ5EHCp3XxqoeDAENLgZAJ0/bBh8Cvf+pGMcN
 IfNoRi9gQ9vCM5sMpU53k/VB1usQzqbt0ZZj+44NlAU5hjlgJQP5IxKq5f9KkbB3vVtjb/x/ShQ
 zQ4T74fcWUR12aiImAETLbM3Qw2tk72NCAquS+5RCAw707Yyn51+OVcw/Mn+vO+tmfrhUPguVlG
 91a2uOt/2qdnXn/OCY1pBnbA9uGpETiNdJsb2Bd7DzQo85L1jiFCk2dFUXbmDxKCJKLdrDsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030099

Add provision to load firmware of Serial engine for I2C protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
Dependencies:

This patch depends on patch 2 of this series.

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
---
 drivers/i2c/busses/i2c-qcom-geni.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ccea575fb783..97be9e468c75 100644
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


