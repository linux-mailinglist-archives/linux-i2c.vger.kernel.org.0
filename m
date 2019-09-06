Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45AD8ABB86
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 16:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732554AbfIFOzM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 10:55:12 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:38592 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731628AbfIFOzM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Sep 2019 10:55:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id D67F31851D;
        Fri,  6 Sep 2019 16:55:09 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id y9n2jTcpxYFy; Fri,  6 Sep 2019 16:55:07 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
        by bastet.se.axis.com (Postfix) with ESMTPS id 974E71851E;
        Fri,  6 Sep 2019 16:55:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 85FCE1E06C;
        Fri,  6 Sep 2019 16:55:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 79FAA1E060;
        Fri,  6 Sep 2019 16:55:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
        by boulder03.se.axis.com (Postfix) with ESMTP;
        Fri,  6 Sep 2019 16:55:07 +0200 (CEST)
Received: from lnxbjornar3.se.axis.com (lnxbjornar3.se.axis.com [10.88.24.4])
        by thoth.se.axis.com (Postfix) with ESMTP id 6DAEC252D;
        Fri,  6 Sep 2019 16:55:07 +0200 (CEST)
Received: by lnxbjornar3.se.axis.com (Postfix, from userid 9651)
        id 6BBBBC4369; Fri,  6 Sep 2019 16:55:07 +0200 (CEST)
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjornar@axis.com>
Subject: [PATCH] i2c: slave-eeprom: Make it possible to pre-load eeprom data
Date:   Fri,  6 Sep 2019 16:55:06 +0200
Message-Id: <1567781706-2191-1-git-send-email-bjorn.ardo@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the slave eeprom has a "firmware-name" in devicetree, then
pre-load the data in the eeprom with this file.

Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index db9763c..40e7d48 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -120,6 +121,21 @@ static ssize_t i2c_slave_eeprom_bin_write(struct file *filp, struct kobject *kob
 	return count;
 }
 
+static int i2c_slave_preload_eeprom_data(struct eeprom_data *eeprom, struct i2c_client *client, unsigned int size)
+{
+	if (client->dev.of_node) {
+		const struct firmware *fw;
+		const char *eeprom_data;
+		if (!of_property_read_string(client->dev.of_node, "firmware-name", &eeprom_data)) {
+			int ret = request_firmware_into_buf(&fw, eeprom_data, &client->dev, eeprom->buffer, size);
+			if (ret)
+				return ret;
+			release_firmware(fw);
+		}
+	}
+	return 0;
+}
+
 static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct eeprom_data *eeprom;
@@ -138,6 +154,10 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_de
 	spin_lock_init(&eeprom->buffer_lock);
 	i2c_set_clientdata(client, eeprom);
 
+	ret = i2c_slave_preload_eeprom_data(eeprom, client, size);
+	if (ret)
+		return ret;
+
 	sysfs_bin_attr_init(&eeprom->bin);
 	eeprom->bin.attr.name = "slave-eeprom";
 	eeprom->bin.attr.mode = S_IRUSR | S_IWUSR;
-- 
2.1.4

