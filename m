Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BBB4015E6
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Sep 2021 07:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbhIFF2n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Sep 2021 01:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238881AbhIFF2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Sep 2021 01:28:43 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0092AC061757;
        Sun,  5 Sep 2021 22:27:38 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id pi15-20020a17090b1e4f00b00197449fc059so985672pjb.0;
        Sun, 05 Sep 2021 22:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O8EgemLUAyhEE0xDtSpxWPGSz/8UwJOOmPy6hkxB9ZY=;
        b=LFFBtt8QCnNg/4EX9uSSFk/oNMDV509nCQa+LBnV/KoqvnFDl9iuOGgYiWBbyVl9C0
         kDlLIph19uG2HdPFMvQLonf6Cm3GTNAPN9gfpzS0sYLuRDaCGlhOWGPclbZgrY04A87C
         ILBNzd07Ga15AsXAprrvloSS+Muari2Qxe8gMAMQAM0lEXtgWtiA9R3+K7CHgLA6wfMX
         xLKsJI5m5hOpk23JLVbOvrIvvj0CyKis/W0XaOvqYoBgWRhdg5qFGuMEZ3b+REd3TMQX
         V0H2n1IjZnGk8QqKkwy6X++myicn+XOC9jjDgfGAyO9Ihw9/+pf3eepdmh6VnP5ZBJhZ
         5m5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O8EgemLUAyhEE0xDtSpxWPGSz/8UwJOOmPy6hkxB9ZY=;
        b=tUTCvgbBiAk64UGc5g8vv9QbHcBM1BIMYzWc0Be9T2wWmj/Q/B4aOzTpkTaHQCZMzQ
         y5BDuTc/hi8QGTf4MbY7pTWlPHWlBM5wDOBnEX/X11F3aisNMMR++caH1es8xTS4nmvb
         76JVLCYObbzHAn1fqYX+ZRlPiUglrEg9uwgPZE+XftQpJUeZGS0COWdicNTT/hhv9DHY
         XdlDOI1Pgz4aoqNEkfRJoDrPzdE3lvpVw9F2i+zMzkZvBkb3u0VGRk6sSj9BDtS1thte
         tXQFSjgOa1UF25CUf5RuoABVjS87LNoh69v4QS5XEnpJOqLYfO0UNIfsqsBWzjgLTjuJ
         15BA==
X-Gm-Message-State: AOAM530yTjn5WXgcf3MLVdeRM5O8ltyU6Ry7xcpUZH7nxpJn7N4CnfR3
        uTLaiYg+S1lHLVx3jrvOOqcCiGJ2T7UYzw==
X-Google-Smtp-Source: ABdhPJw3BzChu7rKDhHBe52O5LwZGgcvCBHhm0t8hApbFNm8WE3azi/K3p2FtykUH3BA1049T4veDw==
X-Received: by 2002:a17:90a:3ec4:: with SMTP id k62mr12355034pjc.32.1630906057664;
        Sun, 05 Sep 2021 22:27:37 -0700 (PDT)
Received: from localhost.localdomain ([124.126.19.250])
        by smtp.gmail.com with ESMTPSA id y23sm6039222pfe.129.2021.09.05.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 22:27:37 -0700 (PDT)
From:   zhaoxiao <long870912@gmail.com>
To:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <long870912@gmail.com>
Subject: [PATCH] i2c: Fix return value of bcm_kona_i2c_probe()
Date:   Mon,  6 Sep 2021 13:27:30 +0800
Message-Id: <20210906052730.19644-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When call function devm_platform_ioremap_resource(), we should use IS_ERR()
to check the return value and return PTR_ERR() if failed.

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index ed5e1275ae46..8e350f20cde0 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -763,7 +763,7 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	/* Map hardware registers */
 	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base))
-		return -ENOMEM;
+		return PTR_ERR(dev->base);
 
 	/* Get and enable external clock */
 	dev->external_clk = devm_clk_get(dev->device, NULL);
-- 
2.20.1

