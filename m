Return-Path: <linux-i2c+bounces-9808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0475A5E3E8
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB880189B3D7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149B72594BE;
	Wed, 12 Mar 2025 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJWvBqVG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6992586EC;
	Wed, 12 Mar 2025 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805510; cv=none; b=LwUO1fEfrrXTrRdy3Z/JDKapNNcVp5nmy+UcRRKBPRRG4B41cgUjgVGxEe8k/m73lP0ugjr0ZvFpQTqxDzvepSwBakM8U6sO59AcJwyAEzrHhECDvfc0fEYLbrvklRQff9fcXX2S1TvdF6RFydcm8QaNHjO4HUCqoWttdOUU/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805510; c=relaxed/simple;
	bh=w1F7q9x4UbMGJHmiVVAtQYhl6DX9oD/ywOPprqltldk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXr5TCS1TVeKBJ93tZCIVmydndJHJNw/gjm6EZBcL3E4zLFmyZsg3cUgGUsYJNYiY/BjMCKuedOcOoec4Q6nYXpf6rxeg6tXVQGij2nCRhDVabzYbE2YzcTRyyGd7iL3J/UowCUSORJ/09VlCf/tiADVj5vP/b/wZa6WBp7+vyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJWvBqVG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805509; x=1773341509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w1F7q9x4UbMGJHmiVVAtQYhl6DX9oD/ywOPprqltldk=;
  b=QJWvBqVGnbt+m8HeToTvXGgc4Ijgqy0RkHOvVOYN5/aatwrSBxc1T98F
   QLzEU7w2EIyDxBNCGVOPBdJdiQ/tKggtqAcFOkWUclNcPP4UPhhbKfhOv
   LJyVIBj+/kHnyYdfIr8JfuL+nitDz+P6V+uBDfiKh7ICM3d8zjJm7iXsj
   5q3W7kuN8j1RLoWEQWVw5sLVdHxdx0oenzuk/5d2xhTgCml6WDAy8+Fp2
   rLClLPhdVVrRdw79abvHn/9QKqKjRrH76P789D64+mcsshXnSa7CGthDg
   EzRZ/IwjQYQfp9ieN3/xLc42F1qsy/ZrhnqoHeXqZ/lgsPe0rFXzG15zX
   A==;
X-CSE-ConnectionGUID: t9/pzS45Q0y0Ka/J7vdXmQ==
X-CSE-MsgGUID: KbdWQ0qyQKqJcw2/65vvYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30487213"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30487213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:51:45 -0700
X-CSE-ConnectionGUID: 6wH/17GsRpih9z/bB12qeQ==
X-CSE-MsgGUID: 0Mwrh9w+Tg2+C6honWpK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157895063"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2025 11:51:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3F8E326A; Wed, 12 Mar 2025 20:51:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/6] i2c: core: Switch to fwnode APIs to get IRQ
Date: Wed, 12 Mar 2025 20:48:50 +0200
Message-ID: <20250312185137.4154173-4-andriy.shevchenko@linux.intel.com>
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

Switch to fwnode APIs to get IRQ. In particular this enables
a support of the separate wakeup IRQ. The rest is converted
just for the sake of consistency and fwnode reuse.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index edab56e5d5e5..f0420cc0df26 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -510,9 +510,9 @@ static int i2c_device_probe(struct device *dev)
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
 
@@ -547,7 +547,7 @@ static int i2c_device_probe(struct device *dev)
 	if (client->flags & I2C_CLIENT_WAKE) {
 		int wakeirq;
 
-		wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
+		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
 		if (wakeirq == -EPROBE_DEFER) {
 			status = wakeirq;
 			goto put_sync_adapter;
-- 
2.47.2


