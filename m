Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 261D36EBF79
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Apr 2023 14:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjDWMjR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Apr 2023 08:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjDWMjR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Apr 2023 08:39:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB5E10E6;
        Sun, 23 Apr 2023 05:39:15 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f20215fa70so2064315e9.0;
        Sun, 23 Apr 2023 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682253554; x=1684845554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BeqKCC7uf5DiAni7uVUYCtTkzdp3ZvJDjEiLgnmAtxI=;
        b=svhlXU/RGgLcijkj+oBP0kZRxHo6C9vOKYp0BCFqaB9D8oObxbSLxaCEt1BDg2PtIn
         G4U8wnUjofQnvC87AyMHmnsvUiOavgKXJQo6xPrHX/0Lf0iaa+QIwvoVdSg0ADPFGqie
         ZNzKX17/brDR58OF7vLkcsqRipgrbSPZCVS7zkFmyqN/wEWdHOt7fXUv0+ismF5OY5Pp
         DTN7Vj0S+taREB9JLg8UGYwD5tBlEXgDkDMrdAqO0LGeEihoA+PTREXL9deQJqzsijjj
         Se9MHh7vrmpeTFnFG92SNSwc7MZtaF9OcxNX5keH3PdMgpdpfDJa1vVvLobxOalbBNvm
         xyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682253554; x=1684845554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BeqKCC7uf5DiAni7uVUYCtTkzdp3ZvJDjEiLgnmAtxI=;
        b=mHaQ0JciWmF/u5BOa4Gak1LbXsRhRr/mAUOBi9Oos6+/wqo3TD4LZcPhxL8NBLDHOe
         0stt86U4wwr/w2MHidPhCMSp/nUXVTZ/Fq3Wa+9FWC+X/X+e+rWBrnfe6rFAK5E3Or20
         Yx6oJhwSRr+oDUPO25C9u60mb8maP67e+4avMpO9XK51ssC3Y2l+WuQKqyJ8pU+UWCde
         cxFZNHwqLpNPXs/PZLXYAm3dWIonr0vqd1dwyvDiTfwx3GkN9jOkc0Z66b2Cq1RRMiDA
         gBjymH2+KgY9tpnYDTPjiVFMuzbK0uYFWgjtGtsLRFQZeo73E1ExcEqJs2HsTg2HvRy+
         Ympw==
X-Gm-Message-State: AAQBX9chKkSooc6Td62rgNhcXzBx14xbnMrik7AlltTMKbVfdui/sHKg
        NM3r0CkdgoyWApLkVxGpsEkr+stPBiB3Ng==
X-Google-Smtp-Source: AKy350ZwDjFRhnNGLWmg7d5IHRZezUWe1gKwK3plZAKzydSJRm31G6A2J5GelTjXEx5804auUVaFVQ==
X-Received: by 2002:a7b:c848:0:b0:3f1:727d:77a6 with SMTP id c8-20020a7bc848000000b003f1727d77a6mr5981843wml.3.1682253554256;
        Sun, 23 Apr 2023 05:39:14 -0700 (PDT)
Received: from standask-GA-A55M-S2HP ([188.123.113.247])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c468500b003f18141a016sm12412408wmo.18.2023.04.23.05.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 05:39:14 -0700 (PDT)
Date:   Sun, 23 Apr 2023 14:39:12 +0200
From:   Stanislav Jakubek <stano.jakubek@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: bcm23550: Add SoC-specific I2C compatible
Message-ID: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add BCM23550-specific compatible for brcm,kona-i2c nodes. While not
currently used by the i2c-bcm-kona driver, they can serve for further
customization, if required.
Done in preparation for dt-binding coversion to DT schema.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in v2:
 - none

 arch/arm/boot/dts/bcm23550.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/bcm23550.dtsi b/arch/arm/boot/dts/bcm23550.dtsi
index a36c9b1d23c8..32b244b8546c 100644
--- a/arch/arm/boot/dts/bcm23550.dtsi
+++ b/arch/arm/boot/dts/bcm23550.dtsi
@@ -159,7 +159,7 @@ uartb3: serial@2000 {
 		};
 
 		bsc1: i2c@16000 {
-			compatible = "brcm,kona-i2c";
+			compatible = "brcm,bcm23550-i2c", "brcm,kona-i2c";
 			reg = <0x00016000 0x70>;
 			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -169,7 +169,7 @@ bsc1: i2c@16000 {
 		};
 
 		bsc2: i2c@17000 {
-			compatible = "brcm,kona-i2c";
+			compatible = "brcm,bcm23550-i2c", "brcm,kona-i2c";
 			reg = <0x00017000 0x70>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -179,7 +179,7 @@ bsc2: i2c@17000 {
 		};
 
 		bsc3: i2c@18000 {
-			compatible = "brcm,kona-i2c";
+			compatible = "brcm,bcm23550-i2c", "brcm,kona-i2c";
 			reg = <0x00018000 0x70>;
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -189,7 +189,7 @@ bsc3: i2c@18000 {
 		};
 
 		bsc4: i2c@1c000 {
-			compatible = "brcm,kona-i2c";
+			compatible = "brcm,bcm23550-i2c", "brcm,kona-i2c";
 			reg = <0x0001c000 0x70>;
 			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.25.1

