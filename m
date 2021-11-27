Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C20E46022B
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Nov 2021 23:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244082AbhK0Wpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Nov 2021 17:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243219AbhK0Wna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Nov 2021 17:43:30 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD547C06139B
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:09 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so9400682wmc.2
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJ8LcarI7xqEtvO5iVdRS56QktsqqAOlLhc5CcWcfZQ=;
        b=r/qaO9nQajEHTbRAiXJq5PBzELxh5SYcoGDHjkN5FwgvsS/VnF/bAOJx+7tp53JVEF
         i/t/XIzQCEyV+pEoUklfZrciszvg94BS/pQNz2A3MeVo01sPBNRVRbaCye70p75cV+t9
         2oGmdCE46DQUSKfznDj4vh4OXQcT07HJryqQcYO4iYmdkQ/1tVg3+0Bz7ZKCVenrVQZg
         vIfZzm/thV8mBebncIzTNzu9qDfvmdD2lo9EjUEneA0fuKw8zj2ExbnSqJ6jRQaStZoS
         yKcNUcq0cYJ4y0FKW61tt2FFcZ/imS6ZDC8X4XwoOYa1SAb+cLLcZsFVTzXL0GcdSW3g
         Y7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJ8LcarI7xqEtvO5iVdRS56QktsqqAOlLhc5CcWcfZQ=;
        b=M8N2+/Pad+OTOPFMsbfpMjvZC43muX8ezTzW95u5qIGe5oetriJuL7paycOUqLjdnV
         j6miue18oihDd1N6sJnghLnu2BUXl27AehWiHHXFe1nxDgB34EP8pKFKL2F04Jak8//v
         SwQ5nR1WQEatVb7cwEw9g+NnsydxCUaXN8/yUvSIoGjw/6gx6tf+jf3Dt3PLPfM96NHG
         M8AJoJIMyWO9qpnChpjwisYLFgcWl+p2lQuBar/mcXERFq+7qCd8nuHik6vjD3yrflWU
         WxpQdwZRFdlE7NczVtvE+HsJ7zi1CUry+bXZJfVG7Q5IpvILXj9FOUL8sxAAI5pwyq/U
         disQ==
X-Gm-Message-State: AOAM533L7myr+l0Puyp90JQhcHKyieOV9ete+0MflUaj9YBV8D4FwlCQ
        F0NjrzXV/fNx9KLsn2rwtvzqXw==
X-Google-Smtp-Source: ABdhPJybLPuiYuY26o40e1ovZYC7Flhu8vSAfHRGwdZ9hn+tl2NYlm7OSVmgTPh6Mb5T6RqHSb/bIA==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr24560888wmi.173.1638052388201;
        Sat, 27 Nov 2021 14:33:08 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id g13sm13152129wrd.57.2021.11.27.14.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:33:07 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 8/8] spi: Make SPI_S3C64XX=y impossible when EXYNOS_USI_V2=m
Date:   Sun, 28 Nov 2021 00:32:53 +0200
Message-Id: <20211127223253.19098-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When S3C64XX SPI is encapsulated in USIv2 block (e.g. in Exynos850),
USIv2 driver must be loaded first, as it's preparing USI hardware for
particular protocol use. Make it impossible for spi-s3c64xx driver to be
built-in when USIv2 driver is built as a module, to prevent incorrect
booting order for those drivers.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/spi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index b2a8821971e1..fbdf901248be 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -761,6 +761,7 @@ config SPI_S3C24XX_FIQ
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX/Exynos SoC series type SPI"
 	depends on (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST)
+	depends on EXYNOS_USI_V2 || !EXYNOS_USI_V2
 	help
 	  SPI driver for Samsung S3C64XX, S5Pv210 and Exynos SoCs.
 	  Choose Y/M here only if you build for such Samsung SoC.
-- 
2.30.2

