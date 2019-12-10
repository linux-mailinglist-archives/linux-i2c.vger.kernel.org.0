Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F6B118CC7
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 16:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfLJPmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 10:42:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35255 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbfLJPmS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 10:42:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so20645626wro.2
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DYGCPlFYfMEo2ftPv0Z0kGJqzS3pUpAwvlGql73I9Zo=;
        b=JnGRUlhX7iRqoMyv7JDwrWvHc2bZ1iB+KpNAHCFq0O9OVhsjih/fG50MoAkvz/PDit
         IM2Gk/ygL2VBxPBxuxWdSmiSWRF3V8hCXX2vf3KPfZkV1e/esNFP1Rs7yOSf/95Dy+67
         QaakjZbFwax/LcTA+kHx2vbCl+rW8/i6+j/07QVVbA8TXDZ6HpAa2PZkpdrINqMY1mLC
         XzvgbFqz6EsntOXM5CaWKRrDamJhBtXfVzh5PDYVk6kJyGkqLVRbrEFcNGQ5oGxFQuqy
         fN94q7TYNyysZcvEqjnibJowJMHmT4F+9/ktkez/dojR0ZX3nSAPTIKsO5Xl3T+3vIYH
         QMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DYGCPlFYfMEo2ftPv0Z0kGJqzS3pUpAwvlGql73I9Zo=;
        b=X43LI4jSI7LtaDYnsxBDtD6NTg7xtRL5REItYP6cCGYoCDVJl04zvs0dtdhTArMntX
         XTfRyV3/xB2IU1HoVmupJJtBoRxPf8DOsY7SEJAzMynGH70YSb5VUidsUsLJmI0cXNtN
         m/Bc8QmElHNBnf47pNX6GwFzHVrziXmrDxW7pjBRO8iYOqcKc59CB8kEhterIQ8nqkI8
         gHMj8wafEz4OkCihXJ3JtYCSWIDP62A+X4bQhpHDvyCv+v37VXwg+dJKtmChp5Mr5kJx
         EGOBbmCK7oVUblb4gXDQ9KicrqVGnTQ3caVHAPzQD382ItOAXlyWXRemGF1m3c7wlWmA
         FUQQ==
X-Gm-Message-State: APjAAAUK0LXwA5Tj/tmZA+pGyPEpiUCZCEcsW0c8HG5rPNlFTv10HXt1
        M95jrDlwDgxd5aCipL89nf8ICA==
X-Google-Smtp-Source: APXvYqw5F0u16O8eA21qt4EDgRqamkoRROndktfP1CGYcsyRpfJ2HD9IhxtTNmPlYsdjzWHbJAoXQg==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr3999583wrv.77.1575992536121;
        Tue, 10 Dec 2019 07:42:16 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o7sm3469085wmc.41.2019.12.10.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 07:42:15 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
Date:   Tue, 10 Dec 2019 16:41:54 +0100
Message-Id: <20191210154157.21930-2-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210154157.21930-1-ktouil@baylibre.com>
References: <20191210154157.21930-1-ktouil@baylibre.com>
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
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 1c75a059206c..ea012b2f2e77 100644
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
@@ -66,6 +74,7 @@ examples:
       qfprom: eeprom@700000 {
           #address-cells = <1>;
           #size-cells = <1>;
+          wp-gpios = <&gpio1 3 0>;
 
           /* ... */
 
-- 
2.17.1

