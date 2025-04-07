Return-Path: <linux-i2c+bounces-10135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C96A7DA8F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 12:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C5213AEF61
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80696235C01;
	Mon,  7 Apr 2025 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kehfOrj7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE02233717;
	Mon,  7 Apr 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019943; cv=none; b=ake2+rYgIgmiXqGSmEXDvP6i6B/uo3W/t8Zy0+FRw5fVgvni+whYyjFJ5tkTz4p2FMIWakWhUk+rqa4Yq3huDXRuQcDcP/zfRcK20fGbX0xBvPIEtEAyqfj3oEzRfxTE6Gp0x9u4txjmg0WldOE0aXNaF7E+3dcwm4AY2eQHnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019943; c=relaxed/simple;
	bh=O8EfThU5MyAxi4xa2ZcUb7XQES2zhDiFxwmhDKkyTh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9La92TLwE8xbwKS63ZhCPvwPwyJtCE0CkVNfeZfAVLpJ/uwKLAkv6pdzuQppVJI9VdHXhTup7puVRgZYUDvPDd+iSI7g4C9CLuptJD1irJrQ4YL2lyBEalhTA2RTzH4Hf01VpqcBysWM4eEpJfO68Jg09oGseAqC4CRanqwhgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kehfOrj7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019942; x=1775555942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O8EfThU5MyAxi4xa2ZcUb7XQES2zhDiFxwmhDKkyTh0=;
  b=kehfOrj7McWwtlTVZFjesx55QA1lNYh2cWM/30E2STisCYYNwWRLuPNu
   9lL0wNisxWmZ//xehLvPq/qXBTYOT/iAED3SJOh5XmJnrqJpiO7NVCmKO
   8M/gO7mIsTKT6eRmUrX+GqrWGkG7kPVBcLMz3qMCYFqXxdevAulduo7Rw
   qPOpGDo7JMOHK+yMmZ2yJGSe/5gy9cltos0LqXfecKdlH/Xe7QCDkoRn9
   iT9Oz8HzdWd8HexXdQdKz9A6TfT8wyKluusjoXnMKhjc15/JPKS7u6Ya1
   cLSXnxIHNidub62fbf7Kxs2A2ixEfSDA9aU3fQUtgS1yPqH28ApYD/DV8
   w==;
X-CSE-ConnectionGUID: yVij85MSRk+Zw9ImsZ7jVg==
X-CSE-MsgGUID: YCT5z8iEQOKQm//P7/0pzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49188885"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49188885"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:59:00 -0700
X-CSE-ConnectionGUID: 0FOHzRE5RC67xtRtAqQjlg==
X-CSE-MsgGUID: otZs+o0tRpqMynUm+QJXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128411736"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 02:58:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BAC7426A; Mon, 07 Apr 2025 12:58:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 5/6] i2c: core: Do not dereference fwnode in struct device
Date: Mon,  7 Apr 2025 12:55:16 +0300
Message-ID: <20250407095852.215809-6-andriy.shevchenko@linux.intel.com>
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

In order to make the underneath API easier to change in the future,
prevent users from dereferencing fwnode from struct device.
Instead, use the specific device_set_node() API for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 18 ++++++++++--------
 drivers/i2c/i2c-core-of.c   |  1 -
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index a0d3aec6c00e..c0df67619364 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -961,6 +961,7 @@ static void i2c_unlock_addr(struct i2c_adapter *adap, unsigned short addr,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	struct fwnode_handle *fwnode;
 	struct i2c_client *client;
 	bool need_put = false;
 	int status;
@@ -1001,18 +1002,19 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.parent = &client->adapter->dev;
 	client->dev.bus = &i2c_bus_type;
 	client->dev.type = &i2c_client_type;
-	client->dev.of_node = of_node_get(info->of_node);
-	client->dev.fwnode = info->fwnode;
 
 	device_enable_async_suspend(&client->dev);
 
+	fwnode = info->fwnode ?: of_fwnode_handle(info->of_node);
+	device_set_node(&client->dev, fwnode_handle_get(fwnode));
+
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
 		if (status) {
 			dev_err(&adap->dev,
 				"Failed to add software node to client %s: %d\n",
 				client->name, status);
-			goto out_err_put_of_node;
+			goto out_err_put_fwnode;
 		}
 	}
 
@@ -1031,8 +1033,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
 	need_put = true;
-out_err_put_of_node:
-	of_node_put(info->of_node);
+out_err_put_fwnode:
+	fwnode_handle_put(fwnode);
 out_err:
 	dev_err(&adap->dev,
 		"Failed to register i2c client %s at 0x%02x (%d)\n",
@@ -1060,11 +1062,11 @@ void i2c_unregister_device(struct i2c_client *client)
 		return;
 
 	fwnode = dev_fwnode(&client->dev);
-	if (is_of_node(fwnode)) {
+	if (is_of_node(fwnode))
 		of_node_clear_flag(to_of_node(fwnode), OF_POPULATED);
-		of_node_put(client->dev.of_node);
-	} else if (is_acpi_device_node(fwnode))
+	else if (is_acpi_device_node(fwnode))
 		acpi_device_clear_enumerated(to_acpi_device_node(fwnode));
+	fwnode_handle_put(fwnode);
 
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 02feee6c9ba9..eb7fb202355f 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -49,7 +49,6 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 	}
 
 	info->addr = addr;
-	info->of_node = node;
 	info->fwnode = of_fwnode_handle(node);
 
 	if (of_property_read_bool(node, "host-notify"))
-- 
2.47.2


