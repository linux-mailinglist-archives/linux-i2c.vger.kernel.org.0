Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8B86C83FB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbjCXR5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbjCXR4n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:56:43 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F88A9034;
        Fri, 24 Mar 2023 10:56:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 997DF660313A;
        Fri, 24 Mar 2023 17:55:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680512;
        bh=cWKkAzJmflHlylToMK1QImQEca35moH/Qy5BEXPVfYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i9xkCyeWIsLtYEjjp94iVfDR4aC8F0rHjKCupNZfUdossrimrGdGe5MNC+DlYv3+L
         nH//JL767JRXZyx8FxlyNjKbvy2LVwMNagkbC0aazJBVfiOFEAf32Aakwr9t+DOG6Z
         bj6JfIpqtP0tR9sD1pn1midXV72TC7uMGP95TihQV5QwyZUGVA6KxaC3vqpZbLtszd
         onXiuu8YE/gr0yD43danNu4JdPmim/GOdwiWgY0pn5voVxq4iqNw1aA64tZT4L9lgs
         O/MNYGxiemM57/1oYT2PGfjukB+KhRzgk02nbF8sTt93DFblr5Qxxo0J0lIcE+K7Is
         uQoZEgvOr1P/Q==
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
Subject: [PATCH v1 13/18] arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
Date:   Fri, 24 Mar 2023 18:54:51 +0100
Message-Id: <20230324175456.219954-14-angelogioacchino.delregno@collabora.com>
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

Properly configure and enable the three i2c controllers that have
devices attached on the Sony Xperia M5 smartphone.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 52ce3284a46f..6df1c848e2d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -55,7 +55,71 @@ &fhctl {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+};
+
 &pio {
+	i2c0_pins: i2c0-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
+				 <PINMUX_GPIO46__FUNC_SCL0>;
+			input-enable;
+		};
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO125__FUNC_SDA1>,
+				 <PINMUX_GPIO126__FUNC_SCL1>;
+			bias-disable;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO43__FUNC_SDA2>,
+				 <PINMUX_GPIO44__FUNC_SCL2>;
+			bias-disable;
+		};
+	};
+
+	i2c3_pins: i2c3-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO136__FUNC_SDA3>,
+				 <PINMUX_GPIO137__FUNC_SCL3>;
+			bias-disable;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO100__FUNC_SDA4>,
+				 <PINMUX_GPIO101__FUNC_SCL4>;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-rx {
 			pinmux = <PINMUX_GPIO113__FUNC_URXD0>;
-- 
2.40.0

