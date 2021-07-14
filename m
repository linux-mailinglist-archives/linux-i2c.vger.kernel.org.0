Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387933C851F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 15:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239284AbhGNNXA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 09:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhGNNW7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 09:22:59 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FDAC061762
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 06:20:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by baptiste.telenet-ops.be with bizsmtp
        id V1L52500c1ccfby011L5J1; Wed, 14 Jul 2021 15:20:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo1-00193w-Hd; Wed, 14 Jul 2021 15:20:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo0-00Aapx-TF; Wed, 14 Jul 2021 15:20:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/4] arm64: dts: renesas: r9a07g044: Add I2C interrupt-names
Date:   Wed, 14 Jul 2021 15:20:02 +0200
Message-Id: <d35ba11bd705e3c728f94ff0414ac6ae1156244f.1626267422.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626267422.git.geert+renesas@glider.be>
References: <cover.1626267422.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add "interrupt-names" properties to the I2C device nodes, to make it
easier to review the interrupt mappings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 9a7489dc70d10882..0dd181739fdfc0f6 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -102,6 +102,8 @@ i2c0: i2c@10058000 {
 				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD R9A07G044_I2C0_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G044_I2C0_MRST>;
@@ -122,6 +124,8 @@ i2c1: i2c@10058400 {
 				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD R9A07G044_I2C1_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G044_I2C1_MRST>;
@@ -142,6 +146,8 @@ i2c2: i2c@10058800 {
 				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD R9A07G044_I2C2_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G044_I2C2_MRST>;
@@ -162,6 +168,8 @@ i2c3: i2c@10058c00 {
 				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD R9A07G044_I2C3_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G044_I2C3_MRST>;
-- 
2.25.1

