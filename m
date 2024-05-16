Return-Path: <linux-i2c+bounces-3532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D758C7C38
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DFB41C213E1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A1415B0E8;
	Thu, 16 May 2024 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PjB+JW72"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86F158A18;
	Thu, 16 May 2024 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883579; cv=none; b=ord/+lAVI8AXOMh0uFKUcXfeSRDKbgarXOBQHu92fHSXGfeRb8WsTVQ9hRH57A5utu1f/j7HZ2lkCPYPjwXaZkr83gNJEZcVZGcjx9O7TRIicr6zhx8GSaxCNKLWybX7+bcfw0bCo8Ft2B7JJSEm6atcT2DgPyv/nW9hHs+jZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883579; c=relaxed/simple;
	bh=Vc/Ctrqo5sSCNIMESKkxnmoeauNn4qTseHw+BxaGLyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gVCm3jh8NMaSesGz6kYu5qv3eB6mkXpX5OLVrzm/xY22eQWptwjimizRT25kRIyxD43PgBx1JbMUg/1II3SIyl7engHKlPju94k2ithikqpeOEWFvplTsYKbcw8nRKLiSbFnFHP4U2S9Xd+klP07hdLHUgQ2+DRsH5MvTZhKysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PjB+JW72; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHggld003311;
	Thu, 16 May 2024 18:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YxdI1uYsH7cLX7wJt08viDpVjHn4EWk+CktSg/LfJFE=;
 b=PjB+JW72nd/CpyHAIk1bypeUcMdA2Nrbwah4vCwUjiV8i4SgbRBunBWheB8duU9LxeIO
 NRpyxODNx6u4Ym8AoM9+9KvXsqpw/57K5hqOtBG73xAG5zgqKMSII3NZPh1BFJaKVAQq
 jtptnJJn2fOndpqZe+WDrSH+2Xt50+AVMcaGeQ4m0Ec/GXPhuD0Y0mZPaLFiTxD1RIlf
 tDgFdB2PRBhwAoe54P6LIFvKGNw3X4LLrF+dpiztrDSPsxTMTIA1dUNoeWdmoKfD0nmt
 Qcpwb0u5c6zUwqsOOcJ0aecr0Bqo8KMN+Gt4l8/W28y1csZXrNR50Jst7/ayGyUeiM5E gQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pse82j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:21 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GG2ceJ029603;
	Thu, 16 May 2024 18:19:20 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m34md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJH6o31064598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 211E05805D;
	Thu, 16 May 2024 18:19:17 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0B2C58083;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 32/40] i2c: fsi: Add interrupt support
Date: Thu, 16 May 2024 13:18:59 -0500
Message-Id: <20240516181907.3468796-33-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: e3iekewMegtYRprZq0GSTS1xnVyEoHSL
X-Proofpoint-GUID: e3iekewMegtYRprZq0GSTS1xnVyEoHSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Optionally support interrupts from the I2C controller so that
the driver can wait rather than poll the status register.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c   | 215 ++++++++++++++++++++++++++++++---
 include/trace/events/i2c_fsi.h |  45 +++++++
 2 files changed, 245 insertions(+), 15 deletions(-)
 create mode 100644 include/trace/events/i2c_fsi.h

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 614d830419bb8..f8d9bc178ef5b 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/wait.h>
 
 #define FSI_ENGID_I2C		0x7
 
@@ -87,6 +88,7 @@
 #define I2C_INT_STOP_ERR	BIT(7)
 #define I2C_INT_BUSY		BIT(6)
 #define I2C_INT_IDLE		BIT(5)
+#define I2C_INT_ANY		GENMASK(15, 7)
 
 /* status register */
 #define I2C_STAT_INV_CMD	BIT(31)
@@ -148,21 +150,35 @@
 /* choose timeout length from legacy driver; it's well tested */
 #define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
 
+struct fsi_i2c_port;
+
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
+	struct fsi_i2c_port	*port;
 	struct mutex		lock;
+	wait_queue_head_t	wait;
 	u32			clock_div;
 	u8			fifo_size;
+	bool			interrupts;
 	bool			skip_stop;
+	bool			abort;
 };
 
 struct fsi_i2c_port {
 	struct i2c_adapter	adapter;
 	struct fsi_i2c_master	*master;
+	struct i2c_msg		*msgs;
+	int			nmsgs;
+	int			rc;
+	int			i;
 	u16			port;
 	u16			xfrd;
+	bool			wake;
 };
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/i2c_fsi.h>
+
 static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
 			    u32 *data)
 {
@@ -192,7 +208,7 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 	u32 watermark;
 	int rc;
 
-	/* since we use polling, disable interrupts */
+	/* start with interrupts disabled */
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, 0);
 	if (rc)
 		return rc;
@@ -236,22 +252,24 @@ static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 	return fsi_i2c_write_reg(fsi, I2C_FSI_RESET_ERR, 0);
 }
 
