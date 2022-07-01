Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98074563C74
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 00:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbiGAWns (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 18:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGAWnr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 18:43:47 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0033A733
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 15:43:46 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t24so6129630lfr.4
        for <linux-i2c@vger.kernel.org>; Fri, 01 Jul 2022 15:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5c6Bd7wOMhGjYwTIFZ4ddcT+zxuo4R5A80uRvI59m7k=;
        b=l8xtFeB3oHG7LlmKTVaYJMDTEY7gIxgNzS0Ow4y+hwoQiDCmibUBm68k3hqco7Q5J6
         tmQIFVb8hW+cQgnrMTOFpDkI3cZEEtwAVFCoRzWPKkwQom1sb26ePgupZ/PK97nmmxth
         VsfdX8kVHAaUZg+8UwvZG3MgY+OqesR9ieXIJ2+pw0gUlD7bC972l+3MF19bwGJCm+5Q
         P8Nbaq+UydzWc4GbWRf3r0PmiC9F8MkdstcZrdJVutQHHXqqhOWqSlowcKzNKLrornSd
         qGvjG3IKsdS0oRxnt+kjXqCDzX1EpPr4AIcpyH7Ojs5sFiJVFR8cIpN6P1SbQhx5T0YV
         xj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5c6Bd7wOMhGjYwTIFZ4ddcT+zxuo4R5A80uRvI59m7k=;
        b=vB1LHCxaYe61ZqiR0EcyhQxXv/M+u1Ndr4LWK7K2G3odivZzRTJX5POLuiKGjVdFdw
         Z9UoFtCkJvNu2N10aOhRUm4EaiULSmn7RcUmLCbHCvUJdeZNDfojNXxMxKJWan8zPEiD
         OcmWmNk7PNmyFz1iFCuuWoW0cmKnl+fTBlDl2MBCDr8eJGFEClzGIyUg+gSkdMQRAVK5
         7ddoZu9Cf/2FyL4ShrRYHSsHiQ/0lgbRIdhlAeULlrOR3kBeyCiI2mbF9wJWynMsGK6Z
         Cj8UZLSNxvFAo0N2FNJFnEX5oEN7wQRawngGlXNO8e2YiPo3I1zFVT4T4JdwzKZ52OSe
         15qQ==
X-Gm-Message-State: AJIora/PRa/XOoPeshZEEIL7bTyZdIxO1FiYH8Kk8FbE3bYbKJyqoBTD
        L892T2xfIGbyEl2mBSPTzV6anDKTX2Wsog==
X-Google-Smtp-Source: AGRyM1uhGB79A/jRJW6AE0rWsCbCJViPRCi2qE5wABhQCy1i22Xrrcu7Yin04Qc5F5FsAszAeNDyDw==
X-Received: by 2002:a05:6512:3b2:b0:47f:9ffb:e7a0 with SMTP id v18-20020a05651203b200b0047f9ffbe7a0mr10321923lfp.208.1656715424754;
        Fri, 01 Jul 2022 15:43:44 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id r7-20020ac25f87000000b00479307e4a1bsm3782658lfe.135.2022.07.01.15.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 15:43:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: i2c: Drop unused voltage supply from example
Date:   Sat,  2 Jul 2022 00:41:36 +0200
Message-Id: <20220701224136.808991-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This drops the pointless v-i2c-supply from the Nomadik I2C
example. This is a leftover from before the use of power
domains when the power domain voltage was attached to a
regulator.

The unused property in the device trees will be removed
in a separate patch.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index eec502c57047..41623bd0306c 100644
--- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
@@ -89,7 +89,6 @@ examples:
 
       #address-cells = <1>;
       #size-cells = <0>;
-      v-i2c-supply = <&db8500_vape_reg>;
 
       clock-frequency = <400000>;
       clocks = <&prcc_kclk 3 3>, <&prcc_pclk 3 3>;
-- 
2.36.1

