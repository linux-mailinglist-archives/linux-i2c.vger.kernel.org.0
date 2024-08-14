Return-Path: <linux-i2c+bounces-5403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9B9521F8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DEEF1C22120
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3DC1BD504;
	Wed, 14 Aug 2024 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TcoqiUoM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695E1BD4E9
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659738; cv=none; b=XZ7DDB5VUt04k2L8xvIRmE49wWk2jVlbUtgdScH6TTTpuHjsVHctHScHGdabqp4Mw2Uors7VobGJFUrHm/P+tB3CcYY5zZtjNer10WCNzPotUivM+zUPyGP6+vlNiPdft3RH1im1xbYKSpT6DK6IEbWFy9kdVB1VD7t6FHd1XrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659738; c=relaxed/simple;
	bh=7Hq/gSPxiQWzaMXYeizVEdvcS8SoPkm1CW8TQ3ZfZJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATKh7deia8mcy531nzivg5nFi93qIVaUBTKk9nm2TdBYYlCmuqz8I4Q4ICDjEVvC1pCzt41lTovX/0HwTvun6JJzWJRaY8ahLa0eOrCWjMyG3zQKNl63iCpMhFqe+Rm7bpVB8IwHennU1ZFm8YPNdwoMgbNp3fovMhemD6zQPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TcoqiUoM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=QSg8b8MzYac1LcU0Mt07nJsx8x+kCS0GeQWXpYiJb5k=; b=TcoqiU
	oMmWQC/nCT4NVq21jT6mCJY5ooDvWRtDHs+/2+TYG9QE5CjYlGf+P5PHFVJdVa5p
	IB6tPQ1U34aUIjALxSzpsiMhtujqBn3m5QtLXkFlH8uSE8tB4AZxJxInx1vsr1BG
	tF8qHrw8MWPUvmLiBNSqzUwHiY967VRXmt6nkxYT+8dXtx05AwqTpkR4CPRoQBWD
	ztlh5rbDwog6K8AsZIIrUIltsl0tv0OLljGYKMETJBzRaTuG95g93kQTuHJ5KN/P
	BLnlCb7eGZ+V4VHhUmjrayw5IOffkwagL4VsXKbVJzYhZdXaXG9fs1ZwSDnXkoPU
	vDcRPEtdq8sBmzeg==
Received: (qmail 2065515 invoked from network); 14 Aug 2024 20:22:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:22:14 +0200
X-UD-Smtp-Session: l3s3148p1@FA4szqgfAMsgAQnoAHipAGJRnFk/ZdC8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 3/3] i2c: testunit: add SMBusAlert trigger
Date: Wed, 14 Aug 2024 20:22:09 +0200
Message-ID: <20240814182210.15382-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
References: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To test SMBusAlert handlers, let the testunit be able to trigger
SMBusAlert interrupts. This new command needs a GPIO connected to the
SMBAlert# line.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst | 48 ++++++++++++++++
 drivers/i2c/i2c-slave-testunit.c             | 59 ++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index 3743188ecfc7..d752f433be07 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -185,3 +185,51 @@ default response::
 
   # i2cset -y 0 0x30 4 0 0 i; i2cget -y 0 0x30
   0x00
+
+0x05 SMBUS_ALERT_REQUEST
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. list-table::
+  :header-rows: 1
+
+  * - CMD
+    - DATAL
+    - DATAH
+    - DELAY
+
+  * - 0x05
+    - response value (7 MSBs interpreted as I2C address)
+    - currently unused
+    - n * 10ms
+
+This test raises an interrupt via the SMBAlert pin which the host controller
+must handle. The pin must be connected to the testunit as a GPIO. GPIO access
+is not allowed to sleep. Currently, this can only be described using firmware
+nodes. So, for devicetree, you would add something like this to the testunit
+node::
+
+  gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+
+The following command will trigger the alert with a response of 0xc9 after 1
+second of delay::
+
+  # i2cset -y 0 0x30 5 0xc9 0x00 100 i
+
+If the host controller supports SMBusAlert, this message with debug level
+should appear::
+
+  smbus_alert 0-000c: SMBALERT# from dev 0x64, flag 1
+
+This message may appear more than once because the testunit is software not
+hardware and, thus, may not be able to react to the response of the host fast
+enough. The interrupt count should increase only by one, though::
+
+  # cat /proc/interrupts | grep smbus_alert
+   93:          1  gpio-rcar  26 Edge      smbus_alert
+
+If the host does not respond to the alert within 1 second, the test will be
+aborted and the testunit will report an error.
+
+For this test, the testunit will shortly drop its assigned address and listen
+on the SMBus Alert Response Address (0x0c). It will reassign its original
+address afterwards.
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index df54185e5e9a..9fe3150378e8 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -8,6 +8,8 @@
 
 #include <generated/utsrelease.h>
 #include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -22,6 +24,7 @@ enum testunit_cmds {
 	TU_CMD_SMBUS_HOST_NOTIFY,
 	TU_CMD_SMBUS_BLOCK_PROC_CALL,
 	TU_CMD_GET_VERSION_WITH_REP_START,
