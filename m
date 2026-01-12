Return-Path: <linux-i2c+bounces-15048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9ED12BF0
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25ED8301266C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D203590D6;
	Mon, 12 Jan 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMknlFus"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B393590CD;
	Mon, 12 Jan 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224231; cv=none; b=R9PXfTyT3KmL+up061xUfrQUsBJFbT6J7FqYQKiE7a9zjxuzDGKWC9RGhVUo+2P4Nyvlbz49tI8PjCaqF4ByjDAuEvKQgkzjSsFG8e+Yn9cbf1iZfBM7hgHJzfCHuFND6zEmm87t67h5AeN0qNmsEAC+1cXwh5qq9h+6Cg9rm8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224231; c=relaxed/simple;
	bh=o8nH+gkCIyLJlA7QnH19GWVvM96pbAemiIVlT3elecU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVEzR5G2+Zxc3s0R10MGzQ9mEV8ppu+c7FrkHNlUrMDeye+h/cmGP6FOrk3ZI/Q9Cr4skenRupcR+s4Uu3Cw1X8E82k5MOiydYnVtqcskNobZsWiskvSnHmUGaKWFg0oGfK7AagffZ4zSX6bH8CkcAxTIJ911rgqRKUbhOeI6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMknlFus; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768224230; x=1799760230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o8nH+gkCIyLJlA7QnH19GWVvM96pbAemiIVlT3elecU=;
  b=BMknlFusxQS0ytargN60TG3ezWYu3BCseGW25N34RMY0kcN/dNY+IGlO
   qGjNn6exd4o5rP3fGi4/w6y08w3XNkkHhqRTlNFx18uqrN5/KCeQlfKrO
   Vt0Ubwta23UHSy/xgxyQogg8ffp0akZzrtuhlg4zK9ibeCwk5NjGsQmfg
   Ra7eL4uj2DwyjXNWhefJHg5DRRm6XCTiaHWzC/ww9nvVPkObnznLnGmbd
   pwvu3ShDvrud41sQ3bSFqE/oRuD9jivO9aRxNHLMXgSnK/V9Sajs7sbuW
   ll2VupMbabXQ0ETt130ZpkajYhcqKai7jEul96OIc9MMlxyfqyNYnAWU/
   g==;
X-CSE-ConnectionGUID: FymuHe2VShqxBYwIN/cabg==
X-CSE-MsgGUID: bdQNXeaTS4aTIv0QbFAXlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73127190"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="73127190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:23:50 -0800
X-CSE-ConnectionGUID: ciPQR49RSHuoWLay/F8C6w==
X-CSE-MsgGUID: ur/x5+0iR56UckCWFPCiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208241593"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 05:23:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id AFE609B; Mon, 12 Jan 2026 14:23:47 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] i2c: core: Replace custom implementation of device_match_fwnode()
Date: Mon, 12 Jan 2026 14:22:41 +0100
Message-ID: <20260112132346.4087258-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
References: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom implementation of the device_match_fwnode().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 41c2e46ffb24..b9b44bed3243 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1852,10 +1852,10 @@ EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
 
 static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)
 {
-	if (dev_fwnode(dev) == data)
+	if (device_match_fwnode(dev, data))
 		return 1;
 
-	if (dev->parent && dev_fwnode(dev->parent) == data)
+	if (dev->parent && device_match_fwnode(dev->parent, data))
 		return 1;
 
 	return 0;
-- 
2.50.1


