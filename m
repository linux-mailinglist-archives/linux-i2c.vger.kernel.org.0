Return-Path: <linux-i2c+bounces-10185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297FA7E576
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 18:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C75103A18C3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741F12066DC;
	Mon,  7 Apr 2025 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVMpubRv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D20205E0D;
	Mon,  7 Apr 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040988; cv=none; b=oounBGaUuKGDNzVAxSi02VTyLmdw587nKIxjKCkyc0M8JlBiRRyEV0Ok8YBwwlZ3I2VAONrRQduo52VQzezG0PgBJnT3yjBSvV/sHxKmMIu509ipnWcSwDVvONDW43J5rMuNkWvZd1mOHF4JHvL64G/aC2KKWI93EvkfaCfj9G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040988; c=relaxed/simple;
	bh=ocKwfB6Vxkwa5A0pOC/2iu6YUSeofDIGwtON0zWaRqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PY+tbQzRjKrY6SoLU1fnHISmA6DQFJWhI3/hIS6tW9SHJqahvkb2nFOPQ+IhEOh4QG0GpX9C0VSm2dmmZWv7X0T/8m0X1i6cvHsHuaH4QW1v5B12xHGmso8hjGXQAIQ/9cbTVOJoH+lPDXaB1saNDnVRVnbnb0rmBkB/kNfZ6no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVMpubRv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040986; x=1775576986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ocKwfB6Vxkwa5A0pOC/2iu6YUSeofDIGwtON0zWaRqc=;
  b=AVMpubRvpRfnZ0N/RquR/RrtFZ/POLmgrzn425VcwH45bRq2AeriKcXi
   X3it7PwtAmZ2xHleZmyAJ6duN/he05OQcANnlnnQ2/gOzLbuSP5K0wn2l
   T8Ie3wcuTkogZ1gbBzhaQOHX+TGVz2FtSzwJCGpROLLXluxs1Oq79pO8U
   zpSGPukzDps5IBfV24rYIZwImXsOT+vQiiVBVs7DqDaeGBnANrBavq02k
   rRMeFfuaH7w02kOvTrro+BRO8mHGCE6boE1GBv1psoVerfGAlmrVNmm/X
   LvVYmIKJOlRwJkVZWqpOyzKZtC+MnkmrwxNedodMvdXtSfEHAsyOulD4V
   w==;
X-CSE-ConnectionGUID: ryl0L6oPQTuPKj2mqpjBkA==
X-CSE-MsgGUID: YkcswM17QKG6SGI3DNyQVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45555078"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45555078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:46 -0700
X-CSE-ConnectionGUID: MC8pyHIATC+QncCGO7ygBw==
X-CSE-MsgGUID: sQ8uBaVGTxKz8/ZnJix3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158986668"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 07 Apr 2025 08:49:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BF6882E4; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 5/7] i2c: core: Do not dereference fwnode in struct device
Date: Mon,  7 Apr 2025 18:45:01 +0300
Message-ID: <20250407154937.744466-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
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

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 18 ++++++++++--------
 drivers/i2c/i2c-core-of.c   |  1 -
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index c92badadd47a..d9e2f9559ce4 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -965,6 +965,7 @@ static void i2c_unlock_addr(struct i2c_adapter *adap, unsigned short addr,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	struct fwnode_handle *fwnode;
 	struct i2c_client *client;
 	bool need_put = false;
 	int status;
@@ -1005,18 +1006,19 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
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
 
@@ -1035,8 +1037,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
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
@@ -1064,11 +1066,11 @@ void i2c_unregister_device(struct i2c_client *client)
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


