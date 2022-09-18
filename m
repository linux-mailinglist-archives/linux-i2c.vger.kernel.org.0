Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3555BBCE9
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Sep 2022 11:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiIRJrt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Sep 2022 05:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIRJrs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Sep 2022 05:47:48 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0154023BCD;
        Sun, 18 Sep 2022 02:47:46 -0700 (PDT)
X-QQ-mid: bizesmtp77t1663494462txiqpi3n
Received: from localhost.localdomain ( [125.70.163.64])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sun, 18 Sep 2022 17:47:41 +0800 (CST)
X-QQ-SSF: 01000000002000E0G000B00A0000000
X-QQ-FEAT: xqT8U4SkSphcRx1oT5ubkJU8UOBdDGLCfKjSBjt1zAJy1rqxuT2WuTHoevVMu
        u9JiszM+zd49Jm+LRwD6uiOkUW2ktqjujfQLUvV3tyEs+tSidfkc5c4RhKr7E1RnVNCJ1QR
        bCy6NNFSPri661lp1w8OgovteF/J84ayilEBOGZT+bVDxH5TOzLpiUKmaaB23eSdzBsCFXT
        c9Vt+SzvmR9CVeDKIn2W+pHAclJfHB5DZupSyG9ooZrETltRP2oP6peQTlr2jm1DbHgYYrK
        60euAQwdlwRW2zeTZGobf1l5hDCR+alECgifhHFOzeC4EVGd8++qSPG1sqYhfrM356U/EWy
        IDpL5uI5XAg9F5KjAPdEu2bNUixyNWzNGHWipoGMhzPnTvZlbe5IwFXHzXDjw==
X-QQ-GoodBg: 0
From:   Jilin Yuan <yuanjilin@cdjrlc.com>
To:     yuanjilin@cdjrlc.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: viperboard: fix repeated words in comments
Date:   Sun, 18 Sep 2022 17:47:35 +0800
Message-Id: <20220918094735.18466-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Delete the redundant word 'to'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
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

