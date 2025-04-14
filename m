Return-Path: <linux-i2c+bounces-10324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D56A87CCB
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F00188C092
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA96268688;
	Mon, 14 Apr 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBZQnRCd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD132673A3;
	Mon, 14 Apr 2025 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625061; cv=none; b=DKQdcTzkA7gx0mOFaPL6/CJVtuG+W2ygp6qtKAalqOzR5Wb3OoHL1Ieaan4/Yi1Mn3d1Y8MZ4D87cJCRmkBXuOOhvfhK8V8+LlPAMlBpx03Au2bjApAfwhsLwahZ79JZ5XqwMFG2+YWMhfm8lhslp355UleT2IDXYx4hl57pPMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625061; c=relaxed/simple;
	bh=5PFQYjaUnb3ZPXJCpgDL6Af4OLub5qhRthcMuDczcC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fm4feHVh6JaWtUbIE2h2b737p5MkX8tzPQBzfvQtpD+HxuYNOkk+f+XDDrgyuIO2RLQQPeVPSNIQGOJ6/bzfHKIGgqIRy5X5mCwGsL7KT4XrPnvuC8rD++i/sDuXetEb1U+LiYky0hbQr/Xki3qC1bEQUidNfbWp4tWK7s0wRCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBZQnRCd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625060; x=1776161060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5PFQYjaUnb3ZPXJCpgDL6Af4OLub5qhRthcMuDczcC4=;
  b=iBZQnRCd3CJfdxtZ6pP0Ksi0X3B9AN4A3RB3rN9TUKD8iLYJBwVnH+Jd
   TlvYGPsdXn7qF82pz/OiwMG+OQh8tQd8B5cLOGyReVHLwImWxDW3pv6kF
   ECRk/uiXqlbyVk9YLVIXh51K+dBMLWX7K2U0e/HgrG1Ty5soGTIEFePck
   mCQsQDaxjEM2dV4GP5F7agr1+X641WOIDkNdMrZsAjVCAiKQLEsviHr+V
   rb3QF2pI5frI3yODuYZ55Y/PMF4O/6zMPcbyczq6PYb1DdQIGvD8aeXaP
   5dO2JpeGLWfe3PQOPR12XDN3huX93Sxt4Ild5Y3RFnErxJyFGSSigMNId
   w==;
X-CSE-ConnectionGUID: 4n2AaKJPRly6hYA2ULvrvQ==
X-CSE-MsgGUID: 87stsSEhS1itpEKZPKU/Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56747117"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56747117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:16 -0700
X-CSE-ConnectionGUID: DelqBiD6RjWU8Mo/iJTaew==
X-CSE-MsgGUID: 0QDMolCpSeKqBEc9MZnVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134747319"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2025 03:04:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E0C28A90; Mon, 14 Apr 2025 13:04:11 +0300 (EEST)
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
Subject: [PATCH v4 3/7] i2c: core: Switch to fwnode APIs to get IRQ
Date: Mon, 14 Apr 2025 13:01:53 +0300
Message-ID: <20250414100409.3910312-4-andriy.shevchenko@linux.intel.com>
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

Switch to fwnode APIs to get IRQ. In particular this enables
a support of the separate wakeup IRQ. The rest is converted
just for the sake of consistency and fwnode reuse.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index edab56e5d5e5..04985abe0e5d 100644
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


