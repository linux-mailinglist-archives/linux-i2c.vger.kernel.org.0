Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCF8352AF9
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Apr 2021 15:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhDBNYn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Apr 2021 09:24:43 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19126 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhDBNYm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Apr 2021 09:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617369882; x=1648905882;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0o1E0dCka4cz+rXzrNVK6QtPuhaEDROb8UjQR+7kVCY=;
  b=1ul0nRmYEZ1yQYl+RrweKRgfbhff6vp03liKFxpNLNPWgf7wIfReas87
   mmtEE4fBFHj/wdonSVku2cnvkpq1mGj8mTpooygu556rMBhRpyLgKE3Od
   hcMhg01WkZZPTRsb3q7eK67tB4SLaXlXE2r3Grc3xeuLZMxEc27CxENbe
   VexIERhTwM/yUFhmKvdLbpgI8t1dUs9GQG1NB9qcfWuy81MWUOlXgUHff
   OVAGJIPoVkdfHFzV+0sY+tiLOlAc+Ezs/22XOyExQccsRHjPctx27RCjW
   6KofFVg1KwzqSnfsROTtHLA0LbM2UVjDCwDnKpA4vTvOoXtsEAufN059L
   A==;
IronPort-SDR: dvukUBEbEmWHIxifWr30gdjvMVGs6v79bSa4z7dJ4LdVy8yayJk7HdzI5CbGLp10tMt6xFQrA1
 A63qDze+2t/XyF4qUUAhIKy/bY/MGwng8E5c8vx7JYo+gNcuXq+bwlsYOObegWnPKTWIruKf0o
 KmqJPcRVQ2cbilGiemTidYUtxhINAt4FBXp6TfQSWMQrrLtGtMONNdRAdxiyvGXjU7+VZ5IvM7
 1wAN9hsnw4t5wmYtQpxCQ740v85xHI1yXHW0tg0BCP0Ym1Y2SqUaqXhBJppu8omGc6YRwDfm/i
 gEE=
X-IronPort-AV: E=Sophos;i="5.81,299,1610434800"; 
   d="scan'208";a="115113508"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Apr 2021 06:24:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Apr 2021 06:24:40 -0700
Received: from rob-dk-mpu01.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Apr 2021 06:24:39 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <bgolaszewski@baylibre.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Claudiu Beznea" <claudiu.beznea@microchip.com>
Subject: [PATCH] eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
Date:   Fri, 2 Apr 2021 16:24:31 +0300
Message-ID: <20210402132431.3590-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some EEPROMs could be used only for MAC storage. In this case the
EEPROM areas where MACs resides could be modeled as NVMEM cells
(directly via DT bindings) such that the already available networking
infrastructure to read properly the MAC addresses (via
of_get_mac_address()). Add "atmel,24mac02e4", "atmel,24mac02e4"
compatible for the usage w/ 24AA025E{48, 64} type of EEPROMs and adapt
the driver to not do offset adjustments.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---

Hi Bartosz,

For the previously available compatibles the offset adjustment is done
(probably for compatibility w/ old DT bindings?). In my scenario 24AA025E48
is used in setup with macb driver which is calling of_get_mac_address()
to get the proper NVMEM cell in EEPROM where the MAC resides and read
directly from there. We modeled the EEPROM and NVMEM cell in DT as
follows:

&i2cnode {
	// ...
	eeprom0: eeprom0@52 {
		compatible = "atmel,24mac02e4";
		#address-cells = <1>;
		#size-cells = <0>;
		reg = <0x52>;
		pagesize = <16>;
		size = <256>;
		status = "okay";

		eeprom0_eui48: eui48@fa {
			reg = <0xfa 0x6>;
		};
	};
};

&gmac {
	// ...

	nvmem-cells = <&eeprom0_eui48>;
	nvmem-cell-names = "mac-address";

	// ...
};


Let me know if some other approach needs to be taken into account in
at24 driver for this to work.

Thank you,
Claudiu Beznea

 drivers/misc/eeprom/at24.c | 69 ++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 926408b41270..ae2fbcb5e83d 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -123,17 +123,19 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
 struct at24_chip_data {
 	u32 byte_len;
 	u8 flags;
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
 
@@ -158,48 +160,52 @@ static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
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
 AT24_CHIP_DATA(at24_data_24cs32, 16,
-	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16);
+	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16, 0);
 AT24_CHIP_DATA(at24_data_24cs64, 16,
-	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
-AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
-AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
-AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
-AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
-AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
+	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
+AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16, 0);
+AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16, 0);
 /* identical to 24c08 ? */
-AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
+AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0, 0);
 
 static const struct i2c_device_id at24_ids[] = {
 	{ "24c00",	(kernel_ulong_t)&at24_data_24c00 },
@@ -208,7 +214,9 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24c02",	(kernel_ulong_t)&at24_data_24c02 },
 	{ "24cs02",	(kernel_ulong_t)&at24_data_24cs02 },
 	{ "24mac402",	(kernel_ulong_t)&at24_data_24mac402 },
+	{ "24mac02e4",	(kernel_ulong_t)&at24_data_24mac02e4 },
 	{ "24mac602",	(kernel_ulong_t)&at24_data_24mac602 },
+	{ "24mac02e6",	(kernel_ulong_t)&at24_data_24mac02e6 },
 	{ "spd",	(kernel_ulong_t)&at24_data_spd },
 	{ "24c02-vaio",	(kernel_ulong_t)&at24_data_24c02_vaio },
 	{ "24c04",	(kernel_ulong_t)&at24_data_24c04 },
@@ -238,7 +246,9 @@ static const struct of_device_id at24_of_match[] = {
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
 	at24->flags = flags;
 	at24->read_post = cdata->read_post;
 	at24->num_addresses = num_addresses;
-	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
+	at24->offset_adj = cdata->adjoff ?
+				at24_get_offset_adj(flags, byte_len) : 0;
 	at24->client[0].client = client;
 	at24->client[0].regmap = regmap;
 
-- 
2.25.1

