Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB72467FFB
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 23:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357762AbhLCWlL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 17:41:11 -0500
Received: from fallback13.mail.ru ([94.100.179.30]:40730 "EHLO
        fallback13.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239197AbhLCWlL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 17:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=I5LtubrEG5s4TYU2kTnkBRYDq+XTWS505dsJiKqLpZI=;
        t=1638571066;x=1639176466; 
        b=WUY+1+OABWsvENBta3ThQXsL5EcZjZQQSR90iBHzZxZJVxlagIb4t6Ck1kDmN2iDkj/l/XDksBlvBALODtPh4WZg6w13VqAjatQ6jENPGVCOUhB6DgiLn5TTw1WunYsJSEBkwm3hBmLTlyfN8Xfq7s1H9UP5GrDy6NCGeMS50fc=;
Received: from [10.161.55.49] (port=46204 helo=smtpng1.i.mail.ru)
        by fallback13.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
        id 1mtHBZ-0007P8-10
        for linux-i2c@vger.kernel.org; Sat, 04 Dec 2021 01:37:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=I5LtubrEG5s4TYU2kTnkBRYDq+XTWS505dsJiKqLpZI=;
        t=1638571065;x=1639176465; 
        b=AO0b2dx7g9e07ZD6t2JR3qx/5yqBxUA0I0sNmAb/IGkVAqOalddO3d57+5miQL38Y2nlcAWwdCNGx4dm4i0GS6oEqtbw2WeaFo2QGpKhEPwxw3OH2GMzePzaz0IVfg11TpE3GGlht5dq6v/YEpo39Ju+z11yogPBhlNJzpg5onTpUeSkTg+TfLKUsRZKXCwV6lKmHtZDLsM3R+dMJa3XnKIu9zT74AtMGbrne/6GX5vGcS9+q3kyQfJmdRaa4VBxkiO28bXLsvbWt1OMPTc7poYZw386/4muFFmcFOqNYmWf2zeacrV7hhYxxOILECzy4AtemdsXRP8SqQ19Pse0kg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
        id 1mtHBV-0003nQ-O2; Sat, 04 Dec 2021 01:37:42 +0300
From:   Maxim Kochetkov <fido_max@inbox.ru>
To:     linux-i2c@vger.kernel.org
Cc:     brgl@bgdev.pl, arnd@arndb.de, gregkh@linuxfoundation.org,
        Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH v2] eeprom: at24: Add support for 24c1025 EEPROM
Date:   Sat,  4 Dec 2021 01:37:27 +0300
Message-Id: <20211203223727.62984-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD93822B471089FF64DD66F0DCF3C6A542BB40DB65F7CC9F54B182A05F538085040FC7737AA95DB9070E4F77F7016F11172D248FF3051E3270AF2B1679F72491240
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE796AEF990C7BF66FEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371A00CE7BDCE207EB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E13BF256A0BED3D992ED5F49BFFFCADD6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18BDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B5FC25ED3FCEC3375A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C1116EF429256F3B4B66020DEC1910EA5A5B3EBAE8B9CF3989C2B6934AE262D3EE7EAB7254005DCEDB83465427F80716C1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B07419594F9A2A96BC8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34E420FF71F2F0FE03B1868F8449E972E742EC56D7A9C7B25648C1FA3476534FCE5420CCAB2CED5CB21D7E09C32AA3244CE11EC23BF2B9B049EB7394C9B3A8049F97FE24653F78E66883B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj+/8mdklYaih4nSy1NXq5aw==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5DADA10CE72E63BB5DFF14EE374F7C909A98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4297D9AD4AAE60BCB73DCF6C1D8861912F74A2EB9F1CABBAB049FFFDB7839CE9E32D4B1194ABA140EAA1C388AF3E34D8D55E186A9A8040FB52556D2C24CC1DF84
X-7FA49CB5: 0D63561A33F958A5A4A3862E2ED49AFA20E68793913744EEE4EA174A10F74ED0CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F79006371E900BC921822949389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8FE0D02E6309259D2F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE732FCE54C4D9A645443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C1116EF429256F3B4315F3297C6F8B04C86476DF97B280EA39C2B6934AE262D3EE7EAB7254005DCEDB83465427F80716C699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj+/8mdklYaiieFzf7coLeLQ==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C900538CFDDA562D7B4DA5E17DCAD9AEE86635404732BB682CF51320BC0D0EC90CEB8C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CC77752E0C033A69E3453F38A29522196
X-Mras: Ok
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Microchip EEPROM 24xx1025 is like a 24c1024. The only difference
between them is that the I2C address bit used to select between the
two banks is bit 2 for the 1025 and not bit 0 as in the 1024.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
v2: rebased on git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/at24/for-next

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

