Return-Path: <linux-i2c+bounces-2718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D9F89500B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 12:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 937821F23EE6
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116B25B682;
	Tue,  2 Apr 2024 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A8HDP0fm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265325914D;
	Tue,  2 Apr 2024 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053675; cv=none; b=sHpC4e/Dr/H/gIlRkvyEhLcWtO13dbWwClon1uivnoH77174J2TNqkggTu8BmF90cmWBcTrZ4ChV6EhtdHJL9j34BprvYPFQ7PzcRvp2dZkmgfwF7kfg1aqkmR7K7yZU8aCp3qR6DClv1t4ULbQdGcNupLcP2wUPIfyiSh78oeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053675; c=relaxed/simple;
	bh=/DQ0J4jT+7O1YXt0ZOeAPIx33eGS+CdFq1XTe0cfZFA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TlpXNPX6UQxe8ZCujSDJkhi2FEFsaJ/G4Vxi4MoDfZ2h9wPJ6FsMcHzgUejIEafJi5/yrFvpV3cGUFjQP/yt0+01RnFBiwdQmrKK1U1bviqk9SZ0axKDofZTsQwV8QVVvTSLfrVJo0+1j9PcHL3uuiJ+JnKECQmUP4AiwjMqF+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A8HDP0fm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4326H81u024439;
	Tue, 2 Apr 2024 10:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=Cmpg8cecJbn7r1UDKMdr
	24xUgseklzecMDt64aoeZ3Y=; b=A8HDP0fm/gw6Xe4pUIPDeabwRLVip1d36CfT
	pV0TB6p6UQjeibz4ddpWc3JjijdH0z3iL8vw9Ydu15AuafhiAiVxsatqx9fuJmUQ
	M9HRQf69oAFJLIPrqtaiOBD8slr8XPLfiYO7M+t2MIK+AWmjtUEjsUIRXHLCpmCJ
	3rjsd1FtS8nchgv0l1FnU7OIFgmdSvQLyrExJNe2V+LXVyQQ64E65WQ01N8QBJPh
	n/f04SH/BP3LFIiKJ4cK68o/Lyao4KlCWBAW9mOMf7hoRLW/X3pFR0CBVZRIyhza
	4r8pGn7GEgVvvx81kEa7iL6+q248urrjpriEYFNRSJifp0X8Uw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8cm5gkq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 10:27:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 432ARj4S016769;
	Tue, 2 Apr 2024 10:27:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3x6btm596j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 10:27:45 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 432ARiO1016760;
	Tue, 2 Apr 2024 10:27:44 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 432ARi1l016758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 10:27:44 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 9EAB1240F4; Tue,  2 Apr 2024 15:57:43 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com, vkoul@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH] i2c: i2c-qcom-geni: Serve transfer during early resume stage
Date: Tue,  2 Apr 2024 15:57:41 +0530
Message-Id: <20240402102741.128424-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: RXcenigXZ69eQtIagROOTbGoT0omNlKn
X-Proofpoint-ORIG-GUID: RXcenigXZ69eQtIagROOTbGoT0omNlKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404020075

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
v1 -> v2:
- Changed gi2c->se.dev to dev during dev_dbg() calls.
- Addressed review comments from Andi.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index da94df466e83..30c335b02ac4 100644
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
+		dev_dbg(dev, "RT_PM disabled, Do force resume, pm_usage_count: %d\n",
+			atomic_read(&dev->power.usage_count));
+		ret = geni_i2c_force_resume(gi2c);
+		if (ret)
+			return ret;
+	} else {
+		ret = pm_runtime_get_sync(dev);
+		if (ret == -EACCES && gi2c->suspended) {
+			dev_dbg(dev, "PM get_sync() failed-%d, force resume\n", ret);
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


