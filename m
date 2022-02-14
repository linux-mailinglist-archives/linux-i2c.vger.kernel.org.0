Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846874B3EC8
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 02:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238927AbiBNBEA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Feb 2022 20:04:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiBNBEA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Feb 2022 20:04:00 -0500
Received: from out30-44.freemail.mail.aliyun.com (out30-44.freemail.mail.aliyun.com [115.124.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBB1522E3;
        Sun, 13 Feb 2022 17:03:53 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0V4JnxiY_1644800629;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0V4JnxiY_1644800629)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 14 Feb 2022 09:03:50 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] i2c: designware: remove unneeded semicolon
Date:   Mon, 14 Feb 2022 09:03:48 +0800
Message-Id: <20220214010348.129251-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/i2c/busses/i2c-designware-amdpsp.c:248:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 752e0024db03..f589d3a1a19e 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -245,7 +245,7 @@ static int psp_acquire_i2c_bus(void)
 	if (psp_i2c_access_count) {
 		psp_i2c_access_count++;
 		goto cleanup;
-	};
+	}
 
 	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
 	if (status) {
-- 
2.20.1.7.g153144c

