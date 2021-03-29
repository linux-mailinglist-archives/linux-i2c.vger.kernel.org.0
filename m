Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382AA34CE41
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhC2Kvq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:40548 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232874AbhC2KvX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:51:23 -0400
IronPort-SDR: hPONAMHmb6HINYsAo7MyNkBtutuNoktle693u0HPg0mCE3ZRk/Cs5PkoPWHJSaAHfJf7WgF4th
 x4oaRUPhSFnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="189271548"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208,223";a="189271548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:51:22 -0700
IronPort-SDR: byE4YpQA5TutuYbQztm2QuCZ/XhoDd/QhR/OrMe8egrD964XiKLQ7vXjIfwSuJ2PZRdVLdG7dc
 JJ9uHUXtAm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208,223";a="515955923"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:55 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] i2c: Remove support for dangling device properties
Date:   Mon, 29 Mar 2021 13:50:47 +0300
Message-Id: <20210329105047.51033-13-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From now on only accepting complete software nodes.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/i2c-boardinfo.c | 11 -----------
 drivers/i2c/i2c-core-base.c | 15 +--------------
 include/linux/i2c.h         |  2 --
 3 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/i2c/i2c-boardinfo.c b/drivers/i2c/i2c-boardinfo.c
index 8bc51d4e69df3..4df8ad092df38 100644
--- a/drivers/i2c/i2c-boardinfo.c
+++ b/drivers/i2c/i2c-boardinfo.c
@@ -47,7 +47,6 @@ EXPORT_SYMBOL_GPL(__i2c_first_dynamic_bus_num);
  *
  * The board info passed can safely be __initdata, but be careful of embedded
  * pointers (for platform_data, functions, etc) since that won't be copied.
- * Device properties are deep-copied though.
  */
 int i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsigned len)
 {
@@ -72,16 +71,6 @@ int i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsig
 		devinfo->busnum = busnum;
 		devinfo->board_info = *info;
 
-		if (info->properties) {
-			devinfo->board_info.properties =
-					property_entries_dup(info->properties);
-			if (IS_ERR(devinfo->board_info.properties)) {
-				status = PTR_ERR(devinfo->board_info.properties);
-				kfree(devinfo);
-				break;
-			}
-		}
-
 		if (info->resources) {
 			devinfo->board_info.resources =
 				kmemdup(info->resources,
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index a6a68081f54e1..916899ee1115f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -910,23 +910,13 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 
 	i2c_dev_set_name(adap, client, info);
 
-	if (info->properties) {
-		status = device_add_properties(&client->dev, info->properties);
-		if (status) {
-			dev_err(&adap->dev,
-				"Failed to add properties to client %s: %d\n",
-				client->name, status);
-			goto out_err_put_of_node;
-		}
-	}
-
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
 		if (status) {
 			dev_err(&adap->dev,
 				"Failed to add software node to client %s: %d\n",
 				client->name, status);
-			goto out_free_props;
+			goto out_err_put_of_node;
 		}
 	}
 
@@ -941,9 +931,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
-out_free_props:
-	if (info->properties)
-		device_remove_properties(&client->dev);
 out_err_put_of_node:
 	of_node_put(info->of_node);
 out_err:
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index cb1f882a3e88e..54b3ccc71e372 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -391,7 +391,6 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @platform_data: stored in i2c_client.dev.platform_data
  * @of_node: pointer to OpenFirmware device node
  * @fwnode: device node supplied by the platform firmware
- * @properties: Deprecated - use swnode instead
  * @swnode: software node for the device
  * @resources: resources associated with the device
  * @num_resources: number of resources in the @resources array
@@ -416,7 +415,6 @@ struct i2c_board_info {
 	void		*platform_data;
 	struct device_node *of_node;
 	struct fwnode_handle *fwnode;
-	const struct property_entry *properties;
 	const struct software_node *swnode;
 	const struct resource *resources;
 	unsigned int	num_resources;
-- 
2.30.2

