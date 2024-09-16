Return-Path: <linux-i2c+bounces-6792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514297A10A
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671571C230AB
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DC01598F4;
	Mon, 16 Sep 2024 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmWCXMuB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25E15957E;
	Mon, 16 Sep 2024 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488175; cv=none; b=mfnbluAu+I1hjTTdUx9mR3hhR2vVxMq1zIZFHalXDSbAz+sppXON+cGKrLLvGhIIiMJTzh2b34GyI0nsIbddhBpMkiAvZ8qlGkX9m4fyd1flV9PprGkZozCdkVquei6XD0ybS/GpnPzkVPVSLxzpxqhHBoMnzFHwOPXGTdJm3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488175; c=relaxed/simple;
	bh=MhAXVGI/Kzt0oL8qizf5tKDuT6I9gfAbGpp8ziDudqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUtIB0M3yhN2XeiYGlx4BZ2w+XUrUlkMweFGHBP7Li8ckCcX1yPz5+0Ac7E1x0lV9Aon370d9T2iaGraUfD895VYsotiLcSVCKarSOV3JVSxov6hvpoeV1B1eobe14HXFt2DlaEPAQZY0nUgWaYXq0EoW22GiR0Uag/G7diOTnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmWCXMuB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488174; x=1758024174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MhAXVGI/Kzt0oL8qizf5tKDuT6I9gfAbGpp8ziDudqU=;
  b=UmWCXMuBxRVogJsXJCxfmryzBcfyfj2//7HNOuc3vZWfXbBTr6RcXhTi
   If42wOjDuNFyKx7TwP6N7DB4uMVvzQGW0s4f/Q+DE5Kk76MO8ZufH+z+/
   ZicejrCl3TO/+mac092pQz7GOvoJ9CcFbF2fEVW/PQUR1iFQfFt3TLRnH
   o/5DLGjowXVPrva+08diWA2gETj/HoGwGiwPrKKyVkZ7MCuUfr+jK8E71
   J/LnUdM/+Y+DecIlvr8DGUR6qObj0oySxRSRGlrb+b1VsWtDeRvjazjzV
   pnE7Xp8SpOqHOcOyqsf7gClmbGxAbTTlbIe+qMkIO6MeBRXWPMKeaqFjI
   g==;
X-CSE-ConnectionGUID: KeGQESnSSyWV/5+ksNtgqA==
X-CSE-MsgGUID: d664qhjXSNWwV7/mIHUpWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50725479"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="50725479"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:44 -0700
X-CSE-ConnectionGUID: EFF8sJwbQNyeKVH/6oEr/A==
X-CSE-MsgGUID: hKnn7488QvC5IFtOeJKyqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="72939893"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 16 Sep 2024 05:02:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D94CD66C; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 06/11] i2c: isch: Utilize temporary variable to hold device pointer
Date: Mon, 16 Sep 2024 15:01:33 +0300
Message-ID: <20240916120237.1385982-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
References: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
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
index d752f822b52e..d0098b7139a0 100644
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
 		 "SMBus SCH adapter at %04x", (unsigned short)res->start);
 
-	return devm_i2c_add_adapter(&dev->dev, &priv->adapter);
+	return devm_i2c_add_adapter(dev, &priv->adapter);
 }
 
 static struct platform_driver smbus_sch_driver = {
-- 
2.43.0.rc1.1336.g36b5255a03ac


