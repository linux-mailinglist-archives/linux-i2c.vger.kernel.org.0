Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6844130345
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 22:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfE3UYb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 16:24:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33248 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfE3UYb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 16:24:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id d9so5051897wrx.0
        for <linux-i2c@vger.kernel.org>; Thu, 30 May 2019 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxwr3xbO19CasYGAT7+jegs6MVWG/SlYD1TekcW6ZEA=;
        b=SWRBHHR4QADF09rs4t6qSm0wb7qRZhgiQCk3Bvmg3FV8GetUkxN3BEENYMxKK6reUM
         F6a5aLmd4zu5L2gnvjpSYRz1yFWYtTxxvKEe682QgHI7+sfqyYRle5VZYtdfEV7o+3oB
         h5U86P6Dl8rgTMy8wmJLLh0kVTlg2VZJzlAYRuYSgxmp59ndERlqJkGuQRdz+vtcx0NW
         j78mnwKfYpJyraeDh+hwUFS+Bg7KhbWqpkEZzDWG2poYFlSYmPtcmv51xZeEx/G64+LL
         b5G7f0DLe/+K7W5Gj2CCzenoWCgdnLAAYFjFl8flrV/OiWA/ihujIG2yoWVObhCtAMPb
         d3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxwr3xbO19CasYGAT7+jegs6MVWG/SlYD1TekcW6ZEA=;
        b=ZSly7t4YQJhTuAV7h8rY3L+6NUCZANa7m/q+1irvvTHTZUsbKK9Vv+bnervaGXXDOr
         sunInFRdcVTRP/rDEtGeCic8Y1temII0eIaMG5ERkib0oTQJ8b4t2Gasf39S8EYZyvkH
         VQQrQxpY2htw88bAyUgcVB6TiINTXl5tEjgOltua2psUL4HQx/kICHfMyg9SxFuiPgyQ
         d9zCrobrimOavmallexDA/eO9eZzk5sV9vDjiTOkzf9z/foDjQmZ4CQ3o+pSp6/w58yk
         3ZCFlzq1H9ebD81wEghJfudV+em7ep3ATgN0Yl28kqbiORi96ea5eXdcTMnzdVIEc0Dc
         MTHA==
X-Gm-Message-State: APjAAAWQc251pm2kWcNGHaY4s+iBW52hEOQeVqv7BZ9NiiuB3K8zVt7W
        BuqrVgYcwX47j4uHvr2VUlueYyN2H2M=
X-Google-Smtp-Source: APXvYqyXPbtw7Hy11NPJPKG8stQknkwN+zkSmlRFnXTF9MJ+LAoLUTJrPFuyDLNCl9uK6G7bJRWB3w==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr3826396wrj.182.1559247869790;
        Thu, 30 May 2019 13:24:29 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id y2sm6409472wra.58.2019.05.30.13.24.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 13:24:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: pca: Fix GPIO lookup code
Date:   Thu, 30 May 2019 22:24:24 +0200
Message-Id: <20190530202424.13937-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The devm_gpiod_request_gpiod() call will add "-gpios" to
any passed connection ID before looking it up.

I do not think the reset GPIO on this platform is named
"reset-gpios-gpios" but rather "reset-gpios" in the device
tree, so fix this up so that we get a proper reset GPIO
handle.

Also drop the inclusion of the legacy GPIO header.

Fixes: 0e8ce93bdceb ("i2c: pca-platform: add devicetree awareness")
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/i2c/busses/i2c-pca-platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i2c-pca-platform.c
index de3fe6e828cb..f50afa8e3cba 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -21,7 +21,6 @@
 #include <linux/platform_device.h>
 #include <linux/i2c-algo-pca.h>
 #include <linux/platform_data/i2c-pca-platform.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -173,7 +172,7 @@ static int i2c_pca_pf_probe(struct platform_device *pdev)
 	i2c->adap.dev.parent = &pdev->dev;
 	i2c->adap.dev.of_node = np;
 
-	i2c->gpio = devm_gpiod_get_optional(&pdev->dev, "reset-gpios", GPIOD_OUT_LOW);
+	i2c->gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(i2c->gpio))
 		return PTR_ERR(i2c->gpio);
 
-- 
2.20.1

