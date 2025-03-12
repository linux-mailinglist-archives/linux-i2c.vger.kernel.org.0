Return-Path: <linux-i2c+bounces-9811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7ABA5E3ED
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29F6176BBA
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD53C25A333;
	Wed, 12 Mar 2025 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKMzrJ0B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C10259489;
	Wed, 12 Mar 2025 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805512; cv=none; b=AsoOOeW54MdD0TYQQ3kZ5iyfkdEBrbNzKNDKnVsSeqSh7h1rSt1y1vd8txKu70EkysHP+4nsEvuVQUFX8eRPkgplp2JnvgcrrKb9AJpuNA8HT8w+NPkbIQGZnnnCWodZKXhR/A2KMb7xnmo3AjOZLJBUuit0F3n3Zvj/WXbMyRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805512; c=relaxed/simple;
	bh=V6+0IS7/fqFcASSZF65vr6gKqboR4LhF8+CjfKajdFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+sVo5KPGoEZoidArI7NJZpr6aFqnkxvmx2BBL277MbAqAeadEg6Ua8Z+0ZVamN1Nf1+u6O6r2IUoIb4FwxSaNlqpfMQgqWdnB+DijdvN+t/0qWoPOFU2xmmO9ZPWesoqzaQNiPkTtIt/ooQl5e4IoGg14JZWdnDf5mPAR1mvfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKMzrJ0B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805511; x=1773341511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V6+0IS7/fqFcASSZF65vr6gKqboR4LhF8+CjfKajdFo=;
  b=gKMzrJ0BD4fSnddjXjBdRde36WfB5BXDFTLqdCrv/ovnEphLFlGIJd5e
   50Zzc0l8APLeBtrHzkoK8hMNGEyzPxqLWs+AFZ9VHf5UUswwMq0z4qcOX
   +O1yERTnqQ9kch26yIjUMDm4VgMAXkVvddQsyt4jVuRCRs8GTcidVyrWE
   9IJpB80Cv2+0+N8vq1fm6xMYV3TH0W/XGIvKvh48R9u5s2LuVDQoMAQnP
   iHzFZ1VlyiHRzEGagvFBtlThqkhZWpFFdX5JDFJAiBXAl2k2iy5LbvO1c
   1tKwDhG0xjHyXVzqb8as8gXqLjWdRb4dZBufIAf9jdpFtgWHBBTdm514W
   g==;
X-CSE-ConnectionGUID: 5EexcDADRFuVUhcvYoxrWw==
X-CSE-MsgGUID: vIsOLdE4TpaV50DJqypvzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30487222"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30487222"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:51:47 -0700
X-CSE-ConnectionGUID: BWOY4Yn1RCusRoEyDrY+KQ==
X-CSE-MsgGUID: Qgpdi5QDT3OYaLTrW6uPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157895068"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2025 11:51:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 53DC727D; Wed, 12 Mar 2025 20:51:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/6] i2c: core: Do not dereference fwnode in struct device
Date: Wed, 12 Mar 2025 20:48:52 +0200
Message-ID: <20250312185137.4154173-6-andriy.shevchenko@linux.intel.com>
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

In order to make the underneath API easier to change in the future,
prevent users from dereferencing fwnode from struct device.
Instead, use the specific device_set_node() API for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 1236061a78c3..dba6c5ce9d42 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -962,6 +962,7 @@ static void i2c_unlock_addr(struct i2c_adapter *adap, unsigned short addr,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	struct fwnode_handle *fwnode;
 	struct i2c_client *client;
 	bool need_put = false;
 	int status;
@@ -1002,18 +1003,19 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
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
 
@@ -1032,8 +1034,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
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
@@ -1061,11 +1063,11 @@ void i2c_unregister_device(struct i2c_client *client)
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
-- 
2.47.2


