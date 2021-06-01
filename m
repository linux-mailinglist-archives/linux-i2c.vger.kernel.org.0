Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91535397699
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbhFAP1u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbhFAP1t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:27:49 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B63C061756
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 08:26:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:555:bf00:6951:b6ab])
        by andre.telenet-ops.be with bizsmtp
        id BrRp2500V35oben01rRpZZ; Tue, 01 Jun 2021 17:26:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H7-00BuxO-1b; Tue, 01 Jun 2021 17:25:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H6-000JY8-KY; Tue, 01 Jun 2021 17:25:48 +0200
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
Subject: [PATCH v2 1/4] dt-bindings: i2c: ce4100: Replace "ti,pcf8575" by "nxp,pcf8575"
Date:   Tue,  1 Jun 2021 17:25:44 +0200
Message-Id: <9b560b7f5ded90430c989a211f2aee009aefc595.1622560799.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622560799.git.geert+renesas@glider.be>
References: <cover.1622560799.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The TI part is equivalent to the NXP part, and its compatible value is
not documented in the DT bindings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt b/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt
index 569b16248514ff86..1ff6f8487a2d7bbd 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt
@@ -71,7 +71,7 @@ This is an example which is used on FalconFalls:
 			/* This I2C controller has one gpio controller */
 			gpio@26 {
 				#gpio-cells = <2>;
-				compatible = "ti,pcf8575";
+				compatible = "nxp,pcf8575";
 				reg = <0x26>;
 				gpio-controller;
 			};
@@ -85,7 +85,7 @@ This is an example which is used on FalconFalls:
 
 			gpio@26 {
 				#gpio-cells = <2>;
-				compatible = "ti,pcf8575";
+				compatible = "nxp,pcf8575";
 				reg = <0x26>;
 				gpio-controller;
 			};
-- 
2.25.1

