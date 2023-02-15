Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD13E697A23
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 11:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbjBOKpt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 05:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234162AbjBOKps (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 05:45:48 -0500
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Feb 2023 02:45:42 PST
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9617837F15
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 02:45:42 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id SFAupWaW35qOuSFAupYXwG; Wed, 15 Feb 2023 11:38:10 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Feb 2023 11:38:10 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: xiic: Remove some dead code
Date:   Wed, 15 Feb 2023 11:38:07 +0100
Message-Id: <9d36938de98dc491425a51a9c07367dd9e448e60.1676457464.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wait_for_completion_timeout() never returns negative value.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8503b5016aaf..5543f372ae60 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1038,10 +1038,6 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		i2c->rx_msg = NULL;
 		i2c->nmsgs = 0;
 		err = -ETIMEDOUT;
-	} else if (err < 0) {	/* Completion error */
-		i2c->tx_msg = NULL;
-		i2c->rx_msg = NULL;
-		i2c->nmsgs = 0;
 	} else {
 		err = (i2c->state == STATE_DONE) ? num : -EIO;
 	}
-- 
2.34.1

