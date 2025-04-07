Return-Path: <linux-i2c+bounces-10132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF2BA7DA8A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 11:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D6FC3ADBDE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC16A233D85;
	Mon,  7 Apr 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/1WV/9X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AA7230BF3;
	Mon,  7 Apr 2025 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019941; cv=none; b=CcRRQ3N/NF0/lyafobOqxJY59oL6HgkDoSDJsrYFKxIX/klThaf+/Z96xpkJ2a6eWGnZD3lhFUBKeueFU2APjtcMwXhf3uHpyXB68HxzNJ3HzlNMvRxxV8k9o5ksjbAeZD0AyjU/sexBb8MRftU1hWYLZHa9yMNZ9QXc2Fmaw/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019941; c=relaxed/simple;
	bh=0UC5mlfa4AOwG6H3hGjWSJbdq0kyeaAOoxIWVs9NAy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYKIumP945sxrI3dTplOkxmWjdNna4qUyyHu12Gmv1+lvw/bWvxWg2Rq+HzIvB+dITNcpqtHTOWcjrStlejolghNXbtu0M9Et1IcM9dgu0hVnObBFQyNgUyQTm1xreDPqQxtNlfK4hFqMiRZOAEuj8DxRVZ92nPyPAtB4ws8J8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/1WV/9X; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019940; x=1775555940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0UC5mlfa4AOwG6H3hGjWSJbdq0kyeaAOoxIWVs9NAy0=;
  b=S/1WV/9XcYFwqIPv+t9qwuzvBEgMGOj7AXA78aJpqaJvMBGeIuPU5yL7
   AtITjX09C5AI6kvcgsvFET93wtxDFvEjVOzXx175gpu8a7X93byZVjgiN
   sbc1SRGPIdpoMsus/FFESLKj9lL0hRiQp2Ly6DE6+FTdu/Ulxag48riGe
   VZl5ILMFVaBV80ury33f5OfWW/5xhctgju3Um0od0M9WxtQPaRPEcAu1J
   5hh0uNL0G6WExFYaUt5lrIPRopZ6Dy5Mjh0IGIBQ7RIAZLo6qI2LvYvhb
   I+BI9dwHb0UHritDD7Gu1twROZBBkipBvpEf4CEHFhfYGRMfKvjfsfiio
   A==;
X-CSE-ConnectionGUID: OTShqZsoSkKGgORHq33fnA==
X-CSE-MsgGUID: BiQ5isNMRzu6gEpES2gpWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49188876"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49188876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:58:58 -0700
X-CSE-ConnectionGUID: T2LkOHEWSAmBXx/v9KmWCQ==
X-CSE-MsgGUID: bFFLnbxmR/GRIYjfStVFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128411721"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 02:58:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 91478338; Mon, 07 Apr 2025 12:58:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 2/6] i2c: core: Unify the firmware node type check
Date: Mon,  7 Apr 2025 12:55:13 +0300
Message-ID: <20250407095852.215809-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
References: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c  | 14 ++++++++------
 drivers/i2c/i2c-core-slave.c | 11 +++++++----
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index c14ffd6190d3..edab56e5d5e5 100644
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
@@ -1054,15 +1055,16 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
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
+	} else if (is_acpi_device_node(fwnode))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
 
 	device_remove_software_node(&client->dev);
diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index faefe1dfa8e5..3c5cb61b8c39 100644
--- a/drivers/i2c/i2c-core-slave.c
+++ b/drivers/i2c/i2c-core-slave.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/property.h>
 
 #include "i2c-core.h"
 
@@ -108,15 +109,17 @@ EXPORT_SYMBOL_GPL(i2c_slave_event);
  */
 bool i2c_detect_slave_mode(struct device *dev)
 {
-	if (IS_BUILTIN(CONFIG_OF) && dev->of_node) {
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+
+	if (is_of_node(fwnode)) {
 		u32 reg;
 
-		for_each_child_of_node_scoped(dev->of_node, child) {
-			of_property_read_u32(child, "reg", &reg);
+		for_each_child_node_scoped(fwnode, child) {
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


