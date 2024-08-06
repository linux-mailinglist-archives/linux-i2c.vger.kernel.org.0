Return-Path: <linux-i2c+bounces-5166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37A9492D6
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 16:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 310631C2367E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 14:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FEC166F03;
	Tue,  6 Aug 2024 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F72KxuI6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093218D648
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954044; cv=none; b=gAgQkbrrhFhEzL9Q5N3hp1hkQ6GU59aVd8TTl0BuS+h57qgyx9EphS9+qJynkFpLpnXXS72K5toYRu5T9lqUx46UJDoVTvlHR4F9jrzRWTA7WS1BuXdli9Kn1oUgMgQS+JvDi2aTW3mPoUabdMxa/pqV0ETVWmYDJeKnbvtQi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954044; c=relaxed/simple;
	bh=T2TDmKcsy0NZqbKXkp8K4XvKFmQzpb5Gg9vM/KhYUzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6jAidivD2+e+YSsBvOZ/1PCx77SkMVJg4UwNccnCJR/iCtcO6gTwECnGuvSDUk7ik79g46gOtxoqigLh13jq3zdVLbDKJcuGEmZgpZEKZ2Sj3/jkFO1p/awcIrUrzyumxdR59ovKNQt98/aPm/pt1t/gJ0Jk4SeOkba46ReKk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F72KxuI6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=A24nU/0tYo75ass/vBmrHPYsBXF3wJuThSVuV3BE8Ms=; b=F72Kxu
	I6IaEmBmlxn1vH031dEv/1OsMkfgwU+FV+AqLD+yrPwhS49MnsCj+NECoReb1zVN
	XUUZ1kkH/dTPElhEk6X4HdfY8P6yfxFP/KubX/9IKjNnS3iSxrsDAdeYUIiKrwYU
	vAoHWEXLq1wmZQUvaHC0S7fThMK5zYSYTC9UitZXA56P142aukvvcR9CeJ+mv+SW
	VCQHO2EEbKbQrrgCnevTpxCF1bSNRgfbJ2bkJoQibYJDFL6i7mUxa+aUiPxyZQjN
	B2fQsrAxUhdGZDRVpExoeO3oI55RiPbvdlz/8hliq5ZHQBESIZz6NEl0VW4N8Ap7
	rMWi19JHaNdWPVHg==
Received: (qmail 249188 invoked from network); 6 Aug 2024 16:20:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2024 16:20:38 +0200
X-UD-Smtp-Session: l3s3148p1@FdltfwQfHIYgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/3] i2c: testunit: add command to support versioning and test rep_start
Date: Tue,  6 Aug 2024 16:20:31 +0200
Message-ID: <20240806142033.2697-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806142033.2697-1-wsa+renesas@sang-engineering.com>
References: <20240806142033.2697-1-wsa+renesas@sang-engineering.com>
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
index 37142a48ab35..a0335782d109 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -133,3 +133,41 @@ later)::
 
   # i2ctransfer -y 0 w3@0x30 0x03 0x01 0x10 r?
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
+If you want to decode to ASCII right away::
+
+  # echo -e "$(i2ctransfer -y 0 w3@0x30 4 0 0 r128 | sed 's/0x\(..\) \?/\\x\1/g')"
+  v6.11.0-rc1-00009-gd37a1b4d3fd0
+
+STOP/START combinations between the two messages will *not* work because they
+are not equivalent to a REPEATED START. As an example, this returns just the
+default response::
+
+  # i2cset -y 0 0x30 4 0 0 i; i2cget -y 0 0x30
+  0x01
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index be1d2e900aef..19296ff09930 100644
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
 
+static char tu_version_info[] = "v" UTS_RELEASE "\0";
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


