Return-Path: <linux-i2c+bounces-3518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B78C7BF6
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8761A1C20F98
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E649158205;
	Thu, 16 May 2024 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fkV6Kujy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCF156F50;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883574; cv=none; b=WOJ7NaLO0Buhz08Slc1X44+3Ik1L8ulFnSUb+N/mlZxRLZ7pRpyGQ/wsfshGTDvNlfBtVc7ojuUgLb4+9ABn4I3djyOV6lLhFRt++X9vFTS/+coiBOFZRZnOusDVwNVgVn95JIH6Dm/IyuCeTY/t8tsCb3EIDtHESItcxHt9+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883574; c=relaxed/simple;
	bh=++qxSg8ePVCHBlUfgcxd7PUReZScqf/xPWbBoudBCnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nVvJ8HtOvmuUe+qkrkNkQVvZs7tVWI5nQwL24XazUYjwDBXjxZXj2opLHZER0X1WMOOno5WO9SLnVFcmKFuVbpZ9cpg2DEBYB69vUwSdMAGz9PfBMRN8xtYMDTbxvPuS23EyTU13AE7GFtleaTdSI0Q1BCXaUEpbSK1qWaACkwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fkV6Kujy; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GI8CTp018657;
	Thu, 16 May 2024 18:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Y98dRxrLBHldvjnywSLtVO9jA7MBr6bUSzYUwxA+r8w=;
 b=fkV6Kujymfj5ALBZpmyE4aj8XM2ObrBfNzElxDNopv+QH9XvbwswwM1Wq0NpydoT3YzC
 nxCpfR42p2f7lSiL4WPkSle5cZgYLBbR73wmZr2VXIBpVEx0VZUcwkRqXKD+vORpe8RI
 F2xwYFYXNmJEmVlMqSQn3Q++Ic3eqTcbgENmfWADBcqDsdc9T9G2vUzhXNyG1Simk3SM
 KkF2zL6AeBMyb72z2AjgpUcaGRW1GH53CbGx5huwecG7D+8Qg/TC1LUuUQpnSm6wz5gB
 JZgFygWHuH0QZcWMITWRKlqQczFhJ2FekiFshEZj7IcA48biMlpSWhFbzWn80iu210F5 ag== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5q5980my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:16 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GG3bpS029636;
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m34m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:15 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJC4I10289720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:14 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9274A58067;
	Thu, 16 May 2024 18:19:10 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52E4E58069;
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
Subject: [PATCH v3 10/40] fsi: core: Add slave spinlock
Date: Thu, 16 May 2024 13:18:37 -0500
Message-Id: <20240516181907.3468796-11-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: jIaNXquNEVynCey3evKIVRnjE3zyk2gu
X-Proofpoint-ORIG-GUID: jIaNXquNEVynCey3evKIVRnjE3zyk2gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

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
index ce9762d1bd8b0..660f89b743235 100644
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
@@ -1007,6 +1013,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	if (!slave)
 		return -ENOMEM;
 
+	spin_lock_init(&slave->lock);
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, id);
 	slave->dev.type = &cfam_type;
 	slave->dev.parent = &master->dev;
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index e9fd4be6f3760..0468ec1c60db2 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -6,6 +6,7 @@
 
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/spinlock.h>
 
 #define FSI_SLAVE_BASE			0x800
 
@@ -107,6 +108,7 @@ struct fsi_slave {
 	struct device		dev;
 	struct fsi_master	*master;
 	struct cdev		cdev;
+	spinlock_t		lock;	/* atomic access and error recovery */
 	int			cdev_idx;
 	int			id;	/* FSI address */
 	int			link;	/* FSI link# */
-- 
2.39.3


