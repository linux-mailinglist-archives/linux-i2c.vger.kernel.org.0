Return-Path: <linux-i2c+bounces-1978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3AE867CCC
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 169CB29074D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DDB12E1F0;
	Mon, 26 Feb 2024 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KLFbl+wT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD412D75F;
	Mon, 26 Feb 2024 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966423; cv=none; b=hg3syNll5pS3zWyNtRJ0mzlDYZs+IyvsxlqX6OTuW1/XLNlYI3Q/1hVbA5gWbWuxzrzzka+gpcWph6qQd7piFCykFNoB4WTb0T7oBZlXkVRXzZUia7Sj0ync2ArjYQRszl2d2eKmwy4HItWcgR2ZR6h0niegZoyXJnTru1+FJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966423; c=relaxed/simple;
	bh=t+fL4dbYLUcdsIq4ZMykfifG2UxgfeRtAt3E1EOP/A8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pGhpLx+yazkfPKcuKXP8UkZ8pqoOCP3evi55aLJyNW6MKdHWUnL7zDWWjHqNb1VN1x3mXkRg5yMnR+8P7aph/xyJlKyaw+RkpJmiozo5A+ZTyMFOIopYGLY+H1me5aGbpk5CE7Kwe498id7IxCb++2OJElt1ymY6hHrtagmFMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KLFbl+wT; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG5i6L026188;
	Mon, 26 Feb 2024 16:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=42KZToJ6L2oi/2I8rKEPazeyIcIc7KzaadnBTEbvxS8=;
 b=KLFbl+wTK54ENAwFCeRwOQ1RxZTLuq8qXWweplyRNmCEjoqfL8bn7Dh9QxgCqibz53aj
 f12/wpxdzEgh04OkHnSH/SRtu0ZCso5r+gehN4g24MwqV4a0UP+glA13ojRSoysaYc/B
 ZfVIwYNj63tpZyPUKAtwkl0qBU8xjyZox5p5gkRp/16B31VTPHKNPJBB9hoP12OM85o4
 LELQ7onVfceggxrA/hub/UGLv+Ip7DMKrSjcPnJ1lELyRkf30+rl78RSNyzvPLXsKEaa
 6+44vbmh+5NbK8vwNWAQbhqwyfLQIOPb6aq8t9X9S1gYD/f5ba4kVu/lTTTzEhzlIjEd 5w== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvsq33cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:28 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGmIR9021306;
	Mon, 26 Feb 2024 16:53:27 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfusntedb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:27 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrOxG66650558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:26 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 519AE58063;
	Mon, 26 Feb 2024 16:53:24 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9762858043;
	Mon, 26 Feb 2024 16:53:23 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 02/31] fsi: Improve master indexing
Date: Mon, 26 Feb 2024 10:52:52 -0600
Message-Id: <20240226165321.91976-3-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: xLt1lVa1QntYMwhEZnW-sGBbMaMkQ8Dc
X-Proofpoint-ORIG-GUID: xLt1lVa1QntYMwhEZnW-sGBbMaMkQ8Dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Master indexing is problematic if a hub is rescanned while the
root master is being rescanned. Move the IDA free below the device
unregistration, lock the scan mutex in the probe function, and
request a specific idx in the hub driver.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c       | 12 +++++-------
 drivers/fsi/fsi-master-hub.c |  2 ++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 7bf0c96fc017..1c687eb021a0 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1271,7 +1271,6 @@ static struct class fsi_master_class = {
 int fsi_master_register(struct fsi_master *master)
 {
 	int rc;
-	struct device_node *np;
 
 	mutex_init(&master->scan_lock);
 
@@ -1295,14 +1294,13 @@ int fsi_master_register(struct fsi_master *master)
 	rc = device_register(&master->dev);
 	if (rc) {
 		ida_free(&master_ida, master->idx);
-		goto out;
-	}
+	} else {
+		struct device_node *np = dev_of_node(&master->dev);
 
-	np = dev_of_node(&master->dev);
-	if (!of_property_read_bool(np, "no-scan-on-init")) {
-		fsi_master_scan(master);
+		if (!of_property_read_bool(np, "no-scan-on-init"))
+			fsi_master_scan(master);
 	}
-out:
+
 	mutex_unlock(&master->scan_lock);
 	return rc;
 }
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 6d8b6e8854e5..36da643b3201 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 
 #include "fsi-master.h"
+#include "fsi-slave.h"
 
 #define FSI_ENGID_HUB_MASTER		0x1c
 
@@ -229,6 +230,7 @@ static int hub_master_probe(struct device *dev)
 	hub->master.dev.release = hub_master_release;
 	hub->master.dev.of_node = of_node_get(dev_of_node(dev));
 
+	hub->master.idx = fsi_dev->slave->link + 1;
 	hub->master.n_links = links;
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
-- 
2.39.3


