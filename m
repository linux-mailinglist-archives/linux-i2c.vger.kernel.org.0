Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464DF581089
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jul 2022 11:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238683AbiGZJ5r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jul 2022 05:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238648AbiGZJ5o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jul 2022 05:57:44 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDB531DCB
        for <linux-i2c@vger.kernel.org>; Tue, 26 Jul 2022 02:57:15 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h9so19454145wrm.0
        for <linux-i2c@vger.kernel.org>; Tue, 26 Jul 2022 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iUicZLyBaZmjv2lqx7fW4HMBGqk7G7eOOVk/ONJ/4PI=;
        b=a9jshOAIwiw5ztp0+n80iX49X5uP9g1fIPLWAKA0Oebli99rLSK1JSwbKX/TWSIEKD
         O8RAu6x1EuYGsc6oXUYHrmfMJXvk5iAAbsgDFp3wtW13E5HsTmbU8dXiDaDJtMrBEKfo
         BtLocFdB4gelyGOYkHzTosErUmhiDP8/zjswgy3RH2fFxA6Xdh3CA/yI5iTiW9jbWJ9K
         oN+oMjKZdsMTijOKOP2BcUYtUHprOqVqAeK+KFkaDem1o5Ff7dUDZtyl1X5TpjYEAD8P
         dBkE0hdxwnSaGXsfATXn6MSzu2tBqE1Ie2s0Wxg+NyX5ban32/phra4XzX8bj2k4iDT4
         H/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iUicZLyBaZmjv2lqx7fW4HMBGqk7G7eOOVk/ONJ/4PI=;
        b=KKqLrlynJgWf0GzDdUpg4FD1EklAsRHKD244JN9mSTIiZKf+dTrn7U+DGFhtxGW2Py
         uGKYC27wqoFvAY9oLzUcGIQWuxo4FlL3ulvfGOyO6qgJJkHF/WVxj4T93EH/iug6ImIQ
         fyzBEaQnQ+KKd1GsosOpdAMX5QdRjTUBVhB+jdRF1wlQa2FJZQZsq6jibup07V+4IBny
         Q08RzbxXDdCUBE7b5e0Ovso+EYyMHMkQUe7ypS7WkLy3F34jcqLufHF1xKuMH2WwY9+c
         XpJUdtdAgInPuPVFJvd9bB3DqyN3wLk3AfNdfTdP2IEsS9bg65+7lSYJYif2Opdt6ACU
         emlw==
X-Gm-Message-State: AJIora9BVYi4u07oKySNRAnZQbSJuY5qB0O15RWQoUYsKagc0m4gY+XA
        2/jZ0GchOvCR8QqG4YmvNIWHaw==
X-Google-Smtp-Source: AGRyM1vaVzTyQ5b+nn+RlJ42faxYO14TpuNlzllTL+nY6z4bb/G0nOBbFTz5DJTxQxp7SwpuN92A3g==
X-Received: by 2002:adf:e84b:0:b0:21e:61cd:647e with SMTP id d11-20020adfe84b000000b0021e61cd647emr10370152wrn.715.1658829433726;
        Tue, 26 Jul 2022 02:57:13 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id t3-20020a1c4603000000b003a2d87aea57sm21170873wma.10.2022.07.26.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 02:57:12 -0700 (PDT)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     fparent@baylibre.com
Cc:     broonie@kernel.org, chaotian.jing@mediatek.com,
        chunfeng.yun@mediatek.com, devicetree@vger.kernel.org,
        dmaengine@vger.kernel.org, jic23@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        matthias.bgg@gmail.com, qii.wang@mediatek.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, ulf.hansson@linaro.org,
        vkoul@kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH 16/17] arm64: dts: mediatek: add mt8365 device-tree
Date:   Tue, 26 Jul 2022 11:57:11 +0200
Message-Id: <20220726095711.708310-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220531135026.238475-17-fparent@baylibre.com>
References: <20220531135026.238475-17-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Fabien,

Could you please add CPUIDLE support:

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 323c814c10cc..1df4075db58f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -59,6 +59,7 @@ cpu0: cpu@0 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
@@ -72,6 +73,7 @@ cpu1: cpu@1 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate", "armpll";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
@@ -85,6 +87,7 @@ cpu2: cpu@2 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate", "armpll";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
@@ -98,10 +101,42 @@ cpu3: cpu@3 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate", "armpll";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			MCDI_CPU: mcdi-cpu {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x00010001>;
+				entry-latency-us = <300>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+
+			MCDI_CLUSTER: mcdi-cluster {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <350>;
+				exit-latency-us = <250>;
+				min-residency-us = <1200>;
+			};
+
+			DPIDLE: dpidle {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010004>;
+				entry-latency-us = <300>;
+				exit-latency-us = <800>;
+				min-residency-us = <3300>;
+			};
+		};
 	};
 
 	cluster0_opp: opp-table-0 {

I have tested it on i350 evk and each idle state is used properly.

Regards,
Amjad
