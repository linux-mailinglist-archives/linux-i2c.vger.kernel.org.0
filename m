Return-Path: <linux-i2c+bounces-3917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A47900A49
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 887CDB24476
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 16:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBB819AA66;
	Fri,  7 Jun 2024 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TVnZWiaK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A91940B3;
	Fri,  7 Jun 2024 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717777735; cv=none; b=udCkT/Wi9PGY35atV/73k7NW9iIdNsKkGvof4g0VR5tvNLlV+rF5E4LG39Elo5C7KaApz11+3q+zWUH0xkBiE3KtbFwysxvVayBSK6EDfriNLufenXA7/PJqlKcqVmDFr0/zQJV1b5NXeKtQfuf2jH/qI1ujeUPpqNHFlmKo4O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717777735; c=relaxed/simple;
	bh=Gc4zNOk6+UfRPRlZrLAL0OpvwuPrtxfQIaAHFXJ/VWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MFOHkpdKUHxaH/pTcg5tR71aPntMhzNpiu3B4MSPod3WOnaLYQpYT6McGCI4ovpRn3Y23xd/ug271Off7n8IPwhDS9zLsmL++HckTId7ygGjR+qZQ1hngd0gz/6y8uoFQYMc9Nw84dmQwTZc0nm2lHUtN6ZUJ88OG0DRFfGrFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TVnZWiaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457EhKXr022870;
	Fri, 7 Jun 2024 16:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sF+XxA39YfAOxQ677VoFK+
	BQ1AN34SAao5viH8UaNeA=; b=TVnZWiaKm4EP2VHaI969Ji006/BAjNDX+rCzo7
	wlHf8LZDRnIvW3mbWH7xCBia8G75z5CyGAXIOARLTShLWUeg+fLxjX9Q5Os1JXxu
	fEgGGUtN1B1G0/tkyngJggBiIoM1Q4PXurm4wZl4dLnBCYirzLlgzO/dCE3tsMFp
	LMxRgizPunWoKXNc1PgSOMmbld2SEhM0kfLj5l7OnzWa3MUCCd0iT4q+f7XFEXDr
	EFWpza0coFZKtR32Sc4MxsU+tiklr0F40BtB99Vr8pXcMcaxjJjhcpg7RxPcQ88G
	gAWWKS1cYTXrpfaLn0qrBcQZqZ0kIp3PaiNJmgK1jvfwcVqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ym0sf0ygd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 16:28:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457GSjQr011825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 16:28:45 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 09:28:44 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 7 Jun 2024 09:28:43 -0700
Subject: [PATCH] i2c: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240607-md-drivers-i2c-busses-v1-1-0340f4590199@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADs1Y2YC/x3M0QrCMAyF4VcZuTZQy6jgq4gXbZq6gKuSuDEYe
 3ejnKvv4vw7GKuwwXXYQXkVk1d3nE8D0JT7g1GqG2KIY0jhgnPFqrKyGkokLIsZG1JLvkaUUgP
 /vpWbbP/u7e4u2RiL5k7Tr/aUvmw4Z/uwwnF8ARs2y5GGAAAA
To: Jean Delvare <jdelvare@suse.com>, Rudolf Marek <r.marek@assembler.cz>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fLLpjQg9wI6ArHKbhWG0KCUkorCEaEQt
X-Proofpoint-ORIG-GUID: fLLpjQg9wI6ArHKbhWG0KCUkorCEaEQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_10,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070122

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ccgx-ucsi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ali1563.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-qup.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/i2c/busses/i2c-ali1563.c   | 1 +
 drivers/i2c/busses/i2c-ccgx-ucsi.c | 1 +
 drivers/i2c/busses/i2c-pxa.c       | 1 +
 drivers/i2c/busses/i2c-qup.c       | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ali1563.c b/drivers/i2c/busses/i2c-ali1563.c
index 63897a89bb35..ee4fd66dedb0 100644
--- a/drivers/i2c/busses/i2c-ali1563.c
+++ b/drivers/i2c/busses/i2c-ali1563.c
@@ -438,4 +438,5 @@ static struct pci_driver ali1563_pci_driver = {
 
 module_pci_driver(ali1563_pci_driver);
 
+MODULE_DESCRIPTION("i2c driver for the ALi 1563 Southbridge");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-ccgx-ucsi.c b/drivers/i2c/busses/i2c-ccgx-ucsi.c
index 092dc92dea9f..d97233862a6c 100644
--- a/drivers/i2c/busses/i2c-ccgx-ucsi.c
+++ b/drivers/i2c/busses/i2c-ccgx-ucsi.c
@@ -27,4 +27,5 @@ struct i2c_client *i2c_new_ccgx_ucsi(struct i2c_adapter *adapter, int irq,
 }
 EXPORT_SYMBOL_GPL(i2c_new_ccgx_ucsi);
 
+MODULE_DESCRIPTION("Instantiate UCSI device for Cypress CCGx Type-C controller");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index f495560bd99c..031175113dd4 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1593,6 +1593,7 @@ static void __exit i2c_adap_pxa_exit(void)
 	platform_driver_unregister(&i2c_pxa_driver);
 }
 
+MODULE_DESCRIPTION("Intel PXA2XX I2C adapter");
 MODULE_LICENSE("GPL");
 
 subsys_initcall(i2c_adap_pxa_init);
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index c9b43a3c4bd3..4a2c745751a2 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1985,5 +1985,6 @@ static struct platform_driver qup_i2c_driver = {
 
 module_platform_driver(qup_i2c_driver);
 
+MODULE_DESCRIPTION("Qualcomm QUP based I2C controller");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:i2c_qup");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240607-md-drivers-i2c-busses-cf6f6ffcc66f


