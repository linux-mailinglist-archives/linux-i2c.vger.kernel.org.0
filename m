Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB729397690
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhFAP1q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234364AbhFAP1n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:27:43 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08238C0613CE
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 08:26:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:555:bf00:6951:b6ab])
        by baptiste.telenet-ops.be with bizsmtp
        id BrRp2500Y35oben01rRpyZ; Tue, 01 Jun 2021 17:25:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H7-00BuxQ-5P; Tue, 01 Jun 2021 17:25:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H6-000JYM-MI; Tue, 01 Jun 2021 17:25:48 +0200
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
Subject: [PATCH v2 3/4] x86: ce4100: Replace "ti,pcf8575" by "nxp,pcf8575"
Date:   Tue,  1 Jun 2021 17:25:46 +0200
Message-Id: <5236cf71d467bec862c4fa7849705caac195b23a.1622560799.git.geert+renesas@glider.be>
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

Note that while the Linux driver DT match table does not contain the
compatible value of the TI part, it could still match to this part, as
i2c_device_id-based matching ignores the vendor part of the compatible
value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/x86/platform/ce4100/falconfalls.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/ce4100/falconfalls.dts b/arch/x86/platform/ce4100/falconfalls.dts
index 0ac3d43571361112..65fa3d866226ce97 100644
--- a/arch/x86/platform/ce4100/falconfalls.dts
+++ b/arch/x86/platform/ce4100/falconfalls.dts
@@ -249,7 +249,7 @@ i2c@1 {
 
 						gpio@26 {
 							#gpio-cells = <2>;
-							compatible = "ti,pcf8575";
+							compatible = "nxp,pcf8575";
 							reg = <0x26>;
 							gpio-controller;
 						};
@@ -263,7 +263,7 @@ i2c@2 {
 
 						gpio@26 {
 							#gpio-cells = <2>;
-							compatible = "ti,pcf8575";
+							compatible = "nxp,pcf8575";
 							reg = <0x26>;
 							gpio-controller;
 						};
-- 
2.25.1

