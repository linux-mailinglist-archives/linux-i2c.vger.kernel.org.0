Return-Path: <linux-i2c+bounces-6578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1169757A8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82D32B28414
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E511C1B29C1;
	Wed, 11 Sep 2024 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvUd3N+a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED51AED24;
	Wed, 11 Sep 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069714; cv=none; b=cvhHAgS1nF8+shp4WGFOdxUUervWsoXqlmVFMLcGKGOgMfbzY5F0W/9pnN9OUe2Q+QUAe6xScHbNhVvF0HF+bOTaGHdbzls2pF+lgm4uJ2M7IU+a+jbM36tYfLPm/+3+nW9Upx6jf0ZVRb0CmV4aZ7hQYEHv4+PHFHYB1RNpLZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069714; c=relaxed/simple;
	bh=doGBm0zParrAysW7PG2VbSXpBV3wtodiCRcB4kSPpac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thCNxOQMB1Gj8azF5BmQHf/TRIUF0wA3OctBjS5xW6KpgoXksStWTrWgnkXprROTBPZ0xHHpgwZzi0NN9RoeQirLBJxBMCi0O0Vfl3ImpOSVi0ASXiZmGXi/mORteDYCxGFxG8wVoIfNlgXDi/F1o4Wwi5v/rWP3Q+ldmKmJaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvUd3N+a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069712; x=1757605712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=doGBm0zParrAysW7PG2VbSXpBV3wtodiCRcB4kSPpac=;
  b=NvUd3N+aSPUSj3OmBAApJ0MY1THtKXakuJehsUHz8PAp1NJ4UDNlngxV
   00tXXBXVknaXQujespU3E1+crtuhFZzJ0f9L3DUgkI0WQChkTcfzzLYKi
   6VBjuZ8zbpF2SrMYSlQGtmhjxGWRMPxfl0KLrDEvXfZcyDlDSTJhXRLsE
   xjMLgE1Egz9r0AqeQbvXAVizUueoQl/PhLfTxNLBmIRkduaVqcY0psVab
   1IuxUdQn7SEfNhotiu0ma7Jq253fyVsO4ti/aJ+Xsg+VXzLwCeaD6IaJa
   W9+1VbEDzvI3f7hS+JIw8McUPKW01/ohNDvQ0fT4ziXvkzCxhCDT8Gia2
   Q==;
X-CSE-ConnectionGUID: DkEHNaYHR/yrVhiySBQBYQ==
X-CSE-MsgGUID: N0t9iPmCS2yhoqQ6vv5kZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701845"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:26 -0700
X-CSE-ConnectionGUID: hbrX6DAEROKr3Kyw8+NEXw==
X-CSE-MsgGUID: TvxpXripQ6iesdxBcMN3BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388563"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 85D3449D; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 06/12] i2c: isch: switch i2c registration to devm functions
Date: Wed, 11 Sep 2024 18:39:19 +0300
Message-ID: <20240911154820.2846187-7-andriy.shevchenko@linux.intel.com>
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

Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
for matching rest of driver initialization, and more concise code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 4ec6c0a66a96..679fe3049299 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -274,7 +274,6 @@ static int smbus_sch_probe(struct platform_device *dev)
 {
 	struct sch_i2c *priv;
 	struct resource *res;
-	int retval;
 
 	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -299,20 +298,7 @@ static int smbus_sch_probe(struct platform_device *dev)
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
 		"SMBus SCH adapter at %04x", res->start);
 
-	retval = i2c_add_adapter(&priv->adapter);
-	if (retval)
-		return retval;
-
-	platform_set_drvdata(dev, priv);
-
-	return 0;
-}
-
-static void smbus_sch_remove(struct platform_device *pdev)
-{
-	struct sch_i2c *priv = platform_get_drvdata(pdev);
-
-	i2c_del_adapter(&priv->adapter);
+	return devm_i2c_add_adapter(&dev->dev, &priv->adapter);
 }
 
 static struct platform_driver smbus_sch_driver = {
@@ -320,7 +306,6 @@ static struct platform_driver smbus_sch_driver = {
 		.name = "isch_smbus",
 	},
 	.probe		= smbus_sch_probe,
-	.remove_new	= smbus_sch_remove,
 };
 
 module_platform_driver(smbus_sch_driver);
-- 
2.43.0.rc1.1336.g36b5255a03ac


