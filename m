Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7276F64C737
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 11:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiLNKem (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 05:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237950AbiLNKej (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 05:34:39 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D682124A;
        Wed, 14 Dec 2022 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671014079; x=1702550079;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gTbC4u5HmiN/0e68ghuTdh6ihuA0N7rhx/1H2OSRrh4=;
  b=UfNytHRAbJsdwkc4UJZ3JPAgNRoi2X9G4t2x1lvdp/yrvlk6zqq/wkTA
   6WNI49p2zP+1MQPE89oBj1A6KbbKSKJM729ZIm/A2ubwVH0F5dmkzyYoK
   s2pRY7nQEOKluf3vtl+lDF2tcv6AFoV/81TxOtpqOMlN13vZSBRc1tQnZ
   Y=;
X-IronPort-AV: E=Sophos;i="5.96,244,1665446400"; 
   d="scan'208";a="161295431"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-0ec33b60.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 10:34:29 +0000
Received: from EX13D45EUA003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-0ec33b60.us-west-2.amazon.com (Postfix) with ESMTPS id 0653CA2963;
        Wed, 14 Dec 2022 10:34:27 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D45EUA003.ant.amazon.com (10.43.165.71) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 14 Dec 2022 10:34:26 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.162.134)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 14 Dec 2022 10:34:22 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <lareine@amazon.com>,
        <hhhawa@amazon.com>
Subject: [PATCH 1/1] i2c: designware: use u64 for clock freq to avoid u32 multiplication overflow
Date:   Wed, 14 Dec 2022 10:34:18 +0000
Message-ID: <20221214103418.64431-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.134]
X-ClientProxiedBy: EX13D36UWB002.ant.amazon.com (10.43.161.149) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lareine Khawaly <lareine@amazon.com>

In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
by depending on the values of the given parameters including the ic_clk.
For example in our usecase where ic_clk >= 1000000, multiplication of
ic_clk * 4700 will result in 32 bit overflow.

This commit change the ic_clk to be u64 parameter to avoid the overflow.

Signed-off-by: Lareine Khawaly <lareine@amazon.com>
Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 4 ++--
 drivers/i2c/busses/i2c-designware-core.h   | 4 ++--
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index c023b691441e..61a6b7bb8935 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -332,7 +332,7 @@ void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
 
-u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
+u32 i2c_dw_scl_hcnt(u64 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
 	/*
 	 * DesignWare I2C core doesn't seem to have solid strategy to meet
@@ -370,7 +370,7 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
 }
 
-u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
+u32 i2c_dw_scl_lcnt(u64 ic_clk, u32 tLOW, u32 tf, int offset)
 {
 	/*
 	 * Conditional expression:
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4d3a3b464ecd..aaba6f9977b6 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -319,8 +319,8 @@ struct i2c_dw_semaphore_callbacks {
 };
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
-u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
-u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
+u32 i2c_dw_scl_hcnt(u64 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
+u32 i2c_dw_scl_lcnt(u64 ic_clk, u32 tLOW, u32 tf, int offset);
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
 unsigned long i2c_dw_clk_rate(struct dw_i2c_dev *dev);
 int i2c_dw_prepare_clk(struct dw_i2c_dev *dev, bool prepare);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 478318b1d35f..d6960507ea46 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -44,7 +44,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 	u32 sda_falling_time, scl_falling_time;
 	struct i2c_timings *t = &dev->timings;
 	const char *fp_str = "";
-	u32 ic_clk;
+	u64 ic_clk;
 	int ret;
 
 	ret = i2c_dw_acquire_lock(dev);
-- 
2.38.1

