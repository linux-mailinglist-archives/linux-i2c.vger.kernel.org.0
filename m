Return-Path: <linux-i2c+bounces-3861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C968FD8B3
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD52F1F22DC8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B6D16D9D5;
	Wed,  5 Jun 2024 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ks+NI1C6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83207167299;
	Wed,  5 Jun 2024 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622623; cv=none; b=KDiLiFncSxoR/D0pjZEeapFsxuMMnF9HZMX+RQpGC4YlRCv/64zChTauPhmFw2aFiZD8IaOUtPiRjyhap8xLLgn2uQsUD7zG9tWcUzK/2RwNxuBlMwHUubDnOrLJ2mKZTxDXGtxKTP88BIzsJb9vF3W+QPaL1eRokZZGXVj912U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622623; c=relaxed/simple;
	bh=V7YtsL0df7QZ2fCW8ovj+jSPEIs0M575sgx8iNcYOWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PDrlCrJokwTTcaJlqttC/wE1Z7JDpAn90H8nJ4JeCna/3mBpTZPG7zGcWzQ567LHJBthWCugEyAd7B2UbsdFPcF7Qx2coJwcPo5PIuYGlBs3YeE7wHEfzQo9bxPMSdX/9z8kE5ph3uWIijZ5xdhuMhjrBy3QCVwwKLQ0sLciyks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ks+NI1C6; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LK8d8026571;
	Wed, 5 Jun 2024 21:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=sExpzqDawVL7Dn962NZ99fpWpjztnGoo0REU8wYGdnY=;
 b=ks+NI1C6uCGlpRYlznESObdhJDiuf59OhDSq8d1a0Rfa0mVJjBQPpAvSmIAQCZi9bu8W
 f8LHDCN5pwlIpqqlcs5eR9cbU+hswTpcoKoSOKccwRDoFbnRdoAjuD2Yl6CZ52qVbqkj
 +BBJBVgQ8bZnCxoCUo6FkNphLCFVz34W52zWEF2iPPSMEcj7Mj3LyHtcTrVn4cOENOSo
 3mCGmfYkXlx1u0eFBw5ZGi8X3Qc3R50r4Pl4Iy7aLVZqM02sdcRPHIsDel69A2O/ExMd
 N8bk+TwVfJ48r6d3s4Naz/IVRGqzvI1tbGgbFnFQpW+9J/2RwYiie4SwRFjfVg/2gNHt Lg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjuwr0qbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:26 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455K5KDA026671;
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffn6hhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNLFO24183380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9286558066;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D6BE5806B;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 27/40] i2c: fsi: Improve formatting
Date: Wed,  5 Jun 2024 16:22:59 -0500
Message-Id: <20240605212312.349188-28-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: P7eu08QAOub-E0MYTLx5CmgJkYMXnczj
X-Proofpoint-GUID: P7eu08QAOub-E0MYTLx5CmgJkYMXnczj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

No functional change. Remove holes in the master structure. Re-order
local variables to look pretty. Remove some local variables in favor of
using their containing structure.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Add detail to commit message.

 drivers/i2c/busses/i2c-fsi.c | 125 +++++++++++++++++------------------
 1 file changed, 60 insertions(+), 65 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 2404ace8c56fa..8fb5b51b74a4d 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -148,10 +148,10 @@
 
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
-	u8			fifo_size;
 	struct list_head	ports;
 	struct mutex		lock;
 	u32			clock_div;
