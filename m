Return-Path: <linux-i2c+bounces-11375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E702AD71FF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 15:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82AE51C223FF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 13:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417CE244696;
	Thu, 12 Jun 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlIqWZ4D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4C2245023;
	Thu, 12 Jun 2025 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734720; cv=none; b=L7X2MEVJLTnJ1H2UWGhlvR4XB69YZu7bbZ89gztA1hx+BsXwSg7c/FYKAJxaSMsMELXjdyKj0nj0DSM6KXCHcPtJ3+pruuktJQ9W4389L9vesI6QmOLLNiba7pGDr2Gbn0RiGADPfpU+h3N4/EfzbsPNTf745Dk/35Ov1MLuvUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734720; c=relaxed/simple;
	bh=UYi8yaa4IpCW+5RfkUS3FLlv0ptEwqridhTpzFcNsSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAifvedn8zzd4uczLoXqyMxtYGmaesJM/4Zlp39dIi+eILFZ2KKAtywcEjh3/GoNu3sIW3ABppuHUfbzdmXy9/vTAYSaSObUjhcRQTesUYdDvcmtKzQUk4lEgzBF0uwClMzB6bbzYGpI7DupfgE+MSUpHWn4adsCs2AIlrrklUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlIqWZ4D; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749734719; x=1781270719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UYi8yaa4IpCW+5RfkUS3FLlv0ptEwqridhTpzFcNsSI=;
  b=ZlIqWZ4D9P6prEVmuPcuo8mpVkdawxUSZtDs2TqVlflMNVOtlk74E0lk
   /YL7FcAJQLQrT38XycfuF8G0oiupdmzHw/eyET+e7QNWKSu9uI4tGevK8
   xWZRRYvihISvb0YEAvLrNWKcyiozj+gDA5BMdJ7a79jHTQM3Oqywgtgf+
   nkDCuWjqt61cti15izyfGaa1X8Tl6YI0csJue3IMBchu9txqMvlStdXGx
   RMcqir4vn+CZTfq0U0zn7qMKCxQUVYXZc+EkM89Go5gqMpr4IOaDu/6Yg
   J7aicyS7K0w+qd1GEwZNTkb95eBU1WIesQd4UPGxzn6GOGDDu+fuhNqX6
   g==;
X-CSE-ConnectionGUID: z6RJD09wRXKDnfvKahSLXg==
X-CSE-MsgGUID: qdL1JyHURqGmo2H8o17Dzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55588367"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="55588367"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:25:01 -0700
X-CSE-ConnectionGUID: zRqJAooVTe+FH9SoJH/aWg==
X-CSE-MsgGUID: 1vMdLySZTHWhYthCeGvHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152509112"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 06:24:56 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] i2c: designware: Add quirk for Intel Xe
Date: Thu, 12 Jun 2025 16:24:47 +0300
Message-ID: <20250612132450.3293248-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250612132450.3293248-1-heikki.krogerus@linux.intel.com>
References: <20250612132450.3293248-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regmap is coming from the parent also in case of Xe
GPUs. Reusing the Wangxun quirk for that.

Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 879719e91df2..a35e4c64a1d4 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -101,7 +101,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 }
 #endif
 
-static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
+static int dw_i2c_get_parent_regmap(struct dw_i2c_dev *dev)
 {
 	dev->map = dev_get_regmap(dev->dev->parent, NULL);
 	if (!dev->map)
@@ -123,12 +123,15 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	int ret;
 
+	if (device_is_compatible(dev->dev, "intel,xe-i2c"))
+		return dw_i2c_get_parent_regmap(dev);
+
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_BAIKAL_BT1:
 		ret = bt1_i2c_request_regs(dev);
 		break;
 	case MODEL_WANGXUN_SP:
-		ret = txgbe_i2c_request_regs(dev);
+		ret = dw_i2c_get_parent_regmap(dev);
 		break;
 	default:
 		dev->base = devm_platform_ioremap_resource(pdev, 0);
@@ -205,25 +208,28 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
+	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
 	struct device *device = &pdev->dev;
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -ENXIO)
+		flags |= ACCESS_POLLING;
+	else if (irq < 0)
 		return irq;
 
 	dev = devm_kzalloc(device, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
-	dev->flags = (uintptr_t)device_get_match_data(device);
 	if (device_property_present(device, "wx,i2c-snps-model"))
-		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
+		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
 
 	dev->dev = device;
 	dev->irq = irq;
+	dev->flags = flags;
 	platform_set_drvdata(pdev, dev);
 
 	ret = dw_i2c_plat_request_regs(dev);
-- 
2.47.2


