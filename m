Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700CD6C840D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbjCXR5s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232282AbjCXR5b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:57:31 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8BE1C7EC;
        Fri, 24 Mar 2023 10:57:04 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7BD32660313C;
        Fri, 24 Mar 2023 17:55:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680513;
        bh=Hpg+2kX8cSdZxnfmoRo906qfV2RYRZo5yI+72ONjdQY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hc1SbaE15e0nfIfp+jakGfugpThPB+sQ+MVoqTPe1qf4N1onowX6j3HX4jMB0ZIZS
         0lN4XpGqHaWAaokP/KyGsa0HN6BN+8dJw79D1Y8VZONgCEEkwnInf1oaZIcGi/b84D
         JRYiRNPF76Sg/4GMYLFV3y/7Q/RfWjlhC7wmHX195J4YqmQmUkyAsb7ixRjIlyJwyl
         xcVd7e3KuDeSCURTtfw14FUdBHpzY7fBUg+HcNBbD8uin4nmArSE7NkA2A0YSqozOe
         awZamWwvR0SgMjGImSEv4lmEr0/iC3wg9WserV/FFtYZdjLjdpMmvFRq4uzRU5J9bW
         V4HrFMq515EwA==
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
Subject: [PATCH v1 14/18] arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
Date:   Fri, 24 Mar 2023 18:54:52 +0100
Message-Id: <20230324175456.219954-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
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

Add the RMI4 Touchscreen on I2C2 and its pin definitions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 6df1c848e2d5..edab90f06a24 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -71,6 +71,28 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts-extended = <&pio 6 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_pins>;
+		syna,startup-delay-ms = <160>;
+		syna,reset-delay-ms = <90>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+		};
+	};
 };
 
 &i2c3 {
@@ -80,6 +102,19 @@ &i2c3 {
 };
 
 &pio {
+	ts_pins: touchscreen-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
+			bias-pull-up;
+			input-enable;
+		};
+
+		pins-rst {
+			pinmux = <PINMUX_GPIO102__FUNC_GPIO102>;
+			output-high;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-- 
2.40.0

