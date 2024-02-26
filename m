Return-Path: <linux-i2c+bounces-2006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA63867D41
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3381C2551F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C5B136982;
	Mon, 26 Feb 2024 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="k7acfr/J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34741350F0;
	Mon, 26 Feb 2024 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966443; cv=none; b=pnz0w3b559wFVukFArhnVmwYzWDrrEC4RFRzptMrfpZGX6TE5zaFniLgMOFQZi1msdq3J4g0FoCKlaDHsMMNvgKABrOi0Y0S6+juANiR6QPpARBalb6NKmAPBZhiFfcHZJiLkNmyOI69JSu5Ic03IhZn2zWMHKIxJBkH6p5V8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966443; c=relaxed/simple;
	bh=y7Ir3NHVxuCw/j7v8sOGwdCGBziRK95layLM4Yi7WNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iZnVPpQwWuRwDSvPWF/IPWTmmHQKzi1uJYo9rgdOPG5Zt3GsFyC8uSVU7B/t9/3fb9bdDSBCPHMr7qP7+L3Wqfb9N/h7RCcha5Zf5lP+W9NzeLYeH+2tC9Pl/ntcEaH2Kf4nsf3P+YznzWFQDG1Hpf1oTYkqlwKZNhVCKWrE3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=k7acfr/J; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGSHn8014969;
	Mon, 26 Feb 2024 16:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=psAc7NhzV/4UUrvAwzBQj4m9xdKePW/86HpHbKqjtW0=;
 b=k7acfr/J+c7hK44idEgZU0Ut9YXZl63Flafqq+xaZx8LQXOcrre78SeBt5xtMr7v1NDf
 JR5D6+rgFTeF+frl4SneTYqLvlfy0KQQK+gy5oNGCf0dDErw5cypEgJKwY584O/YCWPV
 0nslXt2I3H7dJEU/TgWF7Ndwa9+RVEmMewtkUjBcZrS1yNb7ZrJa3fOzbH+9EIG1RBIr
 F2V2AdBhac3TUQbXa+Bi+A6Jm4TVTzINvWO4TWGMEWIEjsXUxTDVvV3S963Azr5QiqVW
 AkPat5pwZ4SqM4SOe6a7igsLnZDILjISGKngPbMEkQKwXNGUB3xsa4q8jTY9XM1OcEVM qQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgx6g8nwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:47 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG5FVN008798;
	Mon, 26 Feb 2024 16:53:46 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftstarc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:46 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrhfg17367696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:45 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC99858065;
	Mon, 26 Feb 2024 16:53:43 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01C5F58053;
	Mon, 26 Feb 2024 16:53:43 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:42 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 26/31] i2c: fsi: Improve formatting
Date: Mon, 26 Feb 2024 10:53:16 -0600
Message-Id: <20240226165321.91976-27-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 7cepKPpawhsebnHBPokYLYDvkOm1sJDi
X-Proofpoint-ORIG-GUID: 7cepKPpawhsebnHBPokYLYDvkOm1sJDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=964
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

No functional change.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 125 +++++++++++++++++------------------
 1 file changed, 60 insertions(+), 65 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index eaecf156ac31..bc44cad49ef2 100644
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
@@ -753,14 +748,14 @@ static int fsi_i2c_probe(struct device *dev)
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


