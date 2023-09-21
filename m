Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0FA7A9AD2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 20:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjIUSvB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 14:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjIUSur (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 14:50:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1644F8A20D
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=BWoG3Cv+9NwMSj
        Oxgnt6dDveNegqs9pWvhh6JaU1+sY=; b=mYqT33MOiLshEtmkWv7E5tZ4gsTQaw
        Z49u0NRmMm7GEcTGxlUoayfUctiKXbquROc53D9gXlY0InY8Su3uIlmtDRC2jTW4
        vKQFJgzOFiT2juQoCzjcBkNNlp6PcTNT637JoA5ZbEGEwCUALC6LoOhMN3V842P3
        +vrbuSU683OydILnh5UaJrY1a7rKMDJNOA2xKbLAIa2E20EcUs2OaEPSjV/AofvV
        XUtOu9yw+S9aqV+Gxu8HEq75iNFOgWglql3nCB56Dmd2QNMVEE3COtGYNphnXxWt
        YyWjwpgVh8120C/ZEPKDolV0UBRAbp/VnXp6Rc0kiS4iOUiHSmDNBCWw==
Received: (qmail 881727 invoked from network); 21 Sep 2023 10:40:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2023 10:40:29 +0200
X-UD-Smtp-Session: l3s3148p1@xoK6cdoFk1YuciSu
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Minjie Du <duminjie@vivo.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: gpio: remove error checks with debugfs
Date:   Thu, 21 Sep 2023 10:40:15 +0200
Message-Id: <20230921084016.3434-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

debugfs can handle error pointers in subsequent calls. So, remove the
error checks as suggested by kerneldoc of this function.

Reported-by: Minjie Du <duminjie@vivo.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-gpio.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index e5a5b9e8bf2c..fb35a75fe0e3 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -263,15 +263,10 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	 * 'fault-injector' dir there. Until then, we have a global dir with
 	 * all adapters as subdirs.
 	 */
-	if (!i2c_gpio_debug_dir) {
+	if (!i2c_gpio_debug_dir)
 		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
-		if (!i2c_gpio_debug_dir)
-			return;
-	}
 
 	priv->debug_dir = debugfs_create_dir(pdev->name, i2c_gpio_debug_dir);
-	if (!priv->debug_dir)
-		return;
 
 	init_completion(&priv->scl_irq_completion);
 
-- 
2.35.1

