Return-Path: <linux-i2c+bounces-4107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C43EE90E476
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 09:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50B9A1F22FA3
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 07:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1690013FD95;
	Wed, 19 Jun 2024 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ixHy4W/e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FD13D525;
	Wed, 19 Jun 2024 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781815; cv=none; b=YWCf3aR10i1K3yvHphoETNylaR82PLoLJbHFtGbnvi9qZ6C83fL5hA/vAZlW9bLnokEibXeoirDa1Wb0PdfDQAOpvY+xSvHYlgibtkFCsOJPnHgOOJr4O34tVGb801qrEcwMmgDzDWPA+XPwXIoG1Tody3iQGJqQ1jPhh0mR76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781815; c=relaxed/simple;
	bh=fqaivpLVUYPqyhOF2jg3SFodzPDaRZd2i2dgt24Ws6w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yw50PNm/5bHAMdhoV42rnTwTuvsbadKcimhGaujxafOgiar9JkVbDlNZp7kXhuM/tvUaynAF3erZmX0TKagprMSL7gmestCntK8bhgJZX/lfNDKCHY7pG1Y15kLTN+eX1bp84eQuePqCRBrsh3uG49FpCbXl7U5Pnzn4CTBPaOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ixHy4W/e; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718781813; x=1750317813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fqaivpLVUYPqyhOF2jg3SFodzPDaRZd2i2dgt24Ws6w=;
  b=ixHy4W/eIqc4LvV5alTfRHUt4uPNhto/i7eUTnq1bnpTOnmiNsaogaWu
   HVZBKNAajPfk13ev8iQOw4VmvT8qRkHTxyFf27EtcnK+YLMpGJZAwLZHP
   9pF+Vn5+QjBArR+93RkwEzTyDTj4/HQOkA48lfAI0sTvYU68gMdqZM/4y
   KaPDvXFE7CYtvlkSPV951mjoFvxVUizcMT7aV3enT/AWQGfItxNzl6lZc
   4OkAn6hVp6kAaoSoKenGdcSxT9fVqWdYVaM/xTHJrNj07h0qa7mF9VLQZ
   m+Tn++R5Zyy2juVz8nYguUsOk3k1+/RKdAvgrsQhuF1RrARVEwthPo4ki
   g==;
X-CSE-ConnectionGUID: Nru8q+MHQyC2PaLNcFE7ig==
X-CSE-MsgGUID: GcSQHuCsR36LLSwyAY1N8g==
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="30691795"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2024 00:23:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 19 Jun 2024 00:23:02 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 19 Jun 2024 00:22:58 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 1/3] eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
Date: Wed, 19 Jun 2024 10:22:29 +0300
Message-ID: <20240619072231.6876-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619072231.6876-1-andrei.simion@microchip.com>
References: <20240619072231.6876-1-andrei.simion@microchip.com>
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


