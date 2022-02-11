Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6291E4B23C7
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 11:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239612AbiBKK6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 05:58:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348486AbiBKK6Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 05:58:25 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF1CB8D
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 02:58:23 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id i34so15790130lfv.2
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 02:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xbwb5/EEFPdfFjLfxYZmeP/Ke/V6uDlSmIqJAvBHyaY=;
        b=ZEiPHvgPPXOnY5GkbalsH7Edlqm4rSSpU4kXLYHiDZf3Jtn5p9CD+Hgw0kD+LxsGQj
         3pevB9hxfk0FCtrevz8RmdGAwAyZVd8M5oszQoHdf0j3USWG/4QcuTqpeCfElhbswiSf
         UO9g9bI9jLWaOHqMbXxdgp+SfzmvcLLsHCQswAUhMaujMvXmbqNmm+cUq1T34lxaWOtV
         gH1iXsp2herut8bUksNh6qDrs2DX2v22c5AZPxbOtDAJPIKvTA+GNLsyAdBaLiuE7Zzd
         fvrMC737Hyy6xKhq3hDX+vOX0cmsKXk6zvm3pfaaQHuzWN7UAXol088wC/nOYoQ0OWPO
         1Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xbwb5/EEFPdfFjLfxYZmeP/Ke/V6uDlSmIqJAvBHyaY=;
        b=APgVO18cJkLn4X5mwwt9/rcegK5SmJt0x1jfmk7iDmiKoMV/jJx47zjoV14I6lPbSV
         CCSaJKXv7g9CVFWecuvZPkv0FRlPPbsiFQoSML16FKOT1zuE8+opZcD7oIt/MI6VqpzF
         RGUs/hYRr9xhUefQjocrRNgbaUws6TPXhLOhoA6geroVo/GLmodnzJxR4R5vqQPnL0WY
         ghnmyJOC/CAQMYMj+fam0r6zlTDqLLfTGAmBQN5Hw8xT25nV7bBAzDqDVMIQ7H+cuTVZ
         wH3L8c4d6DTOSbOROX+IelUo7XmrqZEgzQlyt/sOglHXQ5PUpP7jZw/Hfk3XuNagaDjK
         73hg==
X-Gm-Message-State: AOAM532jb6bRsUI9eRgAgY7NLNtLuQ1HfO/KA27c3kOfHZ8A+ZqjN6YB
        o2xC5gUhsQVcY2DLlYL1L24=
X-Google-Smtp-Source: ABdhPJzRN4Hn4lgQr8XEY3iekjl/+Mc/dOaYHQbcZbyu0WaPEqO8RwOYWKChGdL3h/wTgJ0fvfCGNQ==
X-Received: by 2002:a05:6512:3fa5:: with SMTP id x37mr841314lfa.78.1644577101364;
        Fri, 11 Feb 2022 02:58:21 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id a17sm1606340lfs.35.2022.02.11.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 02:58:20 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Dabros <jsd@semihalf.com>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>,
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] i2c: brcmstb: allow compiling on BCM4908
Date:   Fri, 11 Feb 2022 11:58:06 +0100
Message-Id: <20220211105806.14341-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

BCM4908 SoCs use the same I2C hardware block as STB and BCM63xx devices.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/i2c/busses/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 5ea26a7aa1d5..1fbb5f1fa7b1 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -477,8 +477,8 @@ config I2C_BCM_KONA
 
 config I2C_BRCMSTB
 	tristate "BRCM Settop/DSL I2C controller"
-	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC || \
-		   ARCH_BCM_63XX || COMPILE_TEST
+	depends on ARCH_BCM2835 || ARCH_BCM4908 || ARCH_BCM_63XX || \
+		   ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
 	default y
 	help
 	  If you say yes to this option, support will be included for the
-- 
2.34.1

