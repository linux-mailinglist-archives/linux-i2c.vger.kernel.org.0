Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A384458455
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 16:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238421AbhKUPJO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 10:09:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238393AbhKUPJK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 10:09:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4927FC061714
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 07:06:05 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b1so67863197lfs.13
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 07:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VknmVIVQtpeIlKFvp4NDo9zu3CxNfNa1g3Yr7yIWmJk=;
        b=Ll/IjdvDuPwah2VbxQIdOX2xomjWiVg5upazdhEsnIkAciBneanNGI2JEsomxjjbH2
         25LZtLfkmcLNYMAbF6blY+TprZc4rYNi8396NNltEuoccvGgXDBeX+8hBD+7nOHXbJ4q
         9ANiWnxFL9PAHJrpTZV7U1r0djWJUpuSiDwcgyqIhS6n8xxurz22sMNyODg8Uo2YK8wX
         OoWDzNM7RluugG5wTkiNypfjrkuYaQet0JwSHHdV1b44lFif/3HuQYxsfFibPYkeoQVE
         /BGIoZNZ/IvhmaZT9I3hdo4dCb8peQP7hhOsHO7L4ppvkiU1MDcoEJxzvudhBsuHENZf
         W2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VknmVIVQtpeIlKFvp4NDo9zu3CxNfNa1g3Yr7yIWmJk=;
        b=jOaPD8jYH9xIJtlLLqAy1FLGxaebQxJIIUU/7Yn/bo2MAEwCAAcnFp1+32mwslqMOL
         Gf49ZO/phP9male7cpUoc3oNulp0jEbWScirs88Q2JSVvKY4vW3qzLfkNPjqF9ZX2cmI
         d6Qxndn/pkV5Nwk8KGTo6r+HjzArfVF+V3JHeu8+5Z1mXDjwbxPjLVFmkF/OvVoZGUnK
         udZRvFoPXPuruZzQqXef32XjTCEBpYdSAr94IR77hFmGsUsH2Ym2WuUeoBzIelbEEIie
         +UFydtRcKuyyK7M2/cuINe2iybhhDd7q+7bGDu6Qpe26yF9/Zrmz1/iiUgRPEKpAOE4f
         F4fw==
X-Gm-Message-State: AOAM531Ks811yP24zYMYniFOPwvyTcAvwJGDySEJ9ojiVqqJbFZyN6Kz
        8hJR73rKP9oHebbc4q2Zco6q5w==
X-Google-Smtp-Source: ABdhPJztqj1Ylj8HogWMOo0X+vPq5SNdvEt7B+jz9CdXA9h6cCZRGvoxZLKdWC9xTnfZ9Jp2n6OxwA==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr42946273ljm.2.1637507163592;
        Sun, 21 Nov 2021 07:06:03 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id t196sm665562lff.75.2021.11.21.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 07:06:02 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2 2/2] arm: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies
Date:   Sun, 21 Nov 2021 17:05:58 +0200
Message-Id: <20211121150558.21801-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121150558.21801-1-semen.protsenko@linaro.org>
References: <20211121150558.21801-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A separate Kconfig option HAVE_S3C2410_I2C for Samsung SoCs is not
really needed and the i2c-s3c24xx driver can depend on Samsung ARM
architectures instead. This also enables i2c-s3c2410 for arm64 Exynos
SoCs, which is required for example by Exynos850.

This is basically continuation of work made in following commits:
  - commit d96890fca9fd ("rtc: s3c: remove HAVE_S3C_RTC in favor of
    direct dependencies")
  - commit 7dd3cae90d85 ("ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
    use direct dependencies")

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on latest linux-next

 arch/arm/Kconfig                  |  1 -
 arch/arm/mach-exynos/Kconfig      |  1 -
 arch/arm/mach-s3c/Kconfig.s3c64xx |  1 -
 arch/arm/mach-s5pv210/Kconfig     |  1 -
 drivers/i2c/busses/Kconfig        | 10 ++--------
 5 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f0f9e8bec83a..391f07c17096 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -479,7 +479,6 @@ config ARCH_S3C24XX
 	select GPIO_SAMSUNG
 	select GPIOLIB
 	select GENERIC_IRQ_MULTI_HANDLER
-	select HAVE_S3C2410_I2C if I2C
 	select NEED_MACH_IO_H
 	select S3C2410_WATCHDOG
 	select SAMSUNG_ATAGS
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index dd1ae5571f43..f7d993628cb7 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -20,7 +20,6 @@ menuconfig ARCH_EXYNOS
 	select GPIOLIB
 	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
 	select HAVE_ARM_SCU if SMP
-	select HAVE_S3C2410_I2C if I2C
 	select PINCTRL
 	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index f3fcb570edf5..af01675d8769 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -12,7 +12,6 @@ menuconfig ARCH_S3C64XX
 	select COMMON_CLK_SAMSUNG
 	select GPIO_SAMSUNG if ATAGS
 	select GPIOLIB
-	select HAVE_S3C2410_I2C if I2C
 	select HAVE_TCM
 	select PLAT_SAMSUNG
 	select PM_GENERIC_DOMAINS if PM
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 5a96099af991..055de578b57f 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -12,7 +12,6 @@ config ARCH_S5PV210
 	select CLKSRC_SAMSUNG_PWM
 	select COMMON_CLK_SAMSUNG
 	select GPIOLIB
-	select HAVE_S3C2410_I2C if I2C
 	select PINCTRL
 	select PINCTRL_EXYNOS
 	select SOC_SAMSUNG
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index dce392839017..c6b854a9e476 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -963,16 +963,10 @@ config I2C_RK3X
 	  This driver can also be built as a module. If so, the module will
 	  be called i2c-rk3x.
 
-config HAVE_S3C2410_I2C
-	bool
-	help
-	  This will include I2C support for Samsung SoCs. If you want to
-	  include I2C support for any machine, kindly select this in the
-	  respective Kconfig file.
-
 config I2C_S3C2410
 	tristate "S3C/Exynos I2C Driver"
-	depends on HAVE_S3C2410_I2C || COMPILE_TEST
+	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || \
+		   ARCH_S5PV210 || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  Samsung SoCs (S3C, S5Pv210, Exynos).
-- 
2.30.2

