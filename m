Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076FA132D73
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgAGRsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:48:22 -0500
Received: from sauhun.de ([88.99.104.3]:53380 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728562AbgAGRsV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 12:48:21 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id E5A752C3946;
        Tue,  7 Jan 2020 18:48:19 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] i2c: i2c-core-acpi: convert to use i2c_new_client_device()
Date:   Tue,  7 Jan 2020 18:47:42 +0100
Message-Id: <20200107174748.9616-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Build tested only.

 drivers/i2c/i2c-core-acpi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 62a1c92ab803..8f3dbc97a057 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -225,7 +225,7 @@ static void i2c_acpi_register_device(struct i2c_adapter *adapter,
 	adev->power.flags.ignore_parent = true;
 	acpi_device_set_enumerated(adev);
 
-	if (!i2c_new_device(adapter, info)) {
+	if (IS_ERR(i2c_new_client_device(adapter, info))) {
 		adev->power.flags.ignore_parent = false;
 		dev_err(&adapter->dev,
 			"failed to add I2C device %s from ACPI\n",
@@ -451,7 +451,8 @@ struct notifier_block i2c_acpi_notifier = {
  * resources, in that case this function can be used to create an i2c-client
  * for other I2cSerialBus resources in the Current Resource Settings table.
  *
- * Also see i2c_new_device, which this function calls to create the i2c-client.
+ * Also see i2c_new_client_device, which this function calls to create the
+ * i2c-client.
  *
  * Returns a pointer to the new i2c-client, or error pointer in case of failure.
  * Specifically, -EPROBE_DEFER is returned if the adapter is not found.
@@ -461,7 +462,6 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 {
 	struct i2c_acpi_lookup lookup;
 	struct i2c_adapter *adapter;
-	struct i2c_client *client;
 	struct acpi_device *adev;
 	LIST_HEAD(resource_list);
 	int ret;
@@ -489,11 +489,7 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 	if (!adapter)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	client = i2c_new_device(adapter, info);
-	if (!client)
-		return ERR_PTR(-ENODEV);
-
-	return client;
+	return i2c_new_client_device(adapter, info);
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
 
-- 
2.20.1

