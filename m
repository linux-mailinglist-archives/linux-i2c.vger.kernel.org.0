Return-Path: <linux-i2c+bounces-9420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A77A33E63
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CB13A1366
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 11:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D736C21D3F6;
	Thu, 13 Feb 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzoxU6x6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9593227EBF;
	Thu, 13 Feb 2025 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739447182; cv=none; b=bqC8COPnyoVGYykHWWJEFtfIb5dZBbjS1cd3zZmfvXZblI8FDRSvOxFNwvf42OzGGekbRtnapfdhOMF3lHp0geHxuurjxrPO2/bqHpcxJ9s5slwEuGBHaZxQmUJjeAjwJRpMjM6ELbBAYygCqgV7sAjyzBllyNDZGiCrTNV2s/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739447182; c=relaxed/simple;
	bh=icD1tbHklgfoVg8ChOGPCYM5DzUK/4PvPrrR8iiqEjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pr9V/jgtuh5SzUh4+ATHN3fwxpUoV5zxM7Rdzt2RBMOnECg6C6aOvFXDWG3607UNA3w+dJkt/GvinCdiHjcfPqE5WaQszwIC73SUWpi9eWY6Xpsb3QvJbW4wir4UeQcTjOaqlCEGJkMLM9Io4kFXYcTiQjtwJaw4fZ1Q+S9nQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzoxU6x6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739447181; x=1770983181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=icD1tbHklgfoVg8ChOGPCYM5DzUK/4PvPrrR8iiqEjc=;
  b=bzoxU6x6jGkHmh9Z5Q+o672Tzex1AKKZoLgKZwA8g6pbbqB86RtI/CSs
   VaJ+o2Rh8jwfbDNsAizOfHSOUBaeHLv3ray7utu+T64hKvaXKNM6WAu9s
   ySCGAtCuBanQ/M372kxkejDLVAXdDD3eSAKCt8D8uMOfUINK9/pBc7mWA
   zvmUy6HEiVK1Z46Eknqnj0MOMo7lxJnFZw2erOyqrQSeL8YKOUTbLOPn8
   9Z1UEM1VDKXS8gnXzlRSm78I/QNqxhnUVPVKYTeLZpdfJ5mOn43v/I2xW
   Rpg1rLvSzf1RhgPgpsenmORAwdC9IBME3ItJLGnHLE/zGAbg/VbQtYhMw
   A==;
X-CSE-ConnectionGUID: OyTEcKNdRGe4DGk52+Obww==
X-CSE-MsgGUID: sS1dYMxLRWyuIB/LE/dHZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40063853"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40063853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 03:46:20 -0800
X-CSE-ConnectionGUID: rsuNv/eRRx6dEWG6tHIbkg==
X-CSE-MsgGUID: zGvG/RwpQ/WI50fUi/Fl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113786677"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 03:46:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EFAA22CA; Thu, 13 Feb 2025 13:46:16 +0200 (EET)
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
Subject: [PATCH v2 2/2] i2c: Unexport i2c_of_match_device()
Date: Thu, 13 Feb 2025 13:45:05 +0200
Message-ID: <20250213114613.2646933-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
References: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

i2c_of_match_device() is not used anymore outside of I²C framework,
unexport it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-of.c |  1 -
 drivers/i2c/i2c-core.h    |  9 +++++++++
 include/linux/i2c.h       | 11 -----------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..02feee6c9ba9 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -157,7 +157,6 @@ const struct of_device_id
 
 	return i2c_of_match_device_sysfs(matches, client);
 }
-EXPORT_SYMBOL_GPL(i2c_of_match_device);
 
 #if IS_ENABLED(CONFIG_OF_DYNAMIC)
 static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 36587f38dff3..4797ba88331c 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -84,8 +84,17 @@ static inline void i2c_acpi_remove_space_handler(struct i2c_adapter *adapter) {
 
 #ifdef CONFIG_OF
 void of_i2c_register_devices(struct i2c_adapter *adap);
+const struct of_device_id *i2c_of_match_device(const struct of_device_id *matches,
+					       struct i2c_client *client);
+
 #else
 static inline void of_i2c_register_devices(struct i2c_adapter *adap) { }
+static inline
+const struct of_device_id *i2c_of_match_device(const struct of_device_id *matches,
+					       struct i2c_client *client)
+{
+	return NULL;
+}
 #endif
 extern struct notifier_block i2c_of_notifier;
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2b2af24d2a43..997e80649889 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1029,10 +1029,6 @@ static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node
 	return i2c_get_adapter_by_fwnode(of_fwnode_handle(node));
 }
 
-const struct of_device_id
-*i2c_of_match_device(const struct of_device_id *matches,
-		     struct i2c_client *client);
-
 int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
@@ -1053,13 +1049,6 @@ static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node
 	return NULL;
 }
 
-static inline const struct of_device_id
-*i2c_of_match_device(const struct of_device_id *matches,
-		     struct i2c_client *client)
-{
-	return NULL;
-}
-
 static inline int of_i2c_get_board_info(struct device *dev,
 					struct device_node *node,
 					struct i2c_board_info *info)
-- 
2.45.1.3035.g276e886db78b