+	u8			fifo_size;
 };
 
 struct fsi_i2c_port {
@@ -165,15 +165,14 @@ struct fsi_i2c_port {
 static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
 			    u32 *data)
 {
-	int rc;
 	__be32 data_be;
+	int rc;
 
 	rc = fsi_device_read(fsi, reg, &data_be, sizeof(data_be));
 	if (rc)
 		return rc;
 
 	*data = be32_to_cpu(data_be);
-
 	return 0;
 }
 
@@ -187,9 +186,11 @@ static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
 
 static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 {
-	int rc;
-	u32 mode = I2C_MODE_ENHANCED, extended_status, watermark;
+	u32 mode = I2C_MODE_ENHANCED;
+	u32 extended_status;
 	u32 interrupt = 0;
+	u32 watermark;
+	int rc;
 
 	/* since we use polling, disable interrupts */
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, &interrupt);
@@ -215,9 +216,10 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 
 static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 {
-	int rc;
 	struct fsi_device *fsi = port->master->fsi;
-	u32 mode, dummy = 0;
+	u32 dummy = 0;
+	u32 mode;
+	int rc;
 
 	rc = fsi_i2c_read_reg(fsi, I2C_FSI_MODE, &mode);
 	if (rc)
@@ -238,7 +240,6 @@ static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			 bool stop)
 {
-	struct fsi_i2c_master *i2c = port->master;
 	u32 cmd = I2C_CMD_WITH_START | I2C_CMD_WITH_ADDR;
 
 	port->xfrd = 0;
@@ -252,7 +253,7 @@ static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
 	cmd |= FIELD_PREP(I2C_CMD_ADDR, msg->addr);
 	cmd |= FIELD_PREP(I2C_CMD_LEN, msg->len);
 
-	return fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, &cmd);
+	return fsi_i2c_write_reg(port->master->fsi, I2C_FSI_CMD, &cmd);
 }
 
 static int fsi_i2c_get_op_bytes(int op_bytes)
@@ -268,18 +269,17 @@ static int fsi_i2c_get_op_bytes(int op_bytes)
 static int fsi_i2c_write_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			      u8 fifo_count)
 {
+	int bytes_to_write = port->master->fifo_size - fifo_count;
+	int bytes_remaining = msg->len - port->xfrd;
 	int write;
 	int rc;
-	struct fsi_i2c_master *i2c = port->master;
-	int bytes_to_write = i2c->fifo_size - fifo_count;
-	int bytes_remaining = msg->len - port->xfrd;
 
 	bytes_to_write = min(bytes_to_write, bytes_remaining);
 
 	while (bytes_to_write) {
 		write = fsi_i2c_get_op_bytes(bytes_to_write);
 
-		rc = fsi_device_write(i2c->fsi, I2C_FSI_FIFO,
+		rc = fsi_device_write(port->master->fsi, I2C_FSI_FIFO,
 				      &msg->buf[port->xfrd], write);
 		if (rc)
 			return rc;
@@ -294,12 +294,11 @@ static int fsi_i2c_write_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			     u8 fifo_count)
 {
-	int read;
-	int rc;
-	struct fsi_i2c_master *i2c = port->master;
-	int bytes_to_read;
 	int xfr_remaining = msg->len - port->xfrd;
+	int bytes_to_read;
 	u32 dummy;
+	int read;
+	int rc;
 
 	bytes_to_read = min_t(int, fifo_count, xfr_remaining);
 
@@ -307,7 +306,7 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 		read = fsi_i2c_get_op_bytes(bytes_to_read);
 
 		if (xfr_remaining) {
-			rc = fsi_device_read(i2c->fsi, I2C_FSI_FIFO,
+			rc = fsi_device_read(port->master->fsi, I2C_FSI_FIFO,
 					     &msg->buf[port->xfrd], read);
 			if (rc)
 				return rc;
@@ -316,8 +315,8 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			xfr_remaining -= read;
 		} else {
 			/* no more buffer but data in fifo, need to clear it */
-			rc = fsi_device_read(i2c->fsi, I2C_FSI_FIFO, &dummy,
-					     read);
+			rc = fsi_device_read(port->master->fsi, I2C_FSI_FIFO,
+					     &dummy, read);
 			if (rc)
 				return rc;
 		}
@@ -330,85 +329,80 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 
 static int fsi_i2c_get_scl(struct i2c_adapter *adap)
 {
-	u32 stat = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	u32 stat;
 
-	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT, &stat);
 
 	return !!(stat & I2C_STAT_SCL_IN);
 }
 
 static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
 {
-	u32 dummy = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	u32 dummy = 0;
 
 	if (val)
-		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SCL, &dummy);
 	else
-		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_RESET_SCL, &dummy);
 }
 
 static int fsi_i2c_get_sda(struct i2c_adapter *adap)
 {
-	u32 stat = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	u32 stat;
 
-	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT, &stat);
 
 	return !!(stat & I2C_STAT_SDA_IN);
 }
 
 static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
 {
-	u32 dummy = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	u32 dummy = 0;
 
 	if (val)
-		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SDA, &dummy);
 	else
