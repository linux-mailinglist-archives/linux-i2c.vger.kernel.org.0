Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E1B46C1E
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 23:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfFNVtb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 17:49:31 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43397 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFNVta (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jun 2019 17:49:30 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so3776690ljv.10;
        Fri, 14 Jun 2019 14:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qrq7bOdVmDw17MlBZJ7Vd00iMTb4xybgawnbUy2H72A=;
        b=bn1uTT9Nevw3W6y+y5HuXvq9Fu6GMV1xnAOr6mKOB25yeYREKMNqap4B0rLpIk6Lcq
         z7Dr4bNQSAcYLq2nQN0GMR2Bp6XZ2D2FCsTTq+sf5JdXS+Ykf0UMaElROiDh3nebxfAh
         ZBEKVMVExT1chp3GI7QisjbxWHS+9HQqaiiLpsNQDDbzDBN3sIPtJU30ry2aTEPf1pUy
         cWYLPq2CQPPkzsmj7qkbRhMqnCjyYSXZxthZn9XxRK3RvyG+UctZ8HYFKXglp77AS8ZK
         WXB/xfCT/JB9Rky0AqZVKc1Bn7gLf4b2bdWGe3pl7Nw+gHMpkFVhjC6l39B+T7QKBk3J
         6dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qrq7bOdVmDw17MlBZJ7Vd00iMTb4xybgawnbUy2H72A=;
        b=c0iGombDgYfcxVu0qnFz1Tesx6J4mkxZr/mM/nWAa8EeO1iJBx2rd9tsdroJr6w+Oe
         fbr3aFRPEeb27okXZB116itw4Lg3mLuI0o2TUFRkjPFVzibMDJFpK9tqLLf+E0xwFbFd
         j0tT5Posfu//35bVSiCrQEEq70LtJhPdfGXNiojPVwgG1eLRIKh3s1ogauxxAeDQAjmR
         EsPA+JErccN8+rJxnJsGLJxt5WJ59zsdNQqj2eoASIgkLYMjEnV6B1gSfyD0U0ZXwwIA
         hd6r+B1ZC3kUA/BtybfOYBY/5ulHIuqNKIM4mrYjDJMb/hRmZXjs5UWx37Vj3kV3AXqq
         UhHA==
X-Gm-Message-State: APjAAAVbQPmI7HbTabEjVnXlPnFDMRVnDIqQ2BLKUeeB/VhqrxmPB+Qp
        ll8YnS5SXsLJN68WkLk/YKE=
X-Google-Smtp-Source: APXvYqxTw2K6vRdQwnrF8czdgDPe7mREpeNG2XKDI7lOMIKgocUvEqKbem/tnEylfJxhg7VPpKmiDg==
X-Received: by 2002:a2e:5d92:: with SMTP id v18mr44428002lje.9.1560548968827;
        Fri, 14 Jun 2019 14:49:28 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id 137sm783792ljj.46.2019.06.14.14.49.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 14:49:27 -0700 (PDT)
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mux-gpio: Use "mux" con_id to find channel GPIOs
Date:   Sat, 15 Jun 2019 00:47:49 +0300
Message-Id: <20190614214748.2389-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Recent patch - ("i2c: mux/i801: Switch to use descriptor passing")
altered the i2c-mux-gpio driver to use the GPIO-descriptor
based interface to find and request the GPIOs then being utilized
to select and deselect the channels of GPIO-driven i2c-muxes. Even
though the proposed modification was correct for the platform_data-based
systems, it was invalid for the OF-based ones and caused the kernel
to crash at the driver probe procedure. There were two problems with
that modification. First of all the gpiod_count() and gpiod_get_index()
were called with NULL con_id. Due to this the methods couldn't find
the "mux-gpios" OF-properties and returned the -ENOENT error. Secondly
the return value of gpiod_count() wasn't checked for being negative,
which in case of an error caused the driver to crash. This patch
is intended to fix the described problems.

Fixes: - ("i2c: mux/i801: Switch to use descriptor passing")
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c    |  2 +-
 drivers/i2c/muxes/i2c-mux-gpio.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a377d94968af..ec54b5b4f1a1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1276,7 +1276,7 @@ static int i801_add_mux(struct i801_priv *priv)
 	for (i = 0; i < mux_config->n_gpios; i++) {
 		lookup->table[i].chip_label = mux_config->gpio_chip;
 		lookup->table[i].chip_hwnum = mux_config->gpios[i];
-		lookup->table[i].con_id = NULL;
+		lookup->table[i].con_id = "mux";
 	}
 	gpiod_add_lookup_table(lookup);
 	priv->lookup = lookup;
diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index b9578f668fb2..1ea097dc8d5d 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -130,10 +130,10 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 			sizeof(mux->data));
 	}
 
-	ngpios = gpiod_count(&pdev->dev, NULL);
-	if (!ngpios) {
-		dev_err(&pdev->dev, "no gpios provided\n");
-		return -EINVAL;
+	ngpios = gpiod_count(&pdev->dev, "mux");
+	if (ngpios <= 0) {
+		dev_err(&pdev->dev, "no valid gpios provided\n");
+		return ngpios ?: -EINVAL;
 	}
 	mux->ngpios = ngpios;
 
@@ -173,7 +173,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 			flag = GPIOD_OUT_HIGH;
 		else
 			flag = GPIOD_OUT_LOW;
-		gpiod = devm_gpiod_get_index(&pdev->dev, NULL, i, flag);
+		gpiod = devm_gpiod_get_index(&pdev->dev, "mux", i, flag);
 		if (IS_ERR(gpiod)) {
 			ret = PTR_ERR(gpiod);
 			goto alloc_failed;
-- 
2.21.0

