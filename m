Return-Path: <linux-i2c+bounces-4029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072B9085EB
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 10:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C307D28B3DD
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 08:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DD11836F6;
	Fri, 14 Jun 2024 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILuL2/vX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7661822F8
	for <linux-i2c@vger.kernel.org>; Fri, 14 Jun 2024 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352874; cv=none; b=VT9yPDMCiywsVH2VK3jJCW1o1AIRwYW1/UgvaNMxV443fFLYWxhqAgrpUBzC1bUPVqvZgYRoK0rRkZ5YUtNt4NsvRUoll4vqwzHcUAtHBHD1fkpKa6suB2oELEjYZez0J5twaq3l4jWLtexNhAMgfc9J4Pyjum6dx/4IK9Rtmwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352874; c=relaxed/simple;
	bh=FsW1wDZcSI8zU9c+0ww1DluYDRtDKNmGA625lDy8Fpg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=qG5nwFGj2iT3fhqC99hWG3T9ZckTgUWBON/e8OXI2O1Z/NoUD4sZY7jtxp/7EwEznPrBuRz9wwpOi2BLyFYpZZ4oC7LdI0e9iAKcNWlNicLBXwbbGyu537i15btLnzdj97KzdDpHRm06vF6QnknUS9+yS/DhG7EIE5OcBqTNnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILuL2/vX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718352872; x=1749888872;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FsW1wDZcSI8zU9c+0ww1DluYDRtDKNmGA625lDy8Fpg=;
  b=ILuL2/vX6cHAK5B6uvI0EbvmgCzx0pB9rNNeFMIyC238L3yGPiMcJ2cW
   tlgFMUHWy1xD6JVdJ7/PLtmVKiIp79IKfBcbIW/hBHfHaKQvQbXLJo7mf
   SuVYIOw0FM9dEKjfZywnWLER2VyJk5Wu6YattirhsXWUg6moM2nMXXXby
   SC6Dr7TLx0tfvIeuOMNA/Gj6w4ruTxqZ74Da6b71BHcJ8OFUJ+HLVeUdw
   6YL5DpiutWPBKOIJWBAFStR3zlJqBMJmaQg2iB/QDp6usdzExIrghOs6V
   VfSgtdC+D+SqbIxMBRUpIdCLFUF52R8URhA+XGVH830IxFo1SkA0sOouK
   g==;
X-CSE-ConnectionGUID: wZBc7lNkQP6KEVMYE9QMgg==
X-CSE-MsgGUID: LW3hyYowSqCDODsGLLcUJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="40643406"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40643406"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:14:31 -0700
X-CSE-ConnectionGUID: 4s0MMvB6TUqsmDO/Up66XQ==
X-CSE-MsgGUID: oiK+h7/gSnWnRcQHlDP+Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="71629259"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:14:30 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2A9C811FBC0;
	Fri, 14 Jun 2024 11:14:28 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sI24q-00AW0C-0B;
	Fri, 14 Jun 2024 11:14:28 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-i2c@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/1] i2c: Add nop fwnode operations
Date: Fri, 14 Jun 2024 11:14:18 +0300
Message-Id: <20240614081418.2506288-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nop variants of i2c_find_device_by_fwnode(),
i2c_find_adapter_by_fwnode() and i2c_get_adapter_by_fwnode() for use
without CONFIG_I2C.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Wolfram, others,

This is to support COMPILE_TEST (drivers/media/pci/intel/ipu-bridge.c for
instance). Alternatively we'd need #ifdefs. Similar OF functions have
dummies, too.

We currently get:

ERROR: modpost: "i2c_acpi_new_device_by_fwnode" [drivers/media/pci/intel/ipu-bridge.ko] undefined!
ERROR: modpost: "i2c_find_device_by_fwnode" [drivers/media/pci/intel/ipu-bridge.ko] undefined!

- Sakari

 include/linux/i2c.h | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 9709537370ee..424acb98c7c2 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -960,8 +960,6 @@ int i2c_handle_smbus_host_notify(struct i2c_adapter *adap, unsigned short addr);
 #define builtin_i2c_driver(__i2c_driver) \
 	builtin_driver(__i2c_driver, i2c_add_driver)
 
-#endif /* I2C */
-
 /* must call put_device() when done with returned i2c_client device */
 struct i2c_client *i2c_find_device_by_fwnode(struct fwnode_handle *fwnode);
 
@@ -971,6 +969,28 @@ struct i2c_adapter *i2c_find_adapter_by_fwnode(struct fwnode_handle *fwnode);
 /* must call i2c_put_adapter() when done with returned i2c_adapter device */
 struct i2c_adapter *i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode);
 
+#else /* I2C */
+
+static inline struct i2c_client *
+i2c_find_device_by_fwnode(struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+
+static inline struct i2c_adapter *
+i2c_find_adapter_by_fwnode(struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+
+static inline struct i2c_adapter *
+i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+
+#endif /* !I2C */
+
 #if IS_ENABLED(CONFIG_OF)
 /* must call put_device() when done with returned i2c_client device */
 static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
-- 
2.39.2


