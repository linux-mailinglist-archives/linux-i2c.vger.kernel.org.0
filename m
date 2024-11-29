Return-Path: <linux-i2c+bounces-8255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593C9DBFE3
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 08:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5CE2819F2
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 07:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2031581F2;
	Fri, 29 Nov 2024 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XzVwNK/7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584FE1386DA;
	Fri, 29 Nov 2024 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732866478; cv=none; b=pgcDcxVRzTFonZ+bcRFH8AGxHCssTTGlIxawhynswf2h6135x90vlAeuYpfxTlg1kiOAPzgs2xPcAZCUFLN2x1uyAAFcjLWZP7CfX5BVjdgHWJQRrWwCvEmbHsLsb8Ut4uncUmFkawZl1YJVHAZT441Q3hVzk3qlbtimNEmlQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732866478; c=relaxed/simple;
	bh=kwuMROrURsHseoiSdB0iqwJm9reXjPuCRbvQJB4guio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CKUgckgok5bV2FD88GMLOsLokU+Q1jSaYvJz5hVqMRC9dpCIx+Z2eRrpFxHWnlo7aB3Rjs88vIBGH2A7ymlLyroK48grkupPG3l/8cx1acWzvaGpHrBf1XKXrKmGOaFvfnqJMCE3ahJOVhRskAphpOh2rNoJeZbvGbRpkDlWpWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XzVwNK/7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLafqV019798;
	Fri, 29 Nov 2024 07:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K3hNAk7Wtna1DBG67fmm8hJ0HmP9zar30SA
	zfWmV4qA=; b=XzVwNK/7gOSLoLkizfgYWxJ6dfwbjZVhlRo83nJ7jrio8Hi7eOa
	NxmJKAUfofez7SI65+vePjN1ipNt+K3vm35dtLkcw13EMH3wPNkc1UbgVXCwmGtn
	F8NZtpUeUTQxhmYvjpzU5JhNJCvSJDQBpqJtyL3gsyKOuPY+Yz9G6V+5j8TQ+DEd
	xkyzxheitq2WVQlnCZ9KIhO0G43EKm5Yz4YuUZHLgFTvnl2GOlgkH463IFYw8j78
	3B6wJXdmSSnZLXUwDsAlDFt11xaCDLWdR+eWagcl6DK7C+UQ4ExXDkD67djQB6+G
	8aweqyNSpBYSbvMlh8iZPEEiDZ5n+1tsHIA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y04py5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:47:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT7llWt013065;
	Fri, 29 Nov 2024 07:47:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43384n0fsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:47:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AT7lldt013057;
	Fri, 29 Nov 2024 07:47:47 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AT7lllR013054
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:47:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 63BD6240BE; Fri, 29 Nov 2024 13:17:46 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: andi.shyti@kernel.org, quic_bjorande@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, --cc=konrad.dybcio@linaro.org,
        quic_vdadhani@quicinc.com, vkoul@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v4] i2c: i2c-qcom-geni: Serve transfer during early resume stage
Date: Fri, 29 Nov 2024 13:17:42 +0530
Message-Id: <20241129074742.1844031-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: sgFfcwCk6fSYCXsUa73aSfX2ZM0naH0p
X-Proofpoint-GUID: sgFfcwCk6fSYCXsUa73aSfX2ZM0naH0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290062

pm_runtime_get_sync() function fails during PM early resume and returns
-EACCES because runtime PM for the device is disabled at the early stage
causing i2c transfer to fail. Make changes to serve transfer with forced
resume.

Few i2c clients like PCI OR touch may request i2c transfers during early
resume stage. Any i2c client can keep transfer request very early resume
stage like noirq phase of PM. To serve the transfer, register an interrupt
with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags to avoid timeout of
transfer when IRQ is not enabled during early stage.

The actual usecase over i2c is(Not in upstream yet), PCIe client ->
PCIe Driver -> I2C driver.
PCIe client needs certain configurations over i2c after powering on the
PCIe switch. As part of suspend it uses suspend_noirq() to turn off the
switch, because some PCIe clients do some transfers till suspend_noirq()
phase. And as part of resume_noirq(), it enables the power to the switch
and configures the switch again through i2c.

If pm_runtime_get_sync() is failing when runtime PM is not enabled, then
use pm_runtime_force_resume().

Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
Link to V3: https://lore.kernel.org/all/20241119143031.3331753-1-quic_msavaliy@quicinc.com/T/

v3->v4 :
 - Enhanced commit log by explaining client usecase scenario during early resume.
 - Covered 'usage_count' of 'struct dev_pm_info' under CONFIG_PM to compile non PM CONFIG.

---
Link to V2: https://lore.kernel.org/lkml/202410132233.P25W2vKq-lkp@intel.com/T/

 v2 -> v3:
 - Updated exact usecase and scenario in the commit log description.
 - Removed bulleted points from technical description, added details in free flow.
 - Used pm_runtime_force_resume/suspend() instead customized local implementation.
 - Added debug log after pm_runtime_force_suspend().

---

 v1 -> v2:
 - Changed gi2c->se.dev to dev during dev_dbg() calls.
 - Addressed review comments from Andi and Bjorn.
 - Returned 0 instead garbage inside geni_i2c_force_resume().
 - Added comments explaining forced resume transfer when runtime PM
   remains disabled.
---

    V1 link: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
---
---
 drivers/i2c/busses/i2c-qcom-geni.c | 47 ++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..94f875aca9aa 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -695,17 +695,29 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
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
+	/* Serve I2C transfer by forced resume if Runtime PM is enbled or not */
+	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
+		#if (IS_ENABLED(CONFIG_PM))
+		dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
+			atomic_read(&dev->power.usage_count));
+		#endif
+		ret = pm_runtime_force_resume(dev);
+		if (ret)
+			return ret;
+	} else {
+		ret = pm_runtime_get_sync(gi2c->se.dev);
+		if (ret < 0) {
+			dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
+			pm_runtime_put_noidle(gi2c->se.dev);
+			/* Set device in suspended since resume failed */
+			pm_runtime_set_suspended(gi2c->se.dev);
+			return ret;
+		}
 	}
 
 	qcom_geni_i2c_conf(gi2c);
@@ -715,8 +727,20 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
-	pm_runtime_mark_last_busy(gi2c->se.dev);
-	pm_runtime_put_autosuspend(gi2c->se.dev);
+	/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */
+	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
+		ret = pm_runtime_force_suspend(dev);
+		#if (IS_ENABLED(CONFIG_PM))
+		dev_dbg(dev, "Runtime PM is disabled hence force suspend, pm_usage_count: %d\n",
+			atomic_read(&dev->power.usage_count));
+		#endif
+		if (ret)
+			return ret;
+	} else {
+		pm_runtime_mark_last_busy(gi2c->se.dev);
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+	}
+
 	gi2c->cur = NULL;
 	gi2c->err = 0;
 	return ret;
@@ -833,9 +857,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-
-	/* Keep interrupts disabled initially to allow for low-power modes */
-	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
+			       IRQF_NO_AUTOEN | IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
 			       dev_name(dev), gi2c);
 	if (ret) {
 		dev_err(dev, "Request_irq failed:%d: err:%d\n",
-- 
2.25.1


