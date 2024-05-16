Return-Path: <linux-i2c+bounces-3547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A78C7C7A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76DFC1C21568
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433FD168B0B;
	Thu, 16 May 2024 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KAAEOMHx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5876A165FDB;
	Thu, 16 May 2024 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883609; cv=none; b=J40QAFvvGOZ7OSp5Dr9uPF390AdZfTCFybnSMqiphq6Ixad/yamQJ9oFuWRZAKGNtKPEgzFrdNNxmqJy8maTE4k5BG/EIhmm3PrK5XNeXnnAE5NUQdfj9eSIgMa4qe1T6bRuvE4o6vBvooX+xZ/97W9OsRlaRBo7ahzoZZmyNXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883609; c=relaxed/simple;
	bh=V7YtsL0df7QZ2fCW8ovj+jSPEIs0M575sgx8iNcYOWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kptZ71eqdr8hoGWG8gvSbTj6KlsVrZmEZ/EoNfWjUkYtAZBsfP+WCGKKU0IJf5ztkviC6wmi+CLms3u8o2IkSC0C7vfy7cz2DKPbmTKl05MZmct+c7DLhgM3MX1at6Jki0o1dK1G3R3qw+koF990heEuQ2v0VBbb0yjdvSShw4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KAAEOMHx; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHPT8N028543;
	Thu, 16 May 2024 18:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sExpzqDawVL7Dn962NZ99fpWpjztnGoo0REU8wYGdnY=;
 b=KAAEOMHxv246WxOQrRyEIoI/h6USV0nnwmoSXmL9hZWzPMxPn3QKeeaH5HCWkccciEiT
 ls3iQeZP/2X28Xw3k52pyE6rwqPvFwLCN9MErIaUWdhdF7EHLmU0UyG6Thgb9VALRxxP
 6TyxSXe9YEDiS+Z/Rfik9YZN7H7ylIqkotzPJZ7zuKAQFx/+o1fPZCMwK5gd35hv8mnv
 v7ejz6KfNKvRJW3BJZbGQn42OXXdKwDPEeJqumYYav1Ua08e4YW99r0O8Pwwh3RkOq/b
 tKVoDB6ke3EJAtu2O8NgnuKExpLkQ1Wo8HpiYNGEkIyNPdS9sP7Mpe3YMYhVq357GsCp dA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5mce8frs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GFouQm005504;
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2nq331w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJHoh25690414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5EA85806E;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61CC758088;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 27/40] i2c: fsi: Improve formatting
Date: Thu, 16 May 2024 13:18:54 -0500
Message-Id: <20240516181907.3468796-28-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: aqRpYjFwElhVD6tKl4zd51PHoqBqm-2N
X-Proofpoint-ORIG-GUID: aqRpYjFwElhVD6tKl4zd51PHoqBqm-2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160132

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


