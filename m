Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8E74A3282
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 00:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353422AbiA2XA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 18:00:56 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37521 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353415AbiA2XAz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 18:00:55 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 5B2993200AB0;
        Sat, 29 Jan 2022 18:00:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 29 Jan 2022 18:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=OsXd9TOTU6tLC0fedQdL43FzE/5I2M
        M29uh21O4gXeM=; b=Vez7aT2ZeyVJzI2wzQCiL6PFdJ7cxsv3ZlbXlQSDpsGdK5
        M3Ed/bXtsmoaSBW3gDc2wtwfVAEC78PWVyiNnRj5Y6t0Gkxe55dYODPS7Zvriz6Q
        1K+9xnZSIWTpPDXw1DftyQKoYf2tQUqJqmWtr4OOPhz5pJLkEhV5ECJCSEsP1jKv
        0/cwsieLn5JqEweXIwxQSsk57vplgXACXNLRO9U/iKzzT/ETjWPxXeIVgYyTCE/L
        rENXkBispQGNukb/ev6yTRphXucxtvRSXYRSgTqFw0Cocee9K/5zXChTtc+2mdTw
        vLZkmIoui+3jX93PNFRmXovErkxmbMW1yPl0V/MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OsXd9T
        OTU6tLC0fedQdL43FzE/5I2MM29uh21O4gXeM=; b=c8FoUTA3Eb0b2H3N8ajBeZ
        T3zSY+MF1XGfT9oT8Z64oXxdt8KzLvERPSUDbpR6OjjpjmlyHwgn/YEU7GVhN4mw
        sJGGDYUTJVXsd4nYKUBw8hX/FGl6o7+CXSjUmmuELEXArXat8m4zQ10D0t2JCB/g
        yiiBpmVo7notUlY2/adDf9qbUY30kRELhnhUT3bNDM1CIzm3VOmHhz4L9TIz5fMJ
        Z5H4PSl1JNiOGOE8RePTkMaNE0zuwb+sZETcVVu8RemqW90S/1GJbvkg67M2dcMm
        HKV9dr00q6QVD2ES8Ld6Pc2cBU5fLY4WjZG2GKRB6io0G7LGbKcrjjZkpmlqa7Dw
        ==
X-ME-Sender: <xms:Jcf1YQw6Rj8Vn8gzD6dCfc51eyypYbCJcmOoW8nwq-O4TqG8EldDqQ>
    <xme:Jcf1YUSbEzwhDoyTpP-TBtKnO8PL7faNkLlqFQ1EmQBet85Eh0YVPppq8DAqSaeeG
    NKxSaKnj9VgFso3aQ>
X-ME-Received: <xmr:Jcf1YSWM6ENtuGpnsQM03q2CeDkn3sqhn3eRpY8b3BS8DNkYY50PMlbym15Kgq9_brwmadDePEIbDDglvQd3GlVvfU36IA6f7PM09rOUtk3eCX8PBb2AXIWDxHNYckojNsphvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgddujedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Jcf1YehV7GSatlyOI460vqwWeIaJrXrmu5tFnP5ehwux4NiYLA5DXg>
    <xmx:Jcf1YSDI8us84k0jGF5Prw-9_etBs-eSo116amwgKd3xX9oJweSiSw>
    <xmx:Jcf1YfKRklRvWnkM_wMYVdIj2zVoppvoPhPDXTNb2euylud9hOaGXg>
    <xmx:Jcf1YYB-ajXXHcvPiMc3B_5u5jxcSQg9Z8pGqAlXc43epKErJq2jyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 18:00:53 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 3/5] Input: pinephone-keyboard - Build in the default keymap
Date:   Sat, 29 Jan 2022 17:00:40 -0600
Message-Id: <20220129230043.12422-4-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220129230043.12422-1-samuel@sholland.org>
References: <20220129230043.12422-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PinePhone keyboard comes with removable keys, but there is a default
layout labeled from the factory. Use this keymap if none is provided in
the devicetree.

