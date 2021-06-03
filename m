Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135DB39A540
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 18:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFCQGE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 12:06:04 -0400
Received: from mga11.intel.com ([192.55.52.93]:32152 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229822AbhFCQGD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 12:06:03 -0400
IronPort-SDR: Jjthg7G/TP0kh3lYlZnLpfRm3sJp4gG/n7RYngiVTqJhKrb8ELPPch1RCDKQqvISrOSkFEPjXA
 nO9f9mHZ36Vw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="201062996"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="201062996"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 09:04:17 -0700
IronPort-SDR: q9z479eGKk2mKD248U6tlM60QaXv/WT6AZscxHfgOLcf9/6fT/QtBVOZIzMvCJ7b6PibQp8cST
 BwNbXVzxBhMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="417427734"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jun 2021 09:04:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E3511456; Thu,  3 Jun 2021 19:04:38 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: [PATCH resend v1 3/3] i2c: designware: Fix indentation in the header
Date:   Thu,  3 Jun 2021 19:04:33 +0300
Message-Id: <20210603160433.35816-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
References: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
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

