Return-Path: <linux-i2c+bounces-3865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4678FD8C2
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F001C23303
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F67172BCD;
	Wed,  5 Jun 2024 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="D2TU6lSC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53F16B733;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622625; cv=none; b=OcPNI0nzVZTqUPAmEVwFz/c3g6wpulPD2iwE64my4LTno++HfYQhC3Ij6eA8/9P2NEPdVunXrmx9UGzC281gLsuIYuNo/Ae2PL5eIZf+UjF9X/LW0m+/FTJAojoS764w0hSvqT8nmL7h6PXWOoAMYptsrv80hCiPNmpH7LNkaZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622625; c=relaxed/simple;
	bh=3+focb3tE1wM1QQff+6oE4BhF/jbM/GCPfmx3/r5S1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HAozRp/LYezktxJdf3JZEa66KB0KqOHP4WLiHWQs1Dr5FuunRvWpGxmVz8Qze6J6S6R7GRSw1oAFi+E5zgbFWtpyLP+HSHNp3PdPhVEb1/tFDaImO4ey0ckQAGSNIR7kQotVKzfE9JVyk6ZdnX3oVX9EURs15+8wUfUdx0kqsIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=D2TU6lSC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LDHcQ011846;
	Wed, 5 Jun 2024 21:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=0/NaGtMOdV6peMp7cxUe2O305K/Nsm2Su9UXKOlASJE=;
 b=D2TU6lSCtGY6PQMFSaEsbzVvTpkS/6rk98cFcqt+Jgkq3kuQNUFhoZZ9ak6NACk5Txsl
 CNMXDz0M53IQzDuLbe/uQ1i/+EqeEKaMD58XgzE4s5fV3eJyHVeAsVa/2igPiWJ87gTH
 ijndYGyDkLMcgYso6kXDZREe4AvkPzvLIY+Kso4NeutZlPjPHaVWtlJNkBlwMD60qyvr
 n60kT+ooInZ8IBL9oCq0ikIgEF07WHOGiog1VVa7QFhTVMNVaONV+BhWCdHW7Fqwbdne
 TKmBXO2H371pAitjrXRzFFN21UOWIZgQ9BoDkBPTNHcdQK+Fr0NZBYmW1r/1xle2kpfZ hQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyr080rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:18 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455K0hNn026694;
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffn6hgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:17 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNEah54329796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:16 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EA1858043;
	Wed,  5 Jun 2024 21:23:14 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFFA35806A;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 03/40] fsi: Fix slave addressing after break command
Date: Wed,  5 Jun 2024 16:22:35 -0500
Message-Id: <20240605212312.349188-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ESb3mSMAFGOdcFePo6vRJmD-oYXNuBjs
X-Proofpoint-ORIG-GUID: ESb3mSMAFGOdcFePo6vRJmD-oYXNuBjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

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


