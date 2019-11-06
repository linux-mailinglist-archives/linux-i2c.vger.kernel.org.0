Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AA9F12E3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 10:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfKFJvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 04:51:13 -0500
Received: from sauhun.de ([88.99.104.3]:50186 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727485AbfKFJuh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 04:50:37 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id E43422C054E;
        Wed,  6 Nov 2019 10:50:35 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 04/12] platform: chrome: convert to i2c_new_scanned_device
Date:   Wed,  6 Nov 2019 10:50:22 +0100
Message-Id: <20191106095033.25182-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from the deprecated i2c_new_probed_device() to the new
i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. RFC, please comment and/or ack, but don't apply yet.

 drivers/platform/chrome/chromeos_laptop.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
index 8723bcf10c93..4f3651fcd9fe 100644
--- a/drivers/platform/chrome/chromeos_laptop.c
+++ b/drivers/platform/chrome/chromeos_laptop.c
@@ -63,7 +63,7 @@ struct acpi_peripheral {
 struct chromeos_laptop {
 	/*
 	 * Note that we can't mark this pointer as const because
-	 * i2c_new_probed_device() changes passed in I2C board info, so.
+	 * i2c_new_scanned_device() changes passed in I2C board info, so.
 	 */
 	struct i2c_peripheral *i2c_peripherals;
 	unsigned int num_i2c_peripherals;
@@ -87,8 +87,8 @@ chromes_laptop_instantiate_i2c_device(struct i2c_adapter *adapter,
 	 * address we scan secondary addresses. In any case the client
 	 * structure gets assigned primary address.
 	 */
-	client = i2c_new_probed_device(adapter, info, addr_list, NULL);
-	if (!client && alt_addr) {
+	client = i2c_new_scanned_device(adapter, info, addr_list, NULL);
+	if (IS_ERR(client) && alt_addr) {
 		struct i2c_board_info dummy_info = {
 			I2C_BOARD_INFO("dummy", info->addr),
 		};
@@ -97,9 +97,9 @@ chromes_laptop_instantiate_i2c_device(struct i2c_adapter *adapter,
 		};
 		struct i2c_client *dummy;
 
-		dummy = i2c_new_probed_device(adapter, &dummy_info,
-					      alt_addr_list, NULL);
-		if (dummy) {
+		dummy = i2c_new_scanned_device(adapter, &dummy_info,
+					       alt_addr_list, NULL);
+		if (!IS_ERR(dummy)) {
 			pr_debug("%d-%02x is probed at %02x\n",
 				 adapter->nr, info->addr, dummy->addr);
 			i2c_unregister_device(dummy);
@@ -107,12 +107,14 @@ chromes_laptop_instantiate_i2c_device(struct i2c_adapter *adapter,
 		}
 	}
 
-	if (!client)
+	if (IS_ERR(client)) {
+		client = NULL;
 		pr_debug("failed to register device %d-%02x\n",
 			 adapter->nr, info->addr);
-	else
+	} else {
 		pr_debug("added i2c device %d-%02x\n",
 			 adapter->nr, info->addr);
+	}
 
 	return client;
 }
-- 
2.20.1

