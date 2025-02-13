Return-Path: <linux-i2c+bounces-9419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5EDA33E60
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D5E8169D09
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 11:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4415121D3D3;
	Thu, 13 Feb 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORrh+q7e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78245227EBA;
	Thu, 13 Feb 2025 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739447182; cv=none; b=hMYqfsLoFmBzQjNKS55LHO9sVtdXSgiEw86E9zxs7B9r1rjUDVJoiT+f/J8J7LCU22SlFeJMRWwfDvU+TSCGLBMSMp+4+rZljfL/KYgb8uRRk8sWwFJWEoSrT5nu8EgfBj7tEGnIVd16z2Wu03dwpSunyP+t9g54hIkevMYVRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739447182; c=relaxed/simple;
	bh=vozMNenzLtvKB085531XlV3hT0YOjB3jxbInqK31hmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Beb1QDp1Q2lwiGSssGjrAcrSN0T58uVbiOZy6b6Im8AyYhW38yhrvc/38CwZ5O8G2Xns78IyxuaWXDNogiDdP4Y+1WMwNrKDRIdpZas+XLXLt0vQw+ZLyLVYnUhfNEIeVMwWWDPFaMqUXPsB7L6R94uRrOz7mufZWgP89eAhnhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORrh+q7e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739447181; x=1770983181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vozMNenzLtvKB085531XlV3hT0YOjB3jxbInqK31hmM=;
  b=ORrh+q7erSQykWz6uRg6+F1souFToO1Xgs5vlMdYBsvgxZ2mhadEppJf
   M2IZYNMr8okswrKAbNBChMag8FFONtIlik9XycwWNSvGX/MVyr/5QnQd1
   CgmlGDMEQl3jcCngMp8JbCOgYB3uhKZNJ0++iuL0UL+7Ku5LA0SjujOAo
   BO96HuTBRSczb9B0MIWyB2Hm+m4lKGdCGBWyImXR1vcSIAqfigPY7PMlg
   xxvvUXE64GD1TrEnR8vk1ed0IcUQtR7HnXZhGc2wWMwUsMh68yIYeDEAU
   9qVHyY4nxccCSuk5BpOKNaUuyB6Hf33SZJdUTwn7BlwzvD/1tW647AIaJ
   g==;
X-CSE-ConnectionGUID: voW0XmFuS2CqpOTMLcWncQ==
X-CSE-MsgGUID: De2JjGtNQiiVHRORw1yusg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51126558"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="51126558"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 03:46:20 -0800
X-CSE-ConnectionGUID: cSYlm2FJTMSs0jknWimbOw==
X-CSE-MsgGUID: v6FZam0nQfi6T0VZeIOl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113650853"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 03:46:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 71052209; Thu, 13 Feb 2025 13:46:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 1/2] power: ip5xxx_power: Make use of i2c_get_match_data()
Date: Thu, 13 Feb 2025 13:45:04 +0200
Message-ID: <20250213114613.2646933-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
References: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get matching data in one step by switching to use i2c_get_match_data().

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/power/supply/ip5xxx_power.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/ip5xxx_power.c b/drivers/power/supply/ip5xxx_power.c
index c448e0ac0dfa..a293b2765771 100644
--- a/drivers/power/supply/ip5xxx_power.c
+++ b/drivers/power/supply/ip5xxx_power.c
@@ -828,10 +828,9 @@ static void ip5xxx_setup_regs(struct device *dev, struct ip5xxx *ip5xxx,
 
 static int ip5xxx_power_probe(struct i2c_client *client)
 {
-	const struct ip5xxx_regfield_config *fields = &ip51xx_fields;
+	const struct ip5xxx_regfield_config *fields;
 	struct power_supply_config psy_cfg = {};
 	struct device *dev = &client->dev;
-	const struct of_device_id *of_id;
 	struct power_supply *psy;
 	struct ip5xxx *ip5xxx;
 
@@ -843,9 +842,7 @@ static int ip5xxx_power_probe(struct i2c_client *client)
 	if (IS_ERR(ip5xxx->regmap))
 		return PTR_ERR(ip5xxx->regmap);
 
-	of_id = i2c_of_match_device(dev->driver->of_match_table, client);
-	if (of_id)
-		fields = (const struct ip5xxx_regfield_config *)of_id->data;
+	fields = i2c_get_match_data(client) ?: &ip51xx_fields;
 	ip5xxx_setup_regs(dev, ip5xxx, fields);
 
 	psy_cfg.of_node = dev->of_node;
-- 
2.45.1.3035.g276e886db78b


