Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08571A7EBC
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 15:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgDNNsl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 09:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgDNNsg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Apr 2020 09:48:36 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B04CC061A0C;
        Tue, 14 Apr 2020 06:48:35 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h11so4666129plr.11;
        Tue, 14 Apr 2020 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRIC1+fbqgksFCXZuCIwbMy1gMACOqNnoWCEPyufkRo=;
        b=GaO/qKQOZHoYDBE0SZJhbEGpsDQbuszrib3RZ+LJ4A9j8Jpt43q+nfImee6LnjJ+j/
         aR8OOlq5dPwT1bFM7V+3RYw78okenlCnJXMsZYvnGOP95JFuWYxDxQQDLadVHaJ0jV8S
         Dz0RnmM+GdP/zaU++I85DtwtYRhtfdbluCsGpJn9Oy15ByBq6ysdXVIDPMh825yh1wYd
         pp4dIKSYES6/riRi0KecsSOdbDwZNIvFIiw7pELOFQEBy1kmKs7lbV1UKfikocbd84wz
         xRLiaQuj4ssVo5PvKaRnZlYgWxbxmm/frB53eAnJVbTEcz17KjfIqMsWPK+e2OW/uYRY
         G7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRIC1+fbqgksFCXZuCIwbMy1gMACOqNnoWCEPyufkRo=;
        b=pB3BR3sE1ouzJsb/alituJQPzBoaHjSrbjUZhfJqU0fgRpxQ+8ELfzoIrgP3VQUJik
         cGP5Cl5OOkPzIx7QRGE+JCiFONh6tb1TiPvcXsfPoMZC4JHILNe++mnssk8xERoDYor4
         /3kmO+qQjeApeCql9Wpn8OgtW3vV9OSKzeh/TJi3ZDBK4wZqXEuLG60f+G1Vt9hhAyGV
         oX+yBqwmVBa8BkB017PruuXZ220QxS4/WMuEXXEvsexbrXLSrrxOVv2g5jP8s4Lmm7gb
         5PswPuPafgl4XoeVBtTXBaLintZ4Igpxw4S/LlG9HySHa14gt9IPZ/p+jD/xRddZUf6w
         8Zag==
X-Gm-Message-State: AGi0PuaYElEE9qPi1z5dWc/HLORv7eJAO/jRgWIqLCtl5LuLDu0UO4Ga
        QU8xQQ8pjY4o9ugmnU3qqGk=
X-Google-Smtp-Source: APiQypKxu4lvNh7B1YEtxxWsTvlQwDsLJQmCevNqmTW3KEEsrC0UcP+R0Mko5eh4rrhyjzXZHSxvwA==
X-Received: by 2002:a17:90b:3444:: with SMTP id lj4mr185611pjb.37.1586872114531;
        Tue, 14 Apr 2020 06:48:34 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id g3sm10233341pgd.64.2020.04.14.06.48.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 06:48:34 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     michal.simek@xilinx.com, wsa+renesas@sang-engineering.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, alain.volmat@st.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
Date:   Tue, 14 Apr 2020 21:48:27 +0800
Message-Id: <20200414134827.18674-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

use devm_platform_get_and_ioremap_resource() to simplify code, which
contains platform_get_resource() and devm_ioremap_resource(), it also
get the resource for use by the following code.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-cadence.c      | 3 +--
 drivers/i2c/busses/i2c-pca-platform.c | 3 +--
 drivers/i2c/busses/i2c-rcar.c         | 4 +---
 drivers/i2c/busses/i2c-stm32f7.c      | 3 +--
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 89d58f7d2a25..803c802611eb 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -906,8 +906,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		id->quirks = data->quirks;
 	}
 
-	r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	id->membase = devm_ioremap_resource(&pdev->dev, r_mem);
+	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
 
diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i2c-pca-platform.c
index 635dd697ac0b..546426a470cc 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -149,8 +149,7 @@ static int i2c_pca_pf_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c->reg_base))
 		return PTR_ERR(i2c->reg_base);
 
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 3b5397aa4ca6..a45c4bf1ec01 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -938,9 +938,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	priv->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	priv->io = devm_ioremap_resource(dev, priv->res);
+	priv->io = devm_platform_get_and_ioremap_resource(pdev, 0, &priv->res);
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 330ffed011e0..cf48f8df4423 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1940,8 +1940,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 	phy_addr = (dma_addr_t)res->start;
-- 
2.25.0

