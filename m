Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71BB50C0E2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Apr 2022 23:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiDVVFm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Apr 2022 17:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiDVVFm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Apr 2022 17:05:42 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A23134FEDD;
        Fri, 22 Apr 2022 13:00:55 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-e9027efe6aso2408225fac.10;
        Fri, 22 Apr 2022 13:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FR8aJOPIeHvshKuc9ODiumRNCDqF45G5wAtHKeVcQHA=;
        b=QZFbyAyAvFTggEvqbM0116Vi8/qdnScktU4iDHiobDR+6E5+7Fw8E2XTDJGrfdHq3m
         YlE2Bm6Ozixxka7OptCwZRESA+Alhb82UR7AI2W/jDCuzrvwtwUD4pP1nEcsZS8gouer
         Ob6DZq4zKmAkMX3RF0XDli2xx9c86v3dRWZHKyvG9YXQNrKxFlUbI5JiY9rHl8ShQLqU
         l9DBbG5JXgvxLJffzZ6IGCq56ATLieWXecyOfQ1Tf8u3Xydl6jHgNbWT4xCy7ohVhljg
         y/R+JsjURrzvhHt6UrphnnMUh0eJkRxQyhl3o5PLtl4tj40M80gzWBRi1lAvdgNXFJxH
         9NNw==
X-Gm-Message-State: AOAM532Q2F/Ow6gvgfMDhIhY0EaKf1hRa+0Kg4nQamlVa42DJnYbdS9f
        hxCo4K3hJbrAFGmLQo0IJVl9BLuXeQ==
X-Google-Smtp-Source: ABdhPJy7XbnKUkR+qePjsQY9tdrSqlwteMXQrSIzrqWe73gqEIx9SIlsBZFBGeAym6PEHaps/tqkaQ==
X-Received: by 2002:a05:6871:20c:b0:e6:8475:947e with SMTP id t12-20020a056871020c00b000e68475947emr2902602oad.239.1650655446947;
        Fri, 22 Apr 2022 12:24:06 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id ed22-20020a056870b79600b000da32eab691sm937370oab.23.2022.04.22.12.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:24:06 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: eeprom/at24: Add samsung,s524ad0xd1 compatible
Date:   Fri, 22 Apr 2022 14:23:55 -0500
Message-Id: <20220422192355.2597523-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The samsung,s524ad0xd1 compatible is in use, but not documented. According
to arch/arm/mach-s3c/mach-smdk6410.c, the samsung,s524ad0xd1 is compatible
with the 24c128.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
2.32.0

