Return-Path: <linux-i2c+bounces-8761-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1589FD49C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 14:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA189165156
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 13:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EEB1F37AA;
	Fri, 27 Dec 2024 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LCOOsiG0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB381D319B;
	Fri, 27 Dec 2024 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304623; cv=none; b=ABaRIlgIiTr3PZ6tdJwIzJFakNT2QnvycnrQ8ezJIMxP0QV+YsRWJhFmr60B+q35n8o5tgpy5xJgz5WwnPs9OYq+TkIAPBtKe/NQ4dUnIbmk4RBf/uUQ+qHwzvZbtzLGsQ0heMss0KErZ4qusZikmM0TGao7A9N1UfmI3N85LH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304623; c=relaxed/simple;
	bh=NPvRVHPoCx6i/S/a2n8Uv5w62XRFWSuO9H5fH84L2I4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bPDy1yCFcN4wvHyQ1XX6+d0Z9aiM1irPAg8Prxzjg3k1RkZgk5Yc/fNnE+lXHXwh7jQkBJMrEAkNomWX7Da/QqdUdMjLiwxKiKxRAATkE2zuGk/1PWnhfVT/NLjahwzFgNsbM+gClu95IXK+0F50sUkxwmbrd0xjGiYq/rVoBHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LCOOsiG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR7gfU6009558;
	Fri, 27 Dec 2024 13:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y5n9JQdtdMfi3qeXGMHfeqYIM0OQ+1rnqib
	v04kUWIg=; b=LCOOsiG01+Zh+24pJhDreJj4irfbSPyviCcnx3b6SV6s2Rj7agT
	ZWcmVlxPGLe1IfguWY6oTDc4ndvAeTbaoraxBCe3zUYPjZnjj4vLgyTls770ULyo
	hbzrZFMUi5k/Y3EVovrzYRcjEunbXvJB0cefqMPLQN8uXTADOodxZ9mGX5WFdxMP
	8xoZ6Z3kkxqpwsQFMuwUtr324BYDSKNCGJ9dpkoWhQ0MSPikNqMZjh60nCMv9ffw
	TYz7x4UPydXHwooK3WT0vSFUCHFoJia+W2SI1s9HNDqL2RM6PfW8kk8x1OG/WnC7
	BbNheJcu8TGBbx3qvOzQkHl28eci29FVXvw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sr3b9gdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 13:03:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BRD3WuU012383;
	Fri, 27 Dec 2024 13:03:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43nprmnpd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 13:03:32 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BRD3WiS012372;
	Fri, 27 Dec 2024 13:03:32 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BRD3VIZ012345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 13:03:32 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id CBAA42408A; Fri, 27 Dec 2024 18:33:30 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_bjorande@quicinc.com
Cc: konrad.dybcio@linaro.org, quic_vdadhani@quicinc.com, vkoul@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v5] i2c: i2c-qcom-geni: Serve transfer during early resume stage
Date: Fri, 27 Dec 2024 18:32:36 +0530
Message-Id: <20241227130236.755794-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: WnzKqYrMzuJekbT5xmaUANLBCS0wUvF4
X-Proofpoint-ORIG-GUID: WnzKqYrMzuJekbT5xmaUANLBCS0wUvF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270110

Fix the issue where pm_runtime_get_sync() fails during the PM early resume
phase, returning -EACCES because runtime PM for the device is disabled at
this stage. This failure causes I2C transfers to fail. To resolve this,
serve transfers with a forced resume.

Allow certain I2C clients, such as PCI or Touch devices, to request I2C
transfers during the early resume stage. Enable any I2C client to initiate
a transfer request very early in the resume stage, such as during the
noirq phase of PM. Register an interrupt with the IRQF_EARLY_RESUME and
IRQF_NO_SUSPEND flags to handle these transfers and avoid timeouts when
IRQs are not enabled during the early stage.

A Potential usecase: PCIe client -> PCIe Driver -> I2C driver. It involves
a PCIe client driver communicating with the PCIe driver, which in turn
interfaces with the I2C driver. Upon powering on the PCIe device, send
certain configurations over I2C. During the suspend phase, use the
suspend_noirq() routine to turn off the PCIe device, as some PCIe clients
continue transfers until this phase. During the resume_noirq() phase,
restore power to the PCIe device and reconfigure it via I2C. This ensures
that the PCIe device is properly configured and operational after resuming
from a suspended state.

Use pm_runtime_force_resume() to address the failure of
pm_runtime_get_sync() returning a negative value when runtime PM is
disabled.

Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
Link to V4: https://lore.kernel.org/lkml/bd699719-4958-445a-a685-4b5f6a8ad81f@quicinc.com/

v4->v5:
- Commit log enhanced considering Bjorn's comments by explaining PCIe usecase.
- Enhanced comment with reason when using pm_runtime_force_resume().
- Corrected IS_ENABLED(CONFIG_PM) condition inside geni_i2c_xfer().
- Improved debug log as per Bjorn's suggestions during suspend, resume.
- Reverted back comment before devm_request_irq().

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
 drivers/i2c/busses/i2c-qcom-geni.c | 47 +++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..1885e1ceb11c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -695,17 +695,31 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
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
+	/* During early resume stage, runtime PM is disabled and pm_runtime_get_sync()
+	 * returns error Hence use force_resume() and serve transfer.
+	 */
+	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
+		#if (!IS_ENABLED(CONFIG_PM))
+		dev_dbg(dev, "Forced power ON, pm_usage_count: %d\n",
+			atomic_read(&dev->power.usage_count));
+		#endif
+		ret = pm_runtime_force_resume(dev);
+		if (ret)
+			return ret;
+	} else {
+		ret = pm_runtime_get_sync(gi2c->se.dev);
+		if (ret < 0) {
+			dev_err(gi2c->se.dev, "Error turning resources: %d\n", ret);
+			pm_runtime_put_noidle(gi2c->se.dev);
+			/* Set device in suspended since resume failed */
+			pm_runtime_set_suspended(gi2c->se.dev);
+			return ret;
+		}
 	}
 
 	qcom_geni_i2c_conf(gi2c);
@@ -715,8 +729,20 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
-	pm_runtime_mark_last_busy(gi2c->se.dev);
-	pm_runtime_put_autosuspend(gi2c->se.dev);
+	/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */
+	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
+		ret = pm_runtime_force_suspend(dev);
+		#if (!IS_ENABLED(CONFIG_PM))
+		dev_dbg(dev, "Forced power OFF, pm_usage_count: %d\n",
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
@@ -835,7 +861,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gi2c);
 
 	/* Keep interrupts disabled initially to allow for low-power modes */
-	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
+			       IRQF_NO_AUTOEN | IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
 			       dev_name(dev), gi2c);
 	if (ret) {
 		dev_err(dev, "Request_irq failed:%d: err:%d\n",
-- 
2.25.1


