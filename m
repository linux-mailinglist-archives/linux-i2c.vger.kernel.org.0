Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE306C9E2F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbjC0Ikz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjC0Ikh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:37 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6234C10;
        Mon, 27 Mar 2023 01:37:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id F17726603100;
        Mon, 27 Mar 2023 09:37:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906229;
        bh=ucKptTRH40q7Kj2bw2zloSjqxJ0pG6yGrjzKJ5KlYwU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dh3DyE+D44Hnu3lYslkkV836PvJsUsswIKehfJ4XsNcNoMbBl7ZvgCDmo47pxkbCl
         8B++vRrrhvIGdQTs1efvrFpxT32Zg1KImKqVuk+am61tMyfE1SIUfBcTIN01iROXXL
         iS2kG6A7avLyaeWV835WfssRgVn+PzSw0+XwhwiFJ+btHl4O/+ts40QsKBKvEjSFV2
         X+1sXLOVLb5cICwYgG+9PD0eh4HVgStG9BLe5Tklejqql81HUDaR3OM4YPoLjDvue2
         iVIlcDbbeYWLYr6EgoTbI9nsCAYChLOtYrW5eAB+ODl2Lpqzy9FMv7OL0a7hsvouT4
         XGuZOCcz/w3vw==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 17/17] arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3
Date:   Mon, 27 Mar 2023 10:36:47 +0200
Message-Id: <20230327083647.22017-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the NXP PN547 NFC chip found on this smartphone and
configure its pins.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index bff0760cc1c8..8f00232e7348 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -5,6 +5,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "mt6795.dtsi"
 
 / {
@@ -112,6 +113,16 @@ magnetometer@0x12 {
 		reg = <0x12>;
 	};
 
+	pn547: nfc@28 {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x28>;
+		interrupts-extended = <&pio 3 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&nfc_pins>;
+		enable-gpios = <&pio 149 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&pio 94 GPIO_ACTIVE_HIGH>;
+	};
+
 	proximity@48 {
 		compatible = "sensortek,stk3310";
 		reg = <0x48>;
@@ -122,6 +133,19 @@ proximity@48 {
 };
 
 &pio {
+	nfc_pins: nfc-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO3__FUNC_GPIO3>;
+			bias-pull-down;
+			input-enable;
+		};
+
+		pins-fw-ven {
+			pinmux = <PINMUX_GPIO94__FUNC_GPIO94>,
+				 <PINMUX_GPIO149__FUNC_GPIO149>;
+		};
+	};
+
 	ts_pins: touchscreen-pins {
 		pins-irq {
 			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
-- 
2.40.0

