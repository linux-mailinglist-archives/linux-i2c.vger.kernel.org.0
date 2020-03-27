Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA351959F3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 16:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgC0Pdc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 11:33:32 -0400
Received: from foss.arm.com ([217.140.110.172]:46882 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgC0Pdc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Mar 2020 11:33:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E0031B;
        Fri, 27 Mar 2020 08:33:31 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36BCF3F71F;
        Fri, 27 Mar 2020 08:33:31 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:33:29 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: pxa: magician: convert to use i2c_new_client_device()" to the asoc tree
In-Reply-To:  <20200326211010.13471-2-wsa+renesas@sang-engineering.com>
Message-Id:  <applied-20200326211010.13471-2-wsa+renesas@sang-engineering.com>
X-Patchwork-Hint: ignore
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch

   ASoC: pxa: magician: convert to use i2c_new_client_device()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 17fb5433150e8b0b4000a77a21055359a2eab534 Mon Sep 17 00:00:00 2001
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 26 Mar 2020 22:10:10 +0100
Subject: [PATCH] ASoC: pxa: magician: convert to use i2c_new_client_device()

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Link: https://lore.kernel.org/r/20200326211010.13471-2-wsa+renesas@sang-engineering.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/magician.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/magician.c b/sound/soc/pxa/magician.c
index 6483cff5b73d..3bafd86bfb93 100644
--- a/sound/soc/pxa/magician.c
+++ b/sound/soc/pxa/magician.c
@@ -358,10 +358,10 @@ static int __init magician_init(void)
 	adapter = i2c_get_adapter(0);
 	if (!adapter)
 		return -ENODEV;
-	client = i2c_new_device(adapter, i2c_board_info);
+	client = i2c_new_client_device(adapter, i2c_board_info);
 	i2c_put_adapter(adapter);
-	if (!client)
-		return -ENODEV;
+	if (IS_ERR(client))
+		return PTR_ERR(client);
 
 	ret = gpio_request(EGPIO_MAGICIAN_SPK_POWER, "SPK_POWER");
 	if (ret)
-- 
2.20.1

