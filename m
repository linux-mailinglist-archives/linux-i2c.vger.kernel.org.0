Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F07A31A2871
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730685AbgDHSXd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39864 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729672AbgDHSXd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id k15so2789742pfh.6;
        Wed, 08 Apr 2020 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+80RyxbCn8tz5y0Vc+EWXEDgsPcBxti5SpsxZgdpFyg=;
        b=kBEAOUGyDbUMCiaOMxXLVHOCxuTFkUbc9Vk+PZA1wT6uRgdcOu4yZ5W3VtNCV8eEEd
         clMgpf93NBja5y6HCSHQ8IBQw6iH+KsXEoZa6SIubGcLEW9cewGBX35Y2pcwPbWpIq6E
         1A+y9jt2UCsfRLRayBa3fbw2m3MiE9aswkyvfWVWk3HJnIB6oGZVA3ko71BKk0hydChu
         bTc8I/3JVUUwzXD+EhmTdLGJ3Ad92jENtLMPFBtkhn4pYAeWSnzLOcj+8Bt++O5AWS1h
         j61wytooRVFI6ZUYAbm5m1M14SWW80hFuU1N7lEI92HSL8HtvOqG3bj9o+UgX/7IPNrM
         VzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+80RyxbCn8tz5y0Vc+EWXEDgsPcBxti5SpsxZgdpFyg=;
        b=EjIQYLbbUKI5T2SQbtEZKXAmLVnBO/r6fD1vQQ11ZK4JMBHiN5ARhz6MidLGraALgY
         yYHJTnVaU6qxvThfaUcmYRhPzBVhMiu/Vxoc9e6kkgZ8BoFekNAx9QPch37jQ9gzIQ5y
         3lxEpC+FWg6Se+owvMmYqA4ZeFAVodri85lfftQ63G/r3TaS6KlOkLWrpdoqhu6t5ZOe
         UoLdl/GVdeW+I11/qFG+c2bqeHL6tcgoccQPLSsSaRKObHV+WH0Thziv2YbwUL3GHMLQ
         FH6X039YdEW1a44IFUOGvDLnP2SA5LIdj2c3QVTUDjU5+nhA5g9XFlXB2Z/HtZbAl36f
         CpFg==
X-Gm-Message-State: AGi0PuZJ/cZMltgojZjYjFxue3g8fqGv6GKFKhJTjGnSIv6uv90TTUJ0
        hlwGoCH8H08d11ArdUlEfqY=
X-Google-Smtp-Source: APiQypKUWwHU9zimuwReZlfre05QmJd1ik0rC/sbJJXmYJu+6pwOlBwnBPGRKyg110iwdy6lP5ta+A==
X-Received: by 2002:aa7:947d:: with SMTP id t29mr8595169pfq.184.1586370212220;
        Wed, 08 Apr 2020 11:23:32 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id i124sm17119875pfg.14.2020.04.08.11.23.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:31 -0700 (PDT)
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
Subject: [PATCH v2 02/24] i2c: mv64xxx: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:49 +0800
Message-Id: <20200408182311.26869-3-zhengdejin5@gmail.com>
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
v1 -> v2:
	- no changed

 drivers/i2c/busses/i2c-mv64xxx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index febb7c7ea72b..62fb1ecc84a2 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -877,7 +877,6 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 {
 	struct mv64xxx_i2c_data		*drv_data;
 	struct mv64xxx_i2c_pdata	*pdata = dev_get_platdata(&pd->dev);
-	struct resource	*r;
 	int	rc;
 
 	if ((!pdata && !pd->dev.of_node))
@@ -888,8 +887,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	if (!drv_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pd, IORESOURCE_MEM, 0);
-	drv_data->reg_base = devm_ioremap_resource(&pd->dev, r);
+	drv_data->reg_base = devm_platform_ioremap_resource(pd, 0);
 	if (IS_ERR(drv_data->reg_base))
 		return PTR_ERR(drv_data->reg_base);
 
-- 
2.25.0

