Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637E91949DF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgCZVKO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:10:14 -0400
Received: from sauhun.de ([88.99.104.3]:54534 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727955AbgCZVKO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:14 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 686792C1F8F;
        Thu, 26 Mar 2020 22:10:12 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: pxa: magician: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:10:10 +0100
Message-Id: <20200326211010.13471-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211010.13471-1-wsa+renesas@sang-engineering.com>
References: <20200326211010.13471-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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

