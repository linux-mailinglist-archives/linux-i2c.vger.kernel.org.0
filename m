Return-Path: <linux-i2c+bounces-10181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7DAA7E567
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E931F3A4DD5
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8871FFC4A;
	Mon,  7 Apr 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6pjfh23"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AF520550E;
	Mon,  7 Apr 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040986; cv=none; b=tDtIpnblK1upezcx5AK/1s8CE37RRh+44D5umEnExQllbHt5FFhTCLKfcvZzM9UkCYyqE7fVcIJbK/F+1uiIHmRMpGj+23gtdMRvw7cFXzssnmSypujmf+OCyi25BA7nXpARYDfOjRK59OA/9Xv8QkFJ/yBAo1WjsAKIAA/qccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040986; c=relaxed/simple;
	bh=WNQV/Tzpdu538d4f1vf/iAGrn+2oUnFD71DxzinbQkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0Cq8MR0cREq6LrAYus7EHtqb2o62un8UySBFud2P+GJmak+vHaWKwFpQUe+gIn2MzIsDmFnKet9mDmyy9cwnJFTUX49hsXAxMH9StybSr1Blom5xIJb0oa0vPjL6g3oPxYiomvGVV4LC4vEWzRh7WhUH1j/mahPcvqBpysrdzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6pjfh23; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040983; x=1775576983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNQV/Tzpdu538d4f1vf/iAGrn+2oUnFD71DxzinbQkg=;
  b=b6pjfh23Z7+rjk1/tJAtMj6AauPwOTl8KSfFDL2l0ODIdo28uIMaYOaV
   XqDOWqmVBySOS5umwMJCyoRvqcYnYJaB0gVd+UhLW+Q/2JW/REN7KDRk/
   04cyKncPch9rR9PoKhp7DjPeCwMUASD8HwrpUBX+0YyNuSVl1GeDeJuYz
   Uogi+8zFA0Ir3FUZHN4f+m5FVrna8XAR1mTjeqLMFyvqnsz7qXx00sAI+
   sh8nrZh4TFPqCbCQjw4JFd7x4p3XaLOtWjGzJDfjksxbQi51Q/FX6vFAH
   v/sN5lX6tzcPHt/hDRLCA8Ja7Eq+n6RNnlC48MtlwFvMEbyquDFCergPd
   Q==;
X-CSE-ConnectionGUID: 8uIcuy/PT06hSv2oAOehrg==
X-CSE-MsgGUID: mUg2DlQ8RQmGmwC1mFW7Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45555055"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45555055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:42 -0700
X-CSE-ConnectionGUID: bJkBTVvJTHKyNLoqZVMUKQ==
X-CSE-MsgGUID: YndHSyqrTIm3B9IEhUrqbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158986650"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 07 Apr 2025 08:49:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9E8AD157; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
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
Subject: [PATCH v3 2/7] i2c: core: Unify the firmware node type check
Date: Mon,  7 Apr 2025 18:44:58 +0300
Message-ID: <20250407154937.744466-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
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
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c  | 14 ++++++++------
 drivers/i2c/i2c-core-slave.c | 12 ++++++++----
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 0d850d425734..b320a20957ed 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -494,6 +494,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 
 static int i2c_device_probe(struct device *dev)
 {
+	struct fwnode_handle	*fwnode = dev_fwnode(dev);
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
 	bool do_power_on;
@@ -512,11 +513,11 @@ static int i2c_device_probe(struct device *dev)
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
@@ -1058,15 +1059,16 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
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


