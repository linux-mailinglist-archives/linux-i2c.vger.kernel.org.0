Return-Path: <linux-i2c+bounces-7342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE299A3B8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 14:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D26951F2576E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 12:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EC320CCC5;
	Fri, 11 Oct 2024 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JBfXZ8v2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384D1BDAA1;
	Fri, 11 Oct 2024 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728649092; cv=none; b=t44YA3hmyx9wAnPuDRAuLdR5XEH8QQVBFhvg7qmso4pWX7dIELYVdYllphKEvGMtoJPzuonP6xgSQBNIgzwrygd7XCJTBB1M8g9pXJAXuaIoJe1cE8AD+XjMiph7PB0WLaYPYTOG3CLlMNzo9NlBuwR7dBVKGu7BNh3r2A+z8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728649092; c=relaxed/simple;
	bh=eJyjAZpeQtxDGLHwj59DiUgGN4thAABe8Ylhgn4gFYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O5WHpJJsR34Qy80XOo9Dz53BDsUoV8XUlY4tTQw/T/AbK0AS5iF1qpOm4cGmpGMY2F2IGoRLj6dJmullwu9IIsPBh3yY9JzLd576ZtvAu6MMF9zNWdIa91inPIaijgQvgRqNkN7TqKRqPow1c2XUro1zKOcpZJpwFr3pQRoNZJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JBfXZ8v2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B5NGRP027056;
	Fri, 11 Oct 2024 12:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Cb6U7+NxBzhdPDGsTNybI+b8zuB4tR9gb73
	yeDqtqJg=; b=JBfXZ8v28h33GLADBWUp4LxzZqvKLtALfRWVt5hhB+Gx3OWV2Ht
	SGu4nLkg99IkMOIFKCwwOnJydG6Og9/qr6CFa8yAIyKa3W2PHdfz3z/Sz9GLWCp9
	MsT46HPMtj0NTnY8X/H/Bqe+adWsgIdksim8CyXEHrLLg3IZQml5KO7EnXlA3DOw
	FvPtSb/WJkSG8DRPNqoDMBYy5wBpVBNkfT/gAOeabYkiS9LS98ub41l3VjE8R/PD
	5/UzOqIGk6ct9/AsOGFPU1dX8dqERBewUTAmF/ORCL8+59SBmrzdaZxxYF6Aj+FU
	gGCalB+dh+sXJ0V0nNziVfNYypXbODyg6Zg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426fj6uaw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:18:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCI2ir009838;
	Fri, 11 Oct 2024 12:18:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 422xhmxpet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:18:02 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49BCI2hr009815;
	Fri, 11 Oct 2024 12:18:02 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49BCI1la009805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:18:02 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 3C6D024297; Fri, 11 Oct 2024 17:48:01 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: andi.shyti@kernel.org, quic_bjorande@quicinc.com,
        --cc=linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
        quic_vdadhani@quicinc.com, vkoul@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2] i2c: i2c-qcom-geni: Serve transfer during early resume stage
Date: Fri, 11 Oct 2024 17:47:57 +0530
Message-Id: <20241011121757.2267336-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: 0biFrFI6wyf8H6sdQyTX4FXBadqUopsN
X-Proofpoint-ORIG-GUID: 0biFrFI6wyf8H6sdQyTX4FXBadqUopsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410110085

pm_runtime_get_sync() function fails during PM early resume and returning
-EACCES because runtime PM for the device is disabled at the early stage
causing i2c transfer to fail. Make changes to serve transfer with forced
resume.

Few i2c clients like PCI OR touch may request i2c transfers during early
resume stage. In order to serve transfer request do :

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
v1 -> v2:

- Changed gi2c->se.dev to dev during dev_dbg() calls.
- Addressed review comments from Andi and Bjorn.
- Returned 0 instead garbage inside geni_i2c_force_resume().
- Added comments explaining forced resume transfer when runtime PM
  remains disabled.

V1 link: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
---
---
 drivers/i2c/busses/i2c-qcom-geni.c | 61 +++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a6..e1207f1a3de3 100644
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
@@ -675,22 +677,49 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 	return num;
 }
 
+static int geni_i2c_force_resume(struct geni_i2c_dev *gi2c)
+{
+	struct device *dev = gi2c->se.dev;
+	int ret;
+
+	ret = geni_i2c_runtime_resume(dev);
+	if (ret) {
+		dev_err(gi2c->se.dev, "Failed to enable SE resources: %d\n", ret);
+		pm_runtime_put_noidle(dev);
+		pm_runtime_set_suspended(dev);
+		return ret;
+	}
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	return 0;
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
+	/* Serve I2C transfer by forced resume whether Runtime PM is enbled or not */
+	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
+		dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
+			atomic_read(&dev->power.usage_count));
+		ret = geni_i2c_force_resume(gi2c);
+		if (ret)
+			return ret;
+	} else {
+		ret = pm_runtime_get_sync(dev);
+		if (ret == -EACCES && gi2c->suspended) {
+			dev_dbg(dev, "pm_runtime_get_sync() failed-%d, force resume\n", ret);
+			ret = geni_i2c_force_resume(gi2c);
+			if (ret)
+				return ret;
+		}
 	}
 
 	qcom_geni_i2c_conf(gi2c);
@@ -700,8 +729,19 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
-	pm_runtime_mark_last_busy(gi2c->se.dev);
-	pm_runtime_put_autosuspend(gi2c->se.dev);
+	/* Does Opposite to Forced Resume when runtime PM was not enabled and served
+	 * Transfer via forced resume.
+	 */
+	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
+		pm_runtime_put_noidle(dev);
+		pm_runtime_set_suspended(dev);
+		/* Reset flag same as runtime suspend, next xfer PM can be enabled */
+		gi2c->suspended = 0;
+	} else {
+		pm_runtime_mark_last_busy(gi2c->se.dev);
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+	}
+
 	gi2c->cur = NULL;
 	gi2c->err = 0;
 	return ret;
@@ -818,7 +858,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
+			       IRQF_NO_AUTOEN | IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
 			       dev_name(dev), gi2c);
 	if (ret) {
 		dev_err(dev, "Request_irq failed:%d: err:%d\n",
-- 
2.25.1


