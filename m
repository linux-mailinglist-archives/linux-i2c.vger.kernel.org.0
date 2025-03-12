Return-Path: <linux-i2c+bounces-9805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB6DA5E3E2
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D15581763E4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA3625744E;
	Wed, 12 Mar 2025 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFpRZUHh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A29E1D54E3;
	Wed, 12 Mar 2025 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805507; cv=none; b=hCc8k5YUdo1gJs60xb5NOzuUQjRYovBdR8+0B4a+XOa1kHu/LVk7JAJ3kL/UcPIz5r16z8empF1SArRAzBxonZ5ouckZfqlHfd8It4FTlw4dn08uIVixDmPxHshB9ByWpyLv1Si2h1FaZPpgBmoDRYNDB74v96Yg5wVrymv009I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805507; c=relaxed/simple;
	bh=vyGpTGR+0J7cloQuQwzgkB0zVZ12nAhFlIiabYUYYYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lr++Qm/x3idwR2r6I4oxr4EosOkZB0GjcdNngqJ1rXvHMIyj3pL8H31o8FbUT4BXzUsfQ/8ABN4VEmpJtGdfzN1V4S4prxN5KPN78rKBayovthRBPoj3YoB+/bYz6HUioDoyn2dCnBEpu9PiJnE88ggXsEaRBHi6cA+mIE3jShE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFpRZUHh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805505; x=1773341505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vyGpTGR+0J7cloQuQwzgkB0zVZ12nAhFlIiabYUYYYc=;
  b=TFpRZUHh1QQebx8O9HDVsPU1piNL7lacDzSn6K8yjnuz76aBUABe9VUd
   tYsf2n12jx0k/NyH2d8Lq8fF370okHh1d/ghOtUB6GsewtKt9L7uu8ADo
   nK6ezVdARKMY7eLELrqCUTUnVkKAeBmeBjr/SGQ/ZD/W7EpMGKyXTFrJU
   4geSwEMHNrUUcREMmUDbFQyCW0R07aFbhatLvVkZEy4U9GXQOXSu6qmlb
   aY/o7jhHKvEdOPCK0Svsy//OfjM7ZEJwSVSatDST97bRdLncizsZKQaeI
   j8OOaSGmeEJg4VQwChRKg7Njn/RXK/wQovbQ4V21QYWDdHiey13V9Ih52
   A==;
X-CSE-ConnectionGUID: W7J0L3nsTZC4BD860cMjMQ==
X-CSE-MsgGUID: mFb3tPhMSTKfVekfMFWunw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30487207"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30487207"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:51:44 -0700
X-CSE-ConnectionGUID: eo/RDybZSXy76lUdg+SGLA==
X-CSE-MsgGUID: xuO7XNMwS+iQMBB76uveMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157895060"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2025 11:51:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2CBFB1FC; Wed, 12 Mar 2025 20:51:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/6] i2c: core: Unify the firmware node type check
Date: Wed, 12 Mar 2025 20:48:49 +0200
Message-ID: <20250312185137.4154173-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
References: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/i2c-core-base.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

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
-- 
2.47.2


