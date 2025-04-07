Return-Path: <linux-i2c+bounces-10130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B1A7DA84
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 11:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31CB93A5AD2
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5370230BE0;
	Mon,  7 Apr 2025 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlJ9FHLM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11351B4223;
	Mon,  7 Apr 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019939; cv=none; b=MeiopsQbeIOGZh6DEqumUCD2SwxhVmivj++mzmmY/MoirGC6h9EMRNX+SyC1ocRAhZeMDx2zpmv5rW7r3TTXhwqcg1YoHKaO8ad3ru4uXI5/bVYyJNcHr+HcQTWINBYJGLh7Py8iWStNqh6N1iKKoDwOOKJex+SJggFHB+CLkGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019939; c=relaxed/simple;
	bh=0DO7HOaJu4ISmBYlhgihRq0QriI5BOsSYEBRFY3MbDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/7+ej5QKQ5Wwg1V5MSKAJAxz7KKLfcaFGKU/wefI5AZI2gaAHGhtCgPVk20sEedCEDMAEUu8F2PiOK12SN3kN+LupVe1pvZi4WToEtxTQAQZKguYDJXKskbJJU7AyIdpx7ieTf3a3mmpg3nAIW6eXCkNXlZUskJia/y0zkujHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlJ9FHLM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019938; x=1775555938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0DO7HOaJu4ISmBYlhgihRq0QriI5BOsSYEBRFY3MbDg=;
  b=GlJ9FHLMI6t/cxLUj3bljJm8UJURTFj5CUx6sLQveSULGJW8YregNScF
   RdxlC+q+ofsYJyKVvUoG0aBLS/0NVa9LdNh8jn8acasslXVX6T2kfrWUt
   +govGZGcr6yBVqv70KJZ5+T3MPoPz0fAwM3XylT+Tz7wik6Winny3vZyW
   aOn3L4i9+KGxSRzYYK7MTT8BC7fCEitk6qLLnyE/iWqO2yKvvLGFjDZ+e
   RcBmffNEg+ILnipdL6q/MJETiLLW74bcg/YiS1CI87o080kcsenQgj51I
   eWsTVrCHQ+Gm4OhyllOkXnfbTEnYECdgwk+cDiWsI2fGdIzOIzafIVEqe
   Q==;
X-CSE-ConnectionGUID: ZxQIvSsxQp+HSOiqY9Xt0Q==
X-CSE-MsgGUID: MFkNmjb1Rnq2qUs1DXREaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56376823"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56376823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:58:58 -0700
X-CSE-ConnectionGUID: RjwU16IPQfyor6crNl+KSw==
X-CSE-MsgGUID: ogM/qmdsRPud9KqVMXQZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132644255"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 07 Apr 2025 02:58:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A0B603B1; Mon, 07 Apr 2025 12:58:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 3/6] i2c: core: Switch to fwnode APIs to get IRQ
Date: Mon,  7 Apr 2025 12:55:14 +0300
Message-ID: <20250407095852.215809-4-andriy.shevchenko@linux.intel.com>
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

Switch to fwnode APIs to get IRQ. In particular this enables
a support of the separate wakeup IRQ. The rest is converted
just for the sake of consistency and fwnode reuse.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index edab56e5d5e5..196b29e5924b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -33,7 +33,6 @@
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


