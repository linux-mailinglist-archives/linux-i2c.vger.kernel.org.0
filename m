Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9606C83D7
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjCXRz7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbjCXRz5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:55:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79C1194;
        Fri, 24 Mar 2023 10:55:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 46F78660312C;
        Fri, 24 Mar 2023 17:55:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680501;
        bh=hOCXvcOE1MA3NmbXb3wO5+23XLwEJusz/3mlJjscfXY=;
        h=From:To:Cc:Subject:Date:From;
        b=VcCelZrzrPMuMi4IAPf/JS1jSst8gv5jyfXGHeGomLiCesKIFIlrpIcbwURAxZlYr
         8iu4m9pA3wqxjgq/TNVqZTyVoeMQ7RKgHTqwLyyVUvuXEABEKDTxItS29tv/fnykqC
         hmNFCIs4Hni9YSB6NUMojaZiZ6GAAyXg80m5M01YsBXLokNFEfu8qrcDsvxRujBl6J
         XqMX8W+cfzCa90NcVo0WQHg0KQS8+0PzD9Gl2gIqKQSogt/2QN7VD7qPNXepnFWufI
         vxLWmLD5bIWO7zg+YwnAzimPPdI5KBGy1/RpbNrnciKEckvz9C3/5bReE1VnhWTXv5
         Ai/9q2kT9RYKg==
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
Subject: [PATCH v1 00/18] MT6795 Helio X10 and Sony Xperia M5: DT step 2!
Date:   Fri, 24 Mar 2023 18:54:38 +0100
Message-Id: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
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

AngeloGioacchino Del Regno (18):
  arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
  arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
  arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
  dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
  arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
  arm64: dts: mediatek: mt6795: Add SoC power domains
  dt-bindings: mailbox: mediatek,gce-mailbox: Add compatible for MT6795
  dt-bindings: gce: Add header for MT6795's GCE mailbox
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

