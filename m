Return-Path: <linux-i2c+bounces-3523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80C8C7C13
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0B71F21D7F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7122158A0F;
	Thu, 16 May 2024 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ey1A+RcY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ED015820F;
	Thu, 16 May 2024 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883576; cv=none; b=Erfs/Yu8Agj1z3VCsb7Kn/wbEfAJdv40azlxIolyCWLpD7KbsviNQwvZC6MfrKPrY5vpggtVDWpproB2KYBkADGFK7qobA2Curd8SGm2aIWkrLRWLiyvYatAPy+ECPutmtd8KyPbWpj8wXm2Kr2ooNi73xLXI4Ri9c0s8tOQgTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883576; c=relaxed/simple;
	bh=XNrRONtL68Pz4zCpeEiE+IkzuNnZ7Cayb/AUOF/wCFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fpLq2C4gmntwD9yOGPVVUAaliamuOV8+kTAzWh9Ffn0Dfj0DOHRREjZiOM6+SDd4YbDXtG9xilD0LZdVtdqQazUUE1uOGwx7u+ipmG/gt6CRfgAmrP1X2K4WiIoxJKiT07MfwihCNNqzlf6nLIkLKy4r6NPMySb169aVigxHGdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ey1A+RcY; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHgj1M003338;
	Thu, 16 May 2024 18:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cejzBxtcEByI+xMESV4H8QqE4nNOLYSRaK7OFmvEFBE=;
 b=Ey1A+RcYq/mj91g9t8GMTZHiHVLGQ0UJvhWzQI7pD2gRfHD5jPy90uzffzYap+D5msJx
 W3SWH74GLFQRkEEDijAYSK25GkfqWnQFZlIpOsMgyOTHPYLbKDWdLIKHGz3ZAopbx/2p
 5Daki9+KlDb5rtqPO650LYcMdjoOQhML4v5408QafgE8KDCOaGNmanBAUZe4pCESnCrm
 MeN/kCusiohclpoGP//XSyIV+4jDhaLNrLzpwnxjHkmj2SvVc851xaABW6GBLSx25USa
 3ZySroFoBKLuBpdKHXPkXN3sPdstjZWmOb/6ghqUjfhUzLHokPtZPHr5XPoGjtIwf+FC nw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pse82ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:16 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAFtU002257;
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0pkfug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:15 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJChx24052232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D18B75808B;
	Thu, 16 May 2024 18:19:10 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AF2D58072;
	Thu, 16 May 2024 18:19:10 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:10 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 11/40] fsi: core: Allow cfam device type aliases
Date: Thu, 16 May 2024 13:18:38 -0500
Message-Id: <20240516181907.3468796-12-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 12oT6ApGIe3bN8Ru7iVyyvIOj8pZQr2B
X-Proofpoint-GUID: 12oT6ApGIe3bN8Ru7iVyyvIOj8pZQr2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Other FSI devices can uses aliases for the device numbering, so
modify the function to get a new minor to allow the cfam type
to use aliases too.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 59 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 660f89b743235..36e31eafad3d0 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -884,12 +884,37 @@ static int fsi_adjust_index(int index)
 #endif
 }
 
-static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
-			       dev_t *out_dev, int *out_index)
+static const char *const fsi_dev_type_names[] = {
+	"cfam",
+	"sbefifo",
+	"scom",
+	"occ",
+};
+
+static int __fsi_get_new_minor(struct fsi_slave *slave, struct device_node *np,
+			       enum fsi_dev_type type, dev_t *out_dev, int *out_index)
 {
 	int cid = slave->chip_id;
 	int id;
 
+	if (np && type < 4) {
+		int aid = of_alias_get_id(np, fsi_dev_type_names[type]);
+
+		if (aid >= 0) {
+			/* Use the same scheme as the legacy numbers. */
+			id = (aid << 2) | type;
+			id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
+			if (id >= 0) {
+				*out_index = aid;
+				*out_dev = fsi_base_dev + id;
+				return 0;
+			}
+
+			if (id != -ENOSPC)
+				return id;
+		}
+	}
+
 	/* Check if we qualify for legacy numbering */
 	if (cid >= 0 && cid < 16 && type < 4) {
 		/*
@@ -918,36 +943,10 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
 	return 0;
 }
 
-static const char *const fsi_dev_type_names[] = {
-	"cfam",
-	"sbefifo",
-	"scom",
-	"occ",
-};
-
 int fsi_get_new_minor(struct fsi_device *fdev, enum fsi_dev_type type,
 		      dev_t *out_dev, int *out_index)
 {
-	if (fdev->dev.of_node) {
-		int aid = of_alias_get_id(fdev->dev.of_node, fsi_dev_type_names[type]);
-
-		if (aid >= 0) {
-			/* Use the same scheme as the legacy numbers. */
-			int id = (aid << 2) | type;
-
-			id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
-			if (id >= 0) {
-				*out_index = aid;
-				*out_dev = fsi_base_dev + id;
-				return 0;
-			}
-
-			if (id != -ENOSPC)
-				return id;
-		}
-	}
-
-	return __fsi_get_new_minor(fdev->slave, type, out_dev, out_index);
+	return __fsi_get_new_minor(fdev->slave, fdev->dev.of_node, type, out_dev, out_index);
 }
 EXPORT_SYMBOL_GPL(fsi_get_new_minor);
 
@@ -1059,7 +1058,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	}
 
 	/* Allocate a minor in the FSI space */
-	rc = __fsi_get_new_minor(slave, fsi_dev_cfam, &slave->dev.devt,
+	rc = __fsi_get_new_minor(slave, slave->dev.of_node, fsi_dev_cfam, &slave->dev.devt,
 				 &slave->cdev_idx);
 	if (rc)
 		goto err_free;
-- 
2.39.3