Suggested-by: Ondrej Jirman <x@xff.cz>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/input/keyboard/pinephone-keyboard.c | 128 +++++++++++++++++++-
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
index 9a071753fd91..8065bc3e101a 100644
--- a/drivers/input/keyboard/pinephone-keyboard.c
+++ b/drivers/input/keyboard/pinephone-keyboard.c
@@ -24,6 +24,113 @@
 #define PPKB_SYS_CONFIG			0x20
 #define PPKB_SYS_CONFIG_DISABLE_SCAN		BIT(0)
 
+#define PPKB_DEFAULT_KEYMAP_ROWS	6
+#define PPKB_DEFAULT_KEYMAP_COLS	12
+
+static const uint32_t ppkb_default_fn_keymap[] = {
+	KEY(0,  0, KEY_FN_ESC),
+	KEY(0,  1, KEY_F1),
+	KEY(0,  2, KEY_F2),
+	KEY(0,  3, KEY_F3),
+	KEY(0,  4, KEY_F4),
+	KEY(0,  5, KEY_F5),
+	KEY(0,  6, KEY_F6),
+	KEY(0,  7, KEY_F7),
+	KEY(0,  8, KEY_F8),
+	KEY(0,  9, KEY_F9),
+	KEY(0, 10, KEY_F10),
+	KEY(0, 11, KEY_DELETE),
+
+	KEY(2,  0, KEY_SYSRQ),
+	KEY(2, 10, KEY_INSERT),
+
+	KEY(3,  0, KEY_LEFTSHIFT),
+	KEY(3,  8, KEY_HOME),
+	KEY(3,  9, KEY_UP),
+	KEY(3, 10, KEY_END),
+
+	KEY(4, 1, KEY_LEFTCTRL),
+	KEY(4, 6, KEY_LEFT),
+	KEY(4, 8, KEY_RIGHT),
+	KEY(4, 9, KEY_DOWN),
+
+	KEY(5, 2, KEY_FN),
+	KEY(5, 3, KEY_LEFTALT),
+	KEY(5, 5, KEY_RIGHTALT),
+};
+
+static const struct matrix_keymap_data ppkb_default_fn_keymap_data = {
+	.keymap		= ppkb_default_fn_keymap,
+	.keymap_size	= ARRAY_SIZE(ppkb_default_fn_keymap),
+};
+
+static const uint32_t ppkb_default_keymap[] = {
+	KEY(0,  0, KEY_ESC),
+	KEY(0,  1, KEY_1),
+	KEY(0,  2, KEY_2),
+	KEY(0,  3, KEY_3),
+	KEY(0,  4, KEY_4),
+	KEY(0,  5, KEY_5),
+	KEY(0,  6, KEY_6),
+	KEY(0,  7, KEY_7),
+	KEY(0,  8, KEY_8),
+	KEY(0,  9, KEY_9),
+	KEY(0, 10, KEY_0),
+	KEY(0, 11, KEY_BACKSPACE),
+
+	KEY(1,  0, KEY_TAB),
+	KEY(1,  1, KEY_Q),
+	KEY(1,  2, KEY_W),
+	KEY(1,  3, KEY_E),
+	KEY(1,  4, KEY_R),
+	KEY(1,  5, KEY_T),
+	KEY(1,  6, KEY_Y),
+	KEY(1,  7, KEY_U),
+	KEY(1,  8, KEY_I),
+	KEY(1,  9, KEY_O),
+	KEY(1, 10, KEY_P),
+	KEY(1, 11, KEY_ENTER),
+
+	KEY(2,  0, KEY_LEFTMETA),
+	KEY(2,  1, KEY_A),
+	KEY(2,  2, KEY_S),
+	KEY(2,  3, KEY_D),
+	KEY(2,  4, KEY_F),
+	KEY(2,  5, KEY_G),
+	KEY(2,  6, KEY_H),
+	KEY(2,  7, KEY_J),
+	KEY(2,  8, KEY_K),
+	KEY(2,  9, KEY_L),
+	KEY(2, 10, KEY_SEMICOLON),
+
+	KEY(3,  0, KEY_LEFTSHIFT),
+	KEY(3,  1, KEY_Z),
+	KEY(3,  2, KEY_X),
+	KEY(3,  3, KEY_C),
+	KEY(3,  4, KEY_V),
+	KEY(3,  5, KEY_B),
+	KEY(3,  6, KEY_N),
+	KEY(3,  7, KEY_M),
+	KEY(3,  8, KEY_COMMA),
+	KEY(3,  9, KEY_DOT),
+	KEY(3, 10, KEY_SLASH),
+
+	KEY(4,  1, KEY_LEFTCTRL),
+	KEY(4,  4, KEY_SPACE),
+	KEY(4,  6, KEY_APOSTROPHE),
+	KEY(4,  8, KEY_RIGHTBRACE),
+	KEY(4,  9, KEY_LEFTBRACE),
+
+	KEY(5,  2, KEY_FN),
+	KEY(5,  3, KEY_LEFTALT),
+	KEY(5,  5, KEY_RIGHTALT),
+};
+
+static const struct matrix_keymap_data ppkb_default_keymap_data = {
+	.keymap		= ppkb_default_keymap,
+	.keymap_size	= ARRAY_SIZE(ppkb_default_keymap),
+};
+
 struct pinephone_keyboard {
 	struct input_dev *input;
 	unsigned short *fn_keymap;
@@ -151,6 +258,8 @@ static irqreturn_t ppkb_irq_thread(int irq, void *data)
 
 static int ppkb_probe(struct i2c_client *client)
 {
+	const struct matrix_keymap_data *fn_keymap_data = &ppkb_default_fn_keymap_data;
+	const struct matrix_keymap_data *keymap_data = &ppkb_default_keymap_data;
 	struct device *dev = &client->dev;
 	unsigned int phys_rows, phys_cols;
 	unsigned int map_rows, map_cols;
@@ -176,9 +285,18 @@ static int ppkb_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = matrix_keypad_parse_properties(dev, &map_rows, &map_cols);
-	if (ret)
-		return ret;
+	/* Allow the devicetree to override the default keymaps. */
+	if (of_property_read_bool(dev->of_node, "linux,fn-keymap") ||
+	    of_property_read_bool(dev->of_node, "linux,keymap")) {
+		ret = matrix_keypad_parse_properties(dev, &map_rows, &map_cols);
+		if (ret)
+			return ret;
+
+		fn_keymap_data = keymap_data = NULL;
+	} else {
+		map_rows = PPKB_DEFAULT_KEYMAP_ROWS;
+		map_cols = PPKB_DEFAULT_KEYMAP_COLS;
+	}
 
 	phys_rows = info[PPKB_MATRIX_SIZE] & 0xf;
 	phys_cols = info[PPKB_MATRIX_SIZE] >> 4;
@@ -214,14 +332,14 @@ static int ppkb_probe(struct i2c_client *client)
 	__set_bit(EV_MSC, ppkb->input->evbit);
 	__set_bit(EV_REP, ppkb->input->evbit);
 
-	ret = matrix_keypad_build_keymap(NULL, "linux,fn-keymap",
+	ret = matrix_keypad_build_keymap(fn_keymap_data, "linux,fn-keymap",
 					 map_rows, map_cols, NULL, ppkb->input);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to build FN keymap\n");
 
 	ppkb->fn_keymap = ppkb->input->keycode;
 
-	ret = matrix_keypad_build_keymap(NULL, "linux,keymap",
+	ret = matrix_keypad_build_keymap(keymap_data, "linux,keymap",
 					 map_rows, map_cols, NULL, ppkb->input);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to build keymap\n");
-- 
2.33.1

