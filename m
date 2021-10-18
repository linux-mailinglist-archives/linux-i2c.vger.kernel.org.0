Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2634328B8
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 23:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhJRVDH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 17:03:07 -0400
Received: from fallback19.mail.ru ([185.5.136.251]:37592 "EHLO
        fallback19.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhJRVDG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Oct 2021 17:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=pJFd2bv5+j9JmLRuvjWb2f+Tp+W8R029BGbho62eBjY=;
        t=1634590853;x=1635196253; 
        b=W2qyQElj/17nyNik0ks/C4HoAf1IwPlsD0zhyVyhNVfWZFawUsBU/UMfvFy+GbHm9G0tExleeHDJM2LaPaufzNHNg+PWkLrIpIXWVQBrP2JM8DQJRsW+03rEjBSxPigc7E9SGLyL3kvuOCdfC5M2DvW5LLTT3iMMRlL8JQQfurs=;
Received: from [10.161.55.49] (port=44382 helo=smtpng1.i.mail.ru)
        by fallback19.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
        id 1mcZkU-0002KC-Il
        for linux-i2c@vger.kernel.org; Tue, 19 Oct 2021 00:00:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=pJFd2bv5+j9JmLRuvjWb2f+Tp+W8R029BGbho62eBjY=;
        t=1634590846;x=1635196246; 
        b=FFeOk4k5BX++VaKUFgvbltqCNHIp1U/1nqOk1RZiFc+U7UOSt+WWukOWQbpnNmSwujm4mt6LBIDK089eDKSe3SyFk4SKm/o/gBotUFAv+7RYV1nkV+G/wJCdUZ2bJ9hw8eCsC3LCsxmcRJd7cf2R2GWLAIQyLcfs93X/J1rw21TewVXyuuE948i0IDpat6a/0EcdUKfk0dfdh+o836RU4fUg4kSjw8bFAh50EBw3qMiBJwmDaU32WPtJoUA/miRQ2pvNWrcfv3jleXpHMIkUXQWMfNGy74lMoTDmvcNxSS7lBzB/r68F2qK1Gi3WbocimZRJdPkPjb1sIkNOLpiJ2A==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
        id 1mcZkR-0002Jy-Nz; Tue, 19 Oct 2021 00:00:44 +0300
From:   Maxim Kochetkov <fido_max@inbox.ru>
To:     linux-i2c@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, arnd@arndb.de,
        =gregkh@linuxfoundation.org, Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH] eeprom: at24: Add support for 24c1025 EEPROM
Date:   Tue, 19 Oct 2021 00:00:39 +0300
Message-Id: <20211018210039.129110-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9C7814344C8C501C83E7F929BE7EA671116302D09E268010D182A05F538085040A83CBD68C8D402598D3B8C11D64163D4D6A2679A43C2FF863B3E2D1081142CA1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D78D3A378738F99DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375B4C42A189C515578638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B853E77CE9278C8E80B046EE7BD69A366F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7E688A9D963DC14319FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD186FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E57F4578A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C1FF8B889CA56178043847C11F186F3C59DAA53EE0834AAEE
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505C43183CC1306A8A3310129D85B93983E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CDA625C6CE8BBA1B9417AF489D09622C36F814E4DB1D3807D9C2B6934AE262D3EE7EAB7254005DCEDB83465427F80716C1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B03031C89702B531498E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34023CA4E4726A7D6C2F664CD723433F07493E1B34FBFBA040E8B95FDE25F0419F06B1AF3D15ECCA741D7E09C32AA3244C3C238F077587431B8678B6D9D0230869858039643087248083B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojdoGz0x3r2Xs+MzVmyhBa7w==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D9E403F0FBEF62170F1F0EADE397898EA98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888E0D4ABDE8C577C2ED
X-Mras: Ok
X-7564579A: EEAE043A70213CC8
X-77F55803: 6242723A09DB00B4B5FEEBF5E158233565A124FF1A8161D95B25C1448CD93B0968F3CF0E9FE49B69C58BD02A5A35644039AE529547B04E2102DF08BC46813BD940B341C5B6F5F12E
X-7FA49CB5: 0D63561A33F958A567CBE058F7BEB753C72739702DC7EF7A3EDA8A2977564573CACD7DF95DA8FC8BD5E8D9A59859A8B634143DAF28A1E3E7CC7F00164DA146DAFE8445B8C89999728AA50765F79006378C85D253A8FF80DC9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C39E33AB2AC23AC9D7CC7F00164DA146DA6F5DAA56C3B73B23C77107234E2CFBA522CA9DD8327EE493B89ED3C7A62817812B32DCB92A8600C6C4224003CC83647689D4C264860C145E
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505C43183CC1306A8A3BF55D55D28FA3C63
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CDA625C6CE8BBA1B9E5B2B23C9547AC309A8F5933C267A1379C2B6934AE262D3EE7EAB7254005DCEDB83465427F80716C699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojdoGz0x3r2XsbHc7jgUZX3w==
X-Mailru-MI: 1000000000800
X-Mailru-Sender: A5480F10D64C900538CFDDA562D7B4DA26CFBB5746733F41E9CC35FBA5E601E4B2B917E718C14AA9C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
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
index 305ffad131a2..6543ff6536aa 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -96,6 +96,7 @@ struct at24_data {
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us, and we'll use them with SMBus calls.
 	 */
+	u8 bank_addr_shift;
 	struct at24_client client[];
 };
 
@@ -123,6 +124,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
 struct at24_chip_data {
 	u32 byte_len;
 	u8 flags;
+	u8 bank_addr_shift;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 };
 
@@ -137,6 +139,12 @@ struct at24_chip_data {
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
@@ -197,6 +205,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
 AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
 /* identical to 24c08 ? */
 AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
@@ -225,6 +234,7 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
 	{ "24c512",	(kernel_ulong_t)&at24_data_24c512 },
 	{ "24c1024",	(kernel_ulong_t)&at24_data_24c1024 },
+	{ "24c1025",	(kernel_ulong_t)&at24_data_24c1025 },
 	{ "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
 	{ "at24",	0 },
 	{ /* END OF LIST */ }
@@ -254,6 +264,7 @@ static const struct of_device_id at24_of_match[] = {
 	{ .compatible = "atmel,24c256",		.data = &at24_data_24c256 },
 	{ .compatible = "atmel,24c512",		.data = &at24_data_24c512 },
 	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
+	{ .compatible = "atmel,24c1025",	.data = &at24_data_24c1025 },
 	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
 	{ /* END OF LIST */ },
 };
@@ -548,7 +559,8 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
 	dev = &base_client->dev;
 
 	dummy_client = devm_i2c_new_dummy_device(dev, base_client->adapter,
-						 base_client->addr + index);
+						 base_client->addr +
+						 (index << at24->bank_addr_shift));
 	if (IS_ERR(dummy_client))
 		return PTR_ERR(dummy_client);
 
@@ -689,6 +701,7 @@ static int at24_probe(struct i2c_client *client)
 	at24->page_size = page_size;
 	at24->flags = flags;
 	at24->read_post = cdata->read_post;
+	at24->bank_addr_shift = cdata->bank_addr_shift;
 	at24->num_addresses = num_addresses;
 	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
 	at24->client[0].client = client;
-- 
2.32.0

