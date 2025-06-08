Return-Path: <linux-i2c+bounces-11277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 443FFAD1359
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jun 2025 18:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FD733AB898
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jun 2025 16:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472AB19004A;
	Sun,  8 Jun 2025 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="djhHOUoy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0716132F;
	Sun,  8 Jun 2025 16:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749400413; cv=none; b=ZLOv09pqsU7zxKEb9BGIak7+hM6Gsps9suWQBhujUZk/DX1qz8bH+aPTtznKNWf22LUalIO7YXwM/ierfpC3g2DgE2f89QyxazKticSMJWrrfIUjD5BRzz75iK4vVk1J4EEm2gtfbON1FIBq7kLqPIbXKmGqHG4fQFmEtBmRhvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749400413; c=relaxed/simple;
	bh=5UaJKy+PK+BeyZzfXGi92iOZ13ufZqJEChURi7S104E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TnrcsuWNbmNfl83kDYU5zbEEbq+1gzVoF0/oLZpKRxNAlqRW5lAQ4pgfUcRIdI1TUD0gunvSqwqW2jg/vHmESfKRoG9S0Swa98YD8y144EKHX13HRxO1kyef8+jGnmDE3XRTmOrZmwh+DD8pDV5KxWQnQxNxje5AfEzBtNc7sP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=djhHOUoy; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A25E10397298;
	Sun,  8 Jun 2025 18:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1749400402; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=q9L8aiejltW49BwuW1MY7Fse2bm2uhwAe8TBfe1zjr4=;
	b=djhHOUoylnit2guL3TJHiiKRS1sBTwO/9E6txnGp/5LCUgz3wSpBs0swERQ/Ib5/pdtZt/
	uPIHwtZ2Ds/dFaA7+WuWF2uj1pzqVfBMjtZhGyo/4hwlbJhER3X4EOLTa5JVlwJCtjLP+t
	i3CWS8FgiarfcDo1a2LGKwr7j9fHvYPWR5FB+y/8Fkd4dOxwtnIsFbaw+TeZ/p2/gjNlIz
	PzjCLCCcxbzSu1kK47LkT0pwAqDsSnPJKcZGQMiWfDqBTna4aplciXsTdsAe1gcPCZhfnt
	wB+l7+4dS/o0QbVkKUtoy4zQ5vIv/f23agzEwkM9tAnU+H4yejlv7BA77/zmpg==
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Rishi Gupta <gupt21@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: mcp2221: set gpio pin mode
Date: Sun,  8 Jun 2025 18:33:15 +0200
Message-Id: <20250608163315.24842-1-hs@denx.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

in case we have GPIOLIB enabled the gpio pins are used
from the current driver as gpio pins. But may the gpio
functions of this pins are not enabled in the flash
of the chip and so gpio access fails.

In case CONFIG_IIO is not enabled we can prevent this
issue of the driver simply by enabling the gpio mode
for all pins.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

 drivers/hid/hid-mcp2221.c | 97 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0f93c22a479f..f693e920dffe 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -55,6 +55,27 @@ enum {
 	MCP2221_ALT_F_NOT_GPIOD = 0xEF,
 };
 
+/* MCP SRAM read offsets cmd: MCP2221_GET_SRAM_SETTINGS */
+enum {
+	MCP2221_SRAM_RD_GP0 = 22,
+	MCP2221_SRAM_RD_GP1 = 23,
+	MCP2221_SRAM_RD_GP2 = 24,
+	MCP2221_SRAM_RD_GP3 = 25,
+};
+
+/* MCP SRAM write offsets cmd: MCP2221_SET_SRAM_SETTINGS */
+enum {
+	MCP2221_SRAM_WR_GP_ENA_ALTER = 7,
+	MCP2221_SRAM_WR_GP0 = 8,
+	MCP2221_SRAM_WR_GP1 = 9,
+	MCP2221_SRAM_WR_GP2 = 10,
+	MCP2221_SRAM_WR_GP3 = 11,
+};
+
+#define MCP2221_SRAM_GP_DESIGN_MASK		0x07
+#define MCP2221_SRAM_GP_DIRECTION_MASK		0x08
+#define MCP2221_SRAM_GP_VALUE_MASK		0x10
+
 /* MCP GPIO direction encoding */
 enum {
 	MCP2221_DIR_OUT = 0x00,
@@ -607,6 +628,80 @@ static const struct i2c_algorithm mcp_i2c_algo = {
 };
 
 #if IS_REACHABLE(CONFIG_GPIOLIB)
+static int mcp_gpio_read_sram(struct mcp2221 *mcp)
+{
+	int ret;
+
+	memset(mcp->txbuf, 0, 64);
+	mcp->txbuf[0] = MCP2221_GET_SRAM_SETTINGS;
+
+	mutex_lock(&mcp->lock);
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 64);
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
+/*
+ * If CONFIG_IIO is not enabled, check for the gpio pins
+ * if they are in gpio mode. For the ones which are not
+ * in gpio mode, set them into gpio mode.
+ */
+static int mcp2221_check_gpio_pinfunc(struct mcp2221 *mcp)
+{
+	int i;
+	int needgpiofix = 0;
+	int ret;
+
+	if (IS_ENABLED(CONFIG_IIO))
+		return 0;
+
+	ret = mcp_gpio_read_sram(mcp);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < MCP_NGPIO; i++) {
+		if ((mcp->mode[i] & MCP2221_SRAM_GP_DESIGN_MASK) != 0x0) {
+			dev_warn(&mcp->hdev->dev,
+				 "GPIO %d not in gpio mode\n", i);
+			needgpiofix = 1;
+		}
+	}
+
+	if (!needgpiofix)
+		return 0;
+
+	/*
+	 * Set all bytes to 0, so Bit 7 is not set. The chip
+	 * only changes content of a register when bit 7 is set.
+	 */
+	memset(mcp->txbuf, 0, 64);
+	mcp->txbuf[0] = MCP2221_SET_SRAM_SETTINGS;
+
+	/*
+	 * Set bit 7 in MCP2221_SRAM_WR_GP_ENA_ALTER to enable
+	 * loading of a new set of gpio settings to GP SRAM
+	 */
+	mcp->txbuf[MCP2221_SRAM_WR_GP_ENA_ALTER] = 0x80;
+	for (i = 0; i < MCP_NGPIO; i++) {
+		if ((mcp->mode[i] & MCP2221_SRAM_GP_DESIGN_MASK) == 0x0) {
+			/* write current GPIO mode */
+			mcp->txbuf[MCP2221_SRAM_WR_GP0 + i] = mcp->mode[i];
+		} else {
+			/* pin is not in gpio mode, set it to input mode */
+			mcp->txbuf[MCP2221_SRAM_WR_GP0 + i] = 0x08;
+			dev_warn(&mcp->hdev->dev,
+				 "Set GPIO mode for gpio pin %d!\n", i);
+		}
+	}
+
+	mutex_lock(&mcp->lock);
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 64);
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
 static int mcp_gpio_get(struct gpio_chip *gc,
 				unsigned int offset)
 {
@@ -1216,6 +1311,8 @@ static int mcp2221_probe(struct hid_device *hdev,
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
 		return ret;
+
+	mcp2221_check_gpio_pinfunc(mcp);
 #endif
 
 #if IS_REACHABLE(CONFIG_IIO)
-- 
2.20.1

base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
branch: abb-mcp2221-v1

