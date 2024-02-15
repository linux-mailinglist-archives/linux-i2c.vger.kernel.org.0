Return-Path: <linux-i2c+bounces-1778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0B856FF0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32C2C287148
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1661474B4;
	Thu, 15 Feb 2024 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="h2dHszgp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29257146010;
	Thu, 15 Feb 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034908; cv=none; b=VnSRIQkzVI2b9tKJRkJOHZzypqfQKrzh5CuqTTgbSXgoQS/zprOgLlJisPV05InLFxiL25kkZc6AfPSzYfBBUtJiN2o8EGgXa8nJo8ooNVyTllKPgG9O9/8JqxjnL1D4akyLnF4nwOA5SFJhOcuukjo/UUTOdFeVUNsuYFj+afY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034908; c=relaxed/simple;
	bh=rnrW55EMd5WY1H/Lf4PHZ/r+oG7ZBsAslE1xLX4eUiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j6Uxk/grEN9hMPkOAW26HIuOtE19olK3O+FAPpWPUiNDaUt2voCkbrX4xnhXkbR9wLFSalWnPIuVCIRXmZ8vpxKTqdZ9y8Rbr8GG5WsWT8oleTsPqBWDDuMAIiQDsKb0bOj8ymY1PDyl0C6jw9n6TZCBh/cJjX69kXMav3uFECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=h2dHszgp; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0XBk017924;
	Thu, 15 Feb 2024 22:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bcqBdP1smZ142CVdipR5CsJhhC56BJDRe32BgoHDJb0=;
 b=h2dHszgpB5H1g7lkUbxqPswzrsfW/vrwIFlDBpbZOdP1e5+wEmpb0kLkSkznvQg4lcDo
 bARFQ/4+kBrvJurOt6kKivwXjk3z24HANZcau7gRQlB0QdSb4QWQFMB77+VG5cwEuHEg
 Iqc0HdLlT87yMJU7maCiSr7GfnLf+sH/rOxZ05mqNT7XnNza5w7Zsho/6PK1Qe8OXQ/G
 uv5gJYLreAS5A6+RwBuWHTg2pGsXOHvLcnp3UJs6/oCSl/Q2toITOPwGji+VJIEr4B9r
 qPcYpuzcsGV5Ier0CVL5htWPaRESfQ6WhXgViiY8YsNudrH39tX4j3UY9Y/1KJlu8VZS nA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg69b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJANdP004251;
	Thu, 15 Feb 2024 22:08:10 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0qtmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM87kN9306826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D031958072;
	Thu, 15 Feb 2024 22:08:05 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8570558086;
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
Subject: [PATCH 11/33] fsi: core: Add slave spinlock
Date: Thu, 15 Feb 2024 16:07:37 -0600
Message-Id: <20240215220759.976998-12-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 1NXmfBBLW8NuuHvZgD0892lFSsN0VJSh
X-Proofpoint-ORIG-GUID: 1NXmfBBLW8NuuHvZgD0892lFSsN0VJSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

FSI slave operations were not locked, meaning that during slave
error recovery operations, other slave accesses may take place,
resulting in incorrect recovery and additional errors. Make the
slave access and error recovery atomic with a spinlock. Don't
use a mutex for future interrupt handling support.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 7 +++++++
 drivers/fsi/fsi-slave.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e6ed2d0773b6..eb15e5f5a2ee 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -304,6 +304,7 @@ static int fsi_slave_handle_error(struct fsi_slave *slave, bool write,
 int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 			void *val, size_t size)
 {
+	unsigned long flags;
 	uint8_t id = slave->id;
 	int rc, err_rc, i;
 
@@ -311,6 +312,7 @@ int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 	if (rc)
 		return rc;
 
+	spin_lock_irqsave(&slave->lock, flags);
 	for (i = 0; i < slave_retries; i++) {
 		rc = fsi_master_read(slave->master, slave->link,
 				id, addr, val, size);
@@ -321,6 +323,7 @@ int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 		if (err_rc)
 			break;
 	}
+	spin_unlock_irqrestore(&slave->lock, flags);
 
 	return rc;
 }
@@ -329,6 +332,7 @@ EXPORT_SYMBOL_GPL(fsi_slave_read);
 int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			const void *val, size_t size)
 {
+	unsigned long flags;
 	uint8_t id = slave->id;
 	int rc, err_rc, i;
 
@@ -336,6 +340,7 @@ int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 	if (rc)
 		return rc;
 
+	spin_lock_irqsave(&slave->lock, flags);
 	for (i = 0; i < slave_retries; i++) {
 		rc = fsi_master_write(slave->master, slave->link,
 				id, addr, val, size);
@@ -346,6 +351,7 @@ int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 		if (err_rc)
 			break;
 	}
+	spin_unlock_irqrestore(&slave->lock, flags);
 
 	return rc;
 }
@@ -1005,6 +1011,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	if (!slave)
 		return -ENOMEM;
 
+	spin_lock_init(&slave->lock);
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, id);
 	slave->dev.type = &cfam_type;
 	slave->dev.parent = &master->dev;
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index 42af2fae0329..6f8fb97023fb 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -6,6 +6,7 @@
 
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/spinlock.h>
 
 #define FSI_SLAVE_BASE			0x800
 
@@ -100,6 +101,7 @@ struct fsi_slave {
 	struct device		dev;
 	struct fsi_master	*master;
 	struct cdev		cdev;
+	spinlock_t		lock;	/* atomic access and error recovery */
 	int			cdev_idx;
 	int			id;	/* FSI address */
 	int			link;	/* FSI link# */
-- 
2.39.3


