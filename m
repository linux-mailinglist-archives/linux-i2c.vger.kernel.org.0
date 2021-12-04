Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0B24687EC
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379420AbhLDWCA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 17:02:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379027AbhLDWB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 17:01:58 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B7FC061354
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:58:32 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id l16so13633713wrp.11
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=68SA4R0NxLIr37Da5nfLfh6Rq6kJdXUgL0ant2P/Sj4=;
        b=H2STaTK95005QNz2MbBiOt0wdBCil5jdxUtHdHr+h2kznsY+43uu8BOGpeM8ddviyb
         4kkR520KjL0AdzAAaJwM0QnxG4yAouCHcKEzkMHxIvChopuHSjB+QlUmvrjJTQVVgiud
         rLtQMkpoRjdJqV+bfmG4eeFZVdgTJUoFZ3qh8gFui2bdmGNMjucltMW7H1jkww1kEUSX
         LhqbtWbnWdfuJ/ev8Tdhe0yz7mRzZvMmIFj/YC1zr/sRE7+oFqsAscRePpQjW6fmQd8P
         yXJ2uftobAGZBdxPIpe9R/cRqxlcBOwLC7ZtC5GLjokjVuwrUc0netZH8wt8sCkJjViO
         blfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=68SA4R0NxLIr37Da5nfLfh6Rq6kJdXUgL0ant2P/Sj4=;
        b=ycQKPTNfx5mOOJVVqaZtq8JCaP/1SGg5+3I+Vi1BS3QlM2zlkatY1ER2yyjeD3Qb/b
         3TTum4PuSjfYchrnGWTq+OPhcLAbb0GOoPUTyupY2o+GbD0kKbdqZMMpJOfBH53j5Rqz
         YkFuKAApeTE8iw6dBUI89++//YCL/y+/86//iI/mAuMCPiR/00RqfBzBBQe0aFnjAp5U
         urgFt8GwEDHQ0o8VM6HKWe5HK2RO8X7swLTYJ7hmx4kL0u2NT6qhbAG83n1vNCMmAwK5
         Ne6fPzDHyArZIfkQD48l+iTPd++wKZGY/DN72NJqtc4QH7ezgSDB2wcuBndI3TkAhgb6
         YsNA==
X-Gm-Message-State: AOAM531+NCuXEPBMJRqqkQh6fEWnm09OC7fU8bYXE3x+4Uk7nDwEIaG8
        DZRMEQeF9hPP5T8rpklhEEBW+w==
X-Google-Smtp-Source: ABdhPJylorT12Ea6K3nYV3saE7kchDm27BgyQlbHQDZ9ALWqcIENW5o7LZFLV4oW5SaGmAabQ7rdaQ==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr32746730wrv.310.1638655110996;
        Sat, 04 Dec 2021 13:58:30 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l21sm6572769wrb.38.2021.12.04.13.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:58:30 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
Date:   Sat,  4 Dec 2021 23:58:19 +0200
Message-Id: <20211204215820.17378-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215820.17378-1-semen.protsenko@linaro.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In Device Tree specification it's recommended to use "i2c" name for I2C
nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
warnings like this when validating HS-I2C nodes:

    hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
                                  '^i2c(@.*)?'
    From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml

Rename hsi2c@* to i2c@* to fix those warnings.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - This patch was added in v2

 arch/arm/boot/dts/exynos5260.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 52fa211525ce..524d244050e0 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -368,7 +368,7 @@ mmc_2: mmc@12160000 {
 			status = "disabled";
 		};
 
-		hsi2c_0: hsi2c@12da0000 {
+		hsi2c_0: i2c@12da0000 {
 			compatible = "samsung,exynos5260-hsi2c";
 			reg = <0x12DA0000 0x1000>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
@@ -381,7 +381,7 @@ hsi2c_0: hsi2c@12da0000 {
 			status = "disabled";
 		};
 
-		hsi2c_1: hsi2c@12db0000 {
+		hsi2c_1: i2c@12db0000 {
 			compatible = "samsung,exynos5260-hsi2c";
 			reg = <0x12DB0000 0x1000>;
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
@@ -394,7 +394,7 @@ hsi2c_1: hsi2c@12db0000 {
 			status = "disabled";
 		};
 
-		hsi2c_2: hsi2c@12dc0000 {
+		hsi2c_2: i2c@12dc0000 {
 			compatible = "samsung,exynos5260-hsi2c";
 			reg = <0x12DC0000 0x1000>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
@@ -407,7 +407,7 @@ hsi2c_2: hsi2c@12dc0000 {
 			status = "disabled";
 		};
 
-		hsi2c_3: hsi2c@12dd0000 {
+		hsi2c_3: i2c@12dd0000 {
 			compatible = "samsung,exynos5260-hsi2c";
 			reg = <0x12DD0000 0x1000>;
 			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.30.2

