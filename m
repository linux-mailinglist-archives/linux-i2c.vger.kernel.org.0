Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0865F4B508E
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 13:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353474AbiBNMrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 07:47:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiBNMrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 07:47:15 -0500
Received: from out199-14.us.a.mail.aliyun.com (out199-14.us.a.mail.aliyun.com [47.90.199.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7F563A5;
        Mon, 14 Feb 2022 04:47:07 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0V4SlR3g_1644842822;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0V4SlR3g_1644842822)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 14 Feb 2022 20:47:03 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     jarkko.nikula@linux.intel.com, jsd@semihalf.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next v2 RESEND] i2c: designware: remove unneeded semicolon
Date:   Mon, 14 Feb 2022 20:47:01 +0800
Message-Id: <20220214124701.105814-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Eliminate the following coccicheck warnings:
./drivers/i2c/busses/i2c-designware-amdpsp.c:172:2-3: Unneeded semicolon
./drivers/i2c/busses/i2c-designware-amdpsp.c:245:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

--Changes in v2:
  According to Jan's suggestion
  Fix the same problem in check_i2c_req_sts() function.

 drivers/i2c/busses/i2c-designware-amdpsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 752e0024db03..9d37becbd846 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -172,7 +172,7 @@ static int check_i2c_req_sts(struct psp_i2c_req *req)
 	case PSP_I2C_REQ_STS_INV_PARAM:
 	default:
 		return -EIO;
-	};
+	}
 }
 
 static int psp_send_check_i2c_req(struct psp_i2c_req *req)
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

