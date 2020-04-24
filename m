Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D48D1B7313
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 13:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgDXL3n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 07:29:43 -0400
Received: from smtp2.axis.com ([195.60.68.18]:3585 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgDXL3n (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 07:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1906; q=dns/txt; s=axis-central1;
  t=1587727782; x=1619263782;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tamrexV4OWrlM7Wl4jj2JSBcp9yOh7DTXPmsR1xB0mo=;
  b=M4QdAJQ7maaVZhblMFSKK4r70RFyVkMxx/GAT2aJ9yIjhh1YdH1aDFo2
   mPe2v3C22CH/YX0EdU0WX8cCmA9smVFVbXOmcJgYqQsehDpgsShSb1L3s
   CMJcVgIt6evAbaNHRhto45EvxmgeBYTUEQF10DlBVbL/1RHOroPeKneDE
   B0wt5VZBxLuAmT3rvT/4c5JVGOF0GWe9BbIdBkq9s259NhzRkhEzWezga
   MR+e2JQbGjigKZQsElTNwh026nCT4T/lH5CueO/YrmTEeQUq/qciioJ37
   BK/g7p+if2Q2weTBtlL9MU2gW2nfCsc21QhvXELP1gFyfMI7IkscTv1fU
   Q==;
IronPort-SDR: HzM2mCa5UxWKURCAU4aMMQzj9ERLDXczVo/AyvdLFshb70DfkK/iiFPatBqf89xzDhDFkyKgYZ
 OAzecIYfJPkdDyW7jgVODjPEdj1vDuIUtSF68FaYifdVItnwbK6yEcREu+Yd1BcsuZLOPwsXUe
 UvGPW5vubwjpMEzaduvEcVrGsw7fdSsrLAdH1cZ5wJkO78EnpMilIDAlfLFtlEbbLg/gNlmlzS
 1hdqTVQ8uzuNkpOdKYmMPdXGjL1lj1oXsyPVlMrSrKIXHIbE9Zv/pNrW0PlXrDc/2q4n5huCQ1
 YjI=
X-IronPort-AV: E=Sophos;i="5.73,311,1583190000"; 
   d="scan'208";a="7791806"
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patrick@stwcx.xyz>, <kernel@axis.com>,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
Subject: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom data
Date:   Fri, 24 Apr 2020 13:29:38 +0200
Message-ID: <20200424112938.15031-1-bjorn.ardo@axis.com>
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

