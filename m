Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3245E397689
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbhFAP1n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233924AbhFAP1m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:27:42 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5800CC06174A
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 08:26:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:555:bf00:6951:b6ab])
        by xavier.telenet-ops.be with bizsmtp
        id BrRp2500y35oben01rRpnN; Tue, 01 Jun 2021 17:25:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H7-00BuxN-8c; Tue, 01 Jun 2021 17:25:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H6-000JY2-JO; Tue, 01 Jun 2021 17:25:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] pcf857x: DTS fixes and DT binding to json-schema conversion
Date:   Tue,  1 Jun 2021 17:25:43 +0200
Message-Id: <cover.1622560799.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

This patch series converts the PCF857x-compatible I/O expanders Device
Tree binding documentation to json-schema, after fixing a few issues in
DT binding examples and DTS files.

Changes compared to v1[1]:
  - Drop applied fixes,
  - Drop "ti,pcf8575" from examples and DTS files,
  - Drop support for "ti,pcf8575", as it's 100% compatible with
    "nxp,pcf8575",
  - Drop "hog-[0-9]+" from hog names,
  - Rely on dt-schema/schemas/gpio/gpio-hog.yaml for hog properties.

Thanks!

[1] [PATCH 0/3] pcf857x: DTS fixes and DT binding to json-schema conversion
    https://lore.kernel.org/r/cover.1621583562.git.geert+renesas@glider.be/

Geert Uytterhoeven (4):
  dt-bindings: i2c: ce4100: Replace "ti,pcf8575" by "nxp,pcf8575"
  ARM: dts: dra7x-evm: Drop "ti,pcf8575"
  x86: ce4100: Replace "ti,pcf8575" by "nxp,pcf8575"
  dt-bindings: gpio: pcf857x: Convert to json-schema

 .../devicetree/bindings/gpio/gpio-pcf857x.txt |  69 ------------
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 103 ++++++++++++++++++
 .../bindings/i2c/i2c-pxa-pci-ce4100.txt       |   4 +-
 arch/arm/boot/dts/dra7-evm.dts                |   6 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi       |   4 +-
 arch/arm/boot/dts/dra76-evm.dts               |   6 +-
 arch/x86/platform/ce4100/falconfalls.dts      |   4 +-
 7 files changed, 115 insertions(+), 81 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