-		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_RESET_SDA, &dummy);
 }
 
 static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
 {
-	int rc;
-	u32 mode;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	u32 mode;
+	int rc;
 
-	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
 		return;
 
 	mode |= I2C_MODE_DIAG;
-	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	fsi_i2c_write_reg(port->master->fsi, I2C_FSI_MODE, &mode);
 }
 
 static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
 {
-	int rc;
-	u32 mode;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	u32 mode;
+	int rc;
 
-	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
 		return;
 
 	mode &= ~I2C_MODE_DIAG;
-	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	fsi_i2c_write_reg(port->master->fsi, I2C_FSI_MODE, &mode);
 }
 
 static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
 			     struct fsi_i2c_port *port)
 {
+	u32 dummy = 0;
+	u32 stat;
 	int rc;
-	u32 stat, dummy = 0;
 
 	/* force bus reset, ignore errors */
 	i2c_recover_bus(&port->adapter);
@@ -439,8 +433,9 @@ static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
 
 static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
 {
+	u32 dummy = 0;
+	u32 mode;
 	int rc;
-	u32 mode, dummy = 0;
 
 	/* reset engine */
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
@@ -476,18 +471,17 @@ static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
 
 static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 {
-	int rc;
-	unsigned long start;
+	struct fsi_i2c_master *i2c = port->master;
 	u32 cmd = I2C_CMD_WITH_STOP;
+	unsigned long start;
 	u32 stat;
-	struct fsi_i2c_master *i2c = port->master;
-	struct fsi_device *fsi = i2c->fsi;
+	int rc;
 
 	rc = fsi_i2c_reset_engine(i2c, port->port);
 	if (rc)
 		return rc;
 
-	rc = fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &stat);
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
 	if (rc)
 		return rc;
 
@@ -503,15 +497,14 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 		return 0;
 
 	/* write stop command */
-	rc = fsi_i2c_write_reg(fsi, I2C_FSI_CMD, &cmd);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, &cmd);
 	if (rc)
 		return rc;
 
 	/* wait until we see command complete in the master */
 	start = jiffies;
-
 	do {
-		rc = fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &status);
+		rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &status);
 		if (rc)
 			return rc;
 
@@ -527,8 +520,8 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 				 struct i2c_msg *msg, u32 status)
 {
-	int rc;
 	u8 fifo_count;
+	int rc;
 
 	if (status & I2C_STAT_ERR) {
 		rc = fsi_i2c_abort(port, status);
@@ -576,9 +569,9 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			unsigned long timeout)
 {
-	u32 status = 0;
-	int rc;
 	unsigned long start = jiffies;
+	u32 status;
+	int rc;
 
 	do {
 		rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT,
@@ -608,13 +601,13 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			int num)
 {
-	int i, rc;
-	unsigned long start_time;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *master = port->master;
+	unsigned long start_time;
 	struct i2c_msg *msg;
+	int rc;
+	int i;
 
-	mutex_lock(&master->lock);
+	mutex_lock(&port->master->lock);
 
 	rc = fsi_i2c_set_port(port);
 	if (rc)
@@ -635,7 +628,7 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 unlock:
-	mutex_unlock(&master->lock);
+	mutex_unlock(&port->master->lock);
 	return rc ? : num;
 }
 
@@ -681,8 +674,10 @@ static int fsi_i2c_probe(struct device *dev)
 	struct fsi_i2c_master *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
-	u32 port_no, ports, stat;
+	u32 port_no;
+	u32 ports;
 	u32 lbus;
+	u32 stat;
 	int rc;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -752,14 +747,14 @@ static int fsi_i2c_probe(struct device *dev)
 	}
 
 	dev_set_drvdata(dev, i2c);
-
 	return 0;
 }
 
 static int fsi_i2c_remove(struct device *dev)
 {
 	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
-	struct fsi_i2c_port *port, *tmp;
+	struct fsi_i2c_port *port;
+	struct fsi_i2c_port *tmp;
 
 	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
 		list_del(&port->list);
-- 
2.39.3


