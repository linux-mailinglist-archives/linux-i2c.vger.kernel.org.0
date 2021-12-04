Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DBF4687AE
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359689AbhLDVyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 16:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357238AbhLDVyC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 16:54:02 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758C0C061751
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:50:36 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d24so13806239wra.0
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHZ/NY52q+fJ8ZyowbxA7ltlvG1kl7aRGse+qxxLYbY=;
        b=HWiGCfL53Wa7TGAKg5tgcgNN4csXPz7IboCQqiRoy+A6ZZrbHrnX4sxBbaOqjdmC7j
         XGXNjYR1rqi4HGDjbNtsnyg7c0N8YfghXJ6/uGwv/xufzkhBChwYohLnVJGFW3LOlaZN
         yesGoqbzzjIcUOXySXtROFeuY/1zEnNSNfbZgBsFWzJ1XUasrcvHIF6ox1xQ4f/pM5N5
         xxxJlSF54r2U1CbE99za6RLpDwyqCPfGgXicMVRhyBlQU86R5Uj+wD/OsPF6pO11/D3e
         exB2fQrVXOQX+U0h3aUTxYx2wcFMwcWuUaWk8AgGLiR6aYs0HiuEycv2LSZVzHFCGnq2
         ge6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHZ/NY52q+fJ8ZyowbxA7ltlvG1kl7aRGse+qxxLYbY=;
        b=xk3mI65LvGu4sESlW+Ae6Yu1PhGreTTpFTFMGNWvhZwAz/7i+oVPHNBkiGoMi+4vQy
         l4RDUvLtAiXGaewAZGWoHK2z6BEMqSbHiQwroX7fUZ+yr1QDfM08RUjZ+5onoZNy90Zb
         gfgYJRXPKUDG+8VgaIz1KvKoMOBghz29XrZ2AJUQxWKAur43Z3DaKDCoNiqdJrRH5KUV
         8yYfkM6LslaKCentFfejGehUncT+jNVs6tU6lSXTuSG6SLFpsOV4clni8JUoG+lYs25j
         4QQZouMsrsjgMOjS8oi9PC2vtMBIOTK3dWlHqqovMR+IUPSUMejeI/yb+DEYC4R2SrNe
         2cag==
X-Gm-Message-State: AOAM533xYjmInSlp3/aBgBl5c240sTBdG2RzLeJVXD+51j45FmnPaDE8
        DB8972Uq2VZ4SDHyraCMQuUQKA==
X-Google-Smtp-Source: ABdhPJxILtMVzSvS1Vrd7Lgmv2DVMqTdPl18sdA4LtSUsO6snCPl5qQQFsJ/cYVbFis/6/c3Drwj6w==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr31486819wrr.252.1638654635019;
        Sat, 04 Dec 2021 13:50:35 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h2sm6328676wrz.23.2021.12.04.13.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:50:34 -0800 (PST)
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
Subject:        From a5f512cb01e48f5bfcdef800dd477c8b04a4cacf Mon Sep 17 00:00:00 2001
Date:   Sat,  4 Dec 2021 23:50:25 +0200
Message-Id: <20211204215033.5134-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Modern ARM64 Samsung Exynos SoCs (like Exynos Auto V9 and Exynos850) use
pretty much the same High-Speed I2C controller supported in i2c-exynos5
driver ("samsung,exynos7-hsi2c" variant), but with some differences:
- timings are now calculated and configured a bit differently
- two clocks are now provided to HSI2C controller (and must be
asserted during I2C operation and register access)

This patch series implements these changes, making it possible to use
HSI2C driver on modern Exynos SoCs.

Another change in mentioned SoCs is that HSI2C controller is now a part
of USIv2 IP-core. But no USI modifications are needed in HSI2C driver,
as all USI related configuration is done in USI driver independently.
USI driver is added in [1] series (or its later revision, if available).
To make HSI2C functional, both patch series (this one and [1]) have to
be applied, but those can be applied independently.

Changes in v2:
- Added new patches renaming "hsi2c@*" nodes to "i2c@*" for Exynos
dts's
- Added R-b tags from v1 review
- Fixed and improved i2c-exynos5 dt-bindings

[1] https://patchwork.kernel.org/project/linux-samsung-soc/cover/20211204195757.8600-1-semen.protsenko@linaro.org/

Jaewon Kim (2):
  dt-bindings: i2c: exynos5: Add exynosautov9-hsi2c compatible
  i2c: exynos5: Add support for ExynosAutoV9 SoC

Sam Protsenko (6):
  dt-bindings: i2c: exynos5: Convert to dtschema
  dt-bindings: i2c: exynos5: Add bus clock
  i2c: exynos5: Add bus clock support
  i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
  arm: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260
  arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and
    Exynos7

 .../devicetree/bindings/i2c/i2c-exynos5.txt   |  53 -------
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 133 ++++++++++++++++++
 arch/arm/boot/dts/exynos5260.dtsi             |   8 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  24 ++--
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |  24 ++--
 drivers/i2c/busses/Kconfig                    |   2 +-
 drivers/i2c/busses/i2c-exynos5.c              | 108 +++++++++++---
 7 files changed, 253 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml

-- 
2.30.2

