Return-Path: <linux-i2c+bounces-4197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5909124E7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B2A2B21673
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E651514D3;
	Fri, 21 Jun 2024 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="P8ag3HXU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682740861;
	Fri, 21 Jun 2024 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972189; cv=none; b=UUMdRvAa0iVeAiFYO+oN4g4celKl/B6gWfADPlSDQppmqor+FTzGb8S0PYkD4mqHBEvtKMyLtBhaCJo7VBOUdu6cphHI8ixGs3nmo3InjP6SiPxzXnQpjvgyLiFNWuC/ArsMhCtmHdNyJYXPnRAPMgD8ojylexUDq16LJlJbUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972189; c=relaxed/simple;
	bh=32AGc2f52v8w1DM+MBmF/jrg+lSKr81lCYrxmg+Ywr0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c0jQ4sOBVErXNFc0HA74kREIbysaeFX8Zat9PD6CMYGNdwvMTScePcH1CtOoWax64dNAba0jdRKHGCo9TA/aS/Ei8FH3PwLpo5NSqvkZ2bd9N/hE8tnZ+8CberS7h2CxgzdaG0yU7AevxP7KzMdYt6pMZ74N16PlwyfgQnIG+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=P8ag3HXU; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718972187; x=1750508187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=32AGc2f52v8w1DM+MBmF/jrg+lSKr81lCYrxmg+Ywr0=;
  b=P8ag3HXUe6JmYgWSZ8UWMzsCPPJezaG1RQujWQDRomZOXkGCNozyIsvM
   P7zruimC0IETPoYu/ZLOQ2hk6wJ/JDDhN5/clxvUAYaYsPQEHq8UcffdT
   PB94eX60SBcS1K2yAo1KE2i0/R1gzxZ97ZZXSsZm14olVjxxdtLc3eEVz
   l4B3NXFSvnnLl5gckJ7o1N85Jq3UpTcK2BNjtU2shfRdq8akb3/0jEnvL
   u+uH9qsrzz52waL+YBbplP2sLB46tfCPpeBRLh30F00iQazZEJ3QZrx/c
   EG5wjoq5MIfaknuVN9VsJvijRPaHalJFrlZj6Lb+TMGwodA/SFgV8P9vN
   g==;
X-CSE-ConnectionGUID: gjF6r6nLSZ2qzzloD0+0Lw==
X-CSE-MsgGUID: L6RY1RI1Q0izexGUxY5xiA==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="28341530"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 05:16:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 05:16:05 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 21 Jun 2024 05:16:01 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v2 1/3] eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
Date: Fri, 21 Jun 2024 15:13:38 +0300
Message-ID: <20240621121340.114486-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621121340.114486-1-andrei.simion@microchip.com>
References: <20240621121340.114486-1-andrei.simion@microchip.com>
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
Added "atmel,24mac02e4", "atmel,24mac02e6" compatible for the usage w/
24AA025E{48, 64} type of EEPROMs.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v1 -> v2:
- no change
---
 drivers/misc/eeprom/at24.c | 73 ++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4bd4f32bcdab..8699a6c585c4 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -121,17 +121,19 @@ struct at24_chip_data {
 	u32 byte_len;
 	u8 flags;
 	u8 bank_addr_shift;
+	u8 adjoff;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 };
 
-#define AT24_CHIP_DATA(_name, _len, _flags)				\
+#define AT24_CHIP_DATA(_name, _len, _flags, _adjoff)			\
 	static const struct at24_chip_data _name = {			\
-		.byte_len = _len, .flags = _flags,			\
+		.byte_len = _len, .flags = _flags, .adjoff = _adjoff, \
 	}
 
-#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)		\
+#define AT24_CHIP_DATA_CB(_name, _len, _flags, _adjoff, _read_post)	\
 	static const struct at24_chip_data _name = {			\
 		.byte_len = _len, .flags = _flags,			\
+		.adjoff = _adjoff,					\
 		.read_post = _read_post,				\
 	}
 
@@ -162,53 +164,57 @@ static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
 }
 
 /* needs 8 addresses as A0-A2 are ignored */
-AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR);
+AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR, 0);
 /* old variants can't be handled with this generic entry! */
