Return-Path: <linux-i2c+bounces-5699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 560DC95BDEE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 20:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 097A9285E12
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 18:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4931C1D0DE5;
	Thu, 22 Aug 2024 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzJqJR7d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE3F1D04B5;
	Thu, 22 Aug 2024 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349868; cv=none; b=Ue9pnIYKKBUezLzkoPt+JQ5GSRs+34LIhRPeADyag1g56eZxyoP3fQw95B/a42UDW0tDnjmrPJwW97rOVkc+H6u4jtWGF0h1CDI16T8bXuj/pHneYchcmKuxdnTlHt0EVZxfYxsiQy40UlKDueyy/I96xec8if/yO5HVBpg81YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349868; c=relaxed/simple;
	bh=JK0kDqy8Ygqq4oUSt4jmNEjBBamULbvcQSANgMZ1PzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IigLXoAA87LRzLx5h0BWx1gUVhqjGCvyRPeDFxWXETEJRGrlAKQd2palB/36fA/tVcrkXsCm85/VB0DM9eSXTSDGbvAJCyxghnLLxPLUvrBCvVn0GWGK/PgQvLtyBpoDH7I+0/+pgtzn1rrMd62grsWDPt9uczvpBU004psN8ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzJqJR7d; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724349866; x=1755885866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JK0kDqy8Ygqq4oUSt4jmNEjBBamULbvcQSANgMZ1PzY=;
  b=jzJqJR7dmOmYpB+EDA39mpyI1KmiVdhs8vG4NyZOfuVRraK0SxeC3PVg
   0s2LlBcBXZY9S2yRYW9byZbt4Omd1KdtWx7VkTQiG47ezg8sGHQb+htOM
   xjFj3ccprMIgzwx/WZexSrGDQgO+ibRrzOf42ONQZtlKR85B56uu+KsWU
   2/2lgQXdO3I3vPm1xvevNhwbwxAmCpqWpEoB3tFxQ7w5GyyCNO1S/Qnlh
   B+NebRfDXH3Dh7dR0ZwuDAypv+SOe3MpcPppYLj60SC0raNhRymcEEaHk
   eJBCILQujC3TMxWf+vYV1KCgiJrgG/xI0aTxFkR9SPQcAvGGlQA+UyJmM
   w==;
X-CSE-ConnectionGUID: Ik854R7FQ3i9C0MjSUxR7w==
X-CSE-MsgGUID: KlXMZmIbQZuLyBlJNoZyfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26656209"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="26656209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:04:20 -0700
X-CSE-ConnectionGUID: +hCcj4xPSTeh0y1sovcqmA==
X-CSE-MsgGUID: ux4SOoZ9T7KrKvtOMBMkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="62074201"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 11:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6E618331; Thu, 22 Aug 2024 21:04:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v1 3/5] i2c: designware: Unify the firmware type checks
Date: Thu, 22 Aug 2024 20:58:39 +0300
Message-ID: <20240822180411.2298991-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
References: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of asymmetrical checks for the firmware type use
the is_*_node() calls.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index b0d3c47d93ce..2c460093b7ab 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/swab.h>
 #include <linux/types.h>
@@ -372,14 +373,15 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
 	struct device *device = dev->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(device);
 
 	i2c_parse_fw_timings(device, t, false);
 
 	i2c_dw_adjust_bus_speed(dev);
 
-	if (device->of_node)
+	if (is_of_node(fwnode))
 		i2c_dw_of_configure(device);
-	if (has_acpi_companion(device))
+	else if (is_acpi_node(fwnode))
 		i2c_dw_acpi_configure(device);
 
 	return i2c_dw_validate_speed(dev);
-- 
2.43.0.rc1.1336.g36b5255a03ac


