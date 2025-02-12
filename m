Return-Path: <linux-i2c+bounces-9399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C7A32C6C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED4B188AE72
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEC7256C83;
	Wed, 12 Feb 2025 16:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+Ahi2RC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C79253B5B;
	Wed, 12 Feb 2025 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379022; cv=none; b=cvjkXgVjzn+UNgxdAdTIAOX1ouMuYLneCl7MH8JjiyILInL26jrvu60Ka6TPM6OWdldTaL/3HkM0AbQc176PnB3ABHYYg2MI3Q6uHZrP+cEfSUlmfnOxfc7s+bkaggRovzntb1YqRgkRWFZ8noDoA/PmLdI+zELxf7e4RaKguXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379022; c=relaxed/simple;
	bh=1+Mz2ycujLjY41kSFCBp2VosgomPuA1VzEOfiJ+uivo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6wO3P5+dHC5Z6p55LgFCYmRnl+RUgRzRriqG5NKiGomUUcJ9h5SMWq+aizO5nSX+1RvQ1DzonSN36QGFJ+hr65B6oHR0wU5Bs52cfUH0Z7yf27F1ESw3OYsZGqUiv/gMW0zh++jY7wQiSz5hFA+ce/EM9RERQA9rUHFSVggDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+Ahi2RC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739379021; x=1770915021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1+Mz2ycujLjY41kSFCBp2VosgomPuA1VzEOfiJ+uivo=;
  b=H+Ahi2RCTw0pz39pVAAd4Y6cXueRXFbt2Nr4UT7CTkTFjcST5BQDlnAh
   PqvLUw0n2qyVtSp8mhdS0XUs5oeX2n24b+wwxXny4K/6C0rRmLfMJQj9r
   IoQF02ARgT84jLK26yaK5Fy2itSzJvdMEzOqZ6qdBLnlaM/xPfB86Wh2m
   UPpGbdeZ3jn3mZpmmo9KS+zBsBV8d0mh+O8fGRX553groQwnZosE4FSyT
   4bX0PYO1PIS4wcSz7hFQkWdrNjWG+yy88vJAZqHzP5odWlTozN8wUKeRi
   b/23678CLAq9rQ/oZcCQB8vpIMPDsQrdZRCvk9VBnAPqRhrrwGErx6Rem
   g==;
X-CSE-ConnectionGUID: Yax0ljPUQOKZYGjLoMLZNw==
X-CSE-MsgGUID: tn4xmZ0/ToOhkOE8M2XOTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39930865"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39930865"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:50:16 -0800
X-CSE-ConnectionGUID: dPksZOdzSPqSiiygsAVuLw==
X-CSE-MsgGUID: Tt0Gv14jRu2+1/mwfX4uRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="113539612"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2025 08:50:14 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3B8A91FD; Wed, 12 Feb 2025 18:50:13 +0200 (EET)
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
Subject: [PATCH v1 2/2] i2c: Unexport i2c_of_match_device()
Date: Wed, 12 Feb 2025 18:46:24 +0200
Message-ID: <20250212165012.2413079-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212165012.2413079-1-andriy.shevchenko@linux.intel.com>
References: <20250212165012.2413079-1-andriy.shevchenko@linux.intel.com>
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
index ae2ef3da6ecd..4d281ff5582b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1039,10 +1039,6 @@ static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node
 	return i2c_get_adapter_by_fwnode(of_fwnode_handle(node));
 }
 
-const struct of_device_id
-*i2c_of_match_device(const struct of_device_id *matches,
-		     struct i2c_client *client);
-
 int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
@@ -1063,13 +1059,6 @@ static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node
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


