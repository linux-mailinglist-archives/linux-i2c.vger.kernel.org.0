Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27552B9EBC
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Nov 2020 00:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgKSX4R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Nov 2020 18:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgKSX4R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Nov 2020 18:56:17 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1290C0613CF;
        Thu, 19 Nov 2020 15:56:16 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cf17so4134871edb.2;
        Thu, 19 Nov 2020 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pmDTWYXXAk9rfP2LbwV/8yIbCru45LKAEEkD+ofPX5E=;
        b=EkbjJ9GokRz5usrPgW17OoisIs6dAWdNKJZU5o8gn2o0QHRgN7SskQcx4OjgOyUgFe
         N4xiiLedBp0lL/rV9DNnSsDq6VWKCLfJqtFDt0Qqi+m2VHj5FX2B9NY2yBIHyvw9DsVn
         jn5euztmRelV9WdCk767SGmEAUrV+5apj3e2MqDXrnlYPsuOKZ3DTkc8aPfim4LvwOfn
         gEa+o6wCabkMUn2yqVD7jlPiSTxMZzbVNR4qb0C8LuyYjILzcL1Cb2EwVu2MPT0AwnD+
         X3XcafbDdjIm135ofjkju8iU6y3i+NZQEZmtd9UVtrd2v7G8LpUSg31n9I6I9jaRA1sf
         W11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pmDTWYXXAk9rfP2LbwV/8yIbCru45LKAEEkD+ofPX5E=;
        b=IbpSYZKkgrs2zUq+lVkh567mbBHA/GAZ/Zq+RCZf3D7t9KjvlVTSomFAVXlDkU1VSA
         le6842MjpA31rcfM4shiJ8NCrqOsfyvxMe6Xz2YzSr3IkllZmhcEWqQeLahLlix3JdJm
         r2QVNZZyPd0eNxXKUNtrf8kIXEV/tmfgeJJhk68p/YbWPxeW25v+0WEVql9nnakcj1z2
         q9BarM9+Li5dRaYCnVrUYH9LMMG4RsspAO/cZjiFBOQ86XIOg7Ew6DrRJdHodWhiGLJc
         nmGapE3Y18U+7961BHiTiT5BCG5qEHKVtXj6T+s8YyURp589orCReAH8d5x3mKBtKRDN
         o4cg==
X-Gm-Message-State: AOAM5333zQjHJKWuOF8KIbIurdUi489QounVWvSaMGD8eryC8993dzFg
        YurfuqEt0/n26Wr52PNRHTg=
X-Google-Smtp-Source: ABdhPJxDHcZc79WpJHYk5EfMzTr4tT47zWZU5ploN70wNJfVhLr8bg0dD5Saqhv+hjpxXO2JqaiyHw==
X-Received: by 2002:a05:6402:b8b:: with SMTP id cf11mr33095904edb.74.1605830175070;
        Thu, 19 Nov 2020 15:56:15 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i3sm452987ejh.80.2020.11.19.15.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:56:14 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH v2 00/18] Add CMU/RMU/DMA/MMC/I2C support for Actions Semi S500 SoCs
Date:   Fri, 20 Nov 2020 01:55:54 +0200
Message-Id: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This patchset brings a series of improvements for the Actions Semi S500
SoCs family, by adding support for Clock & Reset Management Units, DMA,
MMC, I2C & SIRQ controllers.

Please note the patches consist mostly of DTS and bindings/compatibles
changes, since all the work they depend on has been already merged,
i.e. clock fixes/additions, pinctrl driver, sirq driver.

For the moment, I have only enabled the features I could test on
RoseapplePi SBC.

Thanks,
Cristi

Changes in v2:
- Added new bindings/compatibles for S500 DMA, MMC & I2C controllers
- Added support for the SIRQ controller
- Added new entries in MAINTAINERS
- Updated naming of some patches in v1

Cristian Ciocaltea (18):
  arm: dts: owl-s500: Add Clock Management Unit
  arm: dts: owl-s500: Set CMU clocks for UARTs
  arm: dts: owl-s500: Add Reset controller
  dt-bindings: dma: owl: Add compatible string for Actions Semi S500 SoC
  dmaengine: owl: Add compatible for the Actions Semi S500 DMA
    controller
  arm: dts: owl-s500: Add DMA controller
  arm: dts: owl-s500: Add pinctrl & GPIO support
  dt-bindings: mmc: owl: Add compatible string for Actions Semi S500 SoC
  arm: dts: owl-s500: Add MMC support
  dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a schema
  MAINTAINERS: Update entry for Actions Semi Owl I2C binding
  i2c: owl: Add compatible for the Actions Semi S500 I2C controller
  arm: dts: owl-s500: Add I2C support
  arm: dts: owl-s500: Add SIRQ controller
  arm: dts: owl-s500-roseapplepi: Use UART clock from CMU
  arm: dts: owl-s500-roseapplepi: Add uSD support
  arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration
  MAINTAINERS: Add linux-actions ML for Actions Semi Arch

 .../devicetree/bindings/dma/owl-dma.yaml      |   5 +-
 .../devicetree/bindings/i2c/i2c-owl.txt       |  29 ----
 .../devicetree/bindings/i2c/i2c-owl.yaml      |  62 ++++++++
 .../devicetree/bindings/mmc/owl-mmc.yaml      |   4 +-
 MAINTAINERS                                   |   3 +-
 arch/arm/boot/dts/owl-s500-roseapplepi.dts    |  97 +++++++++++-
 arch/arm/boot/dts/owl-s500.dtsi               | 140 ++++++++++++++++++
 drivers/dma/owl-dma.c                         |   1 +
 drivers/i2c/busses/i2c-owl.c                  |   1 +
 9 files changed, 304 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.yaml

-- 
2.29.2

