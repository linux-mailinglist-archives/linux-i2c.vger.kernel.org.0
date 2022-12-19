Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E8265112F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 18:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiLSRYH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 12:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiLSRYG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 12:24:06 -0500
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A27C1B;
        Mon, 19 Dec 2022 09:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671470645; x=1703006645;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vtbtqkF+fUxlkt4jhfRzQrVkQWSPkoqmSUAFWXoi41I=;
  b=u3n6CNgwyfcVawdP4qlvVLdE4IYZ+0rVgJAU6xG2+R+Yam9A9BP46t0H
   eBSgysMluZE15ycpjCLtCKc1Tt2pW7x7jey6pGZtiGafMOaITQzE6WYOg
   f8dsYtRFDVNAGzRj1vcveTTbwIdV1pbdz5Dgqf+N+zLvZHkvkcQgypHly
   4=;
X-IronPort-AV: E=Sophos;i="5.96,257,1665446400"; 
   d="scan'208";a="278737540"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-d40ec5a9.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 17:24:04 +0000
Received: from EX13D34EUA003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-m6i4x-d40ec5a9.us-west-2.amazon.com (Postfix) with ESMTPS id C897E4168F;
        Mon, 19 Dec 2022 17:24:01 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D34EUA003.ant.amazon.com (10.43.165.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Mon, 19 Dec 2022 17:24:00 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.161.114)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Mon, 19 Dec 2022 17:23:55 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <Suravee.Suthikulpanit@amd.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>
Subject: [PATCH 1/1] i2c: designware: fix i2c_dw_clk_rate() return size to be u32
Date:   Mon, 19 Dec 2022 17:23:45 +0000
Message-ID: <20221219172345.14272-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.161.114]
X-ClientProxiedBy: EX13D28UWB002.ant.amazon.com (10.43.161.140) To
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

Make i2c_dw_clk_rate() to return u32 instead of unsigned long, as the
function return the value of get_clk_rate_khz() which returns u32.

Fixes: b33af11de236 ("i2c: designware: Do not require clock when SSCN and FFCN are provided")
Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 drivers/i2c/busses/i2c-designware-core.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index c023b691441e..e0a46dfd1c15 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -462,7 +462,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 	dev_warn(dev->dev, "timeout in disabling adapter\n");
 }
 
-unsigned long i2c_dw_clk_rate(struct dw_i2c_dev *dev)
+u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev)
 {
 	/*
 	 * Clock is not necessary if we got LCNT/HCNT values directly from
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4d3a3b464ecd..56a029da448a 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -322,7 +322,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
-unsigned long i2c_dw_clk_rate(struct dw_i2c_dev *dev);
+u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev);
 int i2c_dw_prepare_clk(struct dw_i2c_dev *dev, bool prepare);
 int i2c_dw_acquire_lock(struct dw_i2c_dev *dev);
 void i2c_dw_release_lock(struct dw_i2c_dev *dev);
-- 
2.38.1

