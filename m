Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5161A28A0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729871AbgDHSYn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:43 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40898 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730868AbgDHSYk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id h11so2807747plk.7;
        Wed, 08 Apr 2020 11:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Na+MBxK/KB5LpeIWE2GukXhRC2p8is3PfN4u2dPnbGo=;
        b=TQwBs5wBDXVXYKtj9W7xTxjrzhqyghfDE5a33TySTacDtJDmaX9clEb3tdTeWlQxH+
         aloPTmqKDNLpKbnjTFslZRd65PTOe1uQ4IRyNxY3ka7RqwJscSInxIOFMfOQfa07VrVe
         4BB16gk9Ga6j1kZhJNRtEXAA6n2ehNdUwvpYBRnBA2nZqT2jfrfFpo2AxOv5YaWadouo
         bmD8B5SSZu9ZAA5gcmXkE+noCvWlC0JEgnW2gzN599HcbKxBqKbx7xlSjmokrs7Ux3hH
         2ywJ5x/Ild8sSK4PB6B815h81CkjGv8/9geSndOeztWl7wy+iFNCN7AYUQ5IS9xrMut5
         wVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Na+MBxK/KB5LpeIWE2GukXhRC2p8is3PfN4u2dPnbGo=;
        b=Yv0PFE1hy9G1GAkHCKXwhSblrvCcadF1CCgwyPclq8dE7VvTqlFnJAEEQniYLl6wGP
         s4Dq0TzhDGkiSShW740ahDdPWS9F7jG1iMBmyQzA6/jzXKghPaDSkagdbyUypzDrLsIB
         MdRM6o765c9iQSWF4ZWqV84BoGg+pG4mGn6D8uyDUbvknICtrDnbgbfeDIGAA+VswY9u
         eCZeXOeFJMe6h0bbqrI4JyqYn4DyqPCjxpJaAKtd91+VCAp8RsVrOJpI0r4ggDhQILY5
         H5KmEvZ3qSHta0GVnIzPeagsZRJAGPJiCptB/A4sWRM4eZR2DMGLDpg+LpGVZSuVFDCn
         uDZw==
X-Gm-Message-State: AGi0PuYPfU79u1gpkZcuMlf85Ui0ViuYjOx4kDq3+qmqzkPKczRu2QhC
        WESERrmTpW2Y4YlIotJDpaQ=
X-Google-Smtp-Source: APiQypK4zV0eAu9IyQtiEFEXoMIOwOB3RUIQYBKvMnEtVPU7pDDq2p6MwXBYLQk0B4FPacS/3bhAkw==
X-Received: by 2002:a17:90b:190c:: with SMTP id mp12mr1104275pjb.86.1586370279496;
        Wed, 08 Apr 2020 11:24:39 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 9sm5429913pfh.52.2020.04.08.11.24.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:39 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        ardb@kernel.org, gcherian@marvell.com, jun.nie@linaro.org,
        shawnguo@kernel.org, tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 19/24] i2c: sirf: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:06 +0800
Message-Id: <20200408182311.26869-20-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200408182311.26869-1-zhengdejin5@gmail.com>
References: <20200408182311.26869-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource and devm_ioremap_resource.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-sirf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
index fb7a046b3226..269a71b0ee7f 100644
--- a/drivers/i2c/busses/i2c-sirf.c
+++ b/drivers/i2c/busses/i2c-sirf.c
@@ -272,7 +272,6 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
 {
 	struct sirfsoc_i2c *siic;
 	struct i2c_adapter *adap;
-	struct resource *mem_res;
 	struct clk *clk;
 	int bitrate;
 	int ctrl_speed;
@@ -310,8 +309,7 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
 	adap = &siic->adapter;
 	adap->class = I2C_CLASS_DEPRECATED;
 
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	siic->base = devm_ioremap_resource(&pdev->dev, mem_res);
+	siic->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(siic->base)) {
 		err = PTR_ERR(siic->base);
 		goto out;
-- 
2.25.0

