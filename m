Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F940C3DA3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 19:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfJARBM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 13:01:12 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:39658 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729908AbfJAQkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Oct 2019 12:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1569948023; x=1601484023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=AbNQ1OO9qC/P3BwiZpTRZ/SDjeyYkXOLrzA/Huj/dlM=;
  b=dklJ7GAoPEbbCd0GNBKwREbBojt4ThoOuKgodwy/P2AcgmXmO01T4PWh
   jUHBiFfR/Z5RVFhX2bxZ0k1lhMbGLYDRYUMoThrqChe/9e/gf9FCZsw87
   qPgiZd6dOtFEKq3w8YhuH4ZxwfUAwXhDktfyqCcpQsdoulZiOA8J2Nw32
   A=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; 
   d="scan'208";a="425072316"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 01 Oct 2019 16:40:21 +0000
Received: from EX13MTAUWC001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS id 75C71A24BD;
        Tue,  1 Oct 2019 16:40:21 +0000 (UTC)
Received: from EX13D02UWC002.ant.amazon.com (10.43.162.6) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:40:21 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D02UWC002.ant.amazon.com (10.43.162.6) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:40:20 +0000
Received: from 8c859006a84e.ant.amazon.com (172.26.203.30) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 1 Oct 2019 16:40:20 +0000
From:   Patrick Williams <alpawi@amazon.com>
CC:     =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>,
        Patrick Williams <alpawi@amazon.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] i2c: slave-eeprom: support additional models
Date:   Tue, 1 Oct 2019 11:40:06 -0500
Message-ID: <20191001164009.21610-2-alpawi@amazon.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191001164009.21610-1-alpawi@amazon.com>
References: <20191001164009.21610-1-alpawi@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for emulating the following EEPROMs:
    * 24c01  - 1024 bit
    * 24c128 - 128k bit
    * 24c256 - 256k bit
    * 24c512 - 512k bit

The flag bits in the device id were shifted up 1 bit to make
room for saving the 24c512's size.  24c512 uses the full 16-bit
address space of a 2-byte addressable EEPROM.

Signed-off-by: Patrick Williams <alpawi@amazon.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index efee56106251..65419441313b 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -37,9 +37,9 @@ struct eeprom_data {
 	u8 buffer[];
 };
 
-#define I2C_SLAVE_BYTELEN GENMASK(15, 0)
-#define I2C_SLAVE_FLAG_ADDR16 BIT(16)
-#define I2C_SLAVE_FLAG_RO BIT(17)
+#define I2C_SLAVE_BYTELEN GENMASK(16, 0)
+#define I2C_SLAVE_FLAG_ADDR16 BIT(17)
+#define I2C_SLAVE_FLAG_RO BIT(18)
 #define I2C_SLAVE_DEVICE_MAGIC(_len, _flags) ((_flags) | (_len))
 
 static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
@@ -171,12 +171,20 @@ static int i2c_slave_eeprom_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id i2c_slave_eeprom_id[] = {
+	{ "slave-24c01", I2C_SLAVE_DEVICE_MAGIC(1024 / 8,  0) },
+	{ "slave-24c01ro", I2C_SLAVE_DEVICE_MAGIC(1024 / 8,  I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  0) },
 	{ "slave-24c02ro", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c32", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16) },
 	{ "slave-24c32ro", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
 	{ "slave-24c64ro", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c128", I2C_SLAVE_DEVICE_MAGIC(131072 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c128ro", I2C_SLAVE_DEVICE_MAGIC(131072 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c256", I2C_SLAVE_DEVICE_MAGIC(262144 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c256ro", I2C_SLAVE_DEVICE_MAGIC(262144 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c512", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c512ro", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);
-- 
2.17.2 (Apple Git-113)

