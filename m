Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41EC96524E5
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 17:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiLTQs0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 11:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbiLTQsZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 11:48:25 -0500
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AB9B850;
        Tue, 20 Dec 2022 08:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671554906; x=1703090906;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pS7MvaBVz12cHvVa/K3ipBPyhpGu7jCdmRrme/dkBwA=;
  b=dRy7rzV860gl0/TvBTgYVou/Q01JRkfadvjsLo8XsA8N+yq3kjMWzeuZ
   mSGktAH/g5b+BaNfO0zzeJLa63CzrAlCrKj8gFyFEkQRlHvK7Olf/AHWQ
   qR6F3hjrtS+6DayN2BYQSxDPa3PWZbjUp/1qERYYdWp7hG2vLYXV0d2/V
   g=;
X-IronPort-AV: E=Sophos;i="5.96,259,1665446400"; 
   d="scan'208";a="275378947"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-47cc8a4c.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 16:48:23 +0000
Received: from EX13D36EUA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1a-m6i4x-47cc8a4c.us-east-1.amazon.com (Postfix) with ESMTPS id 964F01610EA;
        Tue, 20 Dec 2022 16:48:19 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D36EUA001.ant.amazon.com (10.43.165.127) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 20 Dec 2022 16:48:18 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.160.83)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Tue, 20 Dec 2022 16:48:13 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linus.walleij@linaro.org>, <ben-linux@fluff.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>,
        Lareine Khawaly <lareine@amazon.com>,
        Hanna Hawa <hhhawa@amazon.com>
Subject: [PATCH v4 1/1] i2c: designware: use casting of u64 in clock multiplication to avoid overflow
Date:   Tue, 20 Dec 2022 16:48:06 +0000
Message-ID: <20221220164806.77576-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.83]
X-ClientProxiedBy: EX13D44UWC001.ant.amazon.com (10.43.162.26) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
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
index e0a46dfd1c15..2a669da08762 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -351,7 +351,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		 *
 		 * If your hardware is free from tHD;STA issue, try this one.
 		 */
-		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
+		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) - 8 +
+			offset;
 	else
 		/*
 		 * Conditional expression:
@@ -367,7 +368,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		 * The reason why we need to take into account "tf" here,
 		 * is the same as described in i2c_dw_scl_lcnt().
 		 */
-		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
+		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf),
+					     MICRO) - 3 + offset;
 }
 
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
@@ -383,7 +385,8 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
 	 * account the fall time of SCL signal (tf).  Default tf value
 	 * should be 0.3 us, for safety.
 	 */
-	return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
+	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) - 1 +
+		offset;
 }
 
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
-- 
2.38.1

