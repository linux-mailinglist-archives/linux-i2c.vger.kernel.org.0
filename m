Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696186E67C8
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 17:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjDRPH0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 11:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjDRPHZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 11:07:25 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD3810E6;
        Tue, 18 Apr 2023 08:07:24 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-187d9c205e9so486737fac.3;
        Tue, 18 Apr 2023 08:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681830443; x=1684422443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ePUfDNEbSZIfyniFn0CBevhDy9dwWK/iVoO3Ol0AKU=;
        b=Z6POKtnEERfN8vHsduLNzsmn9DXPj4xTM9VSyUAz+CpUk8mUzlofVPxYjypJECjkoR
         /4oz0WTu8PLgrElEL8qOktYd4vBlfSJfKWHamx95NwuWhaJjAlXMjWo12WzcSnCH1e8+
         SsSGeHPIxjgp3UZzYXhPLVgKc2YL+P93W5aN+9tm3/+xRqqvPub39DcULPsJxBZg0FQi
         kUG6GsWm47we8aemGv9vtQ4nELy9NitkqvQOVme4f9SzArtCDA9XV4w/qQJ7Hn4+44Oc
         ErCxeN2jcmtKqlAX86NgvXkhOiye9cvsGZQNTZi0i92Hh5F76H6jnOrXBkbRlTXvVAYV
         BchA==
X-Gm-Message-State: AAQBX9f07a9dXjI8GhSw0WhzyD0DSMrsea2as+0GdiL5Xz9knHiHoujD
        1858WJ+lj93J4GYJ71WmRMP1aVIeLQ==
X-Google-Smtp-Source: AKy350Z1qucPStyzyWPSyM3II5UENVHHisvaho2hBEbBL1oSRASXIkjPHjMKRUaexFNY+KWjhWvkVQ==
X-Received: by 2002:a05:6870:638d:b0:183:cf8d:bd84 with SMTP id t13-20020a056870638d00b00183cf8dbd84mr1602063oap.48.1681830443419;
        Tue, 18 Apr 2023 08:07:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j41-20020a4a88ac000000b0053b88b03e24sm5943818ooa.18.2023.04.18.08.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 08:07:23 -0700 (PDT)
Received: (nullmailer pid 1532199 invoked by uid 1000);
        Tue, 18 Apr 2023 15:06:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: samsung: Fix 'deprecated' value
Date:   Tue, 18 Apr 2023 10:06:42 -0500
Message-Id: <20230418150643.1529895-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

'deprecated' is a boolean type which should have a value of 'false' rather
than 'yes'.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index 3d5782deb97d..b204e35e4f8d 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -37,7 +37,7 @@ properties:
       for "samsung,s3c2440-hdmiphy-i2c" whose input/output lines are
       permanently wired to the respective client.
       This property is deprecated. Use "pinctrl-0" and "pinctrl-names" instead.
-    deprecated: yes
+    deprecated: true
 
   interrupts:
     maxItems: 1
-- 
2.39.2