-static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
-			 bool stop)
+static int fsi_i2c_start(struct fsi_i2c_port *port)
 {
 	u32 cmd = I2C_CMD_WITH_START | I2C_CMD_WITH_ADDR;
+	struct i2c_msg *msg = &port->msgs[port->i];
 
 	port->xfrd = 0;
 
 	if (msg->flags & I2C_M_RD)
 		cmd |= I2C_CMD_READ;
 
-	if (stop || msg->flags & I2C_M_STOP)
+	if ((port->i == (port->nmsgs - 1)) || (msg->flags & I2C_M_STOP))
 		cmd |= I2C_CMD_WITH_STOP;
 
 	cmd |= FIELD_PREP(I2C_CMD_ADDR, msg->addr);
 	cmd |= FIELD_PREP(I2C_CMD_LEN, msg->len);
 
+	trace_i2c_fsi_start(port, cmd);
+
 	return fsi_i2c_write_reg(port->master->fsi, I2C_FSI_CMD, cmd);
 }
 
@@ -489,11 +507,38 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port)
 	if (i2c->skip_stop)
 		return 0;
 
+	if (i2c->interrupts) {
+		i2c->abort = true;
+		port->wake = false;
+
+		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, I2C_INT_ANY);
+		if (rc)
+			return rc;
+	}
+
 	/* write stop command */
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, cmd);
 	if (rc)
 		return rc;
 
+	if (i2c->interrupts) {
+		rc = wait_event_interruptible_timeout(i2c->wait, port->wake, I2C_ABORT_TIMEOUT);
+		if (rc > 0)
+			return port->rc;
+
+		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, 0);
+
+		if (!rc) {
+			rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &status);
+			if (!rc && (status & I2C_STAT_CMD_COMP))
+				rc = 0;
+			else
+				rc = -ETIMEDOUT;
+		}
+
+		return rc;
+	}
+
 	/* wait until we see command complete in the master */
 	start = jiffies;
 	do {
@@ -564,8 +609,59 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 	return 0;
 }
 
