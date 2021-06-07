Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B31339E038
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhFGPZT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:25:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:49117 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230226AbhFGPZS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 11:25:18 -0400
IronPort-SDR: gsqVsUxdvpLT0gYfdrs85sN3IKWFsxoGIukOtV6M+r5hxQUxbZf5eL2UEbPQ275UyCl/Czooy7
 5K22ylb0ht8w==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204457151"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="204457151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 08:23:26 -0700
IronPort-SDR: BX9d2tQscwdi2GyUamI3FiWdcaqJbLx8RPuPM6dy61aSDorKkwsVyfVhmEmZpr9JQakeG1+M21
 TfRkuOsrSRKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="551922470"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2021 08:23:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F414418E; Mon,  7 Jun 2021 18:23:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: [PATCH v2 3/3] i2c: designware: Fix indentation in the header
Date:   Mon,  7 Jun 2021 18:23:44 +0300
Message-Id: <20210607152344.57458-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In couple of places the indentation makes harder to read the code.
Fix it to be sane.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/i2c/busses/i2c-designware-core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 6a53f75abf7c..60a2e750cee9 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -117,7 +117,7 @@
 
 #define DW_IC_ERR_TX_ABRT	0x1
 
-#define DW_IC_TAR_10BITADDR_MASTER BIT(12)
+#define DW_IC_TAR_10BITADDR_MASTER	BIT(12)
 
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH	(BIT(2) | BIT(3))
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
@@ -245,7 +245,7 @@ struct dw_i2c_dev {
 	struct clk		*clk;
 	struct clk		*pclk;
 	struct reset_control	*rst;
-	struct i2c_client		*slave;
+	struct i2c_client	*slave;
 	u32			(*get_clk_rate_khz) (struct dw_i2c_dev *dev);
 	int			cmd_err;
 	struct i2c_msg		*msgs;
-- 
2.30.2

