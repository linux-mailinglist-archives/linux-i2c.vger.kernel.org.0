Return-Path: <linux-i2c+bounces-1781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE27A856FFD
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D04A1C21AA6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F343B14830D;
	Thu, 15 Feb 2024 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jXiMnlOB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45114145B3C;
	Thu, 15 Feb 2024 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034908; cv=none; b=FUgtO+IWHn0IInwvxMyCnGVLzryjAYS3ysWcQtYXnbgIs9+7NSIhSdXhhu24KVZ3cHbGOYe+Y0P5CjMIgK9Eljf7RpqhjPylSHrGQEigg+VrciLAgfX+6wja0m6aJKy8urHuWosptmi4UeDibjkLSiF0OKZy97+Y7d6QhVW1prM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034908; c=relaxed/simple;
	bh=gT16x+suHzi4RJDxnpVIxo63PiknxpyG8sAgpETh/No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q9+XmTydA0TVu/XtQxPZ19VA7Me+o2ObeA/jghKYULN2oQcUyNRPpaSM6o5yZITMRVOJfsuVeLy1v0G2UOnSszgZW1+UM3oWwtY5vFN38ZwG5CO6S4cA6oiUXQ9GiCWgx3ND/Yso1i0+oV4i1h3tTM7rK9KNT9/RHEAa/zKYAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jXiMnlOB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJh3mm029685;
	Thu, 15 Feb 2024 22:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RLpioKRBvBvjG6X7CZTJJIG/dvzFzjHsdAqj+Tw9e24=;
 b=jXiMnlOBP8y7xMfyHt6V1kMrCnT2m8JB1EqvSshyCojTBOvi1VlHPqmJPYKe4JkftPh+
 3CUCb5w+AUbolVIp6iJbGEUmnPw5L4LCZT2Mm2wuBLjZ26Euc1eEwdcu9orgNzMoimDR
 xbHgQORuqVMR1Og3tl1CrV+0GqRBg/mbcBszwuqqpauKIS3URHGrjOh+oBA951R13rD0
 2fcy4lKSESVNsbbB8zAehV6aEk+Oe14S/VMtonvFHK0zp4LIYBuHQBrmMeK2giD0CAn+
 GFMeSk7aQjHO5axlKTH6nE4KiT9RWvcg9vRDpVk4s366HYC37AMJqkttZdgnG3f8wdWs rQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9s0tjy3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:09 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM7dYg032572;
	Thu, 15 Feb 2024 22:08:08 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftyudn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:08 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM85YW22676140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:07 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB9F358063;
	Thu, 15 Feb 2024 22:08:03 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 705F358077;
	Thu, 15 Feb 2024 22:08:03 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:03 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 05/33] fsi: Use a defined value for default echo delay
Date: Thu, 15 Feb 2024 16:07:31 -0600
Message-Id: <20240215220759.976998-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DJBdCuUicqlEPNo5M5sYjpvGPU4Xxox9
X-Proofpoint-ORIG-GUID: DJBdCuUicqlEPNo5M5sYjpvGPU4Xxox9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

Avoid hardcoding '16' several times.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 6 +++---
 drivers/fsi/fsi-slave.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1c687eb021a0..8823e8e56dab 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1008,8 +1008,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	slave->link = link;
 	slave->id = id;
 	slave->size = FSI_SLAVE_SIZE_23b;
-	slave->t_send_delay = 16;
-	slave->t_echo_delay = 16;
+	slave->t_send_delay = FSI_SMODE_SD_DEFAULT;
+	slave->t_echo_delay = FSI_SMODE_ED_DEFAULT;
 
 	/* Get chip ID if any */
 	slave->chip_id = -1;
@@ -1160,7 +1160,7 @@ static int fsi_master_break(struct fsi_master *master, int link)
 	if (master->send_break)
 		rc = master->send_break(master, link);
 	if (master->link_config)
-		master->link_config(master, link, 16, 16);
+		master->link_config(master, link, FSI_SMODE_SD_DEFAULT, FSI_SMODE_ED_DEFAULT);
 
 	return rc;
 }
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index dba65bd4e083..dca9db0a42e5 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -41,8 +41,10 @@
 #define FSI_SMODE_SID_MASK	3		/* ID Mask */
 #define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
 #define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define FSI_SMODE_ED_DEFAULT	 16		/* Default echo delay */
 #define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
 #define FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define FSI_SMODE_SD_DEFAULT	 16		/* Default send delay */
 #define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
 
-- 
2.39.3


