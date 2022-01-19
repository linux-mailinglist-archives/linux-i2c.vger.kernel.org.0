Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0E8493290
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 02:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350311AbiASBxD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 20:53:03 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:39839 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346039AbiASBxC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 20:53:02 -0500
Received: by mail-oi1-f180.google.com with SMTP id e81so1786970oia.6;
        Tue, 18 Jan 2022 17:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBx2/hOLa0TpamwOX/KePgd9G0kSxXsL1SCGAEjqAKs=;
        b=MEV5/MSKtU1XNHEwMfFbaK0C1DgiwKc/xt3QzmA6fyepakFKbSinS1iZ/vH9YDJfcu
         cdJUDqbTyhmBHN/5cixhkJQYmrrsHuL/8PPM+FHq5jYujg6hvHfKAmrRkLHcZw/McNXh
         nn2cXeIV9tAPcNwMfltjrACYsCjiyD2TOYrSdsvwi3UBxAU7luWUaGg21tAHqO3cQ6Ke
         t3aMCO3FH5C1rfPtWyzkwmHJRvnFG1xH+FzrcJiu7Rp/KcFJrUwr5AfWAXF3njS2A1Ka
         iMYu1yCQ5tqGZI+FGXSEHcSZ4KdpPGlvoIuz+6oAi1PeL1Zw5ox1SV+RJLZ2rR+pDJe+
         iU9A==
X-Gm-Message-State: AOAM5313iNZLD+zugkOJKf0XVCLI9wN4UEqTemTCB8zi/lFFDPSfR0z9
        0uKiHjJ5wTirvzId+FF8uw==
X-Google-Smtp-Source: ABdhPJw5Kk+Aea7EBsfhNZT1i/XyZCdzhr8UixQ+0QzTi+XrZLb3uHhoffLAsnMAb1AfyYOKVZzjXA==
X-Received: by 2002:aca:d704:: with SMTP id o4mr1140753oig.99.1642557182186;
        Tue, 18 Jan 2022 17:53:02 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id l8sm3438274oot.19.2022.01.18.17.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 17:53:01 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: imx: Make each example a separate entry
Date:   Tue, 18 Jan 2022 19:52:53 -0600
Message-Id: <20220119015253.2437352-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Each independent example should be a separate entry. This allows for
'interrupts' to have different cell sizes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index c167958ae2a9..01720e338b4c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -88,9 +88,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/imx5-clock.h>
-    #include <dt-bindings/clock/vf610-clock.h>
-    #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c@83fc4000 {
         compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
@@ -99,6 +97,9 @@ examples:
         clocks = <&clks IMX5_CLK_I2C2_GATE>;
     };
 
+  - |
+    #include <dt-bindings/clock/vf610-clock.h>
+
     i2c@40066000 {
         compatible = "fsl,vf610-i2c";
         reg = <0x40066000 0x1000>;
-- 
2.32.0

