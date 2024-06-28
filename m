Return-Path: <linux-i2c+bounces-4442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4377491B941
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 932DF283285
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4C6146586;
	Fri, 28 Jun 2024 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nj6L//4Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC48B47F59;
	Fri, 28 Jun 2024 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561743; cv=none; b=EBcSHT3AqNhnh2s2w/6BwhjfaGkmiZAdZ4N5hH3ARuALrGYO1yakyjJdHeyIfbKhIwF419TFjfBA6/7rjlepJPfpQghzknPrBpdBFTsqMfjS3VaAfWjrsZa7ECjNMp7E6d3apjaO3VBYgUAj44Xq4KO6xvyDAzs/GXPnxAJZUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561743; c=relaxed/simple;
	bh=ccI8MYfzyEnNqGdmvND7NjZ84ouSXCcAOMy0xM3NMC0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fG8fMz4vvAEcgkcxMcDnmK9RcsI4Zw1vgh13a0mzlhmMtzu2+mMYNP5YD+z2EkZlFTZnP7XpeCcCp3DIhq0yoy7gymXgaRhwFsKQKr/G0ftjcsTkt1iSO+auhVDRoxwLC59pl/7R3XcxBN0A4E4OPB8tqxXsAzaAZoS26gz9RlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nj6L//4Q; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719561742; x=1751097742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ccI8MYfzyEnNqGdmvND7NjZ84ouSXCcAOMy0xM3NMC0=;
  b=nj6L//4QZSz4/oFpwKIFjgqzj7SV5VcOHbzY8Ys0m+U3PCVI7ZctEsqW
   VsxvsZhxIxIoqppqZ0QGB5/g03D9d69Ul5SsYOMDDkKoQrINf1u6v903z
   o6ierphrbjyYzAKDf3l3H5BQxqJUZlA/FDJzVOs8i+Cdu/hGiKXO58AbD
   EP9Lm6EeuX0oPygemyQP7ebSAo92CyAI1W4ixZbnu8ocdHu+vuCbVmLme
   kQZqRxJbYl9o0jsIoymHK1/MJO/UbCRNBklw97YsGvbwIxO9CxJM52e4a
   uQg9nSZ/HJPL8Pj1mw6sJDSztHAhOuqnzficaKl880alktJCZ4deCVTe9
   w==;
X-CSE-ConnectionGUID: yumzE5LRQZWNGcwzrru4aA==
X-CSE-MsgGUID: zs6JdCT+TdeFXl7gPhaAIQ==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="28620938"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 01:02:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 01:02:05 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 01:02:02 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
Date: Fri, 28 Jun 2024 11:01:44 +0300
Message-ID: <20240628080146.49545-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628080146.49545-1-andrei.simion@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@microchip.com>

The EEPROMs could be used only for MAC storage. In this case the
EEPROM areas where MACs resides could be modeled as NVMEM cells
(directly via DT bindings) such that the already available networking
infrastructure to read properly the MAC addresses (via
of_get_mac_address()). The previously available compatibles needs the
offset adjustment probably for compatibility w/ old DT bindings.
Add "microchip,24aa025e48", "microchip,24aa025e64" compatible for the
usage w/ 24AA025E{48, 64} type of EEPROMs where "24aa025e48" stands
for EUI-48 address and "24aa025e64" stands for EUI-64 address.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
[andrei.simion@microchip.com: Add extended macros to initialize the structure
with explicit value to adjusting offset. Add extra description for the commit
message.]
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v2 -> v3:
- add specific compatible names according with
https://ww1.microchip.com/downloads/en/DeviceDoc/24AA02E48-24AA025E48-24AA02E64-24AA025E64-Data-Sheet-20002124H.pdf
- add extended macros to initialize the structure with explicit value for adjoff
- drop co-developed-by to maintain the commit history
 (chronological order of modifications)

