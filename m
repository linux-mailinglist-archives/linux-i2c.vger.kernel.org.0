Return-Path: <linux-i2c+bounces-5288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906D94E35A
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 23:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45B10B21C67
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 21:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7D115FCED;
	Sun, 11 Aug 2024 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UIV5N0Lj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D715FA92
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 21:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723411410; cv=none; b=DRFVjc45sLEOPJzwewrHQKUaB0qewimbPKosHRpRNyTFTpAsTQpiVAKVyz6njaJijy8NdsKRmyGvZV36wk6rZ22p6JXFUzvaxanuimeLxD13+pljXuSV7J1vDZQzNM3rQqk+fy0ivnv7bX2sIte/uxLisyuYF0jUE4e61qUcRrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723411410; c=relaxed/simple;
	bh=LpyQu7kNGcosv+6pao3qxDmABsJkeItav8cMv2qgRoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtavFBlC0rL4rrI9eBiAge7/p2d4YS/cf2N9HedcNdrd+JewyAvKMxHJTab6ozcydlvGoBUqsGYufZp5bpakoF34jyu61td8BkxyLURYI8Sv2jAvHKh3wAmGEf7RTe2u9CYyQx8REwi7F57q/dzXB4jKl0xNE4vkGwE9WJHm1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UIV5N0Lj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+Rvp2y7LDaaKxTe7cqdNuxNFEJbw2sWby+vY5kW/9n0=; b=UIV5N0
	Ljs0JwJDAzlYC9Eo6l2rsKufi2A3osARqYYiutnYuqS5hhRd2ikPodwstY7fIynd
	Ow8PK4TnDAqU38cP1/+yeha60xWLPWGJO4C99hUCIW08IKl/ktmpSxWhSQC2aH/1
	bW2Ng7i88fAZXZgNwOjL9UE6qBH5WWka9CQN1NQPLoAjybOkINN/jdOkJt7wAOv9
	30gL0ic2OVO0LPDOzjnqURb2zD6lwWuiG9BTU2uSBV4OBNRK9kV+Ja/sygyiIp5q
	iYdTAOuUUchd42qUpiztE0b00pNOFK6pFYWyweNPH5rfSIZbQW2a+vRRD/uikHRA
	89biWmSTZ69+B0uw==
Received: (qmail 1179595 invoked from network); 11 Aug 2024 23:23:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 23:23:25 +0200
X-UD-Smtp-Session: l3s3148p1@Fm+X/G4fJpUujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/4] i2c: testunit: add command to support versioning and test rep_start
Date: Sun, 11 Aug 2024 23:23:15 +0200
Message-ID: <20240811212317.16119-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
References: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some devices, it is essential that controllers handle repeated start
correctly and do not replace it with a stop/start combination. This
addition helps to test that because it will only return a version string
if repeated start is done properly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst | 38 ++++++++++++++++++++
 drivers/i2c/i2c-slave-testunit.c             | 25 +++++++++++--
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index ee019db53938..110c0055064f 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -133,3 +133,41 @@ later)::
 
   # i2ctransfer -y 0 w3@0x30 3 1 0x10 r?
   0x10 0x0f 0x0e 0x0d 0x0c 0x0b 0x0a 0x09 0x08 0x07 0x06 0x05 0x04 0x03 0x02 0x01 0x00
+
+0x04 GET_VERSION_WITH_REP_START
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. list-table::
+  :header-rows: 1
+
+  * - CMD
+    - DATAL
+    - DATAH
+    - DELAY
+
+  * - 0x04
+    - currently unused
+    - currently unused
+    - leave out, partial command!
+
+Partial command. After sending this command, the testunit will reply to a read
+message with a NUL terminated version string based on UTS_RELEASE. The first
+character is always a 'v' and the length of the version string is at maximum
+128 bytes. However, it will only respond if the read message is connected to
+the write message via repeated start. If your controller driver handles
+repeated start correctly, this will work::
+
+  # i2ctransfer -y 0 w3@0x30 4 0 0 r128
+  0x76 0x36 0x2e 0x31 0x31 0x2e 0x30 0x2d 0x72 0x63 0x31 0x2d 0x30 0x30 0x30 0x30 ...
+
+If you have i2c-tools 4.4 or later, you can print out the data right away::
+
+  # i2ctransfer -y -b 0 w3@0x30 4 0 0 r128
+  v6.11.0-rc1-00009-gd37a1b4d3fd0
+
+STOP/START combinations between the two messages will *not* work because they
+are not equivalent to a REPEATED START. As an example, this returns just the
+default response::
+
+  # i2cset -y 0 0x30 4 0 0 i; i2cget -y 0 0x30
+  0x01
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index be1d2e900aef..51b399aa09a0 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2020 by Renesas Electronics Corporation
  */
 
