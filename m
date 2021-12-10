Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803084708A5
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 19:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245312AbhLJS36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 13:29:58 -0500
Received: from fallback19.mail.ru ([185.5.136.251]:48374 "EHLO
        fallback19.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbhLJS36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 13:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=xiujrJVmX28PG/aTOYX4KR58xtb40B4mqo7ZDNe56+U=;
        t=1639160783;x=1639766183; 
        b=k5V9EIf+2cjG1uUd0sjL7HZ/RAX/tIhf7Nd1nZPDvQYe0+OTjqWfZAx4YPhQ+nHv90DOiThiYYgubRsrFgOx6ZOS/yROeVpc6iU7HmAb+6Tu9/Fr/VsbaFh3P9UH1987PrpDJcTCzHDwGWogK2cwXvdELRd2HqDiR01+zW5yBwg=;
Received: from [10.161.55.49] (port=52692 helo=smtpng1.i.mail.ru)
        by fallback19.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
        id 1mvkb7-0007om-Ds
        for linux-i2c@vger.kernel.org; Fri, 10 Dec 2021 21:26:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=xiujrJVmX28PG/aTOYX4KR58xtb40B4mqo7ZDNe56+U=;
        t=1639160781;x=1639766181; 
        b=gDYTBTqon3Ec3VCEQ7Ir9pNeDFO0atT+mfJ8BtvLlYh8t1NDBUT1dmnW04yTYWke1ZwUfx4boHO5lwy6o8oCve0n5LPJqJdzLD0Kjf398Os6JoOVruLy29/dubewozAQEBPEyKsHwwuZWXvbsh9U+6233ip8BzZvpc58CnDcagOABazWVX56NGwEQ10b9zrbNqMeXB03BjihcH6ubmfcr/VoJ7J1gfE4jWLX5F3GxNrO4lPn4IO8WniEX+Vwk7jcFUNRWFfd3OHvSdh26s4CxCo02VYmY6M2YnB0qsMwUZmuUnSt+J0OoQX/PXdOXk9oPWiS0EVRBVNdinu9isdr+w==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
        id 1mvkb5-0005jP-Ou; Fri, 10 Dec 2021 21:26:20 +0300
From:   Maxim Kochetkov <fido_max@inbox.ru>
To:     linux-i2c@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, brgl@bgdev.pl, arnd@arndb.de,
        gregkh@linuxfoundation.org, Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH v3 1/2] eeprom: at24: Add support for 24c1025 EEPROM
Date:   Fri, 10 Dec 2021 21:26:03 +0300
Message-Id: <20211210182604.14288-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211210182604.14288-1-fido_max@inbox.ru>
References: <20211210182604.14288-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9FFF274446F725B74A0A66A77131E9218A37C9B025F167FE8182A05F5380850403A6C28BE3DC80E7299EEF5E3B074F4ECC058511B15E9469C0177F1BC297A6BFB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7612B7ED227D9C0F5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B2BC59D094D41B978638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89EF6AF9C15C2D104BB87922DC2A59FF76F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73D04F0695778128A9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18BDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BC908CD1B87A134A2A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C289736CE4F78F08343847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C644EC96CB38521141895462A15166711AB6708766FA16C519C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFA50BD5087FBFCDAA699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343FB425EC7F4D4A4BD3BD509C35396103E416C336EA0C4FE5289203F299C4E20889E7E1CC018B11181D7E09C32AA3244C554AAB5C87FC67FDD4043F68ED31304F8A6D4CC6FBFAC2518D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojAtZOFKWMnjDNSLv5LF+T3Q==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D506F1E94B0305C865D4EA428D9A0CC4298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4C456381A22064F8E4D2CF43611C06B13EA8B4172942737F7049FFFDB7839CE9E13D5095B00E522FDB42C166B7D8F86521201B05C21256941599522C6A55D883E
X-7FA49CB5: 0D63561A33F958A5EF8AD62DFC4627FA96EA16FD050494ECA46EA568552DEC0ECACD7DF95DA8FC8BD5E8D9A59859A8B697E92A89321C69D7CC7F00164DA146DAFE8445B8C89999728AA50765F79006378C85D253A8FF80DC9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C39E33AB2AC23AC9D7CC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE4930A3850AC1BE2E7356436AE5DD6441DC7C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C644EC96CB3852114AA73E14C2AFB92B9FB0F964EAEF35DDA9C2B6934AE262D3EE7EAB7254005DCED8DA55E71E02F9FC08E8E86DC7131B365E7726E8460B7C23C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojAtZOFKWMnjCT3UHS/d+U4g==
X-Mailru-MI: 800
X-Mras: Ok
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Microchip EEPROM 24xx1025 is like a 24c1024. The only difference
between them is that the I2C address bit used to select between the
two banks is bit 2 for the 1025 and not bit 0 as in the 1024.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 drivers/misc/eeprom/at24.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4d91c71c42cd..633e1cf08d6e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -91,6 +91,7 @@ struct at24_data {
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us.
 	 */
+	u8 bank_addr_shift;
 	struct regmap *client_regmaps[];
 };
 
@@ -118,6 +119,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
 struct at24_chip_data {
 	u32 byte_len;
 	u8 flags;
+	u8 bank_addr_shift;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 };
 
@@ -132,6 +134,12 @@ struct at24_chip_data {
 		.read_post = _read_post,				\
 	}
 
+#define AT24_CHIP_DATA_BS(_name, _len, _flags, _bank_addr_shift)	\
+	static const struct at24_chip_data _name = {			\
+		.byte_len = _len, .flags = _flags,			\
+		.bank_addr_shift = _bank_addr_shift			\
+	}
+
 static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
 {
 	int i;
@@ -192,6 +200,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
 AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
 /* identical to 24c08 ? */
 AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
@@ -220,6 +229,7 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
 	{ "24c512",	(kernel_ulong_t)&at24_data_24c512 },
 	{ "24c1024",	(kernel_ulong_t)&at24_data_24c1024 },
+	{ "24c1025",	(kernel_ulong_t)&at24_data_24c1025 },
 	{ "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
 	{ "at24",	0 },
 	{ /* END OF LIST */ }
@@ -249,6 +259,7 @@ static const struct of_device_id at24_of_match[] = {
 	{ .compatible = "atmel,24c256",		.data = &at24_data_24c256 },
 	{ .compatible = "atmel,24c512",		.data = &at24_data_24c512 },
 	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
+	{ .compatible = "atmel,24c1025",	.data = &at24_data_24c1025 },
 	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
 	{ /* END OF LIST */ },
 };
@@ -533,7 +544,8 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
 
 	dummy_client = devm_i2c_new_dummy_device(&base_client->dev,
 						 base_client->adapter,
-						 base_client->addr + index);
+						 base_client->addr +
+						 (index << at24->bank_addr_shift));
 	if (IS_ERR(dummy_client))
 		return PTR_ERR(dummy_client);
 
@@ -674,6 +686,7 @@ static int at24_probe(struct i2c_client *client)
 	at24->page_size = page_size;
 	at24->flags = flags;
 	at24->read_post = cdata->read_post;
+	at24->bank_addr_shift = cdata->bank_addr_shift;
 	at24->num_addresses = num_addresses;
 	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
 	at24->client_regmaps[0] = regmap;
-- 
2.32.0

