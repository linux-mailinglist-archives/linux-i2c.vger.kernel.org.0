Return-Path: <linux-i2c+bounces-5402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8629521F6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F931F2295B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA301BC09F;
	Wed, 14 Aug 2024 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F6zM8EYN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3261BBBDA
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659737; cv=none; b=nyIsfQDVIevYQ/kwaxbPVz/mFOZGz3eO0ncIRnUlVlgnovRl+Ia4+Chf1bzbxrxSZ+Cq3wH2xSRMi9o5+kDMWNIEe6xD3ypfQu81z6aKAcVbOc1dGZ0Kve6MfM4c56ITxivIat/p7mQLP5/JfeC0rP2Zgb4/RXXxFEmv3MgHCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659737; c=relaxed/simple;
	bh=XZ1itzioRl8PIZsWAe2xvdLETORUOqPKEf7RCJ12hes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN6nUuefpcPyxioynplwr9GUVBxG7OBkO2XaKNcTsrrpiYA65xVzegKvDVmP6DrvvoOiKyE5JL3mJH3jGCTa3RP6tECKBzDL1ppafdMShVyHuej6xlJF1Fg0yE1DNvrgpVyLdzGpbkYXr/IJ39t5DQoM6B4jrAZxQlo83TstD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F6zM8EYN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Wf8kp5SNFQNORNJ8bbKih+D/mtQYOk4x6nQVHTDBrxc=; b=F6zM8E
	YNwc2mAmTxhcHvknR8tgHeGd2cdzve9Jsgeu9Myc95KBnd2VmFim5orkYvdzKxDt
	pp/srJe5oQ8Bu1yDeSP+vAJIeRjx8yJ5n6SmLJDIOp5zyE03HrqsEvNInvMBoD9K
	uC9zr3ubvF7IxB7jHsQ/eP5EAqyy9cfCOx6JrBBYjmXGAcdZGFZ5e5z0a7u4pKD8
	m7385xaUZsu/lb6ldHhU6WTIsuNWl+CN2zs0OX6+od7U3w2vEpe0HdmyvwwcGdZr
	ANwd8XNmEh6+FVgLw0p66q3KkZlkHGSrevVi3wRlrEdmOOAsTSfypDQ6Zobc6Q8L
	9a8cM8nVam3QtuiA==
Received: (qmail 2065495 invoked from network); 14 Aug 2024 20:22:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:22:13 +0200
X-UD-Smtp-Session: l3s3148p1@z1Mdzqgf9sogAQnoAHipAGJRnFk/ZdC8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/3] i2c: testunit: move code to avoid a forward declaration
Date: Wed, 14 Aug 2024 20:22:08 +0200
Message-ID: <20240814182210.15382-3-wsa+renesas@sang-engineering.com>
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

To avoid forward declarations in upcoming code, move the workqueue
handler as-is downwards. This will ease review of the new features.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-testunit.c | 84 ++++++++++++++++----------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index 04060bc8a9d0..df54185e5e9a 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -48,48 +48,6 @@ struct testunit_data {
 
 static char tu_version_info[] = "v" UTS_RELEASE "\n\0";
 
-static void i2c_slave_testunit_work(struct work_struct *work)
-{
-	struct testunit_data *tu = container_of(work, struct testunit_data, worker.work);
-	struct i2c_msg msg;
-	u8 msgbuf[256];
-	int ret = 0;
-
-	msg.addr = I2C_CLIENT_END;
-	msg.buf = msgbuf;
-
-	switch (tu->regs[TU_REG_CMD]) {
-	case TU_CMD_READ_BYTES:
-		msg.addr = tu->regs[TU_REG_DATAL];
-		msg.flags = I2C_M_RD;
-		msg.len = tu->regs[TU_REG_DATAH];
-		break;
-
-	case TU_CMD_SMBUS_HOST_NOTIFY:
-		msg.addr = 0x08;
-		msg.flags = 0;
-		msg.len = 3;
-		msgbuf[0] = tu->client->addr;
-		msgbuf[1] = tu->regs[TU_REG_DATAL];
-		msgbuf[2] = tu->regs[TU_REG_DATAH];
-		break;
-
-	default:
-		break;
-	}
-
-	if (msg.addr != I2C_CLIENT_END) {
-		ret = i2c_transfer(tu->client->adapter, &msg, 1);
-		/* convert '0 msgs transferred' to errno */
-		ret = (ret == 0) ? -EIO : ret;
-	}
-
-	if (ret < 0)
-		dev_err(&tu->client->dev, "CMD%02X failed (%d)\n", tu->regs[TU_REG_CMD], ret);
-
-	clear_bit(TU_FLAG_IN_PROCESS, &tu->flags);
-}
-
 static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 				     enum i2c_slave_event event, u8 *val)
 {
@@ -166,6 +124,48 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 	return ret;
 }
 
+static void i2c_slave_testunit_work(struct work_struct *work)
+{
+	struct testunit_data *tu = container_of(work, struct testunit_data, worker.work);
+	struct i2c_msg msg;
+	u8 msgbuf[256];
+	int ret = 0;
+
+	msg.addr = I2C_CLIENT_END;
+	msg.buf = msgbuf;
+
+	switch (tu->regs[TU_REG_CMD]) {
+	case TU_CMD_READ_BYTES:
+		msg.addr = tu->regs[TU_REG_DATAL];
+		msg.flags = I2C_M_RD;
+		msg.len = tu->regs[TU_REG_DATAH];
+		break;
+
+	case TU_CMD_SMBUS_HOST_NOTIFY:
+		msg.addr = 0x08;
+		msg.flags = 0;
+		msg.len = 3;
+		msgbuf[0] = tu->client->addr;
+		msgbuf[1] = tu->regs[TU_REG_DATAL];
+		msgbuf[2] = tu->regs[TU_REG_DATAH];
+		break;
+
+	default:
+		break;
+	}
+
+	if (msg.addr != I2C_CLIENT_END) {
+		ret = i2c_transfer(tu->client->adapter, &msg, 1);
+		/* convert '0 msgs transferred' to errno */
+		ret = (ret == 0) ? -EIO : ret;
+	}
+
+	if (ret < 0)
+		dev_err(&tu->client->dev, "CMD%02X failed (%d)\n", tu->regs[TU_REG_CMD], ret);
+
+	clear_bit(TU_FLAG_IN_PROCESS, &tu->flags);
+}
+
 static int i2c_slave_testunit_probe(struct i2c_client *client)
 {
 	struct testunit_data *tu;
-- 
2.43.0


