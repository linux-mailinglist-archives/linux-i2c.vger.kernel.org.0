Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01FE1B731A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 13:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDXLak (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 07:30:40 -0400
Received: from smtp2.axis.com ([195.60.68.18]:3661 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbgDXLak (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 07:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1906; q=dns/txt; s=axis-central1;
  t=1587727839; x=1619263839;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tamrexV4OWrlM7Wl4jj2JSBcp9yOh7DTXPmsR1xB0mo=;
  b=Sonq2jpcP53RohE8nnFQ4TA8vIgj/OFxcT/0YEfm37W08r7Z8VvrCfK+
   Z3Vk/Hc/IDsq3UmExeTNPwOa2POVQGxBKQCZZgqYzopWe5exlIlYV9UXP
   8Ze8JSzuUwMRTqKJPg3yp9X4DhRm03orAYC2/7AmTfKXAyabIhk6Urt3F
   I9CljPE74J5W0MxVcOE0vrAmsAsj/vxuXsxuKffOGBfOgV8Ye9zC3umR6
   qH8KdVLP1l4Kxm/3ScbJce9JceEwEQqhIRrkhZhLIzDU9A5CR3eAzmoZb
   71xRLVZk/TiaaQgoi3wvKoA8xHfZ/nf69NiUetIRgEmmZbmfgJiT5S+p4
   w==;
IronPort-SDR: QBW1UsdwJkdX+L6Q3IBWBKo85vacTqeOzOe9md8XEA23dlWnx7Hv5J2W6na8r+MnJND6yWa00K
 vpV0S2VYIyYRnuVMmQJNJmFeblA6OCoQxVY9V/DJMG780HWLJBd3dPiG1Tw2u+0AJqEfjATqOk
 /S+ymLYZgbDU8IurBqJuI4yWoA3ZfTlIOnhxkGnCu4TNDMJ6S1Klj1uh4senzbHJ7y9uum6qGT
 mNz32U0YmYJdXAtcfopsp85P9grV/G0nUo7+8I8O7jgocqN4U6QMwB30eBrKww1ZlqPI9lXxQc
 LxM=
X-IronPort-AV: E=Sophos;i="5.73,311,1583190000"; 
   d="scan'208";a="7791894"
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patrick@stwcx.xyz>, <kernel@axis.com>,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
Subject: [PATCHv3] i2c: slave-eeprom: Make it possible to pre-load eeprom data
Date:   Fri, 24 Apr 2020 13:30:36 +0200
Message-ID: <20200424113036.15109-1-bjorn.ardo@axis.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the slave eeprom has a "firmware-name" in devicetree, then
pre-load the data in the eeprom with this file. Otherwise we
init the eeprom with 0xFF.

Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index cb415b10642f..b425cefea92c 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -120,6 +121,26 @@ static ssize_t i2c_slave_eeprom_bin_write(struct file *filp, struct kobject *kob
 	return count;
 }
 
+static int i2c_slave_init_eeprom_data(struct eeprom_data *eeprom, struct i2c_client *client,
+					 unsigned int size)
+{
+	const struct firmware *fw;
+	const char *eeprom_data;
+	int error = device_property_read_string(&client->dev, "firmware-name", &eeprom_data);
+
+	if (!error) {
+		error = request_firmware_into_buf(&fw, eeprom_data, &client->dev,
+						  eeprom->buffer, size);
+		if (error)
+			return error;
+		release_firmware(fw);
+	} else {
+		/* An empty eeprom typically has all bits set to 1 */
+		memset(eeprom->buffer, 0xFF, size);
+	}
+	return 0;
+}
+
 static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct eeprom_data *eeprom;
@@ -138,6 +159,10 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_de
 	spin_lock_init(&eeprom->buffer_lock);
 	i2c_set_clientdata(client, eeprom);
 
+	ret = i2c_slave_init_eeprom_data(eeprom, client, size);
+	if (ret)
+		return ret;
+
 	sysfs_bin_attr_init(&eeprom->bin);
 	eeprom->bin.attr.name = "slave-eeprom";
 	eeprom->bin.attr.mode = S_IRUSR | S_IWUSR;
-- 
2.11.0

