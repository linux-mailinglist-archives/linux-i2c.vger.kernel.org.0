Return-Path: <linux-i2c+bounces-1769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FED856FD1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59E601C21369
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2096145329;
	Thu, 15 Feb 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oO/hgcS1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE24D1419B5;
	Thu, 15 Feb 2024 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034903; cv=none; b=rmvO6xsO0SvAPWVS6sj9dUDacEioE9+VpSXnvc1mWTJpoLdlO4rLbsxx9UErHMFpq0Af3dBsvOdJE+2JEblHCYidNrech6mGnbhwAA1Eco541+NfPDRGq6m6HLlPWUIMb7ZOerKahRmr7doZevAu7zqfVR1f4cpPjWMjX0OrUQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034903; c=relaxed/simple;
	bh=t+fL4dbYLUcdsIq4ZMykfifG2UxgfeRtAt3E1EOP/A8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QrSkSIfrduQLmKjiretHIOtL2P+UYcxkHCtLqGSp8dWvPPJDARelq7Xo3kJXYmUeBDeOj+GjFCzxE1Z5zLhfbNb5d2tF3InH+ehptj3B3JDQOFrtHAgylJ1d7In/ttUKyUA2yBfxSl4dLBj2VAv6hjYUeBCcxyu4ghibHiohfs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oO/hgcS1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM6OdU026556;
	Thu, 15 Feb 2024 22:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=42KZToJ6L2oi/2I8rKEPazeyIcIc7KzaadnBTEbvxS8=;
 b=oO/hgcS1eeYjUHFgTk9WVp2tStqGPRi4XIqneHPUwzqTvfxHHR2Zk4Th99GKmzJy9Wbm
 6CVmfe7dATE65y3YFc/P+6szw2KFNnt5wcRicDj8OdGVQ0oXdL8yxG5YReImWNS1VurC
 DjmPggmChW6N2IPPMY96CKuoXKNN2B2suTTA9/VfC2cZj1FlOaXrlsCFjx3ehE4GtbAh
 tkg/fxnGn0c8SrkuxXU7eBi1bXO/wnx6+tzkfaHkfK45Neb+3kPZTUq/ssOsrBVF0U8u
 1aV2hSZEhq05rlj75po+Fv2vpNrpoIo7RnoHqSp/Ceb+W6LKcPyzzW89L2zxI+UrVIgX dg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u46r133-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:06 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJHAZ4024888;
	Thu, 15 Feb 2024 22:08:06 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mfpqkfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM83MJ27656862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:05 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6833B58056;
	Thu, 15 Feb 2024 22:08:03 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EC8558061;
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
Subject: [PATCH 04/33] fsi: Improve master indexing
Date: Thu, 15 Feb 2024 16:07:30 -0600
Message-Id: <20240215220759.976998-5-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: yacOQgyGxb1ACjOHEFL6Lk0Fd8klTmzp
X-Proofpoint-GUID: yacOQgyGxb1ACjOHEFL6Lk0Fd8klTmzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

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


