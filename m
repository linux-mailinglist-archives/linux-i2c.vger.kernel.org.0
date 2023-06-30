Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754B47443DD
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 23:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjF3VX4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Jun 2023 17:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjF3VXz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jun 2023 17:23:55 -0400
Received: from smtp.smtpout.orange.fr (unknown [80.12.242.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7882686
        for <linux-i2c@vger.kernel.org>; Fri, 30 Jun 2023 14:23:50 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id FLaWqFE741lRhFLaWqu2BO; Fri, 30 Jun 2023 23:23:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688160215;
        bh=kMcJl7rvulaYPvsNlfWsI9/je8sVJ9jmEHBC5pxujxE=;
        h=From:To:Cc:Subject:Date;
        b=O8ML1LNRtqOBAXG4IUAARTGOG4bbWqctKdJCWvjnoFtNnYF4JIikMW/veVPXHlGtN
         qENoZRqlrMJekwDGxR9X+hXSz/LOJesjZxS44YRA7UBb3ongN/YFK/GY1OX4BhW5pT
         fgEq+VWs1lCN0cQhuLgxHyEx20Pid8ftLkEsYy2kLPrjyG8QP1b7+BV4AFkQAX0eph
         EJuPNUgLuePv0w3ezdcIJsxqF5hHlzDK7P+vgeVRIvcqleA9NrcNk6ozzKdhLlSwqt
         vrcgtjVBDBTY1K1kEOWMYouMC4xdNSq6sAAaKxHHJ6M8vhZgWHT0E9Y63evhoOAtJo
         kWP44ZYBRSDFg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Jun 2023 23:23:35 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     wsa@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2] i2c: busses: i2c-nomadik: Remove a useless call in the remove function
Date:   Fri, 30 Jun 2023 23:23:28 +0200
Message-Id: <62ae6810d41e0429ebaadfac8a95409f4bc72456.1688160163.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since commit a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of
git://git.pengutronix.de/git/wsa/linux"), there is no more
request_mem_region() call in this driver.

So remove the release_mem_region() call from the remove function which is
likely a left over.

There is no details in the above commit log, but at its end we can read:
   Conflicts:
	   drivers/i2c/busses/i2c-nomadik.c

This may explain why this call has been left here.

Fixes: a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of git://git.pengutronix.de/git/wsa/linux
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: synch with latest -next

v1: https://lore.kernel.org/all/4f4c2c5c20b61c4bb28cb3e9ab4640534dd2adec.1629530169.git.christophe.jaillet@wanadoo.fr/


/!\ /!\ /!\ /!\ /!\ /!\
  This patch is completely speculative and without details about commit
  a410963ba4c0 it's hard to be sure of the intent.
/!\ /!\ /!\ /!\ /!\ /!\

All I can say is that it looks logical to me and that it compiles!
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

