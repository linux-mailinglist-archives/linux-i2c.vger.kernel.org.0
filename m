Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1B42D2C98
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 15:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgLHOF0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 09:05:26 -0500
Received: from mga12.intel.com ([192.55.52.136]:54828 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729690AbgLHOF0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 09:05:26 -0500
IronPort-SDR: 51s28QewbNonnbUoAtjn9wdIRIQjnrBYNzofXPSqrreKjo7bXNPsoZAWpeDyTG1avtIBVLV7DB
 mmv8H8eD0H4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="153129049"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="153129049"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 06:03:40 -0800
IronPort-SDR: gXKjuzYanx3uqXgoGRan3DtzxtxB9/p7tzz4ua84Fhara0wHMeCP2tX72j1C4zLBfzWbJ8G27Z
 D61+8Ufyd5sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="483635652"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2020 06:03:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 53ECF252; Tue,  8 Dec 2020 16:03:38 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] i2c: designware: Fix indentation in the header
Date:   Tue,  8 Dec 2020 16:03:37 +0200
Message-Id: <20201208140337.33236-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
References: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In couple of places the indentation makes harder to read the code.
Fix it to be sane.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 85307cfa7109..de00e62e8c7a 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -115,7 +115,7 @@
 
 #define DW_IC_ERR_TX_ABRT	0x1
 
-#define DW_IC_TAR_10BITADDR_MASTER BIT(12)
+#define DW_IC_TAR_10BITADDR_MASTER	BIT(12)
 
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH	(BIT(2) | BIT(3))
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
@@ -243,7 +243,7 @@ struct dw_i2c_dev {
 	struct clk		*clk;
 	struct clk		*pclk;
 	struct reset_control	*rst;
-	struct i2c_client		*slave;
+	struct i2c_client	*slave;
 	u32			(*get_clk_rate_khz) (struct dw_i2c_dev *dev);
 	int			cmd_err;
 	struct i2c_msg		*msgs;
-- 
2.29.2

