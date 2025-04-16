Return-Path: <linux-i2c+bounces-10389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E8CA8B191
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C465016C02B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989EC22D79A;
	Wed, 16 Apr 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEalu380"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71EF224888;
	Wed, 16 Apr 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787059; cv=none; b=kKnZ/+C7YUtk6fKCVeT2jMiX1CaBa0yerDgREO741iJ+HEeQwvd84VYJCkVYYKAxLmWMygfMGisvVEoWiTwYqY5ZDlQsr7dAgog5iKlqFgZVZJxqXaz1DP7Q76N0hTzE4mIxbxfiq1+C3PWS+RNHPbQIHOVbS6uD5BCW27fHmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787059; c=relaxed/simple;
	bh=eiPp1dIZglT6Llp+v5V3BzQhLD5quCsZRmYGDnypSEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIkiLB5Wd5nqU17LaHVNFmxQR/SJ4vcTQihFu68jrKb1wi5ckoZXcE7HeyvACB17fy5BK6kuTBqdGyiTy5ezw0IPOKEB/J8lI4eAo02zonkH/6bsAI18efVtjKffJYhc056qUhr7QKPUd2hv8iajearVz7mxEoL/porw940kNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEalu380; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787058; x=1776323058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eiPp1dIZglT6Llp+v5V3BzQhLD5quCsZRmYGDnypSEs=;
  b=VEalu380TQF+rgJYX524ceAcBUZR3PVqoK1Hec1VeGOhqwgVWHRfBmPh
   bIY2r2loxXRqYEwbYmtBMnyGOChlqtqjzTLneEBkRCESXmLtQIjy3/pIo
   oSe6VEdFoJ6S+v+O1Sa8Kg+mfZU5LvTFmpzdIqLr3UeuHyz5AfYVQTGGR
   A2BJyZvckFbtFXFJFXKWHIne1d4hNKyAFXp4jpgDQTT6Ihld/iip7K6fw
   bMWogdtz4aMK4uOKNv/5LgP1OM4qhfZDZao2Xv2t//R13Vp7t+8JDOJ3K
   yA9LCKxcxMZaBJcoaY/vdye9WAeaCXUJGdG/4iHAJ3rftrjLQVG0A3qEn
   Q==;
X-CSE-ConnectionGUID: hHV5rwUOSLqRet/b++wVBw==
X-CSE-MsgGUID: 9xUXIMoOSJW/ft/ff10/Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56983838"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56983838"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:15 -0700
X-CSE-ConnectionGUID: 37aLm/MhSKCr+BnjpGVy4A==
X-CSE-MsgGUID: Eqdlxy8ASjuPE9ZaorRACw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130668502"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2025 00:04:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 937BE481; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
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
Subject: [PATCH v5 3/7] i2c: core: Switch to fwnode APIs to get IRQ
Date: Wed, 16 Apr 2025 10:01:33 +0300
Message-ID: <20250416070409.1867862-4-andriy.shevchenko@linux.intel.com>
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

Switch to fwnode APIs to get IRQ. In particular this enables
a support of the separate wakeup IRQ on non-OF platforms.
The rest is converted just for the sake of consistency and
fwnode reuse.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2b5236b726af..08ff3f1eb28e 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -26,14 +26,13 @@
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/irqflags.h>
+#include <linux/irq.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pm_domain.h>
@@ -510,9 +509,9 @@ static int i2c_device_probe(struct device *dev)
 			pm_runtime_get_sync(&client->adapter->dev);
 			irq = i2c_smbus_host_notify_to_irq(client);
 		} else if (is_of_node(fwnode)) {
-			irq = of_irq_get_byname(dev->of_node, "irq");
+			irq = fwnode_irq_get_byname(fwnode, "irq");
 			if (irq == -EINVAL || irq == -ENODATA)
-				irq = of_irq_get(dev->of_node, 0);
+				irq = fwnode_irq_get(fwnode, 0);
 		} else if (is_acpi_device_node(fwnode)) {
 			bool wake_capable;
 
@@ -547,7 +546,7 @@ static int i2c_device_probe(struct device *dev)
 	if (client->flags & I2C_CLIENT_WAKE) {
 		int wakeirq;
 
-		wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
+		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
 		if (wakeirq == -EPROBE_DEFER) {
 			status = wakeirq;
 			goto put_sync_adapter;
-- 
2.47.2


