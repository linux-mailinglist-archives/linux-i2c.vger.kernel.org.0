Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215A61B703C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 11:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgDXJEy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 05:04:54 -0400
Received: from smtp1.axis.com ([195.60.68.17]:52298 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbgDXJEy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 05:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1904; q=dns/txt; s=axis-central1;
  t=1587719093; x=1619255093;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=70cNaleQBuotCNkK8rmICCDbJxOX7LvKnQKaCxK4uvA=;
  b=n/a9sOUFpoGN+0+wWIvVtCqBl6q2DS0sZS6Mh2Z9lVs9cNnkKUnS7h+v
   xCqA0zmkL1emJahV1bg4s1Hlw2zdGaFa7TcWEZgZSH65+amYJN+JNJKcb
   H6ZpLaiZFQBbSK9KFk/Vr3Fn2XAg5DkukL4L5sqJPsvHTMGT5ZiKABEj4
   g4hYP+d3G2mh3fp26bC/7v+zZbS6tKaayQMqB1QUyJVhxAaseqJHfw0fw
   GS0oeug7HJjPyKYW5417wBKlC/fkJ3zJLVjOrPIYlbrtN2pkQOywqZ5W6
   ztT15ncR5K8+gRbZ8wsD81LIatkrvA4/x1bQfRvK/m3NK/C8p16Ir/g+3
   w==;
IronPort-SDR: BzCknZINTOGbvei7u2zUeV64HeYk4hSzNoM7HiT5HpGsNd05mREVG/foxcMeIXJre4m6taSQNp
 JjI1qs1cBZs/y8lGpZ+ynOhE4FurXF7WXsintrMuwq3fuMZfySyleiLttCpEIzCvvjR42G8RW3
 wyh4oQiZ0mHj4wv2ULPiir92P9kNMR6EWPonVYa8wXsSBS7BW61FfDFLBK+w0J4X0rDbWOMztL
 B5cbTxuSXLGuVoicXdjXMXvvVDqnNzloA9rMnch8js2/Afz0E0wiKJSAeZVotrXuvXQwdwTRXF
 QyM=
X-IronPort-AV: E=Sophos;i="5.73,311,1583190000"; 
   d="scan'208";a="7992438"
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patrick@stwcx.xyz>, <kernel@axis.com>,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
Subject: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom data
Date:   Fri, 24 Apr 2020 11:04:43 +0200
Message-ID: <20200424090443.26316-1-bjorn.ardo@axis.com>
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
index cb415b10642f..c846c96c25c9 100644
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
+		int ret = request_firmware_into_buf(&fw, eeprom_data, &client->dev,
+						    eeprom->buffer, size);
+		if (ret)
+			return ret;
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

