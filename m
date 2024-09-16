Return-Path: <linux-i2c+bounces-6793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1697A10B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF6781C2221E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A812154C04;
	Mon, 16 Sep 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0J/rmvg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2893B158DA9;
	Mon, 16 Sep 2024 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488175; cv=none; b=QdTCr83KbW3yio4unXIxel90W7srGlKmQuki9Rd3PnFJlA7EXDX7xuiSjt2zuBHp5RVzoIi3WkGW2ekqu4qaKC+mdZl9eYpCbu91BGMe+1SiuiKD3d8cMwRMS15Xn96/jEVgRl7+xdBIbtTtuFDt3D1bEtGlyyfiAG/zElXB6ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488175; c=relaxed/simple;
	bh=c5+EyVZusvXwwP0Tmd8F3Ep5LHjkNJvOIHH43dXMK4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsZ3ySy+0SrBb/whFgbmCSKFtDyU+tNmTOzC5JtfxR4Ggdq0PJHgrEKXlAN4ynpNa+giuyXIEh4GWwz06xmFATCz8MdlLIBoqTj+DkhN+0ZbPxPJpO/rhfZv7S4r40sSgjHUWPmYB0BiubGmgtNfuyvHemQcvJiDCYKFxLHJqE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0J/rmvg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488174; x=1758024174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c5+EyVZusvXwwP0Tmd8F3Ep5LHjkNJvOIHH43dXMK4U=;
  b=S0J/rmvg4Ktujik3BWSfhPo+jMFYMwADsItVgpTuvxh4SshkWAjOSmHz
   BcKofOz7lrCkJ3QqyjiZZeCOQFj1kim+4IwPrfY4zM+m0wuTFIjHOmt+N
   XY/+nBVXnuBUSJrHe0QnwAm4mXWomQ0ihFZrOQz7/zP9l1ME1eAt22ZuU
   sgto6Z4dhruchWvvPlofbR0teqj/Jlap4W5Wbi3JwQZIVSKPrQUtFegSv
   ZgvDHY9lykn9hFOgks7JruEcr1jlpbSW43N53X96HNDcAop/qjOx/S/CG
   pM0FJoIOqKWAq8sDVOehTSy8K6gRckRuCoIjbqU+BH6LSvzRPui7XBabW
   A==;
X-CSE-ConnectionGUID: Pw8A1R08TWK9hNxzDnqMgg==
X-CSE-MsgGUID: 5Fbh+tCCQFaudQujCxEfOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50725484"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="50725484"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:44 -0700
X-CSE-ConnectionGUID: P/x+kd2hQv+kd0MZQBGRjA==
X-CSE-MsgGUID: 51NcZdhbT9S+Pns/Z5Apzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="72939892"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 16 Sep 2024 05:02:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D2827668; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 05/11] i2c: isch: switch i2c registration to devm functions
Date: Mon, 16 Sep 2024 15:01:32 +0300
Message-ID: <20240916120237.1385982-6-andriy.shevchenko@linux.intel.com>
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

Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
for matching rest of driver initialization, and more concise code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 0fe7c9d1dd0d..d752f822b52e 100644
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
 		 "SMBus SCH adapter at %04x", (unsigned short)res->start);
 
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


