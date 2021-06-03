Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BAA39A523
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 17:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFCQAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 12:00:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:44027 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229789AbhFCQAh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 12:00:37 -0400
IronPort-SDR: ixFC8BA/n0EWhrmxna1B1vZVBY7z8bUKGUlhWlRcgfohsLrHujQ2aelk4j1c7LEX0BF6MS1Swb
 pJN3Xx3jVyJw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="267937932"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="267937932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 08:58:52 -0700
IronPort-SDR: xGO7nyNBFj5Nptv/F7vVfHR+5xXzNk+EPAbrkKfZy4796YFFnkIBBV+m4HeRmWwC22TW7QErYM
 YuvL2BAk9Suw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="447910719"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jun 2021 08:58:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ED5AA3B6; Thu,  3 Jun 2021 18:59:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsas@kernel.org
Subject: [PATCH v1 3/3] i2c: designware: Fix indentation in the header
Date:   Thu,  3 Jun 2021 18:59:10 +0300
Message-Id: <20210603155910.35530-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603155910.35530-1-andriy.shevchenko@linux.intel.com>
References: <20210603155910.35530-1-andriy.shevchenko@linux.intel.com>
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

