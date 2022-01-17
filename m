Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990A54905E2
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 11:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238568AbiAQKZf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 05:25:35 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:47142 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238564AbiAQKZf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 05:25:35 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7E03F2177B;
        Mon, 17 Jan 2022 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642415134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=3ak0hJKN0gmw+ZumAWA6qKa1PEDQAXtprAK1aYmEKf0=;
        b=JXbvOFJyA6Ghlj8SEBDNWaroVvUhBUFbZarzKUHCh5iwC8LEeiLoCo+TNPf85rfRz5HvPA
        yc1TQc6Ucg1KbQYyigCJoeYyYiYmDdSerOFx14arsPAgXSDYab9MrK73pefyqQoLWJ9Amw
        UkIQxCxmHs/o90xuuWV+9LvID7re7Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642415134;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=3ak0hJKN0gmw+ZumAWA6qKa1PEDQAXtprAK1aYmEKf0=;
        b=RgJxEmqtu8GKof5f0G2NcUkAETdKUAowOe96xiPBMeTU6i5ajQGBQOrhRKlLhLHkzNhyJ+
        wU/hw0USCoySexBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FE6D13B4E;
        Mon, 17 Jan 2022 10:25:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0z4OFx5E5WGEVgAAMHmgww
        (envelope-from <iivanov@suse.de>); Mon, 17 Jan 2022 10:25:34 +0000
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.org>,
        "Ivan T . Ivanov" <iivanov@suse.de>
Subject: [PATCH] i2c: bcm2835: Set clock-stretch timeout to 35ms
Date:   Mon, 17 Jan 2022 11:25:04 +0100
Message-Id: <20220117102504.90585-1-iivanov@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.org>

The BCM2835 I2C blocks have a register to set the clock-stretch
timeout - how long the device is allowed to hold SCL low - in bus
cycles. The current driver doesn't write to the register, therefore
the default value of 64 cycles is being used for all devices.

Set the timeout to the value recommended for SMBus - 35ms.

See: https://github.com/raspberrypi/linux/issues/3064

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
[iivanov@suse.de fix small coding style issue]
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 drivers/i2c/busses/i2c-bcm2835.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 37443edbf754..9cce0e15da32 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -106,6 +106,7 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_bcm2835_i2c *div = to_clk_bcm2835_i2c(hw);
 	u32 redl, fedl;
+	u32 clk_tout;
 	u32 divider = clk_bcm2835_i2c_calc_divider(rate, parent_rate);
 
 	if (divider == -EINVAL)
@@ -129,6 +130,17 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
 	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_DEL,
 			   (fedl << BCM2835_I2C_FEDL_SHIFT) |
 			   (redl << BCM2835_I2C_REDL_SHIFT));
+
+	/*
+	 * Set the clock stretch timeout to the SMBUs-recommended 35ms.
+	 */
+	if (rate > 0xffff * 1000 / 35)
+		clk_tout = 0xffff;
+	else
+		clk_tout = 35 * rate / 1000;
+
+	bcm2835_i2c_writel(div->i2c_dev, BCM2835_I2C_CLKT, clk_tout);
+
 	return 0;
 }
 
-- 
2.26.2

