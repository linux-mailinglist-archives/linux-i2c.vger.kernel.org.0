Return-Path: <linux-i2c+bounces-10327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5003EA87CD6
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BFBB171EE2
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8CB269D1A;
	Mon, 14 Apr 2025 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvSSLVTR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96A9267B77;
	Mon, 14 Apr 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625063; cv=none; b=qyC0jaK3MxgmuXHL7gFJAbRaz9zygiZLOGGgmxpf27tXTcZ/yswaqXSKi36ewSqz2F0BnyP0rRdCHwumQ1SmsHhAWxEr/jXt2CWYZvr0O34bvgcuknujR4Jblyaqa49dwgSgE2lX+LL++iWLDyLp43u1QLeziDwljYr32FKCUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625063; c=relaxed/simple;
	bh=iKkbduU5FktPbfBWny9kkTItLOd1rfa8hx9agx1bUrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDYTQzvhqyKSdMTh6z8Cky75esH0vCtU1jLjJvMz/wIubb5KlPI4Gjyy0u5ocnigSO+DLzd5Lz2Y32DvtPrf7LnNjrcNUuYOnF8mw8aLTcGwE5T0SUVXjHNOXfrhUdJL6wWN6xtblSecxYC+ANBFja/M+VQbV8DeFwPxLdtTR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvSSLVTR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625062; x=1776161062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iKkbduU5FktPbfBWny9kkTItLOd1rfa8hx9agx1bUrI=;
  b=UvSSLVTRfu7JpxJMAx68jkeGc1wOHfk1N/rXO/+bphQFlreBgWyClTHy
   eWtAnZhHn69G5quk1aL5LjQC/Eho/h4KZOHVeg/6WYZ+tIKp++tYH6Z2G
   3oNZomZ4r5kuiimOaKUP+g6EQla0IInMHRgR1Eh0APIxeB5OPcrnMXk85
   CKfUwWuUgEIdihtVSXP3ppvf5Fv0SbPc6da0FgPVVvoBn7TRB9YmBfxpn
   bwd5LNrWSBdV9VflZdrYrphEfKWJwczszv4Rltzsy98/gJY0m5XVGuWb9
   n4LksPQtII4jIxQfYKdXKadUDq3xHVeLFXPuqEUhNlRIpwrbExWJZ81qQ
   g==;
X-CSE-ConnectionGUID: iESIgSfwQ9qUaLkWVSqxpg==
X-CSE-MsgGUID: h5LHZo/2RH6Bchvl6cllHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56747126"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56747126"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:16 -0700
X-CSE-ConnectionGUID: frY3m25kSzK1mWl6UBGsYw==
X-CSE-MsgGUID: sG9sazP4ShiZEDqTJNA12w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134747318"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2025 03:04:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D9A19AB6; Mon, 14 Apr 2025 13:04:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 2/7] i2c: core: Unify the firmware node type check
Date: Mon, 14 Apr 2025 13:01:52 +0300
Message-ID: <20250414100409.3910312-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/i2c-core-base.c  | 14 ++++++++------
 drivers/i2c/i2c-core-slave.c | 12 ++++++++----
 2 files changed, 16 insertions(+), 10 deletions(-)

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


