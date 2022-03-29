Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF0054EB3A0
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Mar 2022 20:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240654AbiC2SqF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 14:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240666AbiC2Sp5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 14:45:57 -0400
X-Greylist: delayed 333 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Mar 2022 11:44:12 PDT
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920CF972A5
        for <linux-i2c@vger.kernel.org>; Tue, 29 Mar 2022 11:44:12 -0700 (PDT)
From:   =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1648579115; bh=MNw6TZjQg12ilqVca1Iyk/1Sr/JwKEtEFZo4CqiuRdA=;
        h=From:To:Cc:Subject:Date;
        b=MK0FFNR/dSMhYqsYkSiQpNIza2jECdZ01Sz1FG5KrRdcROhl1cEAdsLSEG4wXdfeM
         eEMzqSrFbkDtDZ9SN0WP0Wmg5wGWgEy3BVWpFBv37e0G916tpdI4G+MZ3CvqY2yZzb
         ovpC3Ak2hp3f1boVZ3YgYRmmBggUEat5PHwD2+Dw=
To:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Jean Delvare <khali@linux-fr.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH] i2c: pasemi: Wait for write xfers to finish
Date:   Tue, 29 Mar 2022 20:38:17 +0200
Message-Id: <20220329183817.21656-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wait for completion of write transfers before returning from the driver.
At first sight it may seem advantageous to leave write transfers queued
for the controller to carry out on its own time, but there's a couple of
issues with it:

 * Driver doesn't check for FIFO space.

 * The queued writes can complete while the driver is in its I2C read
   transfer path which means it will get confused by the raising of
   XEN (the 'transaction ended' signal). This can cause a spurious
   ENODATA error due to premature reading of the MRXFIFO register.

Adding the wait fixes some unreliability issues with the driver. There's
some efficiency cost to it (especially with pasemi_smb_waitready doing
its polling), but that will be alleviated once the driver receives
interrupt support.

Fixes: beb58aa39e6e ("i2c: PA Semi SMBus driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---

Tested on Apple's t8103 chip. To my knowledge the PA Semi controller
in its pre-Apple occurences behaves the same as far as this patch is
concerned.

 drivers/i2c/busses/i2c-pasemi-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 7728c8460dc0..9028ffb58cc0 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -137,6 +137,12 @@ static int pasemi_i2c_xfer_msg(struct i2c_adapter *adapter,
 
 		TXFIFO_WR(smbus, msg->buf[msg->len-1] |
 			  (stop ? MTXFIFO_STOP : 0));
+
+		if (stop) {
+			err = pasemi_smb_waitready(smbus);
+			if (err)
+				goto reset_out;
+		}
 	}
 
 	return 0;
-- 
2.33.0

