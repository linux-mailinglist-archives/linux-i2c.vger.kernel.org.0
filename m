Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9B8314E24
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 12:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBILWF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 06:22:05 -0500
Received: from www.zeus03.de ([194.117.254.33]:49664 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230226AbhBILUM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 06:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=EEBV23pyAIcfqpvksmub813O9b9
        exoa6A9a9ixnz1DU=; b=3y00j4hhhhxvXUP3gtUOOGOku+KGAXwrN2iQuqFJoEE
        Yqh6CfSDJ4siu526jblXtARfk4dSX5TfeM6cNn3GFDWLBzz3fFoSG9n14M87S37H
        AuxCG32x9sf30YFWu8lobAizV+JE0Fv5GZzfZIgzXdG4VNbK4mHflo23iLlIvjFI
        =
Received: (qmail 182523 invoked from network); 9 Feb 2021 12:19:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2021 12:19:31 +0100
X-UD-Smtp-Session: l3s3148p1@WMrddeW6Go0gAwDPXxOiANNsDO+kmtby
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: testunit: add support for block process calls
Date:   Tue,  9 Feb 2021 12:19:27 +0100
Message-Id: <20210209111927.19169-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Devices offering SMBus block process calls are rare, so add it to the
testunit. This is also a good test case for testing proper
I2C_M_RECV_LEN flag handling of I2C bus masters emulating SMBus.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst | 23 ++++++++++++++++++--
 drivers/i2c/i2c-slave-testunit.c             | 12 ++++++++--
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index 2c38e64f0bac..ecfc2abec32d 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -22,8 +22,9 @@ Instantiating the device is regular. Example for bus 0, address 0x30:
 
 After that, you will have a write-only device listening. Reads will just return
 an 8-bit version number of the testunit. When writing, the device consists of 4
-8-bit registers and all must be written to start a testcase, i.e. you must
-always write 4 bytes to the device. The registers are:
+8-bit registers and, except for some "partial" commands, all registers must be
+written to start a testcase, i.e. you usually write 4 bytes to the device. The
+registers are:
 
 0x00 CMD   - which test to trigger
 0x01 DATAL - configuration byte 1 for the test
@@ -67,3 +68,21 @@ status word is currently ignored in the Linux Kernel. Example to send a
 notification after 10ms:
 
 # i2cset -y 0 0x30 0x02 0x42 0x64 0x01 i
+
+0x03 SMBUS_BLOCK_PROC_CALL (partial command)
+   DATAL - must be '1', i.e. one further byte will be written
+   DATAH - number of bytes to be sent back
+   DELAY - not applicable, partial command!
+
+This test will respond to a block process call as defined by the SMBus
+specification. The one data byte written specifies how many bytes will be sent
+back in the following read transfer. Note that in this read transfer, the
+testunit will prefix the length of the bytes to follow. So, if your host bus
+driver emulates SMBus calls like the majority does, it needs to support the
+I2C_M_RECV_LEN flag of an i2c_msg. This is a good testcase for it. The returned
+data consists of the length first, and then of an array of bytes from length-1
+to 0. Here is an example which emulates i2c_smbus_block_process_call() using
+i2ctransfer (you need i2c-tools v4.2 or later):
+
+# i2ctransfer -y 0 w3@0x30 0x03 0x01 0x10 r?
+0x10 0x0f 0x0e 0x0d 0x0c 0x0b 0x0a 0x09 0x08 0x07 0x06 0x05 0x04 0x03 0x02 0x01 0x00
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index c288102de324..56dae08dfd48 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -19,6 +19,7 @@
 enum testunit_cmds {
 	TU_CMD_READ_BYTES = 1,	/* save 0 for ABORT, RESET or similar */
 	TU_CMD_HOST_NOTIFY,
+	TU_CMD_SMBUS_BLOCK_PROC_CALL,
 	TU_NUM_CMDS
 };
 
@@ -88,6 +89,8 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 				     enum i2c_slave_event event, u8 *val)
 {
 	struct testunit_data *tu = i2c_get_clientdata(client);
+	bool is_proc_call = tu->reg_idx == 3 && tu->regs[TU_REG_DATAL] == 1 &&
+			    tu->regs[TU_REG_CMD] == TU_CMD_SMBUS_BLOCK_PROC_CALL;
 	int ret = 0;
 
 	switch (event) {
@@ -118,12 +121,17 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		fallthrough;
 
 	case I2C_SLAVE_WRITE_REQUESTED:
+		memset(tu->regs, 0, TU_NUM_REGS);
 		tu->reg_idx = 0;
 		break;
 
-	case I2C_SLAVE_READ_REQUESTED:
 	case I2C_SLAVE_READ_PROCESSED:
-		*val = TU_CUR_VERSION;
+		if (is_proc_call && tu->regs[TU_REG_DATAH])
+			tu->regs[TU_REG_DATAH]--;
+		fallthrough;
+
+	case I2C_SLAVE_READ_REQUESTED:
+		*val = is_proc_call ? tu->regs[TU_REG_DATAH] : TU_CUR_VERSION;
 		break;
 	}
 
-- 
2.28.0

