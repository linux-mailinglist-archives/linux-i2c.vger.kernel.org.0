Return-Path: <linux-i2c+bounces-3524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409498C7C19
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9475CB22E58
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE627158A20;
	Thu, 16 May 2024 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="peltbzJE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92776156F28;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883576; cv=none; b=bFq1AT91wSCnd20whuGVW7wxJ/S5qdK8kt0q6+Ww2vJYAwq41dnDanVaQmwZqUfzkx3hth/5QC0kXn3R4KA5YgrtJZ6IH5KMCJeip0PbJSS1PNSPa71Q8nQBMGeW7H5XbqRUPXT0llg6UEjyBkJ0pQcmjXEmNC1T1JjqbIg0BkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883576; c=relaxed/simple;
	bh=3+focb3tE1wM1QQff+6oE4BhF/jbM/GCPfmx3/r5S1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uAt4/jh0Sd6EXdtbo8QfFN/h5xMg6v+dyvVYpLMUjYJbKbMIfa/M0qYHHJQpfc8E3MV5ei7JJHxp2GxuEyGceCpeYCH6qXEPDr0kmtbKeB4YsAQZqEEC/25yEEuBfzX7qBGByQUCmpbpo54Y7B5/5ZqxAk8rrWNIH43pLxhF9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=peltbzJE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGGhsU017307;
	Thu, 16 May 2024 18:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0/NaGtMOdV6peMp7cxUe2O305K/Nsm2Su9UXKOlASJE=;
 b=peltbzJEELAc56tYfO8jgi6BgNqaQ5jycRbIzU+xJVuRGq9hhq56xY0Ni4l4CE7/flPR
 4XamdNfRdqkaH7ZYwgdcqxtcVFcWMx7HLZHKg1fp4be7jnJqDWXZRzzylj/hEJDW7V8G
 01Qh8CJkZlw5OmPQz18dvhcrebbH5Xi34+rtNP0Pja2lmtJinE0INPsoEtWgNjQVV2Ug
 i1cM9RUwkdHu92viBHUHfU47p2gMwwiR+79NhP4mbuW3TGTrKtwVwX/v8nk/E54gMi+h
 X4APhbqQL0jw7g1MOvrUoCmI8tsbak+uAzl01e+/O4It2xd4Pz1oHGO1a/sRnktZKu1w Lw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5g6jh6tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:13 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHATbp018819;
	Thu, 16 May 2024 18:19:12 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:12 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJASx21496554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:12 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 777A35807D;
	Thu, 16 May 2024 18:19:08 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FBB558071;
	Thu, 16 May 2024 18:19:08 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:08 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 03/40] fsi: Fix slave addressing after break command
Date: Thu, 16 May 2024 13:18:30 -0500
Message-Id: <20240516181907.3468796-4-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: CklOn_OLANOO577Ilyz59g5tq9McdkVA
X-Proofpoint-GUID: CklOn_OLANOO577Ilyz59g5tq9McdkVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

After a break command, the slave ID is set to 0x3, which means the
FSI driver should use that ID when communicating with the slave, until
SMODE is programmed with the new ID (forced to 0 for 23 bit addressing in
the current implementation). This worked previously due to a feature of
newer FSI slaves that don't enforce this requirement. Since hub masters
cannot address non-zero slave IDs, disable this behavior for slaves off
hub masters.

Fixes: 2b545cd8e1b2 ("drivers/fsi: Implement slave initialisation")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c       | 20 ++++++++++----------
 drivers/fsi/fsi-master-hub.c |  1 +
 drivers/fsi/fsi-master.h     |  1 +
 drivers/fsi/fsi-slave.h      |  1 +
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 7bf0c96fc0172..e8dbf5e95c234 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -217,7 +217,7 @@ static uint32_t fsi_slave_smode(int id, u8 t_senddly, u8 t_echodly)
 		| fsi_smode_lbcrr(0x8);
 }
 
