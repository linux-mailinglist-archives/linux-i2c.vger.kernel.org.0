Return-Path: <linux-i2c+bounces-8046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B83379D2832
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 15:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D30282E1E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AFC1CC177;
	Tue, 19 Nov 2024 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kBPZx9wl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82EE56A;
	Tue, 19 Nov 2024 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732026664; cv=none; b=NY4I76wkW3jPOQ3yjRLNb2krAHrCu82A8SSCJMKjN8BCPr26+sOpfMMiyk0y3fTfgAzCcmUhgwRKM1rdY+QsCB/TNiFGG29c2h8SisnRJdMsIUfDm7mtL89I3T/bjnnreCF3TOf0xjighDoeyl7j7oyUhcpLgFmkkBej+iVdVWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732026664; c=relaxed/simple;
	bh=19chT3VK5iUOy0Ed4mobVGVETZcuXaPQI0WZCJfbcQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X2Dp5VTtk1SjAdAu7OdUyH8+EZbwt/4OQYm+PQkIvZwCMyLbKZBrBz3lsjcQFePqF8ABFDfrJhdOEKSuRlUhkRVN0EQtpVH5KxZztcEViXMqYKyBfu+Tk8ESmVdn+y/jI3lkF+CEOYbHqe74LyTYHjxmz6wGTEjZJYQDD1wh++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kBPZx9wl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7CRqW027076;
	Tue, 19 Nov 2024 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E1kCAu+pULAojbnh8MS7CwsULAt3cJ+Tvm2
	EnuFeRfQ=; b=kBPZx9wl0Hw2MWyt/Cz3cNioL+xLh+Uyjzxp2lQerQiesqW3CYu
	tIM+Ebvi8wA3kVIk3ERN040xk6KKKLenmZLUdJeCJh64b0VEJhWW02V4cB9o3XwV
	JFIyj/oSPMzNI2hd/cDHtsAnA7Mz1vqSwZ5xO8kw00sg0MpO2h4BuS3B610mh15u
	c9EMQ+V0yWmsp+YRW1JZlsHzI7rSqB/2ZpwJakSTfDQq4xTHKuElU6x56gaEZl31
	YIiSPvfqKs1hV0URbo7jyRRoRzhW/fMD5zu/ih/EJikbyy7ozKscR4+krQjhEz7u
	Se9hUhDyLjlyOQ8NwPVP8SOSQCg7Lh/CM7A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7tth6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 14:30:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJEUrER010746;
	Tue, 19 Nov 2024 14:30:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42xmfm502c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 14:30:53 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AJEUrOp010741;
	Tue, 19 Nov 2024 14:30:53 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AJEUrWm010739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 14:30:53 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 1B5EA24060; Tue, 19 Nov 2024 20:00:52 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: andi.shyti@kernel.org, quic_bjorande@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, --cc=konrad.dybcio@linaro.org,
        quic_vdadhani@quicinc.com, vkoul@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v3] i2c: i2c-qcom-geni: Serve transfer during early resume stage
Date: Tue, 19 Nov 2024 20:00:31 +0530
Message-Id: <20241119143031.3331753-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 1XYFHjsaLiahucoNLglRV-Y8FQPu3Jld
X-Proofpoint-GUID: 1XYFHjsaLiahucoNLglRV-Y8FQPu3Jld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190106

pm_runtime_get_sync() function fails during PM early resume and returns
-EACCES because runtime PM for the device is disabled at the early stage
causing i2c transfer to fail. Make changes to serve transfer with forced
resume.

Few i2c clients like PCI OR touch may request i2c transfers during early
resume stage. Any i2c client can keep transfer request very early resume
stage like noirq phase of PM. To serve the transfer, register an interrupt
with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags to avoid timeout of
transfer when IRQ is not enabled during early stage.

pm_runtime_get_sync() fails when runtime PM is not enabled, then use
pm_runtime_force_resume() and serve the transfer.

Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---

Link to V2: https://lore.kernel.org/lkml/202410132233.P25W2vKq-lkp@intel.com/T/

 v2 -> v3:
 - Updated exact usecase and scenario in the commit log description.
 - Removed bulleted points from technical description, added details in free flow.
 - Used pm_runtime_force_resume/suspend() instead customized local implementation.
 - Added debug log after pm_runtime_force_suspend().

---
Link to V1: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/

 v1 -> v2:
 - Changed gi2c->se.dev to dev during dev_dbg() calls.
 - Addressed review comments from Andi and Bjorn.
 - Returned 0 instead garbage inside geni_i2c_force_resume().
 - Added comments explaining forced resume transfer when runtime PM
   remains disabled.
---

 drivers/i2c/busses/i2c-qcom-geni.c | 43 +++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..4fe5fa4532ca 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -695,17 +695,27 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
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
+		dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
+			atomic_read(&dev->power.usage_count));
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
@@ -715,8 +725,18 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
-	pm_runtime_mark_last_busy(gi2c->se.dev);
-	pm_runtime_put_autosuspend(gi2c->se.dev);
+	/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */
+	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
+		ret = pm_runtime_force_suspend(dev);
+		dev_dbg(dev, "Runtime PM is disabled hence force suspend, pm_usage_count: %d\n",
+			atomic_read(&dev->power.usage_count));
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
@@ -833,9 +853,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
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


