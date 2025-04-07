Return-Path: <linux-i2c+bounces-10183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F42A7E556
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B189189A5CD
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDE02063E3;
	Mon,  7 Apr 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nc5De0uq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D720551E;
	Mon,  7 Apr 2025 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040987; cv=none; b=aemGZYa+gPDWY03Y85i9GrxY8Tx7JM21azqhEliBnzJYrPU1gbrDZ3MpBUpVWlQLrcCt+eiK0Hk7rtiLBnel72bak61af/cVq/OVbV4DwsCYatfpwmaj45m3LQd79vEGjDA6zeZVto5jJXp43b0RSjfF5GeKAElecqLAfLvgqyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040987; c=relaxed/simple;
	bh=A8BGhNibWN5ifckpQkEKkfZ63fbS3e4jO+HGW/FXJVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6R7Jz3ZhgkSgzVwnE0sTFCiakTs1TRG0dhK+9eiJCUzw8cwouXLLLJ7PeKqRTIr7fchPtjF9c8a5J3kHtC+RADFrSVtthUUwmlCj3aOOU4PRf/KNTukPs/qWkuBQ65j8ZGAk4+FoIsI6IN99nbJ9bI6WWwrLavV3ursN7d5Uow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nc5De0uq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040986; x=1775576986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A8BGhNibWN5ifckpQkEKkfZ63fbS3e4jO+HGW/FXJVs=;
  b=Nc5De0uqIL2JjcrTzhWWSQF8FFbH8PZuYIq4LuRIwtk1+zUeNzD0jegJ
   ZRKmGRdaCAdd8LMdlpDhqCmEYcuEzbzXR5HtO9V2QYW83e/UDRaQYtvPi
   4lEdmF/B2JI1zonjSpMu3QAjmPLlSxtOsqOlZAV4hL8AVbYAr+t7S0FGd
   QE2MQBgynQoS2oHXVRaz+g0S3Tmai8KPNiQoLidXDS6sM05b3+HZDWuP3
   5yZj7dio6Obv45u6joBmePy6t+Qodz/avv6qchJFXiO68rqRkeNM0tovw
   jzdACI80r/mIJB/kP3OUu0GFg0WjuhodKh5RNRPXvzimIdEzMdKrwUBrR
   A==;
X-CSE-ConnectionGUID: 6Htm6L9zQA2Du6N6cixJqw==
X-CSE-MsgGUID: HNH+NOGGQUCnzpnqSYoPLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45324198"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45324198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:43 -0700
X-CSE-ConnectionGUID: w3D+r0adQhqt80khcOt7WA==
X-CSE-MsgGUID: NLDambi6TROoIH7uHCYhbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128930034"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2025 08:49:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AAA45245; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
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
Subject: [PATCH v3 3/7] i2c: core: Switch to fwnode APIs to get IRQ
Date: Mon,  7 Apr 2025 18:44:59 +0300
Message-ID: <20250407154937.744466-4-andriy.shevchenko@linux.intel.com>
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

Switch to fwnode APIs to get IRQ. In particular this enables
a support of the separate wakeup IRQ. The rest is converted
just for the sake of consistency and fwnode reuse.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b320a20957ed..e2fdfbdb1bd7 100644
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
@@ -514,9 +513,9 @@ static int i2c_device_probe(struct device *dev)
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
 
@@ -551,7 +550,7 @@ static int i2c_device_probe(struct device *dev)
 	if (client->flags & I2C_CLIENT_WAKE) {
 		int wakeirq;
 
-		wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
+		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
 		if (wakeirq == -EPROBE_DEFER) {
 			status = wakeirq;
 			goto put_sync_adapter;
-- 
2.47.2


