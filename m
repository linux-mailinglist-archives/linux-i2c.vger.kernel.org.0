Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9E572EC9C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 22:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbjFMULp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 16:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240180AbjFMULf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 16:11:35 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE701FC8;
        Tue, 13 Jun 2023 13:11:13 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-777b0cae9ecso346530139f.2;
        Tue, 13 Jun 2023 13:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686687070; x=1689279070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PBzPtKEJdG96O52dKqtaQoAEW6B/L+Tc6sjmbWnvF8=;
        b=jKEFHQt8xPN8hl5VjO/RObGCdtWdY2ivuslNtc2NwelF4chJExsFdVhWs3Y1UPkyPr
         b4Nz8YnUiejj41HehaAzQfRCzHtWYIEi9GM1dFko6omt75qf5bO8PESK+JnnxchgwBsk
         rai+jMA8yHSEzwSt9oYxUsw+ESLJHRJ9r5x4ClXuCpW0XsDgXC8yqN+pJLHBY9Pr3eAG
         TrqY7URHU0LEsZuid3IZK3HDIHCeGWZe/+ptZ4M8FvHzIVze5JwZdTtGIcP0d9RDcfaS
         nJVG6sO+OHm2W/XLCSUuRev7bZW7jVryP5F762c4v6cGQthedOVO1Z1b1q9sHLemPBwP
         IUQw==
X-Gm-Message-State: AC+VfDwSE8J+JddilHP8eoWzgH6MZGyOr98EytO/X2jxloDyqTNJZJAN
        uQ4oPYTNZzzpVstKpuZ3sg==
X-Google-Smtp-Source: ACHHUZ7Cvzh17SUGOeQREJ30JIkfakOMM7si91l/XAhc3ugQT4AvpHnzINdbry515wsptIqSlOIfPg==
X-Received: by 2002:a6b:7614:0:b0:774:7cdb:1fe4 with SMTP id g20-20020a6b7614000000b007747cdb1fe4mr12961010iom.13.1686687070300;
        Tue, 13 Jun 2023 13:11:10 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id a22-20020a056602209600b0076c7a2f0f41sm4093739ioa.46.2023.06.13.13.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:11:09 -0700 (PDT)
Received: (nullmailer pid 2824490 invoked by uid 1000);
        Tue, 13 Jun 2023 20:11:08 -0000
From:   Rob Herring <robh@kernel.org>
To:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: opencores: Add missing type for "regstep"
Date:   Tue, 13 Jun 2023 14:11:04 -0600
Message-Id: <20230613201105.2824399-1-robh@kernel.org>
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

"regstep" may be deprecated, but it still needs a type.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
index 85d9efb743ee..d9ef86729011 100644
--- a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
+++ b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
@@ -60,6 +60,7 @@ properties:
     default: 0
 
   regstep:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       deprecated, use reg-shift above
     deprecated: true
-- 
2.39.2

