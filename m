Return-Path: <linux-i2c+bounces-2648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E09488FF27
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 13:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72D8BB21A75
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 12:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025F07E785;
	Thu, 28 Mar 2024 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SqzdPNjH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE3D6A00E;
	Thu, 28 Mar 2024 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711629488; cv=none; b=egzyl5FTC+UvY2meUmvMuBEknpmspjJuEIp34Vr9VZBnlhfJ5vAA5zYmhu+7Afu/2IaezvNv+8ooKu9LcUy8sxwWr6SgwTZD+PLq0IkLOfRv8srpKkIlWUh4xRewTcCIfrTsymiAG5XyVI98adxoH5kj8QLcfCd04M18Ojx6Hjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711629488; c=relaxed/simple;
	bh=0OZefYAUBM7IS2Klla+l3VNaQFuyodfR8kQwM6GgpVo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hfEJLbHEnSwTxW3pAERFXcrshBCVnUBK43e1SqVTbEd7zcXiaSBAWF4d6yMEHSUvNq5uRjtDu2DP4cXQTwKCnu6QeIf2cv9/MK+dVqJCkyNH10yJ83MphrlSjYTsxV5QUGZOT+7Hs4H4jnoGYzYxav2LFCIxT0/3EEn+3l8a13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SqzdPNjH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42SAVd8G024674;
	Thu, 28 Mar 2024 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=AP4S4791vHDmECgMCxfC
	RU8ncL4HIyGoKl5g7EVxdNA=; b=SqzdPNjHZBBiAc0kTsJOnhnjk6FutjRGYEdM
	mpfAS30B/Xam9bICyNmSseo7lgloZ+wLCXAzTUv8MkTbxgRxUwuTQClkFc84lYpM
	zWPeRFMmhtOGhej/BPlMBTPRl0IGufjvAw3u1Vb/ZpmtnlWK+W/csRFcvqqyVb53
	FKQ6bQTWV1c6T83qgl6gTU6SgVALtThNo8NucYmSUMyY7ilO6CBX9hSO3RoE1Xqj
	HfzCsZCw2jO9apkddpMJvNijme5D4MwTWsqMnrWxnCexd9hgIumu3tNU+u1fOIFO
	FFd1GRHgUO8K1uilxYWJ7yyXWkRCWho/8PltPUTXjLBGWYKTig==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x54r60uyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 12:37:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42SCblEJ031660;
	Thu, 28 Mar 2024 12:37:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3x1r5mavmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 12:37:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42SCblA5031653;
	Thu, 28 Mar 2024 12:37:47 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42SCblPJ031651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 12:37:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id B5B81240CD; Thu, 28 Mar 2024 18:07:45 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com, Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1] i2c: i2c-qcom-geni: Serve transfer during early resume stage
Date: Thu, 28 Mar 2024 18:07:43 +0530
Message-Id: <20240328123743.1713696-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: cKBrnZ-91GlkdN6jXkoV6mKknFZL7mK1
X-Proofpoint-ORIG-GUID: cKBrnZ-91GlkdN6jXkoV6mKknFZL7mK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_12,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280085

pm_runtime_get_sync() function fails during PM early resume and returning
-EACCES because runtime PM for the device is disabled at the early stage
causing i2c transfer to fail. Make changes to serve transfer with force
resume.

1. Register interrupt with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags
   to avoid timeout of transfer when IRQ is not enabled during early stage.
2. Do force resume if pm_runtime_get_sync() is failing after system
   suspend when runtime PM is not enabled.
3. Increment power usage count after forced resume to balance
   it against regular runtime suspend.

Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index da94df466e83..ed8201983a03 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -134,6 +134,8 @@ struct geni_i2c_clk_fld {
 	u8	t_cycle_cnt;
 };
 
+static int geni_i2c_runtime_resume(struct device *dev);
+
 /*
  * Hardware uses the underlying formula to calculate time periods of
  * SCL clock cycle. Firmware uses some additional cycles excluded from the
@@ -677,22 +679,48 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 	return num;
 }
 
+static int geni_i2c_force_resume(struct geni_i2c_dev *gi2c)
+{
+	struct device *dev = gi2c->se.dev;
+	int ret;
+
+	ret = geni_i2c_runtime_resume(dev);
+	if (ret) {
+		dev_err(gi2c->se.dev, "Error turning SE resources:%d\n", ret);
+		pm_runtime_put_noidle(dev);
+		pm_runtime_set_suspended(dev);
+		return ret;
+	}
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	return ret;
+}
+
 static int geni_i2c_xfer(struct i2c_adapter *adap,
 			 struct i2c_msg msgs[],
 			 int num)
 {
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
+	struct device *dev = gi2c->se.dev;
 	int ret;
 
 	gi2c->err = 0;
 	reinit_completion(&gi2c->done);
-	ret = pm_runtime_get_sync(gi2c->se.dev);
-	if (ret < 0) {
-		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
-		pm_runtime_put_noidle(gi2c->se.dev);
-		/* Set device in suspended since resume failed */
-		pm_runtime_set_suspended(gi2c->se.dev);
-		return ret;
+
+	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
+		dev_dbg(gi2c->se.dev, "RT_PM disabled, Do force resume, usage_count:%d\n",
+			atomic_read(&dev->power.usage_count));
+		ret = geni_i2c_force_resume(gi2c);
+		if (ret)
+			return ret;
+	} else {
+		ret = pm_runtime_get_sync(dev);
+		if (ret == -EACCES && gi2c->suspended) {
+			dev_dbg(gi2c->se.dev, "PM get_sync() failed-%d, force resume\n", ret);
+			ret = geni_i2c_force_resume(gi2c);
+			if (ret)
+				return ret;
+		}
 	}
 
 	qcom_geni_i2c_conf(gi2c);
@@ -702,8 +730,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
-	pm_runtime_mark_last_busy(gi2c->se.dev);
-	pm_runtime_put_autosuspend(gi2c->se.dev);
+	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
+		pm_runtime_put_noidle(dev);
+		pm_runtime_set_suspended(dev);
+		gi2c->suspended = 0;
+	} else {
+		pm_runtime_mark_last_busy(gi2c->se.dev);
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+	}
+
 	gi2c->cur = NULL;
 	gi2c->err = 0;
 	return ret;
@@ -820,7 +855,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
 			       dev_name(dev), gi2c);
 	if (ret) {
 		dev_err(dev, "Request_irq failed:%d: err:%d\n",
-- 
2.25.1