-AT24_CHIP_DATA(at24_data_24c01, 1024 / 8, 0);
+AT24_CHIP_DATA(at24_data_24c01, 1024 / 8, 0, 0);
 AT24_CHIP_DATA(at24_data_24cs01, 16,
-	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0);
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0, 0);
 AT24_CHIP_DATA(at24_data_24cs02, 16,
-	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
 AT24_CHIP_DATA(at24_data_24mac402, 48 / 8,
-	AT24_FLAG_MAC | AT24_FLAG_READONLY);
+	AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
 AT24_CHIP_DATA(at24_data_24mac602, 64 / 8,
-	AT24_FLAG_MAC | AT24_FLAG_READONLY);
+	AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
+AT24_CHIP_DATA(at24_data_24mac02e4, 48 / 8,
+	AT24_FLAG_MAC | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24mac02e6, 64 / 8,
+	AT24_FLAG_MAC | AT24_FLAG_READONLY, 0);
 /* spd is a 24c02 in memory DIMMs */
 AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
-	AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
+	AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0);
 /* 24c02_vaio is a 24c02 on some Sony laptops */
 AT24_CHIP_DATA_CB(at24_data_24c02_vaio, 2048 / 8,
-	AT24_FLAG_READONLY | AT24_FLAG_IRUGO,
+	AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0,
 	at24_read_post_vaio);
-AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0);
+AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0, 0);
 AT24_CHIP_DATA(at24_data_24cs04, 16,
-	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
 /* 24rf08 quirk is handled at i2c-core */
-AT24_CHIP_DATA(at24_data_24c08, 8192 / 8, 0);
+AT24_CHIP_DATA(at24_data_24c08, 8192 / 8, 0, 0);
 AT24_CHIP_DATA(at24_data_24cs08, 16,
-	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0);
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0, 0);
 AT24_CHIP_DATA(at24_data_24cs16, 16,
-	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16);
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16, 0);
 /* M24C32-D Additional Write lockable page (M24C32-D order codes) */
-AT24_CHIP_DATA(at24_data_24c32d_wlp, 32, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24c32d_wlp, 32, AT24_FLAG_ADDR16, 0);
 AT24_CHIP_DATA(at24_data_24cs32, 16,
-	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16);
+	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16, 0);
 /* M24C64-D Additional Write lockable page (M24C64-D order codes) */
-AT24_CHIP_DATA(at24_data_24c64d_wlp, 32, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24c64d_wlp, 32, AT24_FLAG_ADDR16, 0);
 AT24_CHIP_DATA(at24_data_24cs64, 16,
-	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
-AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
-AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
-AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
+	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16, 0);
 AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
-AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
 /* identical to 24c08 ? */
-AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
+AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0, 0);
 
 static const struct i2c_device_id at24_ids[] = {
 	{ "24c00",	(kernel_ulong_t)&at24_data_24c00 },
@@ -217,7 +223,9 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24c02",	(kernel_ulong_t)&at24_data_24c02 },
 	{ "24cs02",	(kernel_ulong_t)&at24_data_24cs02 },
 	{ "24mac402",	(kernel_ulong_t)&at24_data_24mac402 },
+	{ "24mac02e4",	(kernel_ulong_t)&at24_data_24mac02e4 },
 	{ "24mac602",	(kernel_ulong_t)&at24_data_24mac602 },
+	{ "24mac02e6",	(kernel_ulong_t)&at24_data_24mac02e6 },
 	{ "spd",	(kernel_ulong_t)&at24_data_spd },
 	{ "24c02-vaio",	(kernel_ulong_t)&at24_data_24c02_vaio },
 	{ "24c04",	(kernel_ulong_t)&at24_data_24c04 },
@@ -250,7 +258,9 @@ static const struct of_device_id __maybe_unused at24_of_match[] = {
 	{ .compatible = "atmel,24c02",		.data = &at24_data_24c02 },
 	{ .compatible = "atmel,24cs02",		.data = &at24_data_24cs02 },
 	{ .compatible = "atmel,24mac402",	.data = &at24_data_24mac402 },
+	{ .compatible = "atmel,24mac02e4",	.data = &at24_data_24mac02e4 },
 	{ .compatible = "atmel,24mac602",	.data = &at24_data_24mac602 },
+	{ .compatible = "atmel,24mac02e6",	.data = &at24_data_24mac02e6 },
 	{ .compatible = "atmel,spd",		.data = &at24_data_spd },
 	{ .compatible = "atmel,24c04",		.data = &at24_data_24c04 },
 	{ .compatible = "atmel,24cs04",		.data = &at24_data_24cs04 },
@@ -690,7 +700,8 @@ static int at24_probe(struct i2c_client *client)
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


