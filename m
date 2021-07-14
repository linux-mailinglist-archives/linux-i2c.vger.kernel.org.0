Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E063C8525
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 15:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhGNNXA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 09:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhGNNW7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 09:22:59 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D8FC061764
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 06:20:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by andre.telenet-ops.be with bizsmtp
        id V1L52500Z1ccfby011L5T8; Wed, 14 Jul 2021 15:20:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo1-00193v-9c; Wed, 14 Jul 2021 15:20:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo0-00Aapp-SH; Wed, 14 Jul 2021 15:20:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/4] ARM: dts: rza: Add I2C interrupt-names
Date:   Wed, 14 Jul 2021 15:20:01 +0200
Message-Id: <7a073439e37f6672e4809af0a2ee9cd4ac820ec6.1626267422.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626267422.git.geert+renesas@glider.be>
References: <cover.1626267422.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add "interrupt-names" properties to the I2C device nodes of the RZ/A1H
and RZ/A2M DTS files, to make it easier to review the interrupt mappings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100.dtsi | 8 ++++++++
 arch/arm/boot/dts/r7s9210.dtsi  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 45cf75b5824cbe7f..b07b71307f24ad59 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -608,6 +608,8 @@ i2c0: i2c@fcfee000 {
 				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&mstp9_clks R7S72100_CLK_I2C0>;
 			clock-frequency = <100000>;
 			power-domains = <&cpg_clocks>;
@@ -627,6 +629,8 @@ i2c1: i2c@fcfee400 {
 				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&mstp9_clks R7S72100_CLK_I2C1>;
 			clock-frequency = <100000>;
 			power-domains = <&cpg_clocks>;
@@ -646,6 +650,8 @@ i2c2: i2c@fcfee800 {
 				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&mstp9_clks R7S72100_CLK_I2C2>;
 			clock-frequency = <100000>;
 			power-domains = <&cpg_clocks>;
@@ -665,6 +671,8 @@ i2c3: i2c@fcfeec00 {
 				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&mstp9_clks R7S72100_CLK_I2C3>;
 			clock-frequency = <100000>;
 			power-domains = <&cpg_clocks>;
diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 85c0399b1339585b..fdeb0bc12cb794d6 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -236,6 +236,8 @@ i2c0: i2c@e803a000 {
 				     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 87>;
 			power-domains = <&cpg>;
 			clock-frequency = <100000>;
@@ -255,6 +257,8 @@ i2c1: i2c@e803a400 {
 				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 86>;
 			power-domains = <&cpg>;
 			clock-frequency = <100000>;
@@ -274,6 +278,8 @@ i2c2: i2c@e803a800 {
 				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 85>;
 			power-domains = <&cpg>;
 			clock-frequency = <100000>;
@@ -293,6 +299,8 @@ i2c3: i2c@e803ac00 {
 				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 84>;
 			power-domains = <&cpg>;
 			clock-frequency = <100000>;
-- 
2.25.1

