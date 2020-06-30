Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBB920F95B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 18:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgF3QYu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 12:24:50 -0400
Received: from www.zeus03.de ([194.117.254.33]:45892 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387546AbgF3QYt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jun 2020 12:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=FCY85bfBOVoxNrMmAkwmCictq1j
        V0CEe+DgaoZM1CuQ=; b=EKnV9AKuZfohatqfi3XgX5x2Jw0qiXrkxdTk5HOSKb7
        1xmIp0ezZosMwee6E1YwsTbe1Vdy2KYByL5okKU5bY/ibFm8STBNzE8EN9k6mpvn
        tFGWRY+z86WAuIHRi0W/xZu1k5VXtlYp8ljVlfp1htwGaOIa7j1Xzsf+yBPYUkAo
        =
Received: (qmail 262859 invoked from network); 30 Jun 2020 18:24:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2020 18:24:47 +0200
X-UD-Smtp-Session: l3s3148p1@ZNcmnU+p8rsgAwDPXww2AGjFdbOEw2ZQ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: revert "i2c: core: Allow drivers to disable i2c-core irq mapping"
Date:   Tue, 30 Jun 2020 18:24:40 +0200
Message-Id: <20200630162440.8453-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This manually reverts commit d1d84bb95364ed604015c2b788caaf3dbca0262f.
The only user has gone two years ago with commit 589edb56b424 ("ACPI /
scan: Create platform device for INT33FE ACPI nodes") and no new user
has showed up. Remove and hope we will never need it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. Looking for Hans' opinion here.

 drivers/i2c/i2c-core-base.c | 6 +++---
 include/linux/i2c.h         | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 26f03a14a478..dc43242a85ba 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -319,11 +319,9 @@ static int i2c_device_probe(struct device *dev)
 	if (!client)
 		return 0;
 
-	driver = to_i2c_driver(dev->driver);
-
 	client->irq = client->init_irq;
 
-	if (!client->irq && !driver->disable_i2c_core_irq_mapping) {
+	if (!client->irq) {
 		int irq = -ENOENT;
 
 		if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
@@ -349,6 +347,8 @@ static int i2c_device_probe(struct device *dev)
 		client->irq = irq;
 	}
 
+	driver = to_i2c_driver(dev->driver);
+
 	/*
 	 * An I2C ID table is not mandatory, if and only if, a suitable OF
 	 * or ACPI ID table is supplied for the probing device.
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index b8b8963f8bb9..098405df431f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -231,7 +231,6 @@ enum i2c_alert_protocol {
  * @detect: Callback for device detection
  * @address_list: The I2C addresses to probe (for detect)
  * @clients: List of detected clients we created (for i2c-core use only)
- * @disable_i2c_core_irq_mapping: Tell the i2c-core to not do irq-mapping
  *
  * The driver.owner field should be set to the module owner of this driver.
  * The driver.name field should be set to the name of this driver.
@@ -290,8 +289,6 @@ struct i2c_driver {
 	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
 	const unsigned short *address_list;
 	struct list_head clients;
-
-	bool disable_i2c_core_irq_mapping;
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
-- 
2.27.0

