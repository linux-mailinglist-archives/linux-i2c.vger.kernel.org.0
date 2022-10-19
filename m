Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E336046E0
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 15:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiJSNWK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 09:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbiJSNVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 09:21:39 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F34BE1C;
        Wed, 19 Oct 2022 06:06:53 -0700 (PDT)
X-QQ-mid: bizesmtp85t1666184462twis5jvf
Received: from localhost.localdomain ( [182.148.15.91])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Wed, 19 Oct 2022 21:01:01 +0800 (CST)
X-QQ-SSF: 01000000008000F0I000B00A0000000
X-QQ-FEAT: Fc2LLDWeHZ+eO5MYeCG4pwzYGUz0rPPuguITvLBfOnNO+JQye8XQk8DKmcdwI
        pnc/orUXJBQqXzQvqVpc1XdHxuQIj/gDBWuEDZld76hpdkMN61wGW1+O0YzMUP+Ai2UStU6
        AZV6a1zpOveIoDpYM0uX0++Rj+ZIPwe99sv1b6ctW0Z/8YAueMzlGUxo3A0dkNWSbFNTTul
        PBLEykDPRDydiPICThdk+su12Ewzy00z/M7csniXlZbI57sXC3pxmW9F8OanC/7SCqja7If
        d2nLSiKUpJy94xE0LVtF+7DHLOTg9paNOI96Hxehe7Ggx2CP1PqjVMJHvVIzr46aL54g3X+
        PmSiFijlM7OsUY0A15XaWUHXcpI64IIqC7kb24E+Cq0vbxX1vQNwzSIH7TNy0SB+IEnka1l
        K4EfAaz2GVI=
X-QQ-GoodBg: 0
From:   Jilin Yuan <yuanjilin@cdjrlc.com>
To:     yuanjilin@cdjrlc.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: fix repeated words in comments
Date:   Wed, 19 Oct 2022 21:00:55 +0800
Message-Id: <20221019130055.58905-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

