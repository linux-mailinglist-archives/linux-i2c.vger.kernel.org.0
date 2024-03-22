Return-Path: <linux-i2c+bounces-2506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC1886D07
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82FA81C22199
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C263604B9;
	Fri, 22 Mar 2024 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BR2UeEu3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610E5FBA0
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114016; cv=none; b=jmFmYDpO4ux+XvpMLv4SRuE0dg4TX6cbis4VkeQFiqlOe4E4ciWBtt+3pBNA5leBLhbFs3KuOhkZeMKvW/ZXvscyMvM8PlLShlc7XXVqEO8ZHFO0Bcfs8NGZV0jL2xY33QJ9XeKX+0nUygebsR4zlQJsN42KMn2tmI4bX0s5nyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114016; c=relaxed/simple;
	bh=ILcQv+XMPcULM0Od7ox9jtX5Kx6Qqnb5MUap2X6BCj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKZhE2Jc+rbPSlWkVF6Egq4bM/8EDV5J4WjwiK4ucSb2qWJq1UHCpvmFD/zRc8aWjXaE72STIURBrAHhwpOq2CdNbROW2/OrMfA9YFqyPSvz3RuTwdJ4eKUV8FIc1guvd9EBipTtL3k8PukSPT67z+SKhBfPoLpmvqoVaZ1WhHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BR2UeEu3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rF3P6J6pSBdQz8zQrkau4cQ2HrCjATGi3VINbjYPxk8=; b=BR2UeE
	u3ZhJZClbCnp6JJ7SSSGJFdeMkJJJRly8Xvfvt/D7xZNqRH2I78LMFzu6WttGKVf
	MKU8rrv+14plOq+L+lqqxU7M2CtigheDpoa/G8VYic2YxeY8xADOMxEqz8l0EdC8
	rgMSALpEVJ5AZ7Ij8cnMQDk2tnov8pUKUJRkkJ+gCcblrQGR9OrBesVXTQnRIyT5
	hN1Pjxf07K+UH1HLl14kSfTxKmT8TlhuFmTs2zkFwlDZCpMew2pQVfNyXODleFMF
	uojTCLh1UGANq71speTP3P2gNP5Yqo4OVDXWAgJLaohecPIxpzH3pnALtOS2L6Jw
	VoByjyA6mrD9aLlQ==
Received: (qmail 3870567 invoked from network); 22 Mar 2024 14:26:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:37 +0100
X-UD-Smtp-Session: l3s3148p1@UMH8xT8U8OBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/64] i2c: fsi: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:13 +0100
Message-ID: <20240322132619.6389-21-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-fsi.c | 56 ++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 10332693edf0..5eaf2c85a72c 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * FSI-attached I2C master algorithm
+ * FSI-attached I2C controller algorithm
  *
  * Copyright 2018 IBM Corporation
  *
@@ -145,7 +145,7 @@
 /* choose timeout length from legacy driver; it's well tested */
 #define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
 
