Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABDD15815B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 18:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgBJR3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 12:29:33 -0500
Received: from sauhun.de ([88.99.104.3]:44002 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbgBJR3d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 12:29:33 -0500
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id 455982C07F5;
        Mon, 10 Feb 2020 18:29:31 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i2c: rename of_i2c_setup_smbus_alert() to keep in sync
Date:   Mon, 10 Feb 2020 18:29:26 +0100
Message-Id: <20200210172929.6001-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The parent function i2c_setup_smbus_alert() has been renamed, so rename
this one, too, for consistency.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c  | 2 +-
 drivers/i2c/i2c-core-smbus.c | 4 ++--
 include/linux/i2c-smbus.h    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cefad0881942..0ac3d6d8b2e2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1329,7 +1329,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 		goto out_list;
 	}
 
-	res = of_i2c_setup_smbus_alert(adap);
+	res = of_i2c_install_smbus_alert(adap);
 	if (res)
 		goto out_reg;
 
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 06f2e4d78d3c..5ab30d627b4d 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -698,7 +698,7 @@ struct i2c_client *i2c_install_smbus_alert(struct i2c_adapter *adapter,
 EXPORT_SYMBOL_GPL(i2c_install_smbus_alert);
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
-int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
+int of_i2c_install_smbus_alert(struct i2c_adapter *adapter)
 {
 	struct i2c_client *client;
 	int irq;
@@ -716,5 +716,5 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
+EXPORT_SYMBOL_GPL(of_i2c_install_smbus_alert);
 #endif
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index 409da1e478d6..aa24a11d1a83 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -36,9 +36,9 @@ struct i2c_client *i2c_install_smbus_alert(struct i2c_adapter *adapter,
 int i2c_handle_smbus_alert(struct i2c_client *ara);
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
-int of_i2c_setup_smbus_alert(struct i2c_adapter *adap);
+int of_i2c_install_smbus_alert(struct i2c_adapter *adap);
 #else
-static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
+static inline int of_i2c_install_smbus_alert(struct i2c_adapter *adap)
 {
 	return 0;
 }
-- 
2.20.1

