Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6173510624
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Apr 2022 20:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239509AbiDZSD1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Apr 2022 14:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350596AbiDZSDZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Apr 2022 14:03:25 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59EE13F6F;
        Tue, 26 Apr 2022 11:00:16 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-e9027efe6aso12882450fac.10;
        Tue, 26 Apr 2022 11:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SkneqWq9FDny4rMtUcZ44P/OejiG2SCIexlA/0LO6kM=;
        b=ZYhVtHQVq5lkLxxAp29Das27NkddJ9VXolcmurcMsHPr9eEtLpcq/CDUe0pyChBlbK
         5FfpGYJ1Rmy4NGOlBmHR5VURqn4VJrYdEX+4tLWEFjA2N6sA8JIG21D0LLRX+iWu0Zek
         T8TLi0UuCAABjR7VWC6fNKNjPIt0/aAFP4f976+ispmEJo073HfTO7ke33QnxEr01xbq
         zAIfToYRoC26QV7XMU7/IgHJlCqgFc6PLqWInB3bw6fuWUUa5sM5TFaCF5GJAN09xA2T
         Pceyncgf+RBZWQ0lIVX8PXDRZdLUReT0gnP1GnjSxLR9TWFg50xsfZQslTfZJhtJCdFl
         mNIA==
X-Gm-Message-State: AOAM531kiLg7nBv8cVHra31ebbRDOby5stWyOD8nXkOPKRA4slnP5YNI
        JjkJmS/Hyj4qiF9NP1O9ig==
X-Google-Smtp-Source: ABdhPJzlFNfKsmBnTcOItHrKkQhyv1JiJiGqQa16jK+6PcJrp7RHk9StcPftCzLIwKnUKvS04f7WaA==
X-Received: by 2002:a05:6870:b39c:b0:d1:4a9f:35f9 with SMTP id w28-20020a056870b39c00b000d14a9f35f9mr9164098oap.119.1650996016098;
        Tue, 26 Apr 2022 11:00:16 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id y23-20020a056808061700b00322e73cd18bsm5028505oih.16.2022.04.26.11.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 11:00:15 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] dt-bindings: eeprom/at24: Add samsung,s524ad0xd1 compatible
Date:   Tue, 26 Apr 2022 12:59:39 -0500
Message-Id: <20220426175938.2262966-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The samsung,s524ad0xd1 compatible is in use, but not documented. According
to arch/arm/mach-s3c/mach-smdk6410.c, the samsung,s524ad0xd1 is compatible
with the 24c128. As the schema requires a fallback compatible to the
corresponding Atmel compatible, 'atmel,24c128' is added as a fallback.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix the example in samsung,s3c2410-i2c.yaml

 Documentation/devicetree/bindings/eeprom/at24.yaml            | 4 +++-
 .../devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml          | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 6b61a8cf6137..d14e0accbda8 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -120,7 +120,9 @@ properties:
           - const: giantec,gt24c32a
           - const: atmel,24c32
       - items:
-          - const: renesas,r1ex24128
+          - enum:
+              - renesas,r1ex24128
+              - samsung,s524ad0xd1
           - const: atmel,24c128
 
   label:
diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index c26230518957..3d5782deb97d 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -123,7 +123,7 @@ examples:
         samsung,i2c-slave-addr = <0x66>;
 
         eeprom@50 {
-            compatible = "samsung,s524ad0xd1";
+            compatible = "samsung,s524ad0xd1", "atmel,24c128";
             reg = <0x50>;
         };
     };
-- 
2.34.1

