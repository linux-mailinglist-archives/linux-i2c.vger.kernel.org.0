Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8D97478D4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jul 2023 21:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjGDTvO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jul 2023 15:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbjGDTvO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jul 2023 15:51:14 -0400
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C867010DD
        for <linux-i2c@vger.kernel.org>; Tue,  4 Jul 2023 12:51:11 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id Gm3HqhIN61lRhGm3Hq4oNQ; Tue, 04 Jul 2023 21:51:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688500269;
        bh=E5rO26Dz3CWK8l+Od+4vE1x2c+orHF72b1zdbUbPDV4=;
        h=From:To:Cc:Subject:Date;
        b=Vtze80gT9MTMD9rA3V9bGewsYl3ApaMoHm2coqNXA2EIJYAbnuj/jrjX6wzceUUrY
         8ZXcbDtR0rZkV0KZlPL31Rx4tDuX45eSyEH5/HUlapU4xhaQy9oepa92Ex3GuxPGN6
         M6jCQg3gSdxCCXFgmvhKHrHsRZvt7J9ZYdfdkciXcU/7sKSlghv1zHtfgqBlk2c0Y1
         Qw3dA9LeA2lUnpSa7YAnKJyUMCNPG5CpOLHz2QwvPLlUAR4tuxtOm55LHjh+/T6d3y
         ryL1iciITpEf9iTlxjnbvWptvB6wcjt+eM23rzaeVNMSKojQ/6nAWQnetfDJfAkr1W
         SxHEUFahQVGcA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 04 Jul 2023 21:51:09 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dan.carpenter@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alessandro Rubini <rubini@gnudd.com>,
        Wolfram Sang <wsa@kernel.org>,
        Giancarlo Asnaghi <giancarlo.asnaghi@st.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH v3] i2c: busses: i2c-nomadik: Remove a useless call in the remove function
Date:   Tue,  4 Jul 2023 21:50:28 +0200
Message-Id: <62ae6810d41e04a9eb5adfa18a9e40904bc72256.1688160163.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since commit 235602146ec9 ("i2c-nomadik: turn the platform driver to an amba
driver"), there is no more request_mem_region() call in this driver.

So remove the release_mem_region() call from the remove function which is
likely a left over.

Fixes: 235602146ec9 ("i2c-nomadik: turn the platform driver to an amba driver")
Cc: <stable@vger.kernel.org> # v3.6+
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v3: - update commit description
    - add R-b and A-b
    - fix Fixes tag   [Dan Carpenter]
    - add cc stable   [Andi Shyti]

v2: - synch with latest -next
    - https://lore.kernel.org/all/62ae6810d41e0429ebaadfac8a95409f4bc72456.1688160163.git.christophe.jaillet@wanadoo.fr/

v1: - https://lore.kernel.org/all/4f4c2c5c20b61c4bb28cb3e9ab4640534dd2adec.1629530169.git.christophe.jaillet@wanadoo.fr/
---
 drivers/i2c/busses/i2c-nomadik.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 1e5fd23ef45c..212f412f1c74 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1038,7 +1038,6 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 static void nmk_i2c_remove(struct amba_device *adev)
 {
-	struct resource *res = &adev->res;
 	struct nmk_i2c_dev *dev = amba_get_drvdata(adev);
 
 	i2c_del_adapter(&dev->adap);
@@ -1047,7 +1046,6 @@ static void nmk_i2c_remove(struct amba_device *adev)
 	clear_all_interrupts(dev);
 	/* disable the controller */
 	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
-	release_mem_region(res->start, resource_size(res));
 }
 
 static struct i2c_vendor_data vendor_stn8815 = {
-- 
2.34.1

