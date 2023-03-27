Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10CDD6C9E3C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbjC0IlA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233149AbjC0Ikg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE4A49F0;
        Mon, 27 Mar 2023 01:37:06 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4126E66030B4;
        Mon, 27 Mar 2023 09:37:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906225;
        bh=cWKkAzJmflHlylToMK1QImQEca35moH/Qy5BEXPVfYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z0UUfqMfoH2RhoduOVgrRDM1Gjd3a65hdZZrGOBTM6XPqU034WH+nbMMNJl0PtODg
         qQO2ldujlqsVGsrQyk1BCZZp0nh5wjf7P4SS1IYZYp13EKhvLu6U4Jsd2xT7ZNGfnI
         LAkicKM0eIKxgz0VShN4SWv9DVPWJr0fF+UWQWrqj75z/Ore7+Uin3tPvPmiwmduNf
         gRSZWHeqwqXjxy7UcHxfLtYRBRGz6ZRMIx0UBB3x8KndOsfkDZwSaFxDkwB3I6hEw5
         k3qp/sX+xpaoLHytlr6VdfDlOyoT/qP5cJtOiC3rPfXY2VLFuEXo/BRmfB+yNs2kz7
         cC3redVmyKFOg==
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
Subject: [PATCH v2 12/17] arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
Date:   Mon, 27 Mar 2023 10:36:42 +0200
Message-Id: <20230327083647.22017-13-angelogioacchino.delregno@collabora.com>
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

