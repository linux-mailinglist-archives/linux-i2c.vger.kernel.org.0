Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CAA460223
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Nov 2021 23:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356550AbhK0WoM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Nov 2021 17:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356558AbhK0WmL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Nov 2021 17:42:11 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB59C06179F
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:06 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a9so27288362wrr.8
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NMCVGl7pMsP+zITp732vJFcoSeQrkG2e1B5Kv1EgeM=;
        b=P7FFAPYPl9oHx2XJn0Ef0hHwk1zUdCFTfwaNbFWhLzSvk7Z9SFqd/u3s1IvpTe9VTn
         KJnO4eUi/gKznSWazaqBWdBjiBfyU97p90nL2oldEsvmb2b0X5CBo3uN1p2T72MNeEcW
         DxtZtjjAjXZ5oZorBJNnyprY9+16TYmXoq+U9CfOzxA/Iv5iJSRv4Xu6co18W5zvHgn8
         7GsQSTBlZyC+l8G+NsEMpcnU2+c8V524I3mRaxOT3JphaipOD1VnUgasXNGgI6mMb+BK
         4Gtt6xYG/fXAerGCDpU11WkeD+UjCQvUBQRvirsh+iZ62YmKUxRTSipYtPcXrzvtEPlR
         65Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NMCVGl7pMsP+zITp732vJFcoSeQrkG2e1B5Kv1EgeM=;
        b=mvTYAMTyNQfg7LqHqyUJ6T36nMJie17oP+U86sA2ES63iUN/N4CruWf8qMm8kyPpl5
         e6KaGZaTl6vT15QQbhxPPHmpZcjiwLSK8kjOnddPQhFElqq92eIDZmjQBzW+LVcldO8I
         57fT9Oc+/w+9YriWDRzUgo2JdV/OD6ffu7vhOGlvj+0VUKpidxiJEKkcmNF+ti5AShkr
         5UQxeUOOXQoL6GIjnQYj7RXKFYi5xA5EGRlIQpuggdQ8kAIjpmlbMuMKQwwYOEKnB5IF
         iJ2pYLfR51Vl0ZzWXEhtzRdqTTZUoA1VbPKOpCSagR2INgnq4OU3BPwd7M0SsTmvQPlr
         IO9A==
X-Gm-Message-State: AOAM5302JVHisGk3RdQgLQNLjV0wwhFKHNqCsaPSZYa+YOy67+GZRkSj
        xjoXpXrJuWUnzzBWndCWW6cFxA==
X-Google-Smtp-Source: ABdhPJzy5nxx9DYCtcxYRuTdufcTHhm0DmVTtGPh8cq7SXftXb7s3K4I29+XG8BwPobfnQxmaynjlg==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr23231855wrw.628.1638052384715;
        Sat, 27 Nov 2021 14:33:04 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id r17sm17128027wmq.5.2021.11.27.14.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:33:04 -0800 (PST)
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
Subject: [PATCH 6/8] tty: serial: Make SERIAL_SAMSUNG=y impossible when EXYNOS_USI_V2=m
Date:   Sun, 28 Nov 2021 00:32:51 +0200
Message-Id: <20211127223253.19098-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When UART is encapsulated in USIv2 block (e.g. in Exynos850), USIv2
driver must be loaded first, as it's preparing USI hardware for
particular protocol use. Make it impossible for Samsung serial driver to
be built-in when USIv2 driver is built as a module, to prevent incorrect
booting order for those drivers.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 0e5ccb25bdb1..47bc24e74041 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -237,6 +237,7 @@ config SERIAL_CLPS711X_CONSOLE
 config SERIAL_SAMSUNG
 	tristate "Samsung SoC serial support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_APPLE || COMPILE_TEST
+	depends on EXYNOS_USI_V2 || !EXYNOS_USI_V2
 	select SERIAL_CORE
 	help
 	  Support for the on-chip UARTs on the Samsung
-- 
2.30.2

