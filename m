Return-Path: <linux-i2c+bounces-10387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A0BA8B18B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7241D19042F3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8331225A24;
	Wed, 16 Apr 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvbSSuMF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F9315B546;
	Wed, 16 Apr 2025 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787057; cv=none; b=T2NxUYd76jHlkOV+GAxJLnZIO4KS1TnnYt2rbqE4BZgmMwfEGuRc7/ASeCJmBSVFvs+/lW+PxiaNr8T0AKNSe5RZnofqJzbi5PBnV2sZYeYje5McpO82z186mIcLmspjtZx7sF9xsdjINCLXDpPGAv+c3YVzDWS5maQjGAaqpjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787057; c=relaxed/simple;
	bh=uVXZ/I4BjJPmGivqzDxmoi0h39+yTFROdzKZFZdSbkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Di3+G047EWd43NiT2o1G8NovT3Y4uAAXgzxGsnvnKbg1ZGRyvLHbBl15i8VqG6RwHwtijbbyy4/yfKs0m2I4k2C2tn+VtPxYsiKqYotiFaxTFcwga+/olpKgICUuU8ls9VRetGC8W+DzK437eSb3yhebuQxybjkbWt3IVN/lYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvbSSuMF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787056; x=1776323056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uVXZ/I4BjJPmGivqzDxmoi0h39+yTFROdzKZFZdSbkA=;
  b=cvbSSuMFPkrm6eXQxGH49AAkYvblzzvVqBRJ9qawIlBZIqr9hYq18NjY
   Tlu0W47E1NsjiD0zkuq8yXTiZr6Z1ICwQuIAVXZpDBYU0wPI2rzWiCLTS
   gUDIDws4svq4RGAQeOyWcLEdT8zkvu991Hht3sIwOWuNB12JOIyJty3TF
   4PFdkQn+5h+fQGD6V2i1t670iaEM/apTVX5rpOjGCcHOhwtWjRLjYEs+m
   XJphdcVe5wQGBal4gZGG91WCKr7tGS+EdhvTUVyIyJ+b0HwagExitZRrC
   ab5Eqx5xil5Sstat0Ex1TKJo2BJqk/WPnxeZmBEQ1Egd4fD71z764teM6
   w==;
X-CSE-ConnectionGUID: bYJvw4YRQTmgfR2wgKJ9Qg==
X-CSE-MsgGUID: H4eYMbD7QomIgh5HhRhZxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56983831"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56983831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:14 -0700
X-CSE-ConnectionGUID: CiycHQfTR1arOzJWf+kXZQ==
X-CSE-MsgGUID: NibRE/CgQRONXlEtrrzM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130668501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2025 00:04:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 83D0822A; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 2/7] i2c: core: Unify the firmware node type check
Date: Wed, 16 Apr 2025 10:01:32 +0300
Message-ID: <20250416070409.1867862-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
References: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OF and ACPI currently are using asymmetrical APIs to check
for the firmware node type. Unify them by using is_*_node()
against struct fwnode_handle pointer.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c  | 15 +++++++++------
 drivers/i2c/i2c-core-slave.c | 12 ++++++++----
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index c14ffd6190d3..2b5236b726af 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -490,6 +490,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 
 static int i2c_device_probe(struct device *dev)
 {
+	struct fwnode_handle	*fwnode = dev_fwnode(dev);
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
 	bool do_power_on;
@@ -508,11 +509,11 @@ static int i2c_device_probe(struct device *dev)
 			/* Keep adapter active when Host Notify is required */
 			pm_runtime_get_sync(&client->adapter->dev);
 			irq = i2c_smbus_host_notify_to_irq(client);
-		} else if (dev->of_node) {
+		} else if (is_of_node(fwnode)) {
 			irq = of_irq_get_byname(dev->of_node, "irq");
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
-		} else if (ACPI_COMPANION(dev)) {
+		} else if (is_acpi_device_node(fwnode)) {
 			bool wake_capable;
 
 			irq = i2c_acpi_get_irq(client, &wake_capable);
@@ -1054,16 +1055,18 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
  */
 void i2c_unregister_device(struct i2c_client *client)
 {
+	struct fwnode_handle *fwnode;
+
 	if (IS_ERR_OR_NULL(client))
 		return;
 
-	if (client->dev.of_node) {
+	fwnode = dev_fwnode(&client->dev);
+	if (is_of_node(fwnode)) {
 		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
 		of_node_put(client->dev.of_node);
-	}
-
-	if (ACPI_COMPANION(&client->dev))
+	} else if (is_acpi_device_node(fwnode)) {
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
+	}
 
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index faefe1dfa8e5..7ee6b992b835 100644
--- a/drivers/i2c/i2c-core-slave.c
+++ b/drivers/i2c/i2c-core-slave.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/property.h>
 
 #include "i2c-core.h"
 
@@ -108,15 +109,18 @@ EXPORT_SYMBOL_GPL(i2c_slave_event);
  */
 bool i2c_detect_slave_mode(struct device *dev)
 {
-	if (IS_BUILTIN(CONFIG_OF) && dev->of_node) {
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+
+	if (is_of_node(fwnode)) {
+		struct fwnode_handle *child __free(fwnode_handle) = NULL;
 		u32 reg;
 
-		for_each_child_of_node_scoped(dev->of_node, child) {
-			of_property_read_u32(child, "reg", &reg);
+		fwnode_for_each_child_node(fwnode, child) {
+			fwnode_property_read_u32(child, "reg", &reg);
 			if (reg & I2C_OWN_SLAVE_ADDRESS)
 				return true;
 		}
-	} else if (IS_BUILTIN(CONFIG_ACPI) && ACPI_HANDLE(dev)) {
+	} else if (is_acpi_device_node(fwnode)) {
 		dev_dbg(dev, "ACPI slave is not supported yet\n");
 	}
 	return false;
-- 
2.47.2