-static int fsi_slave_set_smode(struct fsi_slave *slave)
+static int fsi_slave_set_smode(struct fsi_slave *slave, uint8_t id)
 {
 	uint32_t smode;
 	__be32 data;
@@ -228,8 +228,7 @@ static int fsi_slave_set_smode(struct fsi_slave *slave)
 	smode = fsi_slave_smode(slave->id, slave->t_send_delay, slave->t_echo_delay);
 	data = cpu_to_be32(smode);
 
-	return fsi_master_write(slave->master, slave->link, slave->id,
-				FSI_SLAVE_BASE + FSI_SMODE,
+	return fsi_master_write(slave->master, slave->link, id, FSI_SLAVE_BASE + FSI_SMODE,
 				&data, sizeof(data));
 }
 
@@ -281,7 +280,7 @@ static int fsi_slave_handle_error(struct fsi_slave *slave, bool write,
 	slave->t_send_delay = send_delay;
 	slave->t_echo_delay = echo_delay;
 
-	rc = fsi_slave_set_smode(slave);
+	rc = fsi_slave_set_smode(slave, FSI_SMODE_SID_BREAK);
 	if (rc)
 		return rc;
 
@@ -773,7 +772,7 @@ static ssize_t slave_send_echo_store(struct device *dev,
 	slave->t_send_delay = val;
 	slave->t_echo_delay = val;
 
-	rc = fsi_slave_set_smode(slave);
+	rc = fsi_slave_set_smode(slave, slave->id);
 	if (rc < 0)
 		return rc;
 	if (master->link_config)
@@ -945,6 +944,8 @@ EXPORT_SYMBOL_GPL(fsi_free_minor);
 
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
+	const uint8_t break_id = (master->flags & FSI_MASTER_FLAG_NO_BREAK_SID) ? 0 :
+		FSI_SMODE_SID_BREAK;
 	uint32_t cfam_id;
 	struct fsi_slave *slave;
 	uint8_t crc;
@@ -957,7 +958,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	if (id != 0)
 		return -EINVAL;
 
-	rc = fsi_master_read(master, link, id, 0, &data, sizeof(data));
+	rc = fsi_master_read(master, link, break_id, 0, &data, sizeof(data));
 	if (rc) {
 		dev_dbg(&master->dev, "can't read slave %02x:%02x %d\n",
 				link, id, rc);
@@ -981,9 +982,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	 */
 	if (master->flags & FSI_MASTER_FLAG_SWCLOCK) {
 		llmode = cpu_to_be32(FSI_LLMODE_ASYNC);
-		rc = fsi_master_write(master, link, id,
-				FSI_SLAVE_BASE + FSI_LLMODE,
-				&llmode, sizeof(llmode));
+		rc = fsi_master_write(master, link, break_id, FSI_SLAVE_BASE + FSI_LLMODE, &llmode,
+				      sizeof(llmode));
 		if (rc)
 			dev_warn(&master->dev,
 				"can't set llmode on slave:%02x:%02x %d\n",
@@ -1028,7 +1028,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 			 "can't set slbus on slave:%02x:%02x %d\n", link, id,
 			 rc);
 
-	rc = fsi_slave_set_smode(slave);
+	rc = fsi_slave_set_smode(slave, break_id);
 	if (rc) {
 		dev_warn(&master->dev,
 				"can't set smode on slave:%02x:%02x %d\n",
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 36da643b32018..eea8649fee74d 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -232,6 +232,7 @@ static int hub_master_probe(struct device *dev)
 
 	hub->master.idx = fsi_dev->slave->link + 1;
 	hub->master.n_links = links;
+	hub->master.flags = FSI_MASTER_FLAG_NO_BREAK_SID;
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
 	hub->master.send_break = hub_master_break;
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 967622c1cabf7..a0d7ad0f0f7cc 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -111,6 +111,7 @@
 
 /* fsi-master definition and flags */
 #define FSI_MASTER_FLAG_SWCLOCK		0x1
+#define FSI_MASTER_FLAG_NO_BREAK_SID	0x2
 
 /*
  * Structures and function prototypes
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index dba65bd4e083f..f6cca04131a92 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -39,6 +39,7 @@
 #define FSI_SMODE_ECRC		0x20000000	/* Hw CRC check */
 #define FSI_SMODE_SID_SHIFT	24		/* ID shift */
 #define FSI_SMODE_SID_MASK	3		/* ID Mask */
+#define FSI_SMODE_SID_BREAK	3		/* ID after break command */
 #define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
 #define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
 #define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
-- 
2.39.3


