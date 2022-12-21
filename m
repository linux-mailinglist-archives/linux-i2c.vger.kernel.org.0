Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78ECA65374D
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Dec 2022 20:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbiLUT7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Dec 2022 14:59:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiLUT7T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Dec 2022 14:59:19 -0500
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758E5BE26;
        Wed, 21 Dec 2022 11:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671652759; x=1703188759;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zQXqnAGgpQQ8/kgGIKKQgdQDWXW93J/yk8fxK9q7Ehs=;
  b=HFFocTGikglWAv8e3EQye19vgq0r0//1FDMQWLdZXnJ5B7iwfQKMluMj
   aJaf9y3WGa59xAOMjqCPNZfRC4qHQ9PuyiyV7uDX6UJ8jFV3WnxEnSIAD
   8TZIqtqW1whSHzVXPDb4CIcIJDWH/rjAwzvIZVh1GmxpRx5tvWNDG+Baq
   c=;
X-IronPort-AV: E=Sophos;i="5.96,263,1665446400"; 
   d="scan'208";a="281532751"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 19:59:16 +0000
Received: from EX13D49EUA002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com (Postfix) with ESMTPS id 6962E81C33;
        Wed, 21 Dec 2022 19:59:12 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D49EUA002.ant.amazon.com (10.43.165.30) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 21 Dec 2022 19:59:11 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.162.134)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 21 Dec 2022 19:59:06 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linus.walleij@linaro.org>, <ben-linux@fluff.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <lareine@amazon.com>,
        <hhhawa@amazon.com>
Subject: [PATCH v5 1/1] i2c: designware: use casting of u64 in clock multiplication to avoid overflow
Date:   Wed, 21 Dec 2022 19:59:00 +0000
Message-ID: <20221221195900.23276-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.134]
X-ClientProxiedBy: EX13D28UWC002.ant.amazon.com (10.43.162.145) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lareine Khawaly <lareine@amazon.com>

In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
by depending on the values of the given parameters including the ic_clk.
For example in our use case where ic_clk is larger than one million,
multiplication of ic_clk * 4700 will result in 32 bit overflow.

Add cast of u64 to the calculation to avoid multiplication overflow, and
use the corresponding define for divide.

Fixes: 2373f6b9744d ("i2c-designware: split of i2c-designware.c into core and bus specific parts")
Signed-off-by: Lareine Khawaly <lareine@amazon.com>
Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
Change log v4->v5:
- Fix indentation

Change Log v3->v4:
- update line length when possible
- fix change log location in the patch

Change Log v2->v3:
- Avoid changing the ic_clk parameter to u64, and do casting in the
  calculation itself instead.
- i2c_dw_clk_rate() returns unsigned long which is confusing because the
  function return the value of get_clk_rate_khz() which returns u32.
  This is not effect the overflow issue, pushed change in separated
  patch.
- use DIV_ROUND_CLOSEST_ULL instead of DIV_ROUND_CLOSEST

Change Log v1->v2:
- Update commit message and add fix tag.

 drivers/i2c/busses/i2c-designware-common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e0a46dfd1c15..6fdb25a5f801 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -351,7 +351,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		 *
 		 * If your hardware is free from tHD;STA issue, try this one.
 		 */
-		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
+		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) -
+		       8 + offset;
 	else
 		/*
 		 * Conditional expression:
@@ -367,7 +368,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		 * The reason why we need to take into account "tf" here,
 		 * is the same as described in i2c_dw_scl_lcnt().
 		 */
-		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
+		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) -
+		       3 + offset;
 }
 
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
@@ -383,7 +385,8 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
 	 * account the fall time of SCL signal (tf).  Default tf value
 	 * should be 0.3 us, for safety.
 	 */
-	return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
+	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) -
+	       1 + offset;
 }
 
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
-- 
2.38.1

