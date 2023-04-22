Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED906EBAD3
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Apr 2023 20:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjDVSHE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Apr 2023 14:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjDVSHD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Apr 2023 14:07:03 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B6C19B;
        Sat, 22 Apr 2023 11:07:01 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-2febac9cacdso1719144f8f.1;
        Sat, 22 Apr 2023 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682186818; x=1684778818;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+ZAi4MB2iglmobNNPKpLNUvG+fr9DuzoLdnk3gLDW0=;
        b=eEiInu1JXd0HVKLPJ+IYQmIZSbHZsi/HXtnF+nCYyABJJ+8g96NfpkWyK8wTtVdPwF
         JkU++tJq4aRInbTihKDkcTGpGd0uRm4YNWB8gzGOjUTSJv0lSlFcZ/rYS0pHi9aMn/SM
         QhFOeu21JLESA+uXcjNV93Fro8BP2rXWTadCqnuEnw1aRW+NFW/HQLOkga4iHehRQNz0
         wjVYPPdwXw5ATClKpWa5oDmuy2GIUecTeu+iGVXrgTIGQdfMGbWdINFumH5FmiIk2CF8
         d9Z66F5+RfP8jG9TtJSwpLKPja7KNb0dVJRYqjWkXUFAyOCl2ffYbct8+yxm+DI6bMUN
         aouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682186818; x=1684778818;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+ZAi4MB2iglmobNNPKpLNUvG+fr9DuzoLdnk3gLDW0=;
        b=ERBqrI1zP8bnyh4H8yaca+EbQ+ia1BLQoHeY/Ri1d0Hwi2HtzFIf0oMpSOesIHHEgK
         3bofpk72MWQvDyv08v7pgm3na0lnlsGa0zv3rG31+8WHycKQBlGfSv2VhtFb8BqJW7Hw
         uTcnMDh4j14luUKAH9DtrnQP6aa47eAZElp2QhwEa0XHIm5FDcabBToGwNPbF5XxzkeG
         DBGG0+CcHhPaYrrmLWx/mKPTtkr+oFFeWaPyB8ypuVtITQ4JTqM/GQgsDeYpmnfCfYc7
         cy5x10Skbq6iHtnl06l5g3u2RQ2NRwXnUPg9YdHxJA8pS4LkvI64jRL0k29VWFht1v+g
         PWjg==
X-Gm-Message-State: AAQBX9cYyojg1+B0tmWE7QxcpLAnfhvcvxKPOj4/dZfqXJI2r95F54FL
        SY+I31+j5IcbpkHyNhsBL7M=
X-Google-Smtp-Source: AKy350YsabFQpa76t44sd7bC+cmvABmHWtla6OM6vDd5rGqx3sfSVw9yneNqhVjpnbPxSLHgKLDdMA==
X-Received: by 2002:adf:db0d:0:b0:2ce:a30d:f764 with SMTP id s13-20020adfdb0d000000b002cea30df764mr6190607wri.21.1682186818233;
        Sat, 22 Apr 2023 11:06:58 -0700 (PDT)
Received: from standask-GA-A55M-S2HP ([188.123.113.247])
        by smtp.gmail.com with ESMTPSA id f17-20020a5d58f1000000b002cea8e3bd54sm6967777wrd.53.2023.04.22.11.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 11:06:57 -0700 (PDT)
Date:   Sat, 22 Apr 2023 20:06:56 +0200
From:   Stanislav Jakubek <stano.jakubek@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: bcm23550: Add SoC-specific I2C compatible
Message-ID: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682185969.git.stano.jakubek@gmail.com>
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

