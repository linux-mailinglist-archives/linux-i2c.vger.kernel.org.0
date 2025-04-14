Return-Path: <linux-i2c+bounces-10328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C0A87CE9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88563B63A9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022C726A0E9;
	Mon, 14 Apr 2025 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oz9Qq0xu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB29E267F7F;
	Mon, 14 Apr 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625063; cv=none; b=hx5jL6W+3qDv2THZjU29YxKBZoDsZOre0T6wBrEcTMqZfxlQDr+3uqYfxnYXTTgPhKjahTmpIXF12RDrbE7+40Y5JkTgFCEmH8vITMa55KzVDJpOH4et/i9JvezUZUilbbQoQtX/PHexg60lDvorS8AHnzcRksvRkem1l3bNU6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625063; c=relaxed/simple;
	bh=bd4KAj3sdChvsK2ffRzybcufhcAUos8+tbD1pYSMCgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjL/k1NI9Fe/bfBxdXOp3QbvMkCe7gZ5747R4623GlDZFQ34d02yl46RIOqurjeJnHbsQCiiBghV8I4buuXSgk8oj4f16JvUdBp/7g78YcLsL66z2sfgdHi+vOIr0epSjigX6yLgY+4VYiss7fY/Wvnvzy7MHLXEpuMFdh/Ivdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oz9Qq0xu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625062; x=1776161062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bd4KAj3sdChvsK2ffRzybcufhcAUos8+tbD1pYSMCgY=;
  b=Oz9Qq0xuymQ7GTrSD4rJOqWHI28GQ1u9lkeiXfBSOOTg7/h0FkSATmII
   3g3Fxe04ixa/hxpJSGw16SdZy/dApWOqRMCCxqG0nXUgjexWb0Pgu07Lj
   tXEBzWlXJzPIBBXq164YJ9bkVeiRhEJTPx4khABDBvvHWLfueJEvRio2b
   ujKbaInc9eMuEUdrA5ydX3J61XxhUKNDLCQVApjilVELRHuER7nOu2Omr
   kNC1C/ig+yAw7eJnw+Qh73AxuHXSnbbzZn11pehN53kOy+4b8X54ST5DV
   1Kc5G7jg2fh/tvBT0kpwW1QRPmVA422RgNGweKsn1GNCEBYZXzdkSyVrC
   w==;
X-CSE-ConnectionGUID: MfHGMLCjTBmIFnzeovTHZg==
X-CSE-MsgGUID: cgedOvycQUC/HyuM82EoYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56747135"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56747135"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:19 -0700
X-CSE-ConnectionGUID: lWAQZE7wSJOgxe+U1HI3ZA==
X-CSE-MsgGUID: dE8JzJi0S6u+DENQ/kymgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134747331"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2025 03:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0AD29AF1; Mon, 14 Apr 2025 13:04:12 +0300 (EEST)
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
Subject: [PATCH v4 5/7] i2c: core: Do not dereference fwnode in struct device
Date: Mon, 14 Apr 2025 13:01:55 +0300
Message-ID: <20250414100409.3910312-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
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
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 18 ++++++++++--------
 drivers/i2c/i2c-core-of.c   |  1 -
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9ca1ade043ed..dc3c60a7d382 100644
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


