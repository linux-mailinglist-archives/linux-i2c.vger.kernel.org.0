Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F712622D1
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgIHWl3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730161AbgIHWlR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:17 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0763C0617A4;
        Tue,  8 Sep 2020 15:41:05 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z17so515474lfi.12;
        Tue, 08 Sep 2020 15:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wTOTLcjkkLtXssJ2ZijwIYtMxeJXm/EDwQWOhPT57kQ=;
        b=UWKnvayzBIo8IJvyj6xeZAbLh+4JYiwBojik1Y2qZ4K7BYF2Pb+z9PwEn8Yz2XpvS4
         VweCEIzB1KsASsEe05X3iB4FM+/wE/YhGYT8b5UxPjbCSpjiGQn9FJypmX0C9653HiHW
         34p8q8MW5eg5ONZr71YWjnzkiPBMNhiVBF9abFDPh7gIGkn6a5NiUO8cZzgdduJdHT02
         /F3JyGSLR9tU9QR776DwUD0ix4UuHYnFPQzb7fmf5kH4fpOD7aYnX26+VUu6OV6IXYPF
         +XBo/hqzz9he4+xoXqkUQc/BlETKFrSYhwMr3GhuiYJF7uk5l8IUJlYOvoLFqXc5x/F+
         xz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wTOTLcjkkLtXssJ2ZijwIYtMxeJXm/EDwQWOhPT57kQ=;
        b=LuCvdA2ReHSJRY5AlwISR1Su4KHp7R1hWNZnxIZ0ErVNdUbbHVMt7Eybwc324wkW1/
         u/u+626871pPPux2R95R9P+1Qr6hR8IF7J/bwgrKMa2l3t4ml+DnhwGmb2LKfRTJP5jk
         97DoE3Lu52jCAZuPj/BPGS36l2SCqfy/fOa0aCmV9e6r8Y21m4mRDOhhfnZvzC03oOaS
         KxI20nuSZb185Cej329ROgzFv8elrCTiL4dnNz6WKTiW+8x4xCCR6jl+o2cOFB9clF58
         G/2J2y7scokPrmGGXoXB+qJjnWh5xtA1ORzyGZ3Qg7yo7NsAuJwLbC4bnEbfR1I1H+G7
         68tA==
X-Gm-Message-State: AOAM530I75caor0w1UtCIBtfPEg452yvCL9s//IVlPXmbTmDDGs+PrrA
        1ogaC6jF5HqOTuJw5XD67nOjzOAPuCg=
X-Google-Smtp-Source: ABdhPJyG8o8852Td7IDedsDkJi3Xs2rjPRURztg5cedM+vp/9v/nP4CL3hDLG3pSyFG4VZ91aZvgLQ==
X-Received: by 2002:a19:42c4:: with SMTP id p187mr530742lfa.149.1599604864077;
        Tue, 08 Sep 2020 15:41:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:41:03 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 34/34] i2c: tegra: Improve driver module description
Date:   Wed,  9 Sep 2020 01:40:06 +0300
Message-Id: <20200908224006.25636-35-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
since newer SoC generations are supported as well.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 087f98010963..1b56d63bdd3c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1912,6 +1912,6 @@ static struct platform_driver tegra_i2c_driver = {
 };
 module_platform_driver(tegra_i2c_driver);
 
-MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
+MODULE_DESCRIPTION("NVIDIA Tegra I2C Bus Controller driver");
 MODULE_AUTHOR("Colin Cross");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

