Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD04745D77
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 15:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjGCNbq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 09:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbjGCNbb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 09:31:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D35EE79
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 06:31:23 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso7061534e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 06:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688391081; x=1690983081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrefK8/PwFCkX5pIXHy+fvuyVY7YugWgUcP56e2MTgw=;
        b=HzCv0pW7TPsAck1rWghAm02q2yt/HBzROM1oIyfB5qzGD+iJBee4h44EfePcDKv/ME
         WlT6+sbB9mIUTLXDQ/mhEoT9Y/1Jb1lIzXQAxk/VSByEcB4sbeBjO1dKppzI177pOtc1
         lZfUCewju6od/DqrYi6YvVBBzQfQVbkqUoDGS1MlcCFDCkICp16fXJ3g0ZWe7cjRbA6q
         ldmTzmMIooF4KNQFYnsbY7jg2rH/n8Roj5Jr4Ye+Xus1I+A5GeYlkB9klbbtdjpG8ab3
         FRpQLYJ4ZtYeYLL6dKnpLdIf0cjJAjP1pid2yKak3eOdfPZt23ETyOl81xIzMD8HuGmR
         dmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688391081; x=1690983081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrefK8/PwFCkX5pIXHy+fvuyVY7YugWgUcP56e2MTgw=;
        b=B27aqTkYUNN24FfYSqQzws22wl1IxLRlWnp5LefqcK1NS9eqydLQY7sgHEjBTFJQrz
         CR+GxUIYwXhXQnBT9O4yaXXGx+EFIEieF4bNtLnXWZSBey0WwNflRKCDug7WpcEbrAbq
         ovc6RifnKdtRWjcWvb2sGouF5+tSVtwrxcclb7KL+y+fVCW0kzur8EfS82bnl590WZZz
         LlPqMTAlbJX+9QTbFfuan6lBwV2jborLR+dsOVlSD3epHI3zuidbyKwOiyPvv+D1NCZs
         hvY50DN7yQMYyHC5z6bMn10bDLeKaeCrC0SkL1MbN9zrXBE6x01Vhe375VrH1AlsK5Dp
         95uA==
X-Gm-Message-State: ABy/qLaUWswf/TaihCFfinccMWcXQxjj0Otz3gQ7fzNnrxoEOgpP1WVK
        cfwoSOEURw8CTmzt46Byxh4uwQ==
X-Google-Smtp-Source: APBJJlGy6QEGoSvdZ/JnNulOqJqe4aDlq/q/gjO8UeVoFQoVR5IjBhO4qM2MvR2m24Cc9pbz369Nmg==
X-Received: by 2002:a05:6512:3703:b0:4f8:7551:7485 with SMTP id z3-20020a056512370300b004f875517485mr5342676lfr.5.1688391081053;
        Mon, 03 Jul 2023 06:31:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id ep7-20020a056512484700b004fbb1f70ceesm833417lfb.227.2023.07.03.06.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:31:20 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 15:31:14 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sm8250: Add interconnects and
 power-domains to QUPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8250_qup_icc-v1-5-fea39aa07525@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688391072; l=20635;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6sUJWs3uxT99bYspriYn1C039w1VdT+N8WiwYSJREPo=;
 b=8lQCglMSF9hO/+Ac5DQiOSr/lbjk+1qBSxdwNkARdIUOVPweSFMlfQfxcfXyajIuNzL9lgKD6
 WfxrfHGMwUnDXGK9N/q+0FV5G2Cvwd8g3r9372f54FjcbOQ7uZFbRzX
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

Describe the interconnect paths related to QUPs and add the power-domains
powering them.

This is required for icc sync_state, as otherwise QUP access is gated.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 150 +++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1efa07f2caff..35111fce898a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1022,6 +1022,10 @@ i2c14: i2c@880000 {
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1038,6 +1042,9 @@ spi14: spi@880000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1054,6 +1061,10 @@ i2c15: i2c@884000 {
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1070,6 +1081,9 @@ spi15: spi@884000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1086,6 +1100,10 @@ i2c16: i2c@888000 {
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1102,6 +1120,9 @@ spi16: spi@888000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1118,6 +1139,10 @@ i2c17: i2c@88c000 {
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1134,6 +1159,9 @@ spi17: spi@88c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1149,6 +1177,8 @@ uart17: serial@88c000 {
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-config";
 				status = "disabled";
 			};
 
@@ -1163,6 +1193,10 @@ i2c18: i2c@890000 {
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1179,6 +1213,9 @@ spi18: spi@890000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1194,6 +1231,8 @@ uart18: serial@890000 {
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-config";
 				status = "disabled";
 			};
 
@@ -1208,6 +1247,10 @@ i2c19: i2c@894000 {
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1224,6 +1267,9 @@ spi19: spi@894000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1276,6 +1322,10 @@ i2c0: i2c@980000 {
 				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1292,6 +1342,9 @@ spi0: spi@980000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1308,6 +1361,10 @@ i2c1: i2c@984000 {
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1324,6 +1381,9 @@ spi1: spi@984000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1340,6 +1400,10 @@ i2c2: i2c@988000 {
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1356,6 +1420,9 @@ spi2: spi@988000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1371,6 +1438,8 @@ uart2: serial@988000 {
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>;
+				interconnect-names = "qup-config";
 				status = "disabled";
 			};
 
@@ -1385,6 +1454,10 @@ i2c3: i2c@98c000 {
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1401,6 +1474,9 @@ spi3: spi@98c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1417,6 +1493,10 @@ i2c4: i2c@990000 {
 				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1433,6 +1513,9 @@ spi4: spi@990000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1449,6 +1532,10 @@ i2c5: i2c@994000 {
 				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1465,6 +1552,9 @@ spi5: spi@994000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1481,6 +1571,10 @@ i2c6: i2c@998000 {
 				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1497,6 +1591,9 @@ spi6: spi@998000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1512,6 +1609,8 @@ uart6: serial@998000 {
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>;
+				interconnect-names = "qup-config";
 				status = "disabled";
 			};
 
@@ -1526,6 +1625,10 @@ i2c7: i2c@99c000 {
 				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1542,6 +1645,9 @@ spi7: spi@99c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1591,6 +1697,10 @@ i2c8: i2c@a80000 {
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1607,6 +1717,9 @@ spi8: spi@a80000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1623,6 +1736,10 @@ i2c9: i2c@a84000 {
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1639,6 +1756,9 @@ spi9: spi@a84000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1655,6 +1775,10 @@ i2c10: i2c@a88000 {
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1671,6 +1795,9 @@ spi10: spi@a88000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1687,6 +1814,10 @@ i2c11: i2c@a8c000 {
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1703,6 +1834,9 @@ spi11: spi@a8c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1719,6 +1853,10 @@ i2c12: i2c@a90000 {
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1735,6 +1873,9 @@ spi12: spi@a90000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1750,6 +1891,8 @@ uart12: serial@a90000 {
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>;
+				interconnect-names = "qup-config";
 				status = "disabled";
 			};
 
@@ -1764,6 +1907,10 @@ i2c13: i2c@a94000 {
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1780,6 +1927,9 @@ spi13: spi@a94000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-config", "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";

-- 
2.41.0

