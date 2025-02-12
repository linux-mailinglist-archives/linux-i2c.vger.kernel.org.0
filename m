Return-Path: <linux-i2c+bounces-9398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCBA32C5E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B2B188BC06
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C69253B58;
	Wed, 12 Feb 2025 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ne0dqnnS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EDA253B4E;
	Wed, 12 Feb 2025 16:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379020; cv=none; b=YLEAJlvy/Nl+wPQSboaSpCuk4jNbAGAcp4zYuqjZOfLjh5gXNdmuUMWlofMuJyPkdWugxTykhecoLyyaXbkI7Z9ldcx8FyqBnfKAyIio3GhC0zNvdH5tPWpSJ08uwup9ADpA8I/2SDkfCrdOJXORt++YjE7jGx+9Xyp+qR5nus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379020; c=relaxed/simple;
	bh=Q+N9WHabrj+dah84quvUEppDblR2dUsU8lHbleu8WWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TucfrWJLZ6/XrlW6L9U3ZpTpAJyQ8xXDMDIyonNIt21zEhqVm435erlGMxI8YT8CModMfETBBJ3BMceAnW0O+5QDZuhP1ZCP7zIflyMbyBeH9WDXpJuqe7lGtd7SUd8IWpSeNg8KKjbF20JTqlcqVchH5B9b85BlL26Xn8zxMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ne0dqnnS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739379019; x=1770915019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q+N9WHabrj+dah84quvUEppDblR2dUsU8lHbleu8WWw=;
  b=Ne0dqnnS6xBQ548f4Qt64nFfs1ltROoTU9HsHmG43AyxkKoU76Gw2CvH
   luZplRtzgETBhqFhxDy1C+nInTfxb6nK7RJD1KFYwLTEkRtPMqVH4vV79
   Bx2TcVPM9PQ0DN42BNOWFV2fAAL+plMkkMpSwMgBYQhlAQAU4Yk0p3igL
   dQGAoLH9/EgZL+NJmfIQcZaX80OtQase48lsf+VIZbYCiMfboR++1NJsz
   Tp2oXTa/31MXELgxPnI8aGIP/XaruBQegIWEEjOeOz2qf9bTRPPBNx6JX
   QTAq5bQL0LFDjYb2cWcGGoHDmmMCdyL30E2QJUyYzb5Z24j9Kj/CnbhPY
   w==;
X-CSE-ConnectionGUID: q98uKkTqTserqnJ6C/Oueg==
X-CSE-MsgGUID: rK34uMcMStiLxByzyDK4Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39930859"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39930859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:50:16 -0800
X-CSE-ConnectionGUID: M/LW78GPSsisUxsUxqLH9w==
X-CSE-MsgGUID: ALso3tNXSrGoXACC8qES2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="113539610"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2025 08:50:14 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 306ED10F; Wed, 12 Feb 2025 18:50:13 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v1 1/2] power: ip5xxx_power: Make use of i2c_get_match_data()
Date: Wed, 12 Feb 2025 18:46:23 +0200
Message-ID: <20250212165012.2413079-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212165012.2413079-1-andriy.shevchenko@linux.intel.com>
References: <20250212165012.2413079-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get matching data in one step by switching to use i2c_get_match_data().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/power/supply/ip5xxx_power.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/ip5xxx_power.c b/drivers/power/supply/ip5xxx_power.c
index c448e0ac0dfa..717ec86c769b 100644
--- a/drivers/power/supply/ip5xxx_power.c
+++ b/drivers/power/supply/ip5xxx_power.c
@@ -828,7 +828,7 @@ static void ip5xxx_setup_regs(struct device *dev, struct ip5xxx *ip5xxx,
 
 static int ip5xxx_power_probe(struct i2c_client *client)
 {
-	const struct ip5xxx_regfield_config *fields = &ip51xx_fields;
+	const struct ip5xxx_regfield_config *fields;
 	struct power_supply_config psy_cfg = {};
 	struct device *dev = &client->dev;
 	const struct of_device_id *of_id;
@@ -843,9 +843,7 @@ static int ip5xxx_power_probe(struct i2c_client *client)
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


