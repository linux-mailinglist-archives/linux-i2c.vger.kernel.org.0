Return-Path: <linux-i2c+bounces-321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511A7F160A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E5BE1C2182C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90F91CAB2;
	Mon, 20 Nov 2023 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ma6yvUUF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D100D4D;
	Mon, 20 Nov 2023 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491617; x=1732027617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mWnrCbe952qZv1cdRW5+nJoDJDChwK0VNgu5M+CVVe8=;
  b=Ma6yvUUFxOc5hswOn0EoW04i+KwE30SfweummFWecKd++fxSDo1rnE2p
   ZwGLo8M9gH0f2ksQPNDmw2YLhG8Mff90vMG6hg0chdrA4sgeeKTYf9LNw
   6JPKN7a0vAc8OnoqqBaaqTroi82aVtZjEToD4chbND7T6RBgvKvvshEAv
   JykvI7pTssUcyGQdTvjuGelnF09hfZ8jKEXrLEOf6923y4qKopnsvdu+w
   uBEwFmSWBS+qXszenmSjrXp73lD0/bZsEX+rDzcBEQinKZEgu2LPsvTjD
   J49RSs3Z8fgJOlgWNr0cxeY68cGs60XJ8z0vJfsWLQiK8aMa2EjXtBpTt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382017054"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382017054"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832291652"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="832291652"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 06:46:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D47AA516; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 15/24] i2c: designware: Unify the firmware type checks
Date: Mon, 20 Nov 2023 16:41:57 +0200
Message-ID: <20231120144641.1660574-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
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
index d3ddfec46200..fb75e9b3d4fc 100644
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


