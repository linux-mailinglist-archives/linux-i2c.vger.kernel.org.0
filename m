Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7A443F916
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 10:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232512AbhJ2IpF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 04:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbhJ2IpF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Oct 2021 04:45:05 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B940C061570;
        Fri, 29 Oct 2021 01:42:37 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t11so6360845plq.11;
        Fri, 29 Oct 2021 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=YUKn1ogiGUUPet0SlrPCeqQwsaI/lAIcv7mQESFrswU=;
        b=KHZ9tSM/6FrUtHundLMRPoZNDRF99RaPChTPxWrs5AGwoSpbs3BRtKLtbFHWIjNmk4
         uYcaEB5ZjYVAr6OQ2+MK5ciwwxsg96V/EAHI3pv1uynQGriCFH6xlQumpD8dZY+c0Moh
         gGquU4YytcQa7mvXD0uz1u76doWKGv+Nnh1kff3SxjScfwae6jZY6dH3g/PXoQK/KAmO
         87HtcjDFRMWZ41SYpLHR99nT/WxUVWmvlSzIWJwydtD1LtYBUaP+rcIoqToQTGq1B4ZY
         TCrhad0OZ4IXsw7eo6L5a+Q9j4yGqGbucq9RQY3lc362wMUbPQvmpIfMVICJyTDgudkY
         64iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YUKn1ogiGUUPet0SlrPCeqQwsaI/lAIcv7mQESFrswU=;
        b=Jk+oUFqmpuoKpAaG1BVtu5duRhf9wC+sdBiVDaXORULFxje2Cy+PNF0bmwS4PPLzk3
         0D2YkZ+ZYIHowyvB4U9ykmk6WIM/pvqS0jzh+RseyiTGz5ojsrWc9RM/fOlaowTJqhMx
         LECmQ6Mgyb7yS0xF/G9vWH/WWeAmMcPlIwJ2B/Ngh3LqjTEO3abDlFp3Ub4tuwl//h8y
         fKyZ6zvEeEhoXjNm4zI0lvNflDUMoYvqLu7wwV+T456kIBoYzgV1gJTU7dg4CxLbw78q
         XPkynJIIRuoZ9fzX2kuINL9CHnF41fpJlu+7cwrMHJoHUDHihJzEVRMP7ctEuIsg9enW
         PyRQ==
X-Gm-Message-State: AOAM531tIo2P/WAbOEDHXryk2wL6Ru1s6cAe/rQYj3NUZoxgoxcMXeLn
        1sTjKr1d1PnJfrD3Gi7TrHI=
X-Google-Smtp-Source: ABdhPJxQfheZOYpdw+3YgK1VyTxx93SUIR990hRVvPoZbma6XjXu7NBQbV1xOv/YHyjjRg7zOm9WWQ==
X-Received: by 2002:a17:90a:4801:: with SMTP id a1mr18298354pjh.156.1635496956380;
        Fri, 29 Oct 2021 01:42:36 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id ml14sm1471424pjb.43.2021.10.29.01.42.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:42:36 -0700 (PDT)
From:   "LH.Kuo" <lhjeff911@gmail.com>
X-Google-Original-From: "LH.Kuo" <lh.kuo@sunplus.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dvorkin@tibbo.com, qinjian@cqplus1.com, wells.lu@sunplus.com,
        "LH.Kuo" <lh.kuo@sunplus.com>
Subject: [PATCH 0/2] This is a patch series for I2C driver for Sunplus SP7021 SoC.
Date:   Fri, 29 Oct 2021 16:42:33 +0800
Message-Id: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates
many peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and
etc.) into a single chip. It is designed for industrial control.

Refer to:
https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
https://tibbo.com/store/plus1.html

LH.Kuo (2):
  I2C: Add I2C driver for Sunplus SP7021
  devicetree bindings I2C Add bindings doc for Sunplus SP7021

 .../devicetree/bindings/i2c/i2c-sunplus.yaml       |   82 +
 MAINTAINERS                                        |   39 +-
 drivers/i2c/busses/Kconfig                         |   10 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-sunplus.c                   | 1936 ++++++++++++++++++++
 5 files changed, 2052 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 create mode 100644 drivers/i2c/busses/i2c-sunplus.c

-- 
2.7.4

