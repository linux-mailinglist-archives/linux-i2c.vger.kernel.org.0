Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676F35B1EA5
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 15:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbiIHNWL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 09:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbiIHNWB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 09:22:01 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE1EDEAB;
        Thu,  8 Sep 2022 06:21:59 -0700 (PDT)
X-QQ-mid: bizesmtp81t1662643315tab8ymgc
Received: from localhost.localdomain ( [182.148.14.0])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 08 Sep 2022 21:21:54 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: xqT8U4SkSphChMcRjDeTUTfb1FnuAqPwtVCFh/ImXYNkoPONLbnBuW4izTcJe
        igGcVHBn8mYmK4ez2cKlQbachpcb0A86qOUdr4Vzmq6dG+12ls2diCGDsmdnRavYSBaFXhV
        M5859I4GejJhTqYjpN+UmMqsid39CrIHgysB69wu7wP2H0qZcNbKQoJWlZsCozulli5+sHG
        ifXcRtgo7a4vYrxigPd1WmkwxEC35kcjFHj3s0qGml3/HBKpvH5ffbLYO5otb3iiQU3pbrC
        JoTvgyk4BTYTbLhAtDxsc2MyVm33qjampBW9pjfk5rqqaUXAm4bYpUHfm3y22mNEBCKZNYZ
        HCAG87IGMuPDyEzWorl+IJh1zOHmZgOWTN4ZNAGZ0oQqzmOWTo=
X-QQ-GoodBg: 0
From:   wangjianli <wangjianli@cdjrlc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] i2c/busses: fix repeated words in comments
Date:   Thu,  8 Sep 2022 21:21:48 +0800
Message-Id: <20220908132148.42995-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Delete the redundant word 'to'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/i2c/busses/i2c-viperboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 8b5322c3bce0..8f87394abbcf 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -318,7 +318,7 @@ static int vprbrd_i2c_xfer(struct i2c_adapter *i2c, struct i2c_msg *msgs,
 			amsg->addr = pmsg->addr;
 			amsg->unknown1 = 0x00;
 			amsg->len = cpu_to_le16(pmsg->len);
-			/* send the addr, the data goes to to board */
+			/* send the addr, the data goes to board */
 			ret = vprbrd_i2c_addr(vb->usb_dev, amsg);
 			if (ret < 0)
 				error = ret;
-- 
2.36.1

