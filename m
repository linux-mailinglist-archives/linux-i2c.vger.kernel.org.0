Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D604F2351
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 08:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiDEGhc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 02:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiDEGhN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 02:37:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B015118E0C
        for <linux-i2c@vger.kernel.org>; Mon,  4 Apr 2022 23:35:12 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a6so13623540ejk.0
        for <linux-i2c@vger.kernel.org>; Mon, 04 Apr 2022 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQKmzATQgOwA4osgUu1k2T5QNkAXEVbGPsChUjRUxPs=;
        b=Y70cAptxp2vAeeSPZbW5hgUtBwr9/jNekpcTOuSlE/a6WKBY5CsLbamywlXYB5wbum
         D6fQTjyNjI5DiaVW5oLGCepyqFWubZ6I8wLCi2QUgxRG1Zn7zHsEBMhkgrJd5Z95AAne
         nbS46HxgFfs9z+Z/fSd0JGxHAj0h8OdMA+G5vZor46i6Xqg+G7xCEB2aK2ps2oVEsVKf
         fJtXu4qhKI8o4OQdW22B9zykAKAV/Pb0VL11ejTXAMn5M2PA/0fcJ5JICc0VpTSBGUPK
         Uy4vtd58869kq1JWorBeia9uOrmZGSAbNjxuX3odqnO/4Fnt8B4zMYqhlfyEV8JkLSWl
         ltdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQKmzATQgOwA4osgUu1k2T5QNkAXEVbGPsChUjRUxPs=;
        b=Ra2Gp+D/2ZUZU9+IkQd9xp/dzgmxfL9wSu9MxEOy1BX0Z831ros3WnYvWsbCmZy/i2
         4RmjzIXxYH6bIuKdV+GDVRJggXAuaPiEHjJ/zH6A/qORaCr8TVt3BmGNj2HpAcwQONf7
         lTVEmjQKYEk/Hz0DA2AQ8+vKlS7ZSG8nltbSwbuD30h5vmCEVneEg00Hm5vCEc3icFU5
         kQv4uMo8ugyzKIbhQX/QopmQg54Q4ctXiUGBbObOXzMfTRoajaqJucahKhCMkoIhz8se
         6ROBY/VQmnADzURaPc/Onu3+NWTT4IiFXzIxzHm+CXvwTyYVXKxV0S5u1J26UoxpzcX6
         F9PQ==
X-Gm-Message-State: AOAM532D+7wYDidYWG6oXnyzYq2kmRLTz+qsI+Qc9wHKf8UivG4/9pa8
        ucXEo1LjcLGMuPQnvsvGazfo5w==
X-Google-Smtp-Source: ABdhPJzIrcCoJgCmzjN2M7RipzdHQW1ZDgiQ/LKA1JGulqukaDGJJDJxrCHzpSsOESwUMHAw2g5pSQ==
X-Received: by 2002:a17:907:3f18:b0:6e0:df2d:c76a with SMTP id hq24-20020a1709073f1800b006e0df2dc76amr2016343ejc.55.1649140510930;
        Mon, 04 Apr 2022 23:35:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bs7-20020a056402304700b004197e5d2350sm6086543edb.54.2022.04.04.23.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 23:35:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/9] arm64: dts: qcom: align clocks in I2C/SPI with DT schema
