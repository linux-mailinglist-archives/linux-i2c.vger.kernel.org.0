Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD66D12DA38
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 17:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfLaQOg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 11:14:36 -0500
Received: from sauhun.de ([88.99.104.3]:51554 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727068AbfLaQOf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Dec 2019 11:14:35 -0500
Received: from localhost (p5486C426.dip0.t-ipconnect.de [84.134.196.38])
        by pokefinder.org (Postfix) with ESMTPSA id A4D3D2C07C9;
        Tue, 31 Dec 2019 17:14:34 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 3/5] i2c: core: add function to request an alias
Date:   Tue, 31 Dec 2019 17:13:58 +0100
Message-Id: <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some devices are able to reprogram their I2C address at runtime. This
can prevent address collisions when one is able to activate and
reprogram these devices one by one. For that to work, they need to be
assigned an unused address. This new functions allows drivers to request
for such an address. It assumes all non-occupied addresses are free. It
will then send a message to such a free address to make sure there is
really nothing listening there.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++++++++
 include/linux/i2c.h         |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 51bd953ddfb2..5a010e7e698f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2241,6 +2241,28 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 	return err;
 }
 
+struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
+{
+	struct i2c_client *alias = ERR_PTR(-EBUSY);
+	int ret;
+	u16 addr;
+
+	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
+
+	for (addr = 0x08; addr < 0x78; addr++) {
+		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
+		if (ret == -ENODEV) {
+			alias = i2c_new_dummy_device(adap, addr);
+			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
+			break;
+		}
+	}
+
+	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
+	return alias;
+}
+EXPORT_SYMBOL_GPL(i2c_new_alias_device);
+
 int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr)
 {
 	return i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f834687989f7..583ca2aec022 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -441,6 +441,8 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
 
+struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap);
+
 /* If you don't know the exact address of an I2C device, use this variant
  * instead, which can probe for device presence in a list of possible
  * addresses. The "probe" callback function is optional. If it is provided,
-- 
2.20.1

