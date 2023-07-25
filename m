Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30327761BBD
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbjGYOai (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbjGYOa1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:27 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCEE10CB;
        Tue, 25 Jul 2023 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295425; x=1721831425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NjSKFlVlUVc3a6pg8Ryc7U984Hk+aqE+VeBi1lqrfFI=;
  b=D7zhlND3gP8QmXd+dJj+hicow7ew/fT2aTZWNBfC3VAYofRJdVjIXKQN
   3OekIqbOg/SSByts6Q1Dfbjt1DsZuNHyVPIU+jPOa2X1CDxXcaFwkzXEt
   uBrdoZK+gD95SK3bAHJiUzBvnjYRk4IgF8MaP26XKnZgNAALt+h00cjzn
   kIRCxnwtGBThgoVX4Dq9SpC941vyc0wwPuVvht0fQWFO7vYkBlqipUgLw
   pDRS+nMxwdiWVJcNvO6Xj6cNWVryAVLtBnF909DeIOLE7wukX8+I8cgSz
   +BXiXJw7RxfjGGoyKxoWUv00HL8Gnc9fPygpaV7maf59vGBd2VNcRb7ih
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="433992494"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="433992494"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1056804945"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="1056804945"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2023 07:30:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D3DF23CC; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 7/9] i2c: desingware: Unify firmware type checks
Date:   Tue, 25 Jul 2023 17:30:21 +0300
Message-Id: <20230725143023.86325-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of asymmetrical checks for the firmware use is_*_node()
calls. With that, drop now local wrappers against

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 23 +++++++---------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 443426474cfc..e6df6a484955 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -241,15 +241,9 @@ static void i2c_dw_of_do_configure(struct dw_i2c_dev *dev, struct device *device
 	}
 }
 
-static void i2c_dw_of_configure(struct dw_i2c_dev *dev)
-{
-	if (dev_of_node(dev->dev))
-		i2c_dw_of_do_configure(dev, dev->dev);
-}
-
 #else	/* CONFIG_OF */
 
-static inline void i2c_dw_of_configure(struct dw_i2c_dev *dev) { }
+static inline void i2c_dw_of_do_configure(struct dw_i2c_dev *dev, struct device *device) { }
 
 #endif	/* CONFIG_OF */
 
@@ -329,12 +323,6 @@ static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *devi
 	}
 }
 
-static void i2c_dw_acpi_configure(struct dw_i2c_dev *dev)
-{
-	if (has_acpi_companion(dev->dev))
-		i2c_dw_acpi_do_configure(dev, dev->dev);
-}
-
 static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 {
 	u32 acpi_speed;
@@ -355,7 +343,7 @@ static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 
 #else	/* CONFIG_ACPI */
 
-static inline void i2c_dw_acpi_configure(struct dw_i2c_dev *dev) { }
+static inline void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *device) { }
 
 static inline u32 i2c_dw_acpi_round_bus_speed(struct device *device) { return 0; }
 
@@ -380,14 +368,17 @@ static void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 
 int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(dev->dev);
 	struct i2c_timings *t = &dev->timings;
 
 	i2c_parse_fw_timings(dev->dev, t, false);
 
 	i2c_dw_adjust_bus_speed(dev);
 
-	i2c_dw_of_configure(dev);
-	i2c_dw_acpi_configure(dev);
+	if (is_of_node(fwnode))
+		i2c_dw_of_do_configure(dev, dev->dev);
+	else if (is_acpi_node(fwnode))
+		i2c_dw_acpi_do_configure(dev, dev->dev);
 
 	return i2c_dw_validate_speed(dev);
 }
-- 
2.40.0.1.gaa8946217a0b

