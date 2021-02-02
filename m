Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD8D30CD73
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 21:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbhBBU4p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 15:56:45 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:43504 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbhBBU4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 15:56:35 -0500
Received: by mail-oi1-f174.google.com with SMTP id d20so8522257oiw.10;
        Tue, 02 Feb 2021 12:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6WKE/3EQ/xJ6AJH5xmJE9YBaYDJN1xjVTBGt+kvQ65Y=;
        b=TirDo8SCmisn1W/UErBbzPEcNL9EIsBI0Hpki5C3reAXYhoSyMvLH9cxTottf6sVxK
         xf/Jtyc9BJmX5T656HZ6pbppu0F7+Cl682xD1LEhWhOyi9yZ0DUoRwJ96KHcw8CCG2tC
         z2IoZZZvvU8DC/4XUKBbC5SA/yxyTbLTpApTQE2AlkFPI4DM6b+dEkZBT+RTzYZRsPCR
         UZk4i5iInD9oE06ZG8JyG8t++oZ/fr4ar46h3ZtGsortA3UNrRcdaL8unGU2FDBqKEG/
         gn95tEvaLm8gG8JiayyY5UYcHIqWZM/VwtPZVOdSpSxVXxXuCuRkoK0pPPsmO+78Mb0N
         /vGg==
X-Gm-Message-State: AOAM531v5X1td8BoFObr3WdUUyVxfBZJ8i14wlmi8ivhfbfEVjD8sS2l
        DD/Nk7DiI16rGCbsdeeq8vxsvi6uBg==
X-Google-Smtp-Source: ABdhPJypjDN+Ts39JWA5K5FwFDZxnlgjEBltLJwzpuZeV8Gkh6PNkOJl8PkeKNKnT1CjwRFOWOyTZg==
X-Received: by 2002:aca:dc07:: with SMTP id t7mr4037098oig.15.1612299353146;
        Tue, 02 Feb 2021 12:55:53 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id k15sm4206otp.10.2021.02.02.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 12:55:52 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-watchdog@vger.kernel.org,
        Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
Date:   Tue,  2 Feb 2021 14:55:44 -0600
Message-Id: <20210202205544.24812-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
References: <20210202205544.24812-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Properties in if/then schemas weren't getting checked by the meta-schemas.
Enabling meta-schema checks finds several errors.

The use of an 'items' schema (as opposed to the list form) is wrong in
some cases as it applies to all entries. 'contains' is the correct schema
to use in the case of multiple entries.

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-crypto@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-leds@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/crypto/allwinner,sun8i-ce.yaml   | 3 +--
 .../devicetree/bindings/display/brcm,bcm2835-hvs.yaml    | 2 +-
 Documentation/devicetree/bindings/leds/ti,tca6507.yaml   | 1 +
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml  | 2 +-
 Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml | 3 +--
 .../devicetree/bindings/phy/renesas,usb2-phy.yaml        | 5 ++---
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml         | 9 ++++-----
 .../bindings/timer/allwinner,sun5i-a13-hstimer.yaml      | 3 +--
 8 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
index 7a60d84289cc..6ab07eba7778 100644
--- a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
@@ -46,8 +46,7 @@ properties:
 if:
   properties:
     compatible:
-      items:
-        const: allwinner,sun50i-h6-crypto
+      const: allwinner,sun50i-h6-crypto
 then:
   properties:
     clocks:
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index e826ab0adb75..2e8566f47e63 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -36,7 +36,7 @@ if:
   properties:
     compatible:
       contains:
-        const: brcm,bcm2711-hvs"
+        const: brcm,bcm2711-hvs
 
 then:
   required:
diff --git a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
index 94c307c98762..32c600387895 100644
--- a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
+++ b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
@@ -69,6 +69,7 @@ patternProperties:
 if:
   patternProperties:
     "^gpio@[0-6]$":
+      type: object
       properties:
         compatible:
           contains:
diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 6bbf29b5c239..6c13703b31db 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -123,7 +123,7 @@ required:
 if:
   properties:
     compatible:
-      items:
+      contains:
         enum:
           - renesas,sdhi-r7s72100
           - renesas,sdhi-r7s9210
diff --git a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
index 58c3ef8004ad..04edda504ab6 100644
--- a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
@@ -99,8 +99,7 @@ patternProperties:
 if:
   properties:
     compatible:
-      items:
-        const: brcm,iproc-ns2-sata-phy
+      const: brcm,iproc-ns2-sata-phy
 then:
   properties:
     reg:
diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 829e8c7e467a..0f358d5b84ef 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -81,9 +81,8 @@ properties:
 if:
   properties:
     compatible:
-      items:
-        enum:
-          - renesas,usb2-phy-r7s9210
+      contains:
+        const: renesas,usb2-phy-r7s9210
 then:
   required:
     - clock-names
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 5b5b1b9d2ec7..5d3947902f2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -76,11 +76,10 @@ required:
 if:
   properties:
     compatible:
-      items:
-        enum:
-          - renesas,pfc-r8a73a4
-          - renesas,pfc-r8a7740
-          - renesas,pfc-sh73a0
+      enum:
+        - renesas,pfc-r8a73a4
+        - renesas,pfc-r8a7740
+        - renesas,pfc-sh73a0
 then:
   required:
     - interrupts-extended
diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
index 40fc4bcb3145..b6a6d03a08b2 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
@@ -46,8 +46,7 @@ required:
 if:
   properties:
     compatible:
-      items:
-        const: allwinner,sun5i-a13-hstimer
+      const: allwinner,sun5i-a13-hstimer
 
 then:
   properties:
-- 
2.27.0