-struct fsi_i2c_master {
+struct fsi_i2c_host {
 	struct fsi_device	*fsi;
 	u8			fifo_size;
 	struct list_head	ports;
@@ -155,7 +155,7 @@ struct fsi_i2c_master {
 struct fsi_i2c_port {
 	struct list_head	list;
 	struct i2c_adapter	adapter;
-	struct fsi_i2c_master	*master;
+	struct fsi_i2c_host	*host;
 	u16			port;
 	u16			xfrd;
 };
@@ -183,7 +183,7 @@ static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
 	return fsi_device_write(fsi, reg, &data_be, sizeof(data_be));
 }
 
-static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
+static int fsi_i2c_dev_init(struct fsi_i2c_host *i2c)
 {
 	int rc;
 	u32 mode = I2C_MODE_ENHANCED, extended_status, watermark;
@@ -214,7 +214,7 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 {
 	int rc;
-	struct fsi_device *fsi = port->master->fsi;
+	struct fsi_device *fsi = port->host->fsi;
 	u32 mode, dummy = 0;
 
 	rc = fsi_i2c_read_reg(fsi, I2C_FSI_MODE, &mode);
@@ -236,7 +236,7 @@ static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
 			 bool stop)
 {
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 	u32 cmd = I2C_CMD_WITH_START | I2C_CMD_WITH_ADDR;
 
 	port->xfrd = 0;
@@ -268,7 +268,7 @@ static int fsi_i2c_write_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 {
 	int write;
 	int rc;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 	int bytes_to_write = i2c->fifo_size - fifo_count;
 	int bytes_remaining = msg->len - port->xfrd;
 
@@ -294,7 +294,7 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 {
 	int read;
 	int rc;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 	int bytes_to_read;
 	int xfr_remaining = msg->len - port->xfrd;
 	u32 dummy;
@@ -330,7 +330,7 @@ static int fsi_i2c_get_scl(struct i2c_adapter *adap)
 {
 	u32 stat = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 
 	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
 
@@ -341,7 +341,7 @@ static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
 {
 	u32 dummy = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 
 	if (val)
 		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
@@ -353,7 +353,7 @@ static int fsi_i2c_get_sda(struct i2c_adapter *adap)
 {
 	u32 stat = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 
 	fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
 
@@ -364,7 +364,7 @@ static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
 {
 	u32 dummy = 0;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 
 	if (val)
 		fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
@@ -377,7 +377,7 @@ static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
 	int rc;
 	u32 mode;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 
 	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
@@ -392,7 +392,7 @@ static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
 	int rc;
 	u32 mode;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 
 	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
@@ -402,7 +402,7 @@ static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
 	fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 }
 
-static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
+static int fsi_i2c_reset_bus(struct fsi_i2c_host *i2c,
 			     struct fsi_i2c_port *port)
 {
 	int rc;
@@ -435,7 +435,7 @@ static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
 	return fsi_i2c_dev_init(i2c);
 }
 
-static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
+static int fsi_i2c_reset_engine(struct fsi_i2c_host *i2c, u16 port)
 {
 	int rc;
 	u32 mode, dummy = 0;
@@ -478,7 +478,7 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 	unsigned long start;
 	u32 cmd = I2C_CMD_WITH_STOP;
 	u32 stat;
-	struct fsi_i2c_master *i2c = port->master;
+	struct fsi_i2c_host *i2c = port->host;
 	struct fsi_device *fsi = i2c->fsi;
 
 	rc = fsi_i2c_reset_engine(i2c, port->port);
@@ -505,7 +505,7 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 	if (rc)
 		return rc;
 
-	/* wait until we see command complete in the master */
+	/* wait until we see command complete in the controller */
 	start = jiffies;
 
 	do {
@@ -579,7 +579,7 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
 	unsigned long start = jiffies;
 
 	do {
-		rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT,
+		rc = fsi_i2c_read_reg(port->host->fsi, I2C_FSI_STAT,
 				      &status);
 		if (rc)
 			return rc;
@@ -609,10 +609,10 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	int i, rc;
 	unsigned long start_time;
 	struct fsi_i2c_port *port = adap->algo_data;
-	struct fsi_i2c_master *master = port->master;
+	struct fsi_i2c_host *host = port->host;
 	struct i2c_msg *msg;
 
-	mutex_lock(&master->lock);
+	mutex_lock(&host->lock);
 
 	rc = fsi_i2c_set_port(port);
 	if (rc)
@@ -633,7 +633,7 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 unlock:
-	mutex_unlock(&master->lock);
+	mutex_unlock(&host->lock);
 	return rc ? : num;
 }
 
@@ -654,7 +654,7 @@ static struct i2c_bus_recovery_info fsi_i2c_bus_recovery_info = {
 };
 
 static const struct i2c_algorithm fsi_i2c_algorithm = {
-	.master_xfer = fsi_i2c_xfer,
+	.xfer = fsi_i2c_xfer,
 	.functionality = fsi_i2c_functionality,
 };
 
@@ -676,7 +676,7 @@ static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
 
 static int fsi_i2c_probe(struct device *dev)
 {
-	struct fsi_i2c_master *i2c;
+	struct fsi_i2c_host *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
 	u32 port_no, ports, stat;
@@ -699,7 +699,7 @@ static int fsi_i2c_probe(struct device *dev)
 		return rc;
 
 	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat) + 1;
-	dev_dbg(dev, "I2C master has %d ports\n", ports);
+	dev_dbg(dev, "I2C controller has %d ports\n", ports);
 
 	for (port_no = 0; port_no < ports; port_no++) {
 		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
@@ -712,7 +712,7 @@ static int fsi_i2c_probe(struct device *dev)
 			break;
 		}
 
-		port->master = i2c;
+		port->host = i2c;
 		port->port = port_no;
 
 		port->adapter.owner = THIS_MODULE;
@@ -742,7 +742,7 @@ static int fsi_i2c_probe(struct device *dev)
 
 static int fsi_i2c_remove(struct device *dev)
 {
-	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
+	struct fsi_i2c_host *i2c = dev_get_drvdata(dev);
 	struct fsi_i2c_port *port, *tmp;
 
 	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
@@ -772,5 +772,5 @@ static struct fsi_driver fsi_i2c_driver = {
 module_fsi_driver(fsi_i2c_driver);
 
 MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
-MODULE_DESCRIPTION("FSI attached I2C master");
+MODULE_DESCRIPTION("FSI attached I2C controller");
 MODULE_LICENSE("GPL");
-- 
2.43.0