Date:   Tue,  5 Apr 2022 08:34:44 +0200
Message-Id: <20220405063451.12011-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
References: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The DT schema expects clocks core-iface order.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Dropped Kuldeep's ack because of changes - more properties changed.
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 12 ++---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 24 ++++-----
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 36 +++++++-------
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 48 +++++++++---------
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 42 ++++++++--------
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 36 +++++++-------
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 72 +++++++++++++--------------
 7 files changed, 135 insertions(+), 135 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 87c28ffa44d3..8032d7933c66 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -318,9 +318,9 @@ i2c_0: i2c@78b6000 {
 			#size-cells = <0>;
 			reg = <0x0 0x078b6000 0x0 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency  = <400000>;
 			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
 			dma-names = "tx", "rx";
@@ -333,9 +333,9 @@ i2c_1: i2c@78b7000 { /* BLSP1 QUP2 */
 			#size-cells = <0>;
 			reg = <0x0 0x078b7000 0x0 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency  = <400000>;
 			dmas = <&blsp_dma 16>, <&blsp_dma 17>;
 			dma-names = "tx", "rx";
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 2072638006a4..8e41c910b8f9 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -467,9 +467,9 @@ blsp1_i2c2: i2c@78b6000 {
 			#size-cells = <0>;
 			reg = <0x078b6000 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
 			dma-names = "tx", "rx";
@@ -484,9 +484,9 @@ blsp1_i2c3: i2c@78b7000 {
 			#size-cells = <0>;
 			reg = <0x078b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <100000>;
 			dmas = <&blsp_dma 16>, <&blsp_dma 17>;
 			dma-names = "tx", "rx";
@@ -499,9 +499,9 @@ blsp1_i2c5: i2c@78b9000 {
 			#size-cells = <0>;
 			reg = <0x78b9000 0x600>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp_dma 20>, <&blsp_dma 21>;
 			dma-names = "tx", "rx";
@@ -514,9 +514,9 @@ blsp1_i2c6: i2c@78ba000 {
 			#size-cells = <0>;
 			reg = <0x078ba000 0x600>;
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <100000>;
 			dmas = <&blsp_dma 22>, <&blsp_dma 23>;
 			dma-names = "tx", "rx";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 384fc8738130..15d9731469ca 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1511,9 +1511,9 @@ blsp_i2c1: i2c@78b5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b5000 0x500>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c1_default>;
 			pinctrl-1 = <&i2c1_sleep>;
@@ -1543,9 +1543,9 @@ blsp_i2c2: i2c@78b6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b6000 0x500>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c2_default>;
 			pinctrl-1 = <&i2c2_sleep>;
@@ -1575,9 +1575,9 @@ blsp_i2c3: i2c@78b7000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b7000 0x500>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c3_default>;
 			pinctrl-1 = <&i2c3_sleep>;
@@ -1607,9 +1607,9 @@ blsp_i2c4: i2c@78b8000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b8000 0x500>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c4_default>;
 			pinctrl-1 = <&i2c4_sleep>;
@@ -1639,9 +1639,9 @@ blsp_i2c5: i2c@78b9000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b9000 0x500>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c5_default>;
 			pinctrl-1 = <&i2c5_sleep>;
@@ -1671,9 +1671,9 @@ blsp_i2c6: i2c@78ba000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078ba000 0x500>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c6_default>;
 			pinctrl-1 = <&i2c6_sleep>;
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 431228faacdd..2a70263a701d 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -923,9 +923,9 @@ i2c_1: i2c@78b5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x78b5000 0x600>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_1_default>;
@@ -941,9 +941,9 @@ i2c_2: i2c@78b6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x78b6000 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_2_default>;
@@ -959,9 +959,9 @@ i2c_3: i2c@78b7000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x78b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_3_default>;
 			pinctrl-1 = <&i2c_3_sleep>;
@@ -976,9 +976,9 @@ i2c_4: i2c@78b8000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x78b8000 0x600>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_4_default>;
 			pinctrl-1 = <&i2c_4_sleep>;
@@ -993,9 +993,9 @@ i2c_5: i2c@7af5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x7af5000 0x600>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_5_default>;
 			pinctrl-1 = <&i2c_5_sleep>;
@@ -1010,9 +1010,9 @@ i2c_6: i2c@7af6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x7af6000 0x600>;
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_6_default>;
 			pinctrl-1 = <&i2c_6_sleep>;
@@ -1027,9 +1027,9 @@ i2c_7: i2c@7af7000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x7af7000 0x600>;
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_7_default>;
 			pinctrl-1 = <&i2c_7_sleep>;
@@ -1044,9 +1044,9 @@ i2c_8: i2c@7af8000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x7af8000 0x600>;
 			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "iface", "core";
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c_8_default>;
 			pinctrl-1 = <&i2c_8_sleep>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8c1dc5155b71..209f9ef030e5 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -519,9 +519,9 @@ blsp1_i2c1: i2c@f9923000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9923000 0x500>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
 			dma-names = "tx", "rx";
@@ -555,9 +555,9 @@ blsp1_i2c2: i2c@f9924000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9924000 0x500>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-						<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp1_dma 14>, <&blsp1_dma 15>;
 			dma-names = "tx", "rx";
@@ -575,9 +575,9 @@ blsp1_i2c4: i2c@f9926000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9926000 0x500>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-						<&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp1_dma 18>, <&blsp1_dma 19>;
 			dma-names = "tx", "rx";
@@ -593,9 +593,9 @@ blsp1_i2c5: i2c@f9927000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9927000 0x500>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-						<&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
 			dma-names = "tx", "rx";
@@ -611,9 +611,9 @@ blsp1_i2c6: i2c@f9928000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9928000 0x500>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-						<&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp1_dma 22>, <&blsp1_dma 23>;
 			dma-names = "tx", "rx";
@@ -657,9 +657,9 @@ blsp2_i2c1: i2c@f9963000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9963000 0x500>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-					<&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			dmas = <&blsp2_dma 12>, <&blsp2_dma 13>;
 			dma-names = "tx", "rx";
@@ -693,9 +693,9 @@ blsp2_i2c5: i2c@f9967000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9967000 0x500>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-						<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <355000>;
 			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
 			dma-names = "tx", "rx";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..dc77880e8927 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2786,9 +2786,9 @@ blsp1_i2c3: i2c@7577000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x07577000 0x1000>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp1_i2c3_default>;
 			pinctrl-1 = <&blsp1_i2c3_sleep>;
@@ -2834,9 +2834,9 @@ blsp2_i2c1: i2c@75b5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x075b5000 0x1000>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				<&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_i2c1_default>;
 			pinctrl-1 = <&blsp2_i2c1_sleep>;
@@ -2851,9 +2851,9 @@ blsp2_i2c2: i2c@75b6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x075b6000 0x1000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				<&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_i2c2_default>;
 			pinctrl-1 = <&blsp2_i2c2_sleep>;
@@ -2868,9 +2868,9 @@ blsp2_i2c3: i2c@75b7000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x075b7000 0x1000>;
 			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				<&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			clock-frequency = <400000>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_i2c3_default>;
@@ -2886,9 +2886,9 @@ blsp2_i2c5: i2c@75b9000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x75b9000 0x1000>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp2_i2c5_default>;
 			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
@@ -2902,9 +2902,9 @@ blsp2_i2c6: i2c@75ba000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x75ba000 0x1000>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				<&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_i2c6_default>;
 			pinctrl-1 = <&blsp2_i2c6_sleep>;
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 6b3a8e1006d0..acf120f91b42 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -914,9 +914,9 @@ blsp1_i2c0: i2c@78b5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b5000 0x600>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP0_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP0_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_i2c0_default>;
 			#address-cells = <1>;
@@ -928,9 +928,9 @@ blsp1_spi0: spi@78b5000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b5000 0x600>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP0_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP0_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi0_default>;
 			#address-cells = <1>;
@@ -942,9 +942,9 @@ blsp1_i2c1: i2c@78b6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b6000 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_i2c1_default>;
 			#address-cells = <1>;
@@ -956,9 +956,9 @@ blsp1_spi1: spi@78b6000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b6000 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi1_default>;
 			#address-cells = <1>;
@@ -970,9 +970,9 @@ blsp1_i2c2: i2c@78b7000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_i2c2_default>;
 			#address-cells = <1>;
@@ -984,9 +984,9 @@ blsp1_spi2: spi@78b7000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi2_default>;
 			#address-cells = <1>;
@@ -998,9 +998,9 @@ blsp1_i2c3: i2c@78b8000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b8000 0x600>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_i2c3_default>;
 			#address-cells = <1>;
@@ -1012,9 +1012,9 @@ blsp1_spi3: spi@78b8000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b8000 0x600>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi3_default>;
 			#address-cells = <1>;
@@ -1026,9 +1026,9 @@ blsp1_i2c4: i2c@78b9000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b9000 0x600>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_i2c4_default>;
 			#address-cells = <1>;
@@ -1040,9 +1040,9 @@ blsp1_spi4: spi@78b9000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b9000 0x600>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi4_default>;
 			#address-cells = <1>;
@@ -1078,9 +1078,9 @@ blsp2_i2c0: i2c@7af5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x07af5000 0x600>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP0_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP0_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp2_i2c0_default>;
 			#address-cells = <1>;
@@ -1092,9 +1092,9 @@ blsp2_spi0: spi@7af5000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x07af5000 0x600>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP0_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP0_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp2_spi0_default>;
 			#address-cells = <1>;
-- 
2.32.0