-static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
-			unsigned long timeout)
+static int fsi_i2c_wait_irq(struct fsi_i2c_port *port, unsigned long timeout)
+{
+	int rc;
+
+	port->wake = false;
+
+	rc = fsi_i2c_write_reg(port->master->fsi, I2C_FSI_INT_MASK, I2C_INT_ANY);
+	if (rc)
+		return rc;
+
+	rc = wait_event_interruptible_timeout(port->master->wait, port->wake, timeout);
+	if (rc > 0) {
+		rc = port->rc;
+
+		if (port->master->abort) {
+			int rc2 = fsi_i2c_abort(port);
+
+			if (rc2)
+				return rc2;
+		}
+
+		return rc;
+	}
+
+	/*
+	 * The interrupt handler should turn off interrupts once it's done, but in this
+	 * case we timed out or were interrupted, so mask them off here.
+	 */
+	fsi_i2c_write_reg(port->master->fsi, I2C_FSI_INT_MASK, 0);
+
+	if (!rc) {
+		u32 status;
+
+		rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT, &status);
+		if (!rc && (status & I2C_STAT_ANY_RESP)) {
+			rc = fsi_i2c_handle_status(port, &port->msgs[port->i], status);
+			if (rc < 0)
+				return rc;
+
+			/* cmd complete and all data xfrd */
+			if (rc == port->msgs[port->i].len)
+				return 0;
+
+			rc = -ETIMEDOUT;
+		} else {
+			rc = -ETIMEDOUT;
+		}
+	}
+
+	return rc;
+}
+
+static int fsi_i2c_wait_poll(struct fsi_i2c_port *port, unsigned long timeout)
 {
 	unsigned long start = jiffies;
 	u32 status;
@@ -578,12 +674,12 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			return rc;
 
 		if (status & I2C_STAT_ANY_RESP) {
-			rc = fsi_i2c_handle_status(port, msg, status);
+			rc = fsi_i2c_handle_status(port, &port->msgs[port->i], status);
 			if (rc < 0)
 				return rc;
 
 			/* cmd complete and all data xfrd */
-			if (rc == msg->len)
+			if (rc == port->msgs[port->i].len)
 				return 0;
 
 			/* need to xfr more data, but maybe don't need wait */
@@ -601,9 +697,7 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 {
 	struct fsi_i2c_port *port = i2c_get_adapdata(adap);
 	unsigned long start_time;
-	struct i2c_msg *msg;
 	int rc;
-	int i;
 
 	mutex_lock(&port->master->lock);
 
@@ -611,21 +705,28 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	if (rc)
 		goto unlock;
 
-	for (i = 0; i < num; i++) {
-		msg = msgs + i;
+	port->master->port = port;
+	port->master->abort = false;
+	port->msgs = msgs;
+	port->nmsgs = num;
+	for (port->i = 0; port->i < num; ++port->i) {
 		start_time = jiffies;
 
-		rc = fsi_i2c_start(port, msg, i == num - 1);
+		rc = fsi_i2c_start(port);
 		if (rc)
 			goto unlock;
 
-		rc = fsi_i2c_wait(port, msg,
-				  adap->timeout - (jiffies - start_time));
+		if (port->master->interrupts)
+			rc = fsi_i2c_wait_irq(port, adap->timeout - (jiffies - start_time));
+		else
+			rc = fsi_i2c_wait_poll(port, adap->timeout - (jiffies - start_time));
 		if (rc)
 			goto unlock;
 	}
 
 unlock:
+	port->msgs = NULL;
+	port->master->port = NULL;
 	mutex_unlock(&port->master->lock);
 	return rc ? : num;
 }
@@ -636,6 +737,85 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 		I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
+static irqreturn_t fsi_i2c_irq(int irq, void *data)
+{
+	struct fsi_i2c_master *i2c = data;
+	struct fsi_i2c_port *port;
+	struct i2c_msg *msg;
+	u32 status;
+	int rc;
+
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, 0);
+	if (rc)
+		return IRQ_NONE;
+
+	if (!i2c->port)
+		return IRQ_HANDLED;
+
+	port = i2c->port;
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &status);
+	if (rc)
+		goto wake;
+
+	trace_i2c_fsi_irq(port, status);
+
+	if (i2c->abort) {
+		if (status & I2C_STAT_CMD_COMP) {
+			port->wake = true;
+			goto done;
+		} else {
+			rc = fsi_i2c_error_status_to_rc(status);
+			goto wake;
+		}
+	}
+
+	if (status & I2C_STAT_ERR) {
+		i2c->abort = true;
+		i2c->skip_stop = status & I2C_STAT_SKIP_STOP;
+		rc = fsi_i2c_error_status_to_rc(status);
+		goto wake;
+	}
+
+	if (!port->msgs || port->i >= port->nmsgs) {
+		rc = -ENODEV;
+		goto wake;
+	}
+
+	msg = &port->msgs[port->i];
+	if (status & I2C_STAT_DAT_REQ) {
+		u8 fifo_count = FIELD_GET(I2C_STAT_FIFO_COUNT, status);
+
+		if (msg->flags & I2C_M_RD)
+			rc = fsi_i2c_read_fifo(port, msg, fifo_count);
+		else
+			rc = fsi_i2c_write_fifo(port, msg, fifo_count);
+	} else if (status & I2C_STAT_CMD_COMP) {
+		if (port->xfrd < msg->len) {
+			rc = -ENODATA;
+		} else {
+			++port->i;
+			if (port->i < port->nmsgs) {
+				rc = fsi_i2c_start(port);
+			} else {
+				port->wake = true;
+				goto done;
+			}
+		}
+	}
+
+	if (!rc)
+		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, I2C_INT_ANY);
+
+wake:
+	if (rc)
+		port->wake = true;
+done:
+	port->rc = rc;
+	if (port->wake)
+		wake_up_interruptible_all(&i2c->wait);
+	return IRQ_HANDLED;
+}
+
 static struct i2c_bus_recovery_info fsi_i2c_bus_recovery_info = {
 	.recover_bus = i2c_generic_scl_recovery,
 	.get_scl = fsi_i2c_get_scl,
@@ -683,6 +863,7 @@ static int fsi_i2c_probe(struct device *dev)
 		return -ENOMEM;
 
 	mutex_init(&i2c->lock);
+	init_waitqueue_head(&i2c->wait);
 	i2c->fsi = to_fsi_dev(dev);
 	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
 
@@ -706,6 +887,10 @@ static int fsi_i2c_probe(struct device *dev)
 	if (rc)
 		return rc;
 
+	rc = fsi_device_request_irq(i2c->fsi, fsi_i2c_irq, i2c);
+	if (!rc)
+		i2c->interrupts = true;
+
 	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat) + 1;
 	dev_dbg(dev, "I2C master has %d ports\n", ports);
 
diff --git a/include/trace/events/i2c_fsi.h b/include/trace/events/i2c_fsi.h
new file mode 100644
index 0000000000000..ac49ae9be356b
--- /dev/null
+++ b/include/trace/events/i2c_fsi.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM i2c_fsi
+
+#if !defined(_TRACE_I2C_FSI_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_I2C_FSI_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(i2c_fsi_irq,
+	TP_PROTO(const struct fsi_i2c_port *port, uint32_t status),
+	TP_ARGS(port, status),
+	TP_STRUCT__entry(
+		__field(int, bus)
+		__field(int, msg_idx)
+		__field(uint32_t, status)
+	),
+	TP_fast_assign(
+		__entry->bus = port->adapter.nr;
+		__entry->msg_idx = port->i;
+		__entry->status = status;
+	),
+	TP_printk("i2c-%d [%d] status:%08x", __entry->bus, __entry->msg_idx, __entry->status)
+);
+
+TRACE_EVENT(i2c_fsi_start,
+	TP_PROTO(const struct fsi_i2c_port *port, uint32_t command),
+	TP_ARGS(port, command),
+	TP_STRUCT__entry(
+		__field(int, bus)
+		__field(int, msg_idx)
+		__field(uint32_t, command)
+	),
+	TP_fast_assign(
+		__entry->bus = port->adapter.nr;
+		__entry->msg_idx = port->i;
+		__entry->command = command;
+	),
+	TP_printk("i2c-%d [%d] command:%08x", __entry->bus, __entry->msg_idx, __entry->command)
+);
+
+#endif
+
+#include <trace/define_trace.h>
-- 
2.39.3