+	TU_CMD_SMBUS_ALERT_REQUEST,
 	TU_NUM_CMDS
 };
 
@@ -44,10 +47,37 @@ struct testunit_data {
 	u8 read_idx;
 	struct i2c_client *client;
 	struct delayed_work worker;
+	struct gpio_desc *gpio;
+	struct completion alert_done;
 };
 
 static char tu_version_info[] = "v" UTS_RELEASE "\n\0";
 
+static int i2c_slave_testunit_smbalert_cb(struct i2c_client *client,
+					  enum i2c_slave_event event, u8 *val)
+{
+	struct testunit_data *tu = i2c_get_clientdata(client);
+
+	switch (event) {
+	case I2C_SLAVE_READ_PROCESSED:
+		gpiod_set_value(tu->gpio, 0);
+		fallthrough;
+	case I2C_SLAVE_READ_REQUESTED:
+		*val = tu->regs[TU_REG_DATAL];
+		break;
+
+	case I2C_SLAVE_STOP:
+		complete(&tu->alert_done);
+		break;
+
+	case I2C_SLAVE_WRITE_REQUESTED:
+	case I2C_SLAVE_WRITE_RECEIVED:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 				     enum i2c_slave_event event, u8 *val)
 {
@@ -127,8 +157,10 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 static void i2c_slave_testunit_work(struct work_struct *work)
 {
 	struct testunit_data *tu = container_of(work, struct testunit_data, worker.work);
+	unsigned long time_left;
 	struct i2c_msg msg;
 	u8 msgbuf[256];
+	u16 orig_addr;
 	int ret = 0;
 
 	msg.addr = I2C_CLIENT_END;
@@ -150,6 +182,26 @@ static void i2c_slave_testunit_work(struct work_struct *work)
 		msgbuf[2] = tu->regs[TU_REG_DATAH];
 		break;
 
+	case TU_CMD_SMBUS_ALERT_REQUEST:
+		i2c_slave_unregister(tu->client);
+		orig_addr = tu->client->addr;
+		tu->client->addr = 0x0c;
+		ret = i2c_slave_register(tu->client, i2c_slave_testunit_smbalert_cb);
+		if (ret)
+			goto out_smbalert;
+
+		reinit_completion(&tu->alert_done);
+		gpiod_set_value(tu->gpio, 1);
+		time_left = wait_for_completion_timeout(&tu->alert_done, HZ);
+		if (!time_left)
+			ret = -ETIMEDOUT;
+
+		i2c_slave_unregister(tu->client);
+out_smbalert:
+		tu->client->addr = orig_addr;
+		i2c_slave_register(tu->client, i2c_slave_testunit_slave_cb);
+		break;
+
 	default:
 		break;
 	}
@@ -176,8 +228,15 @@ static int i2c_slave_testunit_probe(struct i2c_client *client)
 
 	tu->client = client;
 	i2c_set_clientdata(client, tu);
+	init_completion(&tu->alert_done);
 	INIT_DELAYED_WORK(&tu->worker, i2c_slave_testunit_work);
 
+	tu->gpio = devm_gpiod_get_index_optional(&client->dev, NULL, 0, GPIOD_OUT_LOW);
+	if (gpiod_cansleep(tu->gpio)) {
+		dev_err(&client->dev, "GPIO access which may sleep is not allowed\n");
+		return -EDEADLK;
+	}
+
 	if (sizeof(tu_version_info) > TU_VERSION_MAX_LENGTH)
 		tu_version_info[TU_VERSION_MAX_LENGTH - 1] = 0;
 
-- 
2.43.0