v1 -> v2:
- no change
---
 drivers/misc/eeprom/at24.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4bd4f32bcdab..e2ac08f656cf 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -121,20 +121,29 @@ struct at24_chip_data {
 	u32 byte_len;
 	u8 flags;
 	u8 bank_addr_shift;
+	u8 adjoff;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 };
 
-#define AT24_CHIP_DATA(_name, _len, _flags)				\
+#define AT24_CHIP_DATA_AO(_name, _len, _flags, _ao)			\
 	static const struct at24_chip_data _name = {			\
 		.byte_len = _len, .flags = _flags,			\
+		.adjoff = _ao						\
 	}
 
-#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)		\
+#define AT24_CHIP_DATA(_name, _len, _flags)				\
+	AT24_CHIP_DATA_AO(_name, _len, _flags, 0)
+
+#define AT24_CHIP_DATA_CB_AO(_name, _len, _flags, _ao, _read_post)	\
 	static const struct at24_chip_data _name = {			\
 		.byte_len = _len, .flags = _flags,			\
+		.adjoff = _ao,						\
 		.read_post = _read_post,				\
 	}
 
+#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)		\
+	AT24_CHIP_DATA_CB_AO(_name, _len, _flags, 0, _read_post)
+
 #define AT24_CHIP_DATA_BS(_name, _len, _flags, _bank_addr_shift)	\
 	static const struct at24_chip_data _name = {			\
 		.byte_len = _len, .flags = _flags,			\
@@ -170,9 +179,13 @@ AT24_CHIP_DATA(at24_data_24cs01, 16,
 AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0);
 AT24_CHIP_DATA(at24_data_24cs02, 16,
 	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24mac402, 48 / 8,
+AT24_CHIP_DATA_AO(at24_data_24mac402, 48 / 8,
+	AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
+AT24_CHIP_DATA_AO(at24_data_24mac602, 64 / 8,
+	AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
+AT24_CHIP_DATA(at24_data_24aa025e48, 48 / 8,
 	AT24_FLAG_MAC | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24mac602, 64 / 8,
+AT24_CHIP_DATA(at24_data_24aa025e64, 64 / 8,
 	AT24_FLAG_MAC | AT24_FLAG_READONLY);
 /* spd is a 24c02 in memory DIMMs */
 AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
@@ -218,6 +231,8 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24cs02",	(kernel_ulong_t)&at24_data_24cs02 },
 	{ "24mac402",	(kernel_ulong_t)&at24_data_24mac402 },
 	{ "24mac602",	(kernel_ulong_t)&at24_data_24mac602 },
+	{ "24aa025e48",	(kernel_ulong_t)&at24_data_24aa025e48 },
+	{ "24aa025e64",	(kernel_ulong_t)&at24_data_24aa025e64 },
 	{ "spd",	(kernel_ulong_t)&at24_data_spd },
 	{ "24c02-vaio",	(kernel_ulong_t)&at24_data_24c02_vaio },
 	{ "24c04",	(kernel_ulong_t)&at24_data_24c04 },
@@ -270,6 +285,8 @@ static const struct of_device_id __maybe_unused at24_of_match[] = {
 	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
 	{ .compatible = "atmel,24c1025",	.data = &at24_data_24c1025 },
 	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
+	{ .compatible = "microchip,24aa025e48",	.data = &at24_data_24aa025e48 },
+	{ .compatible = "microchip,24aa025e64",	.data = &at24_data_24aa025e64 },
 	{ /* END OF LIST */ },
 };
 MODULE_DEVICE_TABLE(of, at24_of_match);
@@ -690,7 +707,8 @@ static int at24_probe(struct i2c_client *client)
 	at24->read_post = cdata->read_post;
 	at24->bank_addr_shift = cdata->bank_addr_shift;
 	at24->num_addresses = num_addresses;
-	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
+	at24->offset_adj = cdata->adjoff ?
+				at24_get_offset_adj(flags, byte_len) : 0;
 	at24->client_regmaps[0] = regmap;
 
 	at24->vcc_reg = devm_regulator_get(dev, "vcc");
-- 
2.34.1


