Return-Path: <linux-i2c+bounces-10134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8159A7DA96
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 12:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2B6170A18
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611692356D7;
	Mon,  7 Apr 2025 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbNhh3Bv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2D23370E;
	Mon,  7 Apr 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019943; cv=none; b=e4rQOERvxDOl6IBP4Fd/fr4/QV/PsGC10o8JV6TP4ZGm7I8OBLJnCf93r/ufGt3PcbTlut5wGPfIjt32F1xd3n1Iw1dyRPrDFb9vsphJ1tBat9Orzst+vu/NqwJ8Kq4qyyX5pP7B6kT/KkQjGlZQznAYcfoi6CjSXydm+2Uq4NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019943; c=relaxed/simple;
	bh=E1EKhvH/3/E+I7074KzqGnDYkH6JWY+UHDd5lGqMH2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeS4WEDYRQmi07zSSawK0uXjXwEzNi29F5Lr5ktX5VF/WUPafUdxTJtMW90yLqSW5MKGkVDs90kzaRLHRsqSNH2IprkMjwlyCaFVlyWcbZmJflw4B3FyEnE10XIbkaU2k54JUJLH4GIRY+8C9bVT4R8Gnd+cdMV+uAP+Mno0B+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbNhh3Bv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019942; x=1775555942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1EKhvH/3/E+I7074KzqGnDYkH6JWY+UHDd5lGqMH2Q=;
  b=dbNhh3BvyjnRwaUOfqbfl/lXH+99HCP+D5xrbZpwdI2/OuxWEAD1bNDa
   wavAF/7vl+MX7+nPDHsCH9C2W/a+eV4toRp7JvOPBuDS5o2JCiMj21hDk
   Lp5d4aMy8Usxpzehr1uMFOs356nYs4u56Rt/jVlZK5JgN/7+KXPJszlGI
   RVTHDQkBKuEJxcMO5aoQs7JZ/gPGuwoGRyzViRTh6ysx5xm5+b/T8jeBW
   tZW13c1Nv/bne+y1WMsDgW7LSP7UYwToLruhy5caeo19NBO9KZrLduq7z
   2Km+/ND2iglFOXYoFarLcjeQ6xC1lpELrvKRaKN0DCGxkyjkd5R0DgaDi
   g==;
X-CSE-ConnectionGUID: BINjPnWkTdK9eYFBVTjLfg==
X-CSE-MsgGUID: zJv2ytM4RK6fwIgjRNr4lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49188882"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49188882"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:58:58 -0700
X-CSE-ConnectionGUID: WNN06WvWRVaIFK5leiCG3A==
X-CSE-MsgGUID: mCwYltZ1SZOd1VIeRbTouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128411723"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 02:58:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 826E5F0; Mon, 07 Apr 2025 12:58:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 1/6] i2c: core: Drop duplicate check before calling OF APIs
Date: Mon,  7 Apr 2025 12:55:12 +0300
Message-ID: <20250407095852.215809-2-andriy.shevchenko@linux.intel.com>
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

OF APIs are usually NULL-aware and returns an error in case when
device node is not present or supported. We already have a check
for the returned value, no need to check for the parameter.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7ad1ad5c8c3f..c14ffd6190d3 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1209,11 +1209,9 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
 	u32 addr = default_addr;
 	int i;
 
-	if (np) {
-		i = of_property_match_string(np, "reg-names", name);
-		if (i >= 0)
-			of_property_read_u32_index(np, "reg", i, &addr);
-	}
+	i = of_property_match_string(np, "reg-names", name);
+	if (i >= 0)
+		of_property_read_u32_index(np, "reg", i, &addr);
 
 	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
 	return i2c_new_dummy_device(client->adapter, addr);
@@ -1651,12 +1649,10 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
 	struct device *dev = &adapter->dev;
 	int id;
 
-	if (dev->of_node) {
-		id = of_alias_get_id(dev->of_node, "i2c");
-		if (id >= 0) {
-			adapter->nr = id;
-			return __i2c_add_numbered_adapter(adapter);
-		}
+	id = of_alias_get_id(dev->of_node, "i2c");
+	if (id >= 0) {
+		adapter->nr = id;
+		return __i2c_add_numbered_adapter(adapter);
 	}
 
 	mutex_lock(&core_lock);
-- 
2.47.2


