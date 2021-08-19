Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26E13F21C6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Aug 2021 22:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbhHSUsu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Aug 2021 16:48:50 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:47196 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbhHSUst (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Aug 2021 16:48:49 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d33 with ME
        id jYoA250083riaq203YoA3d; Thu, 19 Aug 2021 22:48:10 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 19 Aug 2021 22:48:10 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mans@mansr.com, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: xlr: Fix a resource leak in the error handling path of 'xlr_i2c_probe()'
Date:   Thu, 19 Aug 2021 22:48:08 +0200
Message-Id: <e928fd285b37599e1f6648d0b963de8ed7773166.1629405992.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A successful 'clk_prepare()' call should be balanced by a corresponding
'clk_unprepare()' call in the error handling path of the probe, as already
done in the remove function.

More specifically, 'clk_prepare_enable()' is used, but 'clk_disable()' is
also already called. So just the unprepare step has still to be done.

Update the error handling path accordingly.

Fixes: 75d31c2372e4 ("i2c: xlr: add support for Sigma Designs controller variant")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-xlr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xlr.c b/drivers/i2c/busses/i2c-xlr.c
index 126d1393e548..9ce20652d494 100644
--- a/drivers/i2c/busses/i2c-xlr.c
+++ b/drivers/i2c/busses/i2c-xlr.c
@@ -431,11 +431,15 @@ static int xlr_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&priv->adap, priv);
 	ret = i2c_add_numbered_adapter(&priv->adap);
 	if (ret < 0)
-		return ret;
+		goto err_unprepare_clk;
 
 	platform_set_drvdata(pdev, priv);
 	dev_info(&priv->adap.dev, "Added I2C Bus.\n");
 	return 0;
+
+err_unprepare_clk:
+	clk_unprepare(clk);
+	return ret;
 }
 
 static int xlr_i2c_remove(struct platform_device *pdev)
-- 
2.30.2

