Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE80F4A3289
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 00:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353434AbiA2XBH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 18:01:07 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37149 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353408AbiA2XA6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 18:00:58 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 1AFA63200AB0;
        Sat, 29 Jan 2022 18:00:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 29 Jan 2022 18:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=vrBXDS1ojZa8egDi/tODkXvIJSt4wA
        5hxeMg5uTMGVc=; b=dqBoh0rGN3lCWXQoPNMje0UEEIjL02b6ctRVPl/QpcWO/X
        SUjW4f7bz0ZG6iAYCfce4LhZcqbhI95NkJUyTuNtsw7r+VjrlgUZPTswZVBK02He
        Jv04cBcuaXKixmiMjrPXHUYxtC/lOmpCFPUOjjo3CYAxB1UDQXMLRfEhDln5wjxS
        aIze9ekuhUa3xnrPNa7o/j5cLN5h1H/9pUDmBhHbm1lpGs2/l93GZPTOGaCy+PGr
        Ql8+TR4FyOUEOiwrx27L36FgmftJBlVIeJHgyXcufW9LlNkBiQ17zwjlEwXj/W8U
        astzxdNeSvWr/oKPmGVw837wsA1yEdt0mMZFGLtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vrBXDS
        1ojZa8egDi/tODkXvIJSt4wA5hxeMg5uTMGVc=; b=W++CoLDg/b5GV0OtwvlAhg
        3fLX+x7Hk/mzIVM3Gyk4SNmTu6Sm7/PkMjXdoNQd0HKdr903uzpfU4H9sJrFg5/R
        A84jTlMvwDWSc5dnDtC+zS/9fDS5vUp17s3YxRAukD6BCZefEgeVJ8+OABoYQIwP
        /WfF6eeZMU2hQz6Zk7X9b1jDsIx4Z5Ku69M+oMcaDUlUJApRvM21ycjKhe9vriMZ
        VLgqWhiIUUfnQslYA3MpHsJsRYz6oXF3jkGcecZPnWSrcxp6VuKXPurTo8WeVUF1
        7aFo3ais4d/lINh6XdGWTQOYtFG5+dyBBYC+HMbPniW9uLjUr4xA0Uf12F+OiHOA
        ==
X-ME-Sender: <xms:KMf1YREvPymQ3SzYqeRWbSw1VCz9WgHwOyBW11PVRnLIJXv_Jj7Yew>
    <xme:KMf1YWVs0r2CgLdhfCuaZr3uQxzV4AQ7at4f-OJYRRqA0PUebe_3S_lYIuVxK8Su-
    dK7om2g8PuLnB_Ugw>
X-ME-Received: <xmr:KMf1YTI9d1pMCwWDRwqwMl5cW6dSPcOtTOipsje4Fv2DKo5bCBQC0O6pkabCuWRT3FlYik_zr0z52TBeOdZqOqbeFQXhV-Pf6GgUhqRtryvsOgbnSBQlh6pFivSxji7KSs3GrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgdduieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:KMf1YXFmu7BNuR_gvWwRuMGYkaYrbgIMdjhNZe-P09PFL7mmZ9zDtA>
    <xmx:KMf1YXXoQ0gjJ5eZKYfhaV7JTTBAZkyal56qnHMmvRUMnf3p9V2RIw>
    <xmx:KMf1YSO0hQpYyo2aWEOhEN1ib6O1E4jZqIYAfXVNLRF8bHfuymlsJA>
    <xmx:KMf1YeHZc8fpXOJxGdoafgRs4ane02xt4CWbcEQXdzGwCIET9UGrRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 18:00:56 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 4/5] Input: pinephone-keyboard - Support the proxied I2C bus
Date:   Sat, 29 Jan 2022 17:00:41 -0600
Message-Id: <20220129230043.12422-5-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220129230043.12422-1-samuel@sholland.org>
References: <20220129230043.12422-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PinePhone keyboard case contains a battery managed by an integrated
power bank IC. The power bank IC communicates over I2C, and the keyboard
MCU firmware provides an interface to read and write its registers.
Let's use this interface to implement a SMBus adapter, so we can reuse
the driver for the power bank IC.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/input/keyboard/pinephone-keyboard.c | 73 +++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
index 8065bc3e101a..7d2e16e588a0 100644
--- a/drivers/input/keyboard/pinephone-keyboard.c
+++ b/drivers/input/keyboard/pinephone-keyboard.c
@@ -3,6 +3,7 @@
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
 #include <linux/crc8.h>
