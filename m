Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD9C7463DA
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 22:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjGCUP4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 16:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbjGCUPw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 16:15:52 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC8510C2
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 13:15:42 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f122ff663eso7494416e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688415340; x=1691007340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwU6U03peid4uuDsGQ1dNshAh7m/oGA1lAGwHfg01NI=;
        b=ttpOXAWprLMG+DvdPIsQblV2dMi2bg40A66fYJ6jT8ytDYfsV0Eu0dgzBNUrtO4buE
         J1OKTrQErq9P7IUWqJdWXvW3Grj9hALGwjUsK5RhUw0QIHe3wAs+wLuMuTvrbPoxwbm+
         XZenecrOLuTdRLsgmqK/O0Ac1s31QggSCgGmhwVXZzxSVtsbvTYxyPnnxvmiSOQFqO81
         tZWhTO3bg2HErNiDVamOC8tJgojWH7LDZ6hZqZ6YKcJiAHX86FhfzKJ1nySB0jp0Yxbq
         SaokLb2Vv1GDfci4+TFaJT6omRxe3Y7695XCSwb1FsZ/RBiy9OFeREGI8DhdKrEz3BMw
         nq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688415340; x=1691007340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwU6U03peid4uuDsGQ1dNshAh7m/oGA1lAGwHfg01NI=;
        b=J8uXDN6fHCxp12Aw4aLopsFE4z3CDdx2doI0w1l6Q6GtX0XjQLuUqmhDl7JEu8lg5X
         DHEqngDj7VVUkQIWfgMVEJCsQOcax85/xi/SJuehqZzcL1eVQJTkPoiLnfM/B4XX1HIC
         lnOu3WtwobE6cse7bRwlwhk2Ptl7vKzXYSnj37k/+5H8BAWXnBBWrn54P4/OSiiAOKWX
         u0Il4ZSiyHzcm1hKUvYEQ1xDbGP4IxtFpRTFMCSwXWMDrpEudSSjqrpICsvQuXug+rjS
         zROxJhfp/ox2/sXssm3DkDO76wM+X6F6iwu0XEoaGtU57Vbru6na8xKmNvuygKLruj/m
         M3Ew==
X-Gm-Message-State: ABy/qLZcWLNYJPMsisQ9Q842ECWvGn1zNKFkQXv2pqdLU0m5aHyJS5pt
        BD3NIpDK1qOnk0i/e5W0oewxAA==
X-Google-Smtp-Source: APBJJlE5FROkUFTv7yJiT+ZjaTRVzaVRKUq1xlZVtcgTPdX4SioWXVPsHNcozm0RMLXGvUdsekkOIg==
X-Received: by 2002:a05:6512:2510:b0:4f8:5c90:f8a4 with SMTP id be16-20020a056512251000b004f85c90f8a4mr8032438lfb.33.1688415340051;
        Mon, 03 Jul 2023 13:15:40 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id w27-20020a05651204db00b004fba7edc6cesm1991365lfq.7.2023.07.03.13.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 13:15:39 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 22:15:28 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8250: Add interconnects and
 power-domains to QUPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8250_qup_icc-v2-4-9ba0a9460be2@linaro.org>
References: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688415328; l=25779;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YRQPi1hslmnpu1uXKHQ5JExguT5Giv4sU0ntlbI/EFw=;
 b=ZnED6idKFZoxJkd52T8ZSbrNTUKX20GhYTjiHI3sldYVuOdgofz4yCv4GH1IrEGU4Rn+7DSES
 AWeagIwCTsmCQcq6PLaWAWrAmykYq9bimuVeYSpqHQ3JRRU/NZQI649
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 286 +++++++++++++++++++++++++++++++++++
 1 file changed, 286 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1efa07f2caff..5909f04c81de 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -370,6 +370,12 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 		};
 	};
 
+	qup_virt: interconnect-qup-virt {
+		compatible = "qcom,sm8250-qup-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
 	cpu0_opp_table: opp-table-cpu0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -1022,6 +1028,13 @@ i2c14: i2c@880000 {
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1038,6 +1051,12 @@ spi14: spi@880000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1054,6 +1073,13 @@ i2c15: i2c@884000 {
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1070,6 +1096,12 @@ spi15: spi@884000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1086,6 +1118,13 @@ i2c16: i2c@888000 {
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1102,6 +1141,12 @@ spi16: spi@888000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1118,6 +1163,13 @@ i2c17: i2c@88c000 {
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1134,6 +1186,12 @@ spi17: spi@88c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1149,6 +1207,10 @@ uart17: serial@88c000 {
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-core",
+						     "qup-config";
 				status = "disabled";
 			};
 
@@ -1163,6 +1225,13 @@ i2c18: i2c@890000 {
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1179,6 +1248,12 @@ spi18: spi@890000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1194,6 +1269,10 @@ uart18: serial@890000 {
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-core",
+						     "qup-config";
 				status = "disabled";
 			};
 
@@ -1208,6 +1287,13 @@ i2c19: i2c@894000 {
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1224,6 +1310,12 @@ spi19: spi@894000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_2 0 &qup_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_2 0>,
+						<&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1276,6 +1368,13 @@ i2c0: i2c@980000 {
 				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1292,6 +1391,12 @@ spi0: spi@980000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1308,6 +1413,13 @@ i2c1: i2c@984000 {
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1324,6 +1436,12 @@ spi1: spi@984000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1340,6 +1458,13 @@ i2c2: i2c@988000 {
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1356,6 +1481,12 @@ spi2: spi@988000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1371,6 +1502,10 @@ uart2: serial@988000 {
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config";
 				status = "disabled";
 			};
 
@@ -1385,6 +1520,13 @@ i2c3: i2c@98c000 {
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1401,6 +1543,12 @@ spi3: spi@98c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1417,6 +1565,13 @@ i2c4: i2c@990000 {
 				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1433,6 +1588,12 @@ spi4: spi@990000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1449,6 +1610,13 @@ i2c5: i2c@994000 {
 				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1465,6 +1633,12 @@ spi5: spi@994000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1481,6 +1655,13 @@ i2c6: i2c@998000 {
 				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1497,6 +1678,12 @@ spi6: spi@998000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1512,6 +1699,10 @@ uart6: serial@998000 {
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config";
 				status = "disabled";
 			};
 
@@ -1526,6 +1717,13 @@ i2c7: i2c@99c000 {
 				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1542,6 +1740,12 @@ spi7: spi@99c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>,
+						<&aggre2_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1591,6 +1795,13 @@ i2c8: i2c@a80000 {
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1607,6 +1818,12 @@ spi8: spi@a80000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1623,6 +1840,13 @@ i2c9: i2c@a84000 {
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1639,6 +1863,12 @@ spi9: spi@a84000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1655,6 +1885,13 @@ i2c10: i2c@a88000 {
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1671,6 +1908,12 @@ spi10: spi@a88000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1687,6 +1930,13 @@ i2c11: i2c@a8c000 {
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1703,6 +1953,12 @@ spi11: spi@a8c000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1719,6 +1975,13 @@ i2c12: i2c@a90000 {
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1735,6 +1998,12 @@ spi12: spi@a90000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1750,6 +2019,10 @@ uart12: serial@a90000 {
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core",
+						     "qup-config";
 				status = "disabled";
 			};
 
@@ -1764,6 +2037,13 @@ i2c13: i2c@a94000 {
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd SM8250_CX>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1780,6 +2060,12 @@ spi13: spi@a94000 {
 				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_1 0>,
+						<&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI_CH0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";

-- 
2.41.0

