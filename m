Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C92745D63
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 15:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbjGCNbY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 09:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbjGCNbU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 09:31:20 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8813E5A
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 06:31:18 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f766777605so6868950e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688391076; x=1690983076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2RI3+66dTpZ9C4ox3q+m5S+xeRtBMTP/kVw+ytOXk4=;
        b=inpJ0VovqtQ8g/UFm+SoVRGe0WZPBMO35cPLnHy0FdV/1Ahc3lBjK0HTKkN5e1a53W
         lMzz63d16Vmju8Xntq635NMcGOtlkK26RKZfE02a+SZ+5G5j6LlXWNk+AXor/fJFh/pN
         Th8+lcjm+whpcFtu8pB1mLfy4LvPWVEQQNZ9/b01qj9gBcFYxyP2uH1YY9D+fi+riJ5l
         SeB0EJKFVju8PnKGt1NSHM3W/34IpU4/okoFWrjagX3xbAkyucyfJcZBrgoKdXxmQ0VT
         LeLW4YpmJbj8F3Z40oqmk/DsonixOjv29pPfbwPMXvnYlPwN6NkBoTQYFHoDIcZHrvIx
         Q+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688391076; x=1690983076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2RI3+66dTpZ9C4ox3q+m5S+xeRtBMTP/kVw+ytOXk4=;
        b=c3eREmcnULFyeWP3jNgWtKqjhji6uQLrt7fGuFSj4ugOvmPRFBKCmXhn3I188dPwam
         GLdOF7ZwtBF1CdD4AuKxx2QO7SmZ8o6Ey+bGJ4osCuxn3y7zdymIsJwzUejM+YVcJmnu
         wOgUkfYr3d7qobllV8s/kZdMb3+xyyFoS+E+zoE10BM9O3mgc3OhiO5E4sYBRPX656we
         Y0T3X5km1D6RbDbvod129dQshFur2xvL52ldaG9TOpcNwnCPvNbi4IfHJOzvLOwsy8Ii
         tg7+OiPJg2lCQuV7Bd8JFZtg3IfJOpxofnyqSy4fZVsSljXERilMd/QkHvnGf88Q2wWb
         OJIg==
X-Gm-Message-State: ABy/qLYXsMv37UeF/3BPRwortdufReBDXEOGaXLF6TFUfHVmM6GRcY/R
        zNwngeyAbd8Vf76c2I8HFMOnIQ==
X-Google-Smtp-Source: APBJJlGHneF9y50KLLcylEC0u5K7FX2jsNUrQKCxMZuDYkGMyEAvOfpfont9DqrFn9m11FTiJqz+5Q==
X-Received: by 2002:a05:6512:3a7:b0:4f3:9136:9cd0 with SMTP id v7-20020a05651203a700b004f391369cd0mr6154596lfp.44.1688391076514;
        Mon, 03 Jul 2023 06:31:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id ep7-20020a056512484700b004fbb1f70ceesm833417lfb.227.2023.07.03.06.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:31:16 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 15:31:11 +0200
Subject: [PATCH 2/5] dt-bindings: serial: geni-qcom: Allow no qup-core icc
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8250_qup_icc-v1-2-fea39aa07525@linaro.org>
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688391072; l=1333;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PHLLf0dYHyrWiNleR3i9qlCgEBMco5J5FnlnRJYIuaA=;
 b=01sXMPmg4hRNAhe629YzVYzm5DQTEV0QMurBwgyti7/OIjJy3QP2fMez4fgR21njikOPBYNdP
 nTMfMisnZkeBTo+FNYNjyxjjfHD6CN/00DdYpJG5Ofwlc3CLNwE4Efu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some SoCs (like SM8150 and SM8250) don't seem to provide a qup-core path.
Allow such case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/serial/qcom,serial-geni-qcom.yaml     | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
index dd33794b3534..a0acba57bc06 100644
--- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
@@ -25,14 +25,6 @@ properties:
   clock-names:
     const: se
 
-  interconnects:
-    maxItems: 2
-
-  interconnect-names:
-    items:
-      - const: qup-core
-      - const: qup-config
-
   interrupts:
     minItems: 1
     items:
@@ -56,6 +48,24 @@ properties:
   reg:
     maxItems: 1
 
+oneOf:
+  - properties:
+      interconnects:
+        maxItems: 1
+
+      interconnect-names:
+        items:
+          - const: qup-config
+
+  - properties:
+      interconnects:
+        minItems: 2
+
+      interconnect-names:
+        items:
+          - const: qup-core
+          - const: qup-config
+
 required:
   - compatible
   - clocks

-- 
2.41.0

