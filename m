Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E181D2E7426
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Dec 2020 22:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgL2VSN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Dec 2020 16:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgL2VSM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Dec 2020 16:18:12 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498CEC061574;
        Tue, 29 Dec 2020 13:17:32 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b2so13761513edm.3;
        Tue, 29 Dec 2020 13:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FZ/H9WSOhHVwLs+QGJ7fpSAvZcye4tGBUW7rT83ZTqs=;
        b=sAEohDXxCNdSD5xC6VTxLT/TaeDso+7HGrFm10sPmuXrBrtpqB8NCseIrdcgUtHM+l
         SlfmHpW31fxTG4qdN+h1KQGsT1CiqY7zK96LgWVMVI0u4kb89jXqnoNX0dblI7i3bkBp
         /KMsL6mIyDWUfTALgHftqkJ8EngKKUgFOenfDD8VQSd8dLYw7kiypJHwHWoz5gBgO27f
         IWp2GhK2b8RwhiEse0Ot1r3XCMbBV5RyPs89at3RgmxHSn6ThjFNNkztj+CibMEiCg7h
         ROoFVyM724u37xcOV+a+smAffQcM46AyF/YkFibmpqkT9GTwWcOkTXcZhDmWjMUp2NBB
         30sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FZ/H9WSOhHVwLs+QGJ7fpSAvZcye4tGBUW7rT83ZTqs=;
        b=eYC4icw9ZS1OlfBzrFUp8BoJvxS4Mp7UhSFnA+5cGMCVlgsabfUMsMW4mf4pc6VKFl
         H5iR/itALErfQeHr5XuhG5wXkLnmEBmwavArkA2H9wU/vWRlbMjORNqgS641eJGa7t+o
         tEtStmSVe+0CNHr/L+Zcgxta7iULFCER3RMmCTHOfQIhIAzVMvIhJYNormht/Y6uQGFE
         55flqvQtwLzV2ahxA30uOr3lEeZ09jdA6+eHFdF8OZZ7EqNmHHPzHHtM9d8aLlc602Go
         OCO0KP2q83tmjyOSg2mqK0srwb0CUW3zIwhIn58Te+flhY9jrjEipUDJxX90H57mXgf5
         gTjg==
X-Gm-Message-State: AOAM5330i8L99N74lk8aRfog8bshg2gjLfHkLdRZY7Ah1kzkNI578jnD
        xosUBMDXvA6JDEtnid9vtpk=
X-Google-Smtp-Source: ABdhPJzKxhTpgS/AV3nUiTk7WK0f95zDG2XoswIhZbVPontZj9HQK6yA6qageu0/vszLTMrGHH15ow==
X-Received: by 2002:aa7:ca03:: with SMTP id y3mr48618048eds.87.1609276651068;
        Tue, 29 Dec 2020 13:17:31 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id u9sm37354553edd.54.2020.12.29.13.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 13:17:30 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH v3 00/13] Add CMU/RMU/DMA/MMC/I2C support for Actions Semi
Date:   Tue, 29 Dec 2020 23:17:15 +0200
Message-Id: <cover.1609263738.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.30.0
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

Changes in v3:
- Squashed 'arm: dts: owl-s500-roseapplepi: Use UART clock from CMU' with
  'arm: dts: owl-s500: Set CMU clocks for UARTs', according to Mani's review
- Rebased series on v5.11-rc1 and dropped the already merged patches:
 * dt-bindings: mmc: owl: Add compatible string for Actions Semi S500 SoC
 * dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a schema
 * MAINTAINERS: Update entry for Actions Semi Owl I2C binding
 * i2c: owl: Add compatible for the Actions Semi S500 I2C controller

Changes in v2:
- Added new bindings/compatibles for S500 DMA, MMC & I2C controllers
- Added support for the SIRQ controller
- Added new entries in MAINTAINERS
- Updated naming of some patches in v1

Cristian Ciocaltea (13):
  arm: dts: owl-s500: Add Clock Management Unit
  arm: dts: owl-s500: Set CMU clocks for UARTs
  arm: dts: owl-s500: Add Reset controller
  dt-bindings: dma: owl: Add compatible string for Actions Semi S500 SoC
  dmaengine: owl: Add compatible for the Actions Semi S500 DMA
    controller
  arm: dts: owl-s500: Add DMA controller
  arm: dts: owl-s500: Add pinctrl & GPIO support
  arm: dts: owl-s500: Add MMC support
  arm: dts: owl-s500: Add I2C support
  arm: dts: owl-s500: Add SIRQ controller
  arm: dts: owl-s500-roseapplepi: Add uSD support
  arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration
  MAINTAINERS: Add linux-actions ML for Actions Semi Arch

 .../devicetree/bindings/dma/owl-dma.yaml      |   7 +-
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/owl-s500-cubieboard6.dts    |   7 -
 .../arm/boot/dts/owl-s500-guitar-bb-rev-b.dts |   7 -
 .../arm/boot/dts/owl-s500-labrador-base-m.dts |   7 -
 arch/arm/boot/dts/owl-s500-roseapplepi.dts    |  97 +++++++++++-
 arch/arm/boot/dts/owl-s500-sparky.dts         |   7 -
 arch/arm/boot/dts/owl-s500.dtsi               | 140 ++++++++++++++++++
 drivers/dma/owl-dma.c                         |   3 +-
 9 files changed, 239 insertions(+), 37 deletions(-)

-- 
2.30.0

