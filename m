Return-Path: <linux-i2c+bounces-6575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF5B975781
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCEB81F253C5
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E0E1AED30;
	Wed, 11 Sep 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fo8EF4r+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C948C1AE84D;
	Wed, 11 Sep 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069712; cv=none; b=nLlfLRQiLJqazjQ0CFclRyz68Msl8eGjzH2okpCLsZhoHqS+ZBfpCXo2st3VTju9+jzQBVzInPK8T6Kkxo8HYVVt3PlrRYI/Mu4XEAYjGCy1kTs4D8nBhZPSSNb0dhX/0rLgWJxO8KE3KnUap6JDOqeNcUroeIzYTcUutdpJ0Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069712; c=relaxed/simple;
	bh=W6pfDkfO7pk7KbhbI/uXFzMf9YUDqd9I+u21ldL50+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dA0/nJhXyxQ4crL+rd3tg6D89UxDCcjxhHkpX/Z5Z8kOaz+5W078Yzga52ckrYaKOKn/IIsTNCqA+/CkbpETNj+vn33yLNfN1AoX3oZLIKCwFeqMLCPw10NdiINNLfSIeKvcqqwKl9VkU/phHOSVYGsAQQq1hwlxpbjNBsm03lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fo8EF4r+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069711; x=1757605711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W6pfDkfO7pk7KbhbI/uXFzMf9YUDqd9I+u21ldL50+Y=;
  b=fo8EF4r+bLbF7oiSune6iDi0RbUfCr1XXr+4udDQv1LvEFJX/tc2mwcb
   C3DJrQk1YuBBUE7+Pe21d0t1/Gfi/Zxby4CVtK8TopcxDVr9ykem33R1A
   yleaS5zlVoG7/o228lhEniYukVl6/OSw/nPiZ9Z4T/aHosu2/Q6xTkdEa
   rwittgWXz7Hs/mfvZsPd/HLcxF+kLurP0gVBFpz+vsQRg8FeDWmpJwsoN
   A2rYyvAqBG6cej46/1JCwHij27pjiB+fku33iG8kWggULVaweXLGlUyS1
   qInCV1pEwdoTZ+RekoKhugC0l6cuSWK7d7+ifgLEzlG2e3KM9B9A0Do+K
   g==;
X-CSE-ConnectionGUID: JO3/BQnNRW6/L2CCYP/P3w==
X-CSE-MsgGUID: 51Bm/tZMRCOr/SnmPt2ZVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701839"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:26 -0700
X-CSE-ConnectionGUID: YwGOIiARTyKPs2ty5PHSgA==
X-CSE-MsgGUID: Z6UaAWAdRWea3TNdSaEApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388562"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9987C580; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 07/12] i2c: isch: Utilize temporary variable to hold device pointer
Date: Wed, 11 Sep 2024 18:39:20 +0300
Message-ID: <20240911154820.2846187-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a temporary variable to hold a device pointer.
It can be utilized in the ->probe() and save a bit of LoCs.
To make it consistent, rename currently used dev to pdev.

While at it, convert the only error message to dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 679fe3049299..bbcfa3218a81 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -270,27 +270,26 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= sch_func,
 };
 
-static int smbus_sch_probe(struct platform_device *dev)
+static int smbus_sch_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct sch_i2c *priv;
 	struct resource *res;
 
-	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(dev, IORESOURCE_IO, 0);
+	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
 		return -EBUSY;
 
-	priv->smba = devm_ioport_map(&dev->dev, res->start, resource_size(res));
-	if (!priv->smba) {
-		dev_err(&dev->dev, "SMBus region %pR already in use!\n", res);
-		return -EBUSY;
-	}
+	priv->smba = devm_ioport_map(dev, res->start, resource_size(res));
+	if (!priv->smba)
+		return dev_err_probe(dev, -EBUSY, "SMBus region %pR already in use!\n", res);
 
 	/* set up the sysfs linkage to our parent device */
-	priv->adapter.dev.parent = &dev->dev;
+	priv->adapter.dev.parent = dev;
 	priv->adapter.owner = THIS_MODULE,
 	priv->adapter.class = I2C_CLASS_HWMON,
 	priv->adapter.algo = &smbus_algorithm,
@@ -298,7 +297,7 @@ static int smbus_sch_probe(struct platform_device *dev)
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
 		"SMBus SCH adapter at %04x", res->start);
 
-	return devm_i2c_add_adapter(&dev->dev, &priv->adapter);
+	return devm_i2c_add_adapter(dev, &priv->adapter);
 }
 
 static struct platform_driver smbus_sch_driver = {
-- 
2.43.0.rc1.1336.g36b5255a03ac


