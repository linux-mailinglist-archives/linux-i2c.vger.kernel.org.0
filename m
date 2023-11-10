Return-Path: <linux-i2c+bounces-26-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5827E81AA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FA15B20C95
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601283A29A;
	Fri, 10 Nov 2023 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoLZ3TZG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044C3A298
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:31:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0C3129207;
	Fri, 10 Nov 2023 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641065; x=1731177065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rMCJyp3s0CVWHHyikBnsf5d5zvaMttv+rzq/RNKsO7w=;
  b=HoLZ3TZGh3JEzWijA0dxenmQhVTfmmtC/32fRYBsJ/DCyNJeCsvT1IXR
   CgFQcQ43wkqgbLADvJoNgVpTnHINNmiuxTxzQbRMQJvRWhKUI8x5CMKul
   obelbVd9//o2q59dCWYDF3x7hb0QlUqVye4L8FbhICGCaEaBqtT7mMbeo
   oNjSOO9Jf/PqkX8QMlyl3jix6S2mWm4lSvJ2RSYzswS/LAEL91xfKdGnE
   WWqAAlWV3LFU7m5BrBQ7Nryr0DPrESZGaj7bT5UTuSAr5vcLsZus/SLFZ
   uoNLhW/ilGWXh87m/FEFYc/tBMh9v4v092pLomStzZW3+u0wTpt8wiBEr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380606862"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="380606862"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792912168"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792912168"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2023 10:29:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1318A8C1; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 16/25] i2c: designware: Unify the firmware type checks
Date: Fri, 10 Nov 2023 20:11:36 +0200
Message-ID: <20231110182304.3894319-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
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
index a5cae814a9c2..49d9d5f83071 100644
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
2.43.0.rc1.1.gbec44491f096


