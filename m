Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41A3D3A3FC
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jun 2019 07:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfFIF5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 01:57:13 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37525 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbfFIF5N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jun 2019 01:57:13 -0400
Received: by mail-pg1-f195.google.com with SMTP id 20so3295422pgr.4;
        Sat, 08 Jun 2019 22:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mUYWP70RDTFI+93NFRrPVCzuklD/oeAhEhCx99S9U8o=;
        b=gXPEdV4gT7JPNVfY2who+GifPoiYdfH9sStCQa8uywQBc4gasuPJLjm8C1Kww+oo0F
         D3pTPP+wpxKbVNs+IdgpvODsnYyT/36N/Vs4zpljDjh740g2ffOsgslmAGq4HPg055Ab
         cBmX07Tt8C1YORsjQzEioUW+ar9HQqljpt4u3T9I13XC1wZQxgJKag4vHtvo+SmSBCCl
         aR54Klr2z9nhElopEv1Vtkxt51oRYM3fdsT+DfQzIGB7vnIm/cuBgd+fiCvmvGky5Bi5
         K8jZmkDiu5afRymh7NMX9kzzVuDcQ44K7/FOkF8MJnS9dJsV/SI2egDaaK2jqRz/+Xhi
         TbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mUYWP70RDTFI+93NFRrPVCzuklD/oeAhEhCx99S9U8o=;
        b=M8QLad/dpv/Fi1Z0ZRszWCRPnGOtSm2y/nIE2QNbwNj9VV6KcGR3M4E3gi9gheO3qE
         LDEGvaV3/3g7O+yBRar/fD5RzFar+upKcaLEXnvpjz9MKZ6pKEf0CtXF5FhPWlCgbzCM
         0O/TscyTHAAIcYQFUKAcP8e78k0hQJFaryVKugG5ZCMxya8WH6a6sgy4MNbvMABkI2Xp
         1aYD736vjpGk2lretRrWq1IMt6toPg8Yd5Gn10a7AqddJ5UWImNGX2xFv7BucUx58Bpp
         +jW/NBJhX/hyG4cTXtFquRCdGUsauPrVNSG6cFIS/tuTKH7sdMBpBi09Oodic4fx2lUe
         S+dg==
X-Gm-Message-State: APjAAAUArrRV/nhYz3uGRdz7/ndnCSpqB3A3MV9QjKfiNeqmYF06TSLA
        UuAkxC6wfrIHuJPUAdXM9EF5ys+z8YA=
X-Google-Smtp-Source: APXvYqyoOiRJERFkarQP7/W9+vFK31hqsgl04tvV/3GDz3Xy3v0h2ZD+qJMBXPW31llsyNVW157QoQ==
X-Received: by 2002:a63:1663:: with SMTP id 35mr10426201pgw.253.1560059831794;
        Sat, 08 Jun 2019 22:57:11 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net. [24.22.235.96])
        by smtp.gmail.com with ESMTPSA id 2sm7367848pff.174.2019.06.08.22.57.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 22:57:10 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx: Initialize DMA before registering I2C adapter
Date:   Sat,  8 Jun 2019 22:56:58 -0700
Message-Id: <20190609055658.3446-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allocating DMA after registering I2C adapter can lead to infinite
probing loop, for example, consider the following scenario:

    1. i2c_imx_probe() is called and successfully registers an I2C
       adapter via i2c_add_numbered_adapter()

    2. As a part of i2c_add_numbered_adapter() new I2C slave devices
       are added from DT which results in a call to
       driver_deferred_probe_trigger()

    3. i2c_imx_probe() continues and calls i2c_imx_dma_request() which
       due to lack of proper DMA driver returns -EPROBE_DEFER

    4. i2c_imx_probe() fails, removes I2C adapter and returns
       -EPROBE_DEFER, which places it into deferred probe list

    5. Deferred probe work triggered in #2 above kicks in and calls
       i2c_imx_probe() again thus bringing us to step #1

To avoid having this problem, move i2c_imx_dma_request() to happen
before i2c_add_numbered_adapter().

This problem was encountered on VF610 CFU1 board with
CONFIG_FSL_EDMA=n.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-imx.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b1b8b938d7f4..78a909f56f75 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -278,7 +278,7 @@ static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 {
 	struct imx_i2c_dma *dma;
 	struct dma_slave_config dma_sconfig;
-	struct device *dev = &i2c_imx->adapter.dev;
+	struct device *dev = i2c_imx->adapter.dev.parent;
 	int ret;
 
 	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
@@ -1153,10 +1153,15 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto clk_notifier_unregister;
 
+	/* Init DMA config if supported */
+	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
+	if (ret < 0)
+		goto clk_notifier_unregister;
+
 	/* Add I2C adapter */
 	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
 	if (ret < 0)
-		goto clk_notifier_unregister;
+		goto dma_free;
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
@@ -1166,16 +1171,12 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	dev_dbg(&i2c_imx->adapter.dev, "adapter name: \"%s\"\n",
 		i2c_imx->adapter.name);
 
-	/* Init DMA config if supported */
-	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
-	if (ret < 0)
-		goto del_adapter;
-
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
 	return 0;   /* Return OK */
 
-del_adapter:
-	i2c_del_adapter(&i2c_imx->adapter);
+dma_free:
+	if (i2c_imx->dma)
+		i2c_imx_dma_free(i2c_imx);
 clk_notifier_unregister:
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
 rpm_disable:
-- 
2.21.0