+#include <generated/utsrelease.h>
 #include <linux/bitops.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -15,11 +16,13 @@
 #include <linux/workqueue.h> /* FIXME: is system_long_wq the best choice? */
 
 #define TU_CUR_VERSION 0x01
+#define TU_VERSION_MAX_LENGTH 128
 
 enum testunit_cmds {
 	TU_CMD_READ_BYTES = 1,	/* save 0 for ABORT, RESET or similar */
 	TU_CMD_SMBUS_HOST_NOTIFY,
 	TU_CMD_SMBUS_BLOCK_PROC_CALL,
+	TU_CMD_GET_VERSION_WITH_REP_START,
 	TU_NUM_CMDS
 };
 
@@ -39,10 +42,13 @@ struct testunit_data {
 	unsigned long flags;
 	u8 regs[TU_NUM_REGS];
 	u8 reg_idx;
+	u8 read_idx;
 	struct i2c_client *client;
 	struct delayed_work worker;
 };
 
+static char tu_version_info[] = "v" UTS_RELEASE "\n\0";
+
 static void i2c_slave_testunit_work(struct work_struct *work)
 {
 	struct testunit_data *tu = container_of(work, struct testunit_data, worker.work);
@@ -91,6 +97,8 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 	struct testunit_data *tu = i2c_get_clientdata(client);
 	bool is_proc_call = tu->reg_idx == 3 && tu->regs[TU_REG_DATAL] == 1 &&
 			    tu->regs[TU_REG_CMD] == TU_CMD_SMBUS_BLOCK_PROC_CALL;
+	bool is_get_version = tu->reg_idx == 3 &&
+			      tu->regs[TU_REG_CMD] == TU_CMD_GET_VERSION_WITH_REP_START;
 	int ret = 0;
 
 	switch (event) {
@@ -100,6 +108,7 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 
 		memset(tu->regs, 0, TU_NUM_REGS);
 		tu->reg_idx = 0;
+		tu->read_idx = 0;
 		break;
 
 	case I2C_SLAVE_WRITE_RECEIVED:
@@ -136,12 +145,21 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		break;
 
 	case I2C_SLAVE_READ_PROCESSED:
-		if (is_proc_call && tu->regs[TU_REG_DATAH])
+		/* Advance until we reach the NUL character */
+		if (is_get_version && tu_version_info[tu->read_idx] != 0)
+			tu->read_idx++;
+		else if (is_proc_call && tu->regs[TU_REG_DATAH])
 			tu->regs[TU_REG_DATAH]--;
+
 		fallthrough;
 
 	case I2C_SLAVE_READ_REQUESTED:
-		*val = is_proc_call ? tu->regs[TU_REG_DATAH] : TU_CUR_VERSION;
+		if (is_get_version)
+			*val = tu_version_info[tu->read_idx];
+		else if (is_proc_call)
+			*val = tu->regs[TU_REG_DATAH];
+		else
+			*val = TU_CUR_VERSION;
 		break;
 	}
 
@@ -160,6 +178,9 @@ static int i2c_slave_testunit_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, tu);
 	INIT_DELAYED_WORK(&tu->worker, i2c_slave_testunit_work);
 
+	if (sizeof(tu_version_info) > TU_VERSION_MAX_LENGTH)
+		tu_version_info[TU_VERSION_MAX_LENGTH - 1] = 0;
+
 	return i2c_slave_register(client, i2c_slave_testunit_slave_cb);
 };
 
-- 
2.43.0


