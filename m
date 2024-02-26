Return-Path: <linux-i2c+bounces-1987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE9867CFF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D6CAB29044
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37D9130AC5;
	Mon, 26 Feb 2024 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="p0YF905S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF712F596;
	Mon, 26 Feb 2024 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966427; cv=none; b=SWL4JKzFAT/KE8/bXjYnKwStJHgHidZ36Jgi0RN9eQP818XJbH7BLHm/m5JtGwa4KrZnFoLFSRvVv/fOfgpns+05UDYHEPfKXEzwCQ+IKIYde1ybMinJi0j+NJiCbqowvxl404bXD2cyHOEIjn2K2IPlTWF8oeF7aAmduWKGUXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966427; c=relaxed/simple;
	bh=dag58QHRP1fnYaS6R8SJNNOzUfUDraUYmqyTTX6oECc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WEU41TA+iwjxztHI5eb1PsYunRMH/tqSZot8DJB0Ksy6SnIGbBDp5sD1bFZKMYnCZidHmL3pBpwHUAkUZZorgKwTLEPMjkcAlI6SdoMKMbLZ/H6DF3OSiJjtrkUVfog7I4bVwOCiseEkFhYnrjjiduiSU/NOJzXFaqUh/iOcijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=p0YF905S; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGgWSj002982;
	Mon, 26 Feb 2024 16:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rmoDiCu3fC7Vm+wfRrhY6aDgTDEoQqVvLgZuCXucm4A=;
 b=p0YF905S/AuVXilU6fAKSWE5tClfDmIFKH0QR1ItsvPW0BLP7fZsqC/EGfDPVBEzUj+3
 71u0hmv/swejzplAB+4J2VuJRLAxESOaBi4J4dOFvTmpA0mJxmZ9uSm/hwLcO8jmjY1K
 76NuHR6t9198D9ZCAb/m+iQHwIXniVtw0ty7/DvrhDRRIudrFRdKU1faPG9XqYVqUn1s
 rdLZV0kaGotS2uhArjr8kvSMx/tIBRBqhUlCqMGNZhRqIjqiq1caGrZ54pUNLx6HubmF
 Gi4fvjN9Gvz0fDhVK8KSccRgA4VJSv49+OvZVi6qHt1BKFEpHVetUJa0Vuyu2NnqNZeA Sg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgxd4g9ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:35 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFJsHA008178;
	Mon, 26 Feb 2024 16:53:34 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9m2a0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:34 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrVVc36831748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:33 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B83D5805D;
	Mon, 26 Feb 2024 16:53:31 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E38F458053;
	Mon, 26 Feb 2024 16:53:30 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:30 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 11/31] fsi: core: Allow cfam device type aliases
Date: Mon, 26 Feb 2024 10:53:01 -0600
Message-Id: <20240226165321.91976-12-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nWDarWJWpsjLqt_it3GQia91Z1aNl05_
X-Proofpoint-ORIG-GUID: nWDarWJWpsjLqt_it3GQia91Z1aNl05_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Other FSI devices can uses aliases for the device numbering, so
modify the function to get a new minor to allow the cfam type
to use aliases too.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 - Check fsi device type variable before use to ensure we don't go out
   of bounds on the fsi_dev_type_names array.

 drivers/fsi/fsi-core.c | 59 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index eb15e5f5a2ee..8ad4feb71c8e 100644
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


