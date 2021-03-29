Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731B734CE29
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhC2Kul (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:50:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:49544 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231553AbhC2Kug (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:36 -0400
IronPort-SDR: MmiJT3BxOc1FnFhBgda4WDWT6zmP9qO2TzwGB27Xdz2dQp+qwsug90cruRN+T3y2atDoacqIZ3
 6hLOtkmgovlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653628"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:36 -0700
IronPort-SDR: WTUskLKr5mroP36TQPg5bLgNfnLimfvrWkqWVOvx1sMG3jFjlrW8R/Cp7xA8qBPTnjan+J6Zmc
 qzSfBftBBMfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955825"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:34 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] i2c: Add support for software nodes
Date:   Mon, 29 Mar 2021 13:50:36 +0300
Message-Id: <20210329105047.51033-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This makes it possible for the drivers to assign complete
software fwnodes to the devices instead of only the device
properties in those nodes.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 15 ++++++++++++++-
 include/linux/i2c.h         |  4 +++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index f21362355973e..a6a68081f54e1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -920,15 +920,27 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	if (info->swnode) {
+		status = device_add_software_node(&client->dev, info->swnode);
+		if (status) {
+			dev_err(&adap->dev,
+				"Failed to add software node to client %s: %d\n",
+				client->name, status);
+			goto out_free_props;
+		}
+	}
+
 	status = device_register(&client->dev);
 	if (status)
-		goto out_free_props;
+		goto out_remove_swnode;
 
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
 	return client;
 
+out_remove_swnode:
+	device_remove_software_node(&client->dev);
 out_free_props:
 	if (info->properties)
 		device_remove_properties(&client->dev);
@@ -961,6 +973,7 @@ void i2c_unregister_device(struct i2c_client *client)
 
 	if (ACPI_COMPANION(&client->dev))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
+	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
 }
 EXPORT_SYMBOL_GPL(i2c_unregister_device);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b2158..cb1f882a3e88e 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -391,7 +391,8 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @platform_data: stored in i2c_client.dev.platform_data
  * @of_node: pointer to OpenFirmware device node
  * @fwnode: device node supplied by the platform firmware
- * @properties: additional device properties for the device
+ * @properties: Deprecated - use swnode instead
+ * @swnode: software node for the device
  * @resources: resources associated with the device
  * @num_resources: number of resources in the @resources array
  * @irq: stored in i2c_client.irq
@@ -416,6 +417,7 @@ struct i2c_board_info {
 	struct device_node *of_node;
 	struct fwnode_handle *fwnode;
 	const struct property_entry *properties;
+	const struct software_node *swnode;
 	const struct resource *resources;
 	unsigned int	num_resources;
 	int		irq;
-- 
2.30.2

