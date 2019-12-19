Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3423126142
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 12:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfLSLwT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 06:52:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36060 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbfLSLwA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 06:52:00 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so5326709wma.1
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 03:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tY1YFADtaZKXzMf5Ie7W6ruxIu2Bb0htwIWWuGbAKcM=;
        b=g9BqwR2T1/I9UWMAVp/ZqXBkfesKLtxfql62Ats6JCmHyrgeqIcvyF5bBUnfb71mMy
         QP4vUYVPzSIO7PPHg0+ASpHinxdROHkqmPkLRKUTO2aiJ8QMyzo+Mzww2couC1OVe+qS
         2j1PYVjLW27+L5u+IgU4B0z+DmkQdgGptoWBtL64wPFWXJAkiyS7r3M771dmzoXDnJOp
         nc/vWUYzH04qcXn3ayS4jzZLRTt5SrbfmBEA3WTISAO29jIaM1ccONkGGpiy9LQ2PzBp
         7av5v7DTa3eZt2rCQOMMIWGeEqUb4ydb4BqCeAqWFQXQYku29EQGVtKvY95Xt4zqqB1X
         YJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tY1YFADtaZKXzMf5Ie7W6ruxIu2Bb0htwIWWuGbAKcM=;
        b=MFDVXqyPxoR5XkEnuddRp6mA1JkLdpNcJgrhxhtOTBP9CVOXaxLrKCSr1gybM7PXq/
         3nqWytDhmB6DvQc39GWdrtmHsoRDFJXubd6631ZDLkDz9LVyMfWVA4ezWv/F4XHgPEfV
         2RSz9YxhtWHf+QJ/UFFm+etEquCFFpJFwTSkGryECaVCF/wyFLEfQA30RQY/Wni2oyWJ
         +TqgLHyfTv0Tz+KqFxSwt3TTCXUOWvrqnWGWcNIC/1By9Zt+d8gQbhgGGgKZEgXqMXqo
         aFGePcU/n2ATnwhK5kXaJ8orxWqM8YT1mDnkZoScX+9GB37KF1LOA5IdC6OUOtJoNvAC
         ioUw==
X-Gm-Message-State: APjAAAWly2ykX+UYnXk8z46/5MwIgnRffmHpeLqbK4m1+m48PnPRPl0F
        WUceiMm2zzEgySyweKQrFBX5Cw==
X-Google-Smtp-Source: APXvYqzlwjvltFbDap8RdkQ64BKs2O//iQJUD+y6qLqzurI6gy3wxklpvAm+GERYUdoyUdGko4ntpA==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr9872505wml.71.1576756318833;
        Thu, 19 Dec 2019 03:51:58 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id k16sm6489660wru.0.2019.12.19.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 03:51:58 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v3 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
Date:   Thu, 19 Dec 2019 12:51:38 +0100
Message-Id: <20191219115141.24653-2-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219115141.24653-1-ktouil@baylibre.com>
References: <20191219115141.24653-1-ktouil@baylibre.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Several memories have a write-protect pin, that when pulled high, it
blocks the write operation.

On some boards, this pin is connected to a GPIO and pulled high by
default, which forces the user to manually change its state before
writing.

Instead of modifying all the memory drivers to check this pin, make
the NVMEM subsystem check if the write-protect GPIO being passed
through the nvmem_config or defined in the device tree and pull it
low whenever writing to the memory.

Add a new optional property to the device tree binding document, which
allows to specify the GPIO line to which the write-protect pin is
connected.

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 1c75a059206c..b43c6c65294e 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -34,6 +34,14 @@ properties:
     description:
       Mark the provider as read only.
 
+  wp-gpios:
+    description:
+      GPIO to which the write-protect pin of the chip is connected.
+      The write-protect GPIO is asserted, when it's driven high
+      (logical '1') to block the write operation. It's deasserted,
+      when it's driven low (logical '0') to allow writing.
+    maxItems: 1
+
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
@@ -63,9 +71,12 @@ patternProperties:
 
 examples:
   - |
+      #include <dt-bindings/gpio/gpio.h>
+
       qfprom: eeprom@700000 {
           #address-cells = <1>;
           #size-cells = <1>;
+          wp-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
 
           /* ... */
 
-- 
2.17.1

