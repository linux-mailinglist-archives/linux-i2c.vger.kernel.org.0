Return-Path: <linux-i2c+bounces-1773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F0856FDE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0D541F23B6F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB48C145B1C;
	Thu, 15 Feb 2024 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GLGaMrg0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F6913AA41;
	Thu, 15 Feb 2024 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034904; cv=none; b=a5rb+9HOI2gy7t7NUAfu/bhuGhukHms/Zl8RsTPYxnno5DzUbjihEINBqppODpFZgmHHJFaxKmX8mB0BjU3I3FGwQ8yYRXQSNGY4mHbD/lkzNQ5MIUFqcdds2WzkR2A/V7gTQjTNcB9kPjnK7gglCLMj1uvyZQMjjqxMFOP1wkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034904; c=relaxed/simple;
	bh=g6m8Cm3ROV7efeeZHUrBzY5Km6nC+Ze0oxF+hQuiVzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOhITRF4bMkeUIUV7BPnbzn6IvAzqXw53Q7wsQtsjNFHdRxxv38f0oRx47q5ROvIsR17zKCr1kXuWGHgHheust9UZn6xiYIizo4uO8C1UK2svvykob/zEXOBCnbNSjZn4r2laj9gvE83YGxY0JJUurT6fH4YK6iAwqEUSpkPg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GLGaMrg0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM7A2d029978;
	Thu, 15 Feb 2024 22:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=p4Bd0cE5tZZXjGiUwlW/m21TY8wBk8xiigmq9eJjy/8=;
 b=GLGaMrg0p4kwI0jPAcxpqxebeEsukU+FGmd866Zjg7zHGFf1HxJUf1qQO7kOLeXV57Rg
 e9y+nfTgz+X0BZqCTKNoYr6MuKrGIhWy+fyO85rT3Z8n9m8MLvpdgUVka63Ln6HdvECx
 Efk1bUHlTCDOsBCvticam0Bsoq6IzpRfGp7CtibstvJJyZa6tcZI9ht3l+tFqXMifl39
 gVW7W0npVinYA6fqV76b8LJ5nGmP89c0bPPwe2s6AAhKhbsb09FUsue4nYSx11iyPqWy
 iKET9fwQDyxHnJXOPS0PvKHJz82kB4N7ZtdWN+gV2mXP88IEZcolb8oVCGhApq2kA/bv Rw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9s0tjy3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:09 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLN4qc009920;
	Thu, 15 Feb 2024 22:08:08 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p6374qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:08 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM86BB918236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:08 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26AD058061;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8FD558073;
	Thu, 15 Feb 2024 22:08:05 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:05 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 12/33] fsi: core: Allow cfam device type aliases
Date: Thu, 15 Feb 2024 16:07:38 -0600
Message-Id: <20240215220759.976998-13-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 7D2MOM1G1KlY4M5GFPY2YVwo4YalrYB3
X-Proofpoint-ORIG-GUID: 7D2MOM1G1KlY4M5GFPY2YVwo4YalrYB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

Other FSI devices can uses aliases for the device numbering, so
modify the function to get a new minor to allow the cfam type
to use aliases too.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 59 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index eb15e5f5a2ee..95f6ce81f8f4 100644
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
 
+	if (np) {
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
 
@@ -1052,7 +1051,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	}
 
 	/* Allocate a minor in the FSI space */
-	rc = __fsi_get_new_minor(slave, fsi_dev_cfam, &slave->dev.devt,
+	rc = __fsi_get_new_minor(slave, slave->dev.of_node, fsi_dev_cfam, &slave->dev.devt,
 				 &slave->cdev_idx);
 	if (rc)
 		goto err_free;
-- 
2.39.3


