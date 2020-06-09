Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396711F3C50
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 15:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbgFIN0x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 09:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgFIN0x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 09:26:53 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA84EC05BD1E;
        Tue,  9 Jun 2020 06:26:52 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u8so1400958pje.4;
        Tue, 09 Jun 2020 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QusMWrbVSqNCA9Vj6aVV3k3Kx07QkMMqYu7loEdqwck=;
        b=fdTB7MiXAKj536SYnUoaU2XnrBKccvOxlmMo0FYNsxJ494eIqCV91FnPLC6TKV9KeX
         36yyhi3hv2ehmccAqefo+n4Iwmqk10/MZAskfd7KQA4T/xKZtKR+37gxo51Sgc3+kkTK
         9ePFnkGmZuMKRHLfjr4+pAReM6TaqymTY0oOwk5BSzC9CyGw0qui2cqCwoAcX5EaJ5sW
         ennahvOHPUvZ3ZQMO1VfUlJGN3qWILZ9CzXu7k02jljs/URFtnTJujP02iR5qrtUQm4h
         S53RSwb0BPAyG4mRi+JO1q6MuodDHapZWbiNr4VRJ77x8xQXDf+xsw/BSnHkMMNzWgYv
         65mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QusMWrbVSqNCA9Vj6aVV3k3Kx07QkMMqYu7loEdqwck=;
        b=nP/kOXba5WLQhxTnMsip9We/OzlHyqAK72JKx+8ZNR6Iz+TmqTHLWo9N0C1seKJ0Fj
         lyifgXYFjZKp9cVDeLT5qHFuPoizQmZeD9WxpIr1TP5oWnRz+4/4D9f+VJw0naakkVY7
         6uEvLs44qEYJ9K8ybqQC5m/5KF+M6aPX1VojmbvyA7gqS6F/cckHIm3WZqK19p+BPLjU
         ID8p+3ZLJUnj11ppmMxN9h/+ulSD3GkSqF5afZkXf8VrqfuvCYA79eyc4GMMqCoB7U1/
         Z0xbb6vydjYnk6DQO8zIgwTNHvupO4KtPotkK28GI9TLyBSJzDil25ua2AnFULM8A/kd
         1cAA==
X-Gm-Message-State: AOAM533h6ywf8GNPAO+dzwSAywZIkRriokyspguwVqsR4TmM9sbfofxo
        mmN97LQOflFNWit19S5SqAw=
X-Google-Smtp-Source: ABdhPJxLW798RDJ9H+z390Fk/HHj5jev6sBdN99n9t4PT7es6sgvxXULvn01EU+O/ObGIuIiX9qmjg==
X-Received: by 2002:a17:902:b08b:: with SMTP id p11mr3449660plr.324.1591709212554;
        Tue, 09 Jun 2020 06:26:52 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
        by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:26:52 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        pierre-yves.mordret@st.com, philippe.schenker@toradex.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4 1/4] ARM: dts: stm32: add I2C3 support on STM32F429 SoC
Date:   Tue,  9 Jun 2020 21:26:40 +0800
Message-Id: <1591709203-12106-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patch adds I2C3 instances of the STM32F429 SoC

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d7770699feb5..257b8431dece 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -402,6 +402,18 @@
 			status = "disabled";
 		};
 
+		i2c3: i2c@40005c00 {
+			compatible = "st,stm32f4-i2c";
+			reg = <0x40005c00 0x400>;
+			interrupts = <72>,
+				     <73>;
+			resets = <&rcc STM32F4_APB1_RESET(I2C3)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(I2C3)>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dac: dac@40007400 {
 			compatible = "st,stm32f4-dac-core";
 			reg = <0x40007400 0x400>;
-- 
2.7.4

