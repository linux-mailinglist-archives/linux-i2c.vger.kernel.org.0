Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB5515815F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 18:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJR3j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 12:29:39 -0500
Received: from sauhun.de ([88.99.104.3]:44010 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbgBJR3d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 12:29:33 -0500
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id EEDB72C07F9;
        Mon, 10 Feb 2020 18:29:31 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] i2c: smbus: remove outdated references to irq level triggers
Date:   Mon, 10 Feb 2020 18:29:27 +0100
Message-Id: <20200210172929.6001-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

IRQ levels are now handled within the IRQ core. Remove the forgotten
references from the documentation.

Fixes: 9b9f2b8bc2ac ("i2c: i2c-smbus: Use threaded irq for smbalert")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-smbus.c | 5 -----
 include/linux/i2c-smbus.h    | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 5ab30d627b4d..d11a8ce2aa61 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -676,11 +676,6 @@ EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data_or_emulated);
  * Handling can be done either through our IRQ handler, or by the
  * adapter (from its handler, periodic polling, or whatever).
  *
- * NOTE that if we manage the IRQ, we *MUST* know if it's level or
- * edge triggered in order to hand it to the workqueue correctly.
- * If triggering the alert seems to wedge the system, you probably
- * should have said it's level triggered.
- *
  * This returns the ara client, which should be saved for later use with
  * i2c_handle_smbus_alert() and ultimately i2c_unregister_device(); or an
  * ERRPTR to indicate an error.
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index aa24a11d1a83..b89b91eb1c72 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -15,17 +15,12 @@
 
 /**
  * i2c_smbus_alert_setup - platform data for the smbus_alert i2c client
- * @alert_edge_triggered: whether the alert interrupt is edge (1) or level (0)
- *		triggered
  * @irq: IRQ number, if the smbus_alert driver should take care of interrupt
  *		handling
  *
  * If irq is not specified, the smbus_alert driver doesn't take care of
  * interrupt handling. In that case it is up to the I2C bus driver to either
  * handle the interrupts or to poll for alerts.
- *
- * If irq is specified then it it crucial that alert_edge_triggered is
- * properly set.
  */
 struct i2c_smbus_alert_setup {
 	int			irq;
-- 
2.20.1

