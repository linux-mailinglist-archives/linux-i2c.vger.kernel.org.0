Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB27551706A
	for <lists+linux-i2c@lfdr.de>; Mon,  2 May 2022 15:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbiEBNjB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 May 2022 09:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385366AbiEBNiw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 May 2022 09:38:52 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA7F7644
        for <linux-i2c@vger.kernel.org>; Mon,  2 May 2022 06:35:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:194e:5782:c420:7f87])
        by albert.telenet-ops.be with bizsmtp
        id Rpb52700A28fWK506pb5V9; Mon, 02 May 2022 15:35:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlWCe-002mrd-PI; Mon, 02 May 2022 15:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlWCd-002vA0-Ss; Mon, 02 May 2022 15:35:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] dt-bindings: renesas: R-Car V3U is R-Car Gen4
Date:   Mon,  2 May 2022 15:34:52 +0200
Message-Id: <cover.1651497024.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

Despite the name, R-Car V3U is the first member of the R-Car Gen4
family[1].

Hence this patch series updates various DT binding documents to move
compatible values for R-Car V3U devices to R-Car Gen4 sections, in
bindings where the latter already exist.  Other DT binding documents
will be updated progressively, after adding support for more SoCs in the
R-Car Gen4 family.

These patches are intended to be taken by DT or subsystem maintainers.
Separate patches to update the DTS file[2] and SoC identication code[3]
are in-flight.

Thanks for your comments!

[1] https://www.renesas.com/eu/en/products/automotive-products/automotive-system-chips-socs/r-car-v3u-best-class-r-car-v3u-asil-d-system-chip-automated-driving
[2] [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
    https://lore.kernel.org/73cea9d5e1a6639422c67e4df4285042e31c9fd5.1651497071.git.geert+renesas@glider.be
[3] [PATCH] soc: renesas: R-Car V3U is R-Car Gen4
    https://lore.kernel.org/2bbecad7b6c24c0d5c1797b3f7f0733d5ba33842.1651497066.git.geert+renesas@glider.be

Geert Uytterhoeven (7):
  dt-bindings: gpio: renesas,rcar-gpio: R-Car V3U is R-Car Gen4
  dt-bindings: i2c: renesas,rcar-i2c: R-Car V3U is R-Car Gen4
  dt-bindings: iommu: renesas,ipmmu-vmsa: R-Car V3U is R-Car Gen4
  dt-bindings: renesas,rcar-dmac: R-Car V3U is R-Car Gen4
  dt-bindings: serial: renesas,hscif: R-Car V3U is R-Car Gen4
  dt-bindings: serial: renesas,scif: R-Car V3U is R-Car Gen4
  dt-bindings: watchdog: renesas,wdt: R-Car V3U is R-Car Gen4

 .../devicetree/bindings/dma/renesas,rcar-dmac.yaml     | 10 ++++------
 .../devicetree/bindings/gpio/renesas,rcar-gpio.yaml    |  4 +---
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml      |  2 +-
 .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml  |  4 ++--
 .../devicetree/bindings/serial/renesas,hscif.yaml      |  2 +-
 .../devicetree/bindings/serial/renesas,scif.yaml       |  2 +-
 .../devicetree/bindings/watchdog/renesas,wdt.yaml      |  2 +-
 7 files changed, 11 insertions(+), 15 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
