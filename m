Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556343579FF
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 04:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhDHCAw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 22:00:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230334AbhDHCAw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 22:00:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3B23611AF;
        Thu,  8 Apr 2021 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617847241;
        bh=cw5M6pxU6yZtM1xJOgHtmP/1L3ZF1wzsAoIgeeXdZV0=;
        h=From:To:Cc:Subject:Date:From;
        b=Oj6lBGs0n1L5Q9414P7yA84LveZniVZvi1TL9P3HmGcsdRjRroyLno8buZgcPHpGw
         KNZAYv8ar2SBCQ8AwKfdwvNikhzW6mEY527rikBLE81hUYbrk+wfF9RtAbOVh7tr+w
         i5sgFjcZpQ7N9iTLTreXPNGDJwf8+x/ChwuRfUeM9ejiLnkanfrE+aDjf2BlsXMKA6
         weFVQ2iBysXOFNFysvYkpp1U5cFhSV4FvWbVfg10o/rFKxr4Zud5HOivRpdiL7r6tN
         iuGoNOZ5VDh7qHSjdhWVWO7yfrfo8r6Pp1riwSaElqF684ZlESisUzRek244m04GXA
         sjy77gZOAsY/g==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] i2c: mv64xxx: Fix random system lock caused by runtime PM
Date:   Thu,  8 Apr 2021 04:00:00 +0200
Message-Id: <20210408020000.21914-1-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I noticed a weird bug with this driver on Marvell CN9130 Customer
Reference Board.

Sometime after boot, the system locks with the following message:
 [104.071363] i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0

The system does not respond afterwards, only warns about RCU stalls.

This first appeared with commit e5c02cf54154 ("i2c: mv64xxx: Add runtime
PM support").

With further experimentation I discovered that adding a delay into
mv64xxx_i2c_hw_init() fixes this issue. This function is called before
every xfer, due to how runtime PM works in this driver. It seems that in
order to work correctly, a delay is needed after the bus is reset in
this function.

Since there already is a known erratum with this controller needing a
delay, I assume that this is just another place this needs to be
applied. Therefore I apply the delay only if errata_delay is true.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index c590d36b5fd1..5c8e94b6cdb5 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -221,6 +221,10 @@ mv64xxx_i2c_hw_init(struct mv64xxx_i2c_data *drv_data)
 	writel(0, drv_data->reg_base + drv_data->reg_offsets.ext_addr);
 	writel(MV64XXX_I2C_REG_CONTROL_TWSIEN | MV64XXX_I2C_REG_CONTROL_STOP,
 		drv_data->reg_base + drv_data->reg_offsets.control);
+
+	if (drv_data->errata_delay)
+		udelay(5);
+
 	drv_data->state = MV64XXX_I2C_STATE_IDLE;
 }
 
-- 
2.26.2

