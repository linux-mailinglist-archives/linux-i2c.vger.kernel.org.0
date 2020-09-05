Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CB225EA96
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbgIEUnV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbgIEUmy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B10CC061245;
        Sat,  5 Sep 2020 13:42:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b19so11753489lji.11;
        Sat, 05 Sep 2020 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MRpNSGyTgCk/Y8FaKuOrYPL2JV7Xhknf5YwvWuQ7xXs=;
        b=pyaubIRoUAhtZcXMTD3VUb3d0gBpJxWhur0Q3r7N5SLnJB3H42trvzyMHwr6t0UzKz
         kbaYuy6FgG/8nSAP+ASeJY/fv6+fXScUMIf+CvJh+eFB2gVOPos+4ZTvPLiO8mcrk+cW
         v/CHiem+XaElkbPDOrkx75vCANgur/0YWCmF018PIcNFegfhfRau/mn5+TinJ2lAEbqI
         LnCVlCOtpCf/vRI2S5jo2XyycfIBFZgL55qZ4YzYTMgOodsRDiwW9MqvzPGmDwXlZ4py
         BadB6lpKOs7Fd8i/DBQF5RSvwsnER7tH8KApThkxfyVyo4fqDFU/2kH1rQqWViW9EMKl
         za3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MRpNSGyTgCk/Y8FaKuOrYPL2JV7Xhknf5YwvWuQ7xXs=;
        b=CciDc/3ofzOkgNNfpksN4qvkjlYXYkY/2aiWoqz32QazIXtSGarfcd1AEd4nUvxNZP
         ZHEsPYsqiwkfZwkm00PTv7cVnc8RUyrzePALzOGefCUuVxhiGLR9c1PQoym2ctcAfYE7
         Ir4RjBVfP5WTH4i/YzvyxTJOh9hF7cN2BVistsz3gHxG3cTKOvX587EkYtXP4oE07WTW
         ybQ35lpTH0qsk/iYJGEapNK5eXbus1JKOhvi8Edmu5Lgz0fXeza2f5sT0Si9G9tLPuLy
         d8QbE9GViWuOZdwUzn3ZVpWR/5LOiHm0LHn0DtMPRiz8b/CyeiCRWseTxHJZiGkSwmkR
         xkRA==
X-Gm-Message-State: AOAM532Qx8xTjk6h7ARFTMYpZQxgcKywcAU2yBOLNAwsI4fYVZ5ij623
        28LQBT6FOu5Y1bCF2n8VGpc=
X-Google-Smtp-Source: ABdhPJwPFdYjrnYT98zjucuXMG6/T3YLciFWzYJyIDiim880bolcxZlE7PZrsE+HYmMNpvvLjhaVSw==
X-Received: by 2002:a2e:3a09:: with SMTP id h9mr6577398lja.287.1599338571276;
        Sat, 05 Sep 2020 13:42:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 29/31] i2c: tegra: Improve driver module description
Date:   Sat,  5 Sep 2020 23:41:49 +0300
Message-Id: <20200905204151.25343-30-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
since newer SoC generations are supported as well.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c36f2bed0240..dccad2429117 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1896,6 +1896,6 @@ static struct platform_driver tegra_i2c_driver = {
 };
 module_platform_driver(tegra_i2c_driver);
 
-MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
+MODULE_DESCRIPTION("NVIDIA Tegra I2C Bus Controller driver");
 MODULE_AUTHOR("Colin Cross");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

