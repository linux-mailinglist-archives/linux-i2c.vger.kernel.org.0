Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E3B30CD6B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 21:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbhBBU4f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 15:56:35 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:38683 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbhBBU4c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 15:56:32 -0500
Received: by mail-ot1-f44.google.com with SMTP id t25so11135328otc.5;
        Tue, 02 Feb 2021 12:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/rEofJPqnkLlE8GJQFmVM1qahKIfCsQMC9dA4r5GHw=;
        b=Hp/M1WBJ6vNDx8V0gZq9eXVWg4ftMyJDcTB6JO23c8OTY9X9qNDY6CTdkRhkI+lvPl
         FEwS7dWqZg1mir+rtTOxBxTiql0729Rpzk1XybjNQRupV/FYhVvfIlWpz2pcM/6JPbGw
         g/mb2ROzfwngWahBuS+fdMFyj8AZsK7IVCt3wSC/q5wlVB1YRIIBgyl+PwlLPeCjNwIJ
         4ae6ZQRWQeT0/ZUmHK0m7nUQynA3mGNG1F6sx6/M0erJrNyRwZil5+OTrCSbdsv9x9zQ
         RRXbV3yuSruYfiKD4o96tkzZ+4d54U15FIzCSAUzBeYB0Fuxs6UA/18W8Tt+kTkyB3Up
         iDdQ==
X-Gm-Message-State: AOAM530z9LA3XxWruD8TACNWL4gXDISQS/BXUQAXz53RnxIzjNgTGv7Z
        TWVl8endEXdvUN6s/CIHA5R127KA5w==
X-Google-Smtp-Source: ABdhPJyTfcE7Idlr0T2ZxzdhnhsjVGP931mbpfLbWa9WxA2Y7K5KDop7bsHZiJVP+WqqddEvlnnecQ==
X-Received: by 2002:a9d:6643:: with SMTP id q3mr11847740otm.63.1612299350248;
        Tue, 02 Feb 2021 12:55:50 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id k15sm4206otp.10.2021.02.02.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 12:55:49 -0800 (PST)
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
        iommu@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: iommu: renesas,ipmmu-vmsa: Make 'power-domains' conditionally required
Date:   Tue,  2 Feb 2021 14:55:43 -0600
Message-Id: <20210202205544.24812-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
References: <20210202205544.24812-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixing the compatible string typos results in an error in the example:

Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.example.dt.yaml:
  iommu@fe951000: 'power-domains' is a required property

Based on the dts files, a 'power-domains' property only exists on Gen 3
which can be conditioned on !renesas,ipmmu-vmsa.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/iommu/renesas,ipmmu-vmsa.yaml           | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index 349633108bbd..dda44976acc1 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -76,7 +76,6 @@ required:
   - compatible
   - reg
   - '#iommu-cells'
-  - power-domains
 
 oneOf:
   - required:
@@ -86,6 +85,17 @@ oneOf:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: renesas,ipmmu-vmsa
+    then:
+      required:
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
-- 
2.27.0

