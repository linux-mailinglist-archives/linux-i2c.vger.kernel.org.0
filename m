Return-Path: <linux-i2c+bounces-3320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C398B643C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0004E1F222F6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0708181BAA;
	Mon, 29 Apr 2024 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PVjzyu8U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98918130F;
	Mon, 29 Apr 2024 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424524; cv=none; b=rnmw8k+GRkDfxGjspBL5BDMcDHAz8GVoU3cxC+IHAnWN63k717cICyL+6G9rbCHes1RginuMSWFcVlqUuBjFU3wwuKFTYKNdEdNU149E94/LJheI7Em+kprsgOxMWUiJUCPc9WfrTAtHU10J+ZMoA11iJHU08WwJmmPA3xmkIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424524; c=relaxed/simple;
	bh=gPvvzMSRDgj7FivzqDBmOCGvulFZ6OlOKdEnSDIAaXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ef/EfWobSo0ArREGV22kGoC7I1ULH8HQcQ8fRVboWydV2OBi+n6S8ICc1RxNUuzi4IWL7XqNB+ZmfgUtqUShVWVKLSO95HQMtMZQHewW5jYTZJ2UFTq9+h25PQnzReqR8pzn4EiplSHgBpkHK60vhK03UkeWZdeCSlt4DRD4DOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PVjzyu8U; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKs6MS019885;
	Mon, 29 Apr 2024 21:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tYCWNfX9l1yguWDgLtgGGbM0l6DgIRxcLhlsD76wZVQ=;
 b=PVjzyu8UYe+hEiA7T1A4i96jxxMm8oFbx9xSMCT0tZLyW9mbxbJGPSpDfK9tk8/dd60u
 sYfoI5Z0EIRSOZaEC/NV3Lh8Rf0aAQuBiLKJlQGfjDQq4ZQ0vNBf4RkwRWLAjkf8c1Yo
 Y50AAnHmChuH241+Y50R1H/l1PTHUdWXVX2alZH48dJWsf4Ah5T1UK+ugYVZwsRI0SGM
 rnq4FAybwTJIBxlkXWg78+LIxWkmmX2YfKo4CBAYYOBxz3Gbo87qGA4YC3U4RIy92jV2
 5+xf9AwRTrt7gglBShBnKyxHuzkFBUt5dQi0cdChnsnXCS3HaXWTZjA/BHhTmjdfGvIS aQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjyj01d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:50 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TJVJY5015603;
	Mon, 29 Apr 2024 21:01:49 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed2s47n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:49 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1kdF18744014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:48 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 274165805B;
	Mon, 29 Apr 2024 21:01:46 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 637D158066;
	Mon, 29 Apr 2024 21:01:45 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 15/17] fsi: occ: Get device number from FSI minor number API
Date: Mon, 29 Apr 2024 16:01:29 -0500
Message-Id: <20240429210131.373487-16-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cJXIH8TCSemLCXOH89YtJKHCwIMReHC8
X-Proofpoint-GUID: cJXIH8TCSemLCXOH89YtJKHCwIMReHC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

Remove the IDA indexing for OCC devices and instead use the FSI
minor number API. This will make the OCC numbering consistent
with other FSI engines and make the "reg" device tree property
unnecessary.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c | 47 +++++++++----------------------------------
 1 file changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index da35ca9e84a6..2023355b3980 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -4,9 +4,9 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
+#include <linux/fsi.h>
 #include <linux/fsi-sbefifo.h>
 #include <linux/gfp.h>
-#include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
@@ -44,6 +44,7 @@ struct occ {
 	struct device *sbefifo;
 	char name[32];
 	int idx;
+	dev_t devt;
 	bool platform_hwmon;
 	u8 sequence_number;
 	void *buffer;
@@ -75,8 +76,6 @@ struct occ_client {
 
 #define to_client(x)	container_of((x), struct occ_client, xfr)
 
-static DEFINE_IDA(occ_ida);
-
 static int occ_open(struct inode *inode, struct file *file)
 {
 	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
@@ -622,7 +621,6 @@ static int occ_unregister_of_child(struct device *dev, void *data)
 static int occ_probe(struct platform_device *pdev)
 {
 	int rc;
-	u32 reg;
 	char child_name[32];
 	struct occ *occ;
 	struct platform_device *hwmon_dev = NULL;
@@ -637,6 +635,10 @@ static int occ_probe(struct platform_device *pdev)
 	if (!occ)
 		return -ENOMEM;
 
+	rc = fsi_get_new_minor(to_fsi_dev(dev->parent), fsi_dev_occ, &occ->devt, &occ->idx);
+	if (rc)
+		return rc;
+
 	/* SBE words are always four bytes */
 	occ->buffer = kvmalloc(OCC_MAX_RESP_WORDS * 4, GFP_KERNEL);
 	if (!occ->buffer)
@@ -651,24 +653,6 @@ static int occ_probe(struct platform_device *pdev)
 	 */
 	occ->sequence_number = (u8)((jiffies % 0xff) + 1);
 	mutex_init(&occ->occ_lock);
-
-	if (dev->of_node) {
-		rc = of_property_read_u32(dev->of_node, "reg", &reg);
-		if (!rc) {
-			/* make sure we don't have a duplicate from dts */
-			occ->idx = ida_simple_get(&occ_ida, reg, reg + 1,
-						  GFP_KERNEL);
-			if (occ->idx < 0)
-				occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
-							  GFP_KERNEL);
-		} else {
-			occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
-						  GFP_KERNEL);
-		}
-	} else {
-		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
-	}
-
 	platform_set_drvdata(pdev, occ);
 
 	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
@@ -680,7 +664,7 @@ static int occ_probe(struct platform_device *pdev)
 	rc = misc_register(&occ->mdev);
 	if (rc) {
 		dev_err(dev, "failed to register miscdevice: %d\n", rc);
-		ida_simple_remove(&occ_ida, occ->idx);
+		fsi_free_minor(occ->devt);
 		kvfree(occ->buffer);
 		return rc;
 	}
@@ -719,7 +703,7 @@ static int occ_remove(struct platform_device *pdev)
 	else
 		device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
 
-	ida_simple_remove(&occ_ida, occ->idx);
+	fsi_free_minor(occ->devt);
 
 	return 0;
 }
@@ -746,20 +730,7 @@ static struct platform_driver occ_driver = {
 	.remove = occ_remove,
 };
 
-static int occ_init(void)
-{
-	return platform_driver_register(&occ_driver);
-}
-
-static void occ_exit(void)
-{
-	platform_driver_unregister(&occ_driver);
-
-	ida_destroy(&occ_ida);
-}
-
-module_init(occ_init);
-module_exit(occ_exit);
+module_platform_driver(occ_driver);
 
 MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
 MODULE_DESCRIPTION("BMC P9 OCC driver");
-- 
2.39.3


