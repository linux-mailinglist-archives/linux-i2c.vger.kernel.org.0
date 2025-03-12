Return-Path: <linux-i2c+bounces-9807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89921A5E3E6
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD54417677F
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE6C258CF3;
	Wed, 12 Mar 2025 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNYjjBrC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C254256C9E;
	Wed, 12 Mar 2025 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805510; cv=none; b=KXZPocsQmDLEr1fB3GAXLTaZcr13PMp9NPgeL8JOG9lisqHiPyWMUd55qB6n9uhyGOUmZWP4Qr6M4JViO1LfzMz+Qnqun5jqG1e/nCBwKTj/ymGB1KBbFUYMARQ/ldnImAM/f4VSikJnM/mKsE9aOhYoW9aPIchmpAVLQc5JKNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805510; c=relaxed/simple;
	bh=E1EKhvH/3/E+I7074KzqGnDYkH6JWY+UHDd5lGqMH2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHYKaAAxgVHJk7WBhXP934cLdqQs606lM7BgaErkAagahZP/n9HjfcCzYPbWV0rV3i8EjCUMh806h91Ezmd5mYu4RLaOqCJztKc6OVhZz51gJ5a23h6Gy4fs14Do81EkhtGZf+WT/meBRKbWllFhGrir68DJEUuO4klIGm1p5wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNYjjBrC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805507; x=1773341507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1EKhvH/3/E+I7074KzqGnDYkH6JWY+UHDd5lGqMH2Q=;
  b=iNYjjBrCauEhY52kUAY/hVbal22HoQwcoaVZEgvLL+R8yw6lZyhKGLno
   lHjVAju2sB2mDMHLyZKzzDvgjg3elu6KyE34tK/xDxS9KkTf31va1Vzii
   c7szg5IXYytTJecEKyI3qBoAPW/5/Fntxx0STOHKuh85S9KJmr+vdJkg+
   HdvUshH2pufUYT6qeFSRALDQpVm4sLsLVjLmrEan5t6RKLRLpEejKxCDk
   Xzfphu1+6q/+5W2vuMCTRW38ZD1xG9Ev9MRIgbNmdpajJf4v0oYetT7nA
   zEeSNaljhrE644CeJhxRmOSYwDcgo+8OzbPl+tJgDrnD9cvlgmycpx8hO
   g==;
X-CSE-ConnectionGUID: cn30z4f6REK0rN5vBKhEDQ==
X-CSE-MsgGUID: Wh+s2fZMQjir9Ccm7+2eSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30487208"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30487208"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:51:44 -0700
X-CSE-ConnectionGUID: sb07XPEfQhSBLbSfJbryZQ==
X-CSE-MsgGUID: 9s291pTaQ+OuH5pgDbdNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157895061"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2025 11:51:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 23271130; Wed, 12 Mar 2025 20:51:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/6] i2c: core: Drop duplicate check before calling OF APIs
Date: Wed, 12 Mar 2025 20:48:48 +0200
Message-ID: <20250312185137.4154173-2-andriy.shevchenko@linux.intel.com>
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


