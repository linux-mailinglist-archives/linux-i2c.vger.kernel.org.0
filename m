Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157806C9E24
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbjC0Iks (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbjC0Ikd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7972E9;
        Mon, 27 Mar 2023 01:36:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D1D96601F5E;
        Mon, 27 Mar 2023 09:36:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906213;
        bh=ubB9ozQrHtmRAC/h3ra8X8vZIkv037PoS7C0Tn1POaQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Hq+VWeyIHZac38b5D8jvwU8JFH3CHhnwWviZEWONgG6Uruu8oMv1HfRHoPOpRYmSz
         i+PWmyfzx78Pv68NqDyXOZGWRoSMDui9gyPlzE0YSZOgmOxzfFMTNe7fBiKVZRFjIC
         P4KKZMkXf2pMROJHkheZoy0t3ay+OhA5lN7/UMDKo/7z54oztM8OxH3f2Z2G3jM/6U
         V7Q12gZ0cBhjpW0dg23RiEEBuVK4e7pgWvI3DrEHPtEhy4ithm3thRSAHVWynr4BYe
         v8m+fVHbRzgua6cxa2FOj8Ip0fYPvVlDaVwKXzIqtPztyllYm5cgKw5lmFXns+HQdV
         YtK4cQH34us8A==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 00/17] MT6795 Helio X10 and Sony Xperia M5: DT step 2!
Date:   Mon, 27 Mar 2023 10:36:30 +0200
Message-Id: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Changes in v2:
 - Squashed the addition of mediatek,mt6795-gce.h header with the
   commit adding the MT6795 GCE compatible.

This series further enhances the support for the MT6795 Helio X10 SoC
and the Sony Xperia M5 smartphone.

In particular, for the SoC support, this adds:
 - Frequency Hopping support
 - I2C controllers
 - Power domains
 - IOMMU support and LARBs
 - GCE/CMDQ Mailbox
 - VDECSYS and VENCSYS clocks
 - MMSYS support

...and, on the Xperia M5 smartphone, this adds:
 - Frequency Hopping with Spread Spectrum for MAINPLL, MPLL, MSDCPLL
 - Touchscreen support (Synaptics S2726, fw id: 1898977, RMI4 protocol)
 - Accelerometer
 - Magnetometer
 - Proximity sensor
 - NFC support

...all of which was successfully tested on the Xperia M5 smartphone.

This series depends on [1] for the MMSYS support.

Plan for step 3 is to push upstream full display support, which does
already work on my custom tree ;-)

[1]: https://lore.kernel.org/all/20230309102618.114157-1-angelogioacchino.delregno@collabora.com/

Cheers!

AngeloGioacchino Del Regno (17):
  arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
  arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
  arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
  dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
  arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
  arm64: dts: mediatek: mt6795: Add SoC power domains
  dt-bindings: mailbox: mediatek,gce-mailbox: Add support for MT6795
  arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
  arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
  arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
  arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
  arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
  arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
  arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
  arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer
  arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310
    Proximity
  arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |   4 +
 .../mailbox/mediatek,gce-mailbox.yaml         |  20 +-
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 166 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 245 ++++++++++++++++++
 include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 +++++++++
 5 files changed, 550 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h

-- 
2.40.0

