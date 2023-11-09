Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9BCC7E7172
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344994AbjKIS2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345015AbjKIS2m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:42 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99993C06;
        Thu,  9 Nov 2023 10:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554520; x=1731090520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yDPVqcRH6sP/SphP24kcue0BYm7loFUON/tJY9ZWFSk=;
  b=jR8e/s9osj+sDSKswsajw9gLFMkQOt/sWTaLOyw29SDujBMDuSJwKgfm
   Pdv7meNl3yVf9IV0sYjviZwUli4FtUZ4A9IVfp3MT8C0sMhcuFZJXwYb9
   WDRabSEYAkYh7r3bwOUF1PT7eF6WwyuFK2DF56+CdcAzCDHSB/KTntB/n
   w1kiUPYGvSNNqAZs7O85BdFyVt+zFaoAbDlTRP7AazPqTJ5TCg5YVLsPE
   nSUbs+d3GoY1A1vn/KSpaVYYOiTYash4GkAV0X7u3JAuW14wXu5HQQw93
   hVux8ZttLB+L51g5i4xsaT6B/A/VWzXZ/YygDRcgNZqxcXZYbiqeJkBBV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389853919"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="389853919"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936938985"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="936938985"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2023 10:28:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AD46B7F1; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 07/12] i2c: desingware: Unify the firmware type checks
Date:   Thu,  9 Nov 2023 20:19:17 +0200
Message-ID: <20231109182823.3531846-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
2.40.0.1996.gbec44491f096

