Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0173A1C664E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 05:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbgEFD2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 23:28:48 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:29686 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgEFD2s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 May 2020 23:28:48 -0400
Received: from localhost.localdomain ([93.23.13.221])
        by mwinf5d40 with ME
        id bFUd2200E4m9Yy503FUdZx; Wed, 06 May 2020 05:28:45 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 06 May 2020 05:28:45 +0200
X-ME-IP: 93.23.13.221
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     gxt@pku.edu.cn, arnd@arndb.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: puv3: Fix an error handling path in 'puv3_i2c_probe()'
Date:   Wed,  6 May 2020 05:28:24 +0200
Message-Id: <20200506032824.191633-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is a spurious 'put_device()' in the remove function.
A reference to 'pdev->dev' is taken in the probe function without a
corresponding 'get_device()' to increment the refcounted reference.

Add the missing 'get_device()' and update the error handling path
accordingly.

Fixes: d10e4a660d11 ("unicore32 machine related files: add i2c bus drivers for pkunity-v3 soc")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is provided as-is. It is not even compile tested because I don't
use cross-compiler.

It is purely speculative and based on what looks like an unbalanced
'put_device()' in the remove function.
---
 drivers/i2c/busses/i2c-puv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-puv3.c b/drivers/i2c/busses/i2c-puv3.c
index 5cec5a36807d..62a4b860d3c0 100644
--- a/drivers/i2c/busses/i2c-puv3.c
+++ b/drivers/i2c/busses/i2c-puv3.c
@@ -203,18 +203,20 @@ static int puv3_i2c_probe(struct platform_device *pdev)
 			mem->start);
 	adapter->algo = &puv3_i2c_algorithm;
 	adapter->class = I2C_CLASS_HWMON;
-	adapter->dev.parent = &pdev->dev;
+	adapter->dev.parent = get_device(&pdev->dev);
 
 	platform_set_drvdata(pdev, adapter);
 
 	adapter->nr = pdev->id;
 	rc = i2c_add_numbered_adapter(adapter);
 	if (rc)
-		goto fail_add_adapter;
+		goto fail_put_device;
 
 	dev_info(&pdev->dev, "PKUnity v3 i2c bus adapter.\n");
 	return 0;
 
+fail_put_device:
+	put_device(&pdev->dev);
 fail_add_adapter:
 	kfree(adapter);
 fail_nomem:
-- 
2.25.1

