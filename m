Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685C04687D9
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236342AbhLDWBt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 17:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236369AbhLDWBt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 17:01:49 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A766C061354
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:58:23 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p18so5155366wmq.5
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHZ/NY52q+fJ8ZyowbxA7ltlvG1kl7aRGse+qxxLYbY=;
        b=TaNYBwZrqLHyDEpJd9tFK7v+pEKaWZ3gK/aQWMCDDiOa6FN6Mnu+hJnKy121s0MzAX
         jbUGACs1M/WfjkNBwPxlIVi8YPDfNYI2gAn/Eb2RgQQCRrZgLRMcYopKWgiKyfQ/9zBT
         0+45bnNZAEfMMDVntIok6Cb9RlSyuacIBJJWN9dDtpXoH8feVj4IZJPNVMsc2n65lTY6
         e5jr96haRHzO7POFgzMt9Bvc8gKcRV4WyEkwHJlnmG6TBKJkMDfZ2+xgpCQjzEOaQY/m
         xzEoF9kclmjQhxyGKDNVj5UQN5qCXQk9+qf9609TYCc629b3/WHGgyG2xYQUw8mGUbAz
         dmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHZ/NY52q+fJ8ZyowbxA7ltlvG1kl7aRGse+qxxLYbY=;
        b=OKX3w3MJSB61HaZS5I+rptZYS3rT6PRpX1bPOKSaXRVS8cFbBkk5Daqt7hiqjC01FY
         lJwxf1t+rvXLijo9yixa2Q5xH07+0C5NSDXjT1dgyen2wqTX7I9K55vsHRsSTxOjlyoW
         DLNuTo0w61FZR2SE5u8d/KUq95C8hiJA8B2KuxsS3xD8f033hOAm6qiTWuvFX/F9W2tM
         4ZLyhX+kDO9p3ssonK4U+LgCMxqDtDcEFWujVEVodCyMDWDRR89YY5BG1o+nQVAZd2yr
         5X5E5UDo1eTt1JKZd9V+Sgub+F9mGb9iRQd6OzySfX7RaqOeNGCaYdVOTh8TcP2lbPZk
         mCDg==
X-Gm-Message-State: AOAM531SEL31pGJhTgUTNAB5WZBdD1H6ewO5Os9eOZEdcgpQN2zYO66b
        62NDhMMuG6+ZH+1UU57mJPt18w==
X-Google-Smtp-Source: ABdhPJyBlS65eTB40gkaiVnMcqmJfn92ZRp+4jD43fZfatuxal9gpwbItlIEPVa3d0KqyoC1hPexAA==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id f15mr11572129wmq.116.1638655101461;
        Sat, 04 Dec 2021 13:58:21 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id o3sm9628522wms.10.2021.12.04.13.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:58:21 -0800 (PST)
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
Subject: [PATCH v2 RESEND 0/8] i2c: exynos5: Add support for modern Exynos SoCs
Date:   Sat,  4 Dec 2021 23:58:12 +0200
Message-Id: <20211204215820.17378-1-semen.protsenko@linaro.org>
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

