Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09357E716A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345009AbjKIS2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344987AbjKIS2j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:39 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0533C04;
        Thu,  9 Nov 2023 10:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554517; x=1731090517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FNPib3amku2OveJFmG0UkpnYVRBDCdjSLX+9Rx4QUOQ=;
  b=UR0fdGArXXzlJXCCo2QGoWTMyMmbs5lH/eN9zPduIxFLylEq6wwG2KxY
   AO27OR5ExEsWORt1afx317bmEKSqFZ1CjkfCpvXKqy969jaShrAXm3jqu
   LuQocEQvJ1bw7il9IBMz+w0Br6+Lc991N8Pec/ItOBvIPhwt+ImakTHda
   TYpaIwLj8KxzUlwM1k9Qd7Vk/WJUNP2IcSCVd34amiUg7DOWR8FX0PnIe
   apajsKUciZByFiO+myunKMASGp4cIS9/21zvaTX/cLMe6Jl+18i7hWonI
   NXfi8e9nvrykBPyq5vinTsq1oc+ufCnLagwfpoBhN+aZzNeAH1BEb05pJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375088668"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="375088668"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="767086814"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="767086814"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2023 10:28:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6B07876D; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
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
Subject: [PATCH v2 03/12] i2c: designware: Drop return value from i2c_dw_acpi_configure()
Date:   Thu,  9 Nov 2023 20:19:13 +0200
Message-ID: <20231109182823.3531846-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_dw_acpi_configure() is called without checking of the returned
value, hence just drop it by converting to void.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 4 +---
 drivers/i2c/busses/i2c-designware-core.h   | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index affcfb243f0f..8d2223d164e3 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -255,7 +255,7 @@ static void i2c_dw_acpi_params(struct device *device, char method[],
 	kfree(buf.pointer);
 }
 
-int i2c_dw_acpi_configure(struct device *device)
+void i2c_dw_acpi_configure(struct device *device)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 	struct i2c_timings *t = &dev->timings;
@@ -285,8 +285,6 @@ int i2c_dw_acpi_configure(struct device *device)
 		dev->sda_hold_time = fs_ht;
 		break;
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index a7f6f3eafad7..f4dc08139624 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -397,7 +397,7 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
-int i2c_dw_acpi_configure(struct device *device);
+void i2c_dw_acpi_configure(struct device *device);
 #else
-static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
+static inline void i2c_dw_acpi_configure(struct device *device) { }
 #endif
-- 
2.40.0.1996.gbec44491f096

