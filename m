Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296A470AE03
	for <lists+linux-i2c@lfdr.de>; Sun, 21 May 2023 14:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjEUMTy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 May 2023 08:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjEUMTx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 May 2023 08:19:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250C5AA
        for <linux-i2c@vger.kernel.org>; Sun, 21 May 2023 05:19:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF1A360C25
        for <linux-i2c@vger.kernel.org>; Sun, 21 May 2023 12:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F57C433EF;
        Sun, 21 May 2023 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684671591;
        bh=tfRnbBUuVALsCjtyyYhE9Q63qD8wS1OT5P92jV/IUEY=;
        h=From:To:Cc:Subject:Date:From;
        b=e6N9x002lnf92jodcMxqj2c9nZsu4AcYiDEF/hJ9W9h8zlxWKv4FIvISFggb+OkOt
         qcliML2+xoHwKTYhoF4ER+eJpms8/p6PcWtat7LEkA96VrExdXwUjZTABTtuAWxh2h
         NfzcE/y3+0oKLSC1fQYQlnR9mxzGU0m3+L2hfi5cgH7xi2kAVHe+j8jkrIMqDvolIM
         5HIckRnbH01WR/hat4PSV/5hK2H15fJvuj62nrNwJL58iOQ1feJh9t4aQ6RAzilQIK
         fEdb9JP8e8MN3+nvkfAfEiwOdRLR/udKaARoLlY9w/B3tE2QCvILeN+WuYs4Dm1c+V
         CZyQ/48bZkhwA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] i2c: mv64xxx: Fix reading invalid status value in atomic mode
Date:   Sun, 21 May 2023 14:19:40 +0200
Message-Id: <20230521121940.27057-1-kabel@kernel.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There seems to be a bug within the mv64xxx I2C controller, wherein the
status register may not necessarily contain valid value immediately
after the IFLG flag is set in the control register.

My theory is that the controller:
- first sets the IFLG in control register
- then updates the status register
- then raises an interrupt

This may sometime cause weird bugs when in atomic mode, since in this
mode we do not wait for an interrupt, but instead we poll the control
register for IFLG and read status register immediately after.

I encountered -ENXIO from mv64xxx_i2c_fsm() due to this issue when using
this driver in atomic mode.

Note that I've only seen this issue on Armada 385, I don't know whether
other SOCs with this controller are also affected. Also note that this
fix has been in U-Boot for over 4 years [1] without anybody complaining,
so it should not cause regressions.

[1] https://source.denx.de/u-boot/u-boot/-/commit/d50e29662f78

Fixes: 544a8d75f3d6 ("i2c: mv64xxx: Add atomic_xfer method to driver")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 047dfef7a657..878c076ebdc6 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -520,6 +520,17 @@ mv64xxx_i2c_intr(int irq, void *dev_id)
 
 	while (readl(drv_data->reg_base + drv_data->reg_offsets.control) &
 						MV64XXX_I2C_REG_CONTROL_IFLG) {
+		/*
+		 * It seems that sometime the controller updates the status
+		 * register only after it asserts IFLG in control register.
+		 * This may result in weird bugs when in atomic mode. A delay
+		 * of 100 ns before reading the status register solves this
+		 * issue. This bug does not seem to appear when using
+		 * interrupts.
+		 */
+		if (drv_data->atomic)
+			ndelay(100);
+
 		status = readl(drv_data->reg_base + drv_data->reg_offsets.status);
 		mv64xxx_i2c_fsm(drv_data, status);
 		mv64xxx_i2c_do_action(drv_data);
-- 
2.39.3