+#include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/input/matrix_keypad.h>
 #include <linux/interrupt.h>
@@ -23,6 +24,11 @@
 #define PPKB_SCAN_DATA			0x08
 #define PPKB_SYS_CONFIG			0x20
 #define PPKB_SYS_CONFIG_DISABLE_SCAN		BIT(0)
+#define PPKB_SYS_SMBUS_COMMAND		0x21
+#define PPKB_SYS_SMBUS_DATA		0x22
+#define PPKB_SYS_COMMAND		0x23
+#define PPKB_SYS_COMMAND_SMBUS_READ		0x91
+#define PPKB_SYS_COMMAND_SMBUS_WRITE		0xa1
 
 #define PPKB_DEFAULT_KEYMAP_ROWS	6
 #define PPKB_DEFAULT_KEYMAP_COLS	12
@@ -132,6 +138,7 @@ static const struct matrix_keymap_data ppkb_default_keymap_data = {
 };
 
 struct pinephone_keyboard {
+	struct i2c_adapter adapter;
 	struct input_dev *input;
 	unsigned short *fn_keymap;
 	u8 crc_table[CRC8_TABLE_SIZE];
@@ -143,6 +150,57 @@ struct pinephone_keyboard {
 	u8 buf[];
 };
 
+static int ppkb_adap_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+				unsigned short flags, char read_write,
+				u8 command, int size,
+				union i2c_smbus_data *data)
+{
+	struct i2c_client *client = adap->algo_data;
+	u8 buf[3];
+	int ret;
+
+	buf[0] = command;
+	buf[1] = data->byte;
+	buf[2] = read_write == I2C_SMBUS_READ ? PPKB_SYS_COMMAND_SMBUS_READ
+					      : PPKB_SYS_COMMAND_SMBUS_WRITE;
+
+	ret = i2c_smbus_write_i2c_block_data(client, PPKB_SYS_SMBUS_COMMAND,
+					     sizeof(buf), buf);
+	if (ret)
+		return ret;
+
+	/* Read back the command status until it passes or fails. */
+	do {
+		usleep_range(300, 500);
+		ret = i2c_smbus_read_byte_data(client, PPKB_SYS_COMMAND);
+	} while (ret == buf[2]);
+	if (ret < 0)
+		return ret;
+	/* Commands return 0x00 on success and 0xff on failure. */
+	if (ret)
+		return -EIO;
+
+	if (read_write == I2C_SMBUS_READ) {
+		ret = i2c_smbus_read_byte_data(client, PPKB_SYS_SMBUS_DATA);
+		if (ret < 0)
+			return ret;
+
+		data->byte = ret;
+	}
+
+	return 0;
+}
+
+static u32 ppkg_adap_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_SMBUS_BYTE_DATA;
+}
+
+static const struct i2c_algorithm ppkb_adap_algo = {
+	.smbus_xfer		= ppkb_adap_smbus_xfer,
+	.functionality		= ppkg_adap_functionality,
+};
+
 static int ppkb_set_scan(struct i2c_client *client, bool enable)
 {
 	struct device *dev = &client->dev;
@@ -265,6 +323,7 @@ static int ppkb_probe(struct i2c_client *client)
 	unsigned int map_rows, map_cols;
 	struct pinephone_keyboard *ppkb;
 	u8 info[PPKB_MATRIX_SIZE + 1];
+	struct device_node *i2c_bus;
 	int ret;
 
 	ret = i2c_smbus_read_i2c_block_data(client, 0, sizeof(info), info);
@@ -312,6 +371,20 @@ static int ppkb_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, ppkb);
 
+	i2c_bus = of_get_child_by_name(dev->of_node, "i2c-bus");
+	if (i2c_bus) {
+		ppkb->adapter.owner = THIS_MODULE;
+		ppkb->adapter.algo = &ppkb_adap_algo;
+		ppkb->adapter.algo_data = client;
+		ppkb->adapter.dev.parent = dev;
+		ppkb->adapter.dev.of_node = i2c_bus;
+		strscpy(ppkb->adapter.name, DRV_NAME, sizeof(ppkb->adapter.name));
+
+		ret = devm_i2c_add_adapter(dev, &ppkb->adapter);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to add I2C adapter\n");
+	}
+
 	crc8_populate_msb(ppkb->crc_table, PPKB_CRC8_POLYNOMIAL);
 	ppkb->row_shift = get_count_order(map_cols);
 	ppkb->rows = map_rows;
-- 
2.33.1

