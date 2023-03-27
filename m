Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D68F6C9E3A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbjC0Ik7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbjC0Ikg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14088659F;
        Mon, 27 Mar 2023 01:37:07 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E5A366030DD;
        Mon, 27 Mar 2023 09:37:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906226;
        bh=Hpg+2kX8cSdZxnfmoRo906qfV2RYRZo5yI+72ONjdQY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FAw0FkcvKRQq7SxMAUHNCsdj/Xi9VXqhIMNLXbL0I1aMoIQFFEu4oH8lXmvdGpTOq
         N3bIawz0SMfPVyzPYWB1kQBMhciex90bwii9r46fjeG1F2ZNhM0oRB6ZBYrWryEKY/
         YA9yE3PcNqfKoA7kiNt47TLoxHieCsgUmQ02TIwbsKV5iE3PY9iyZNvF0AdzdLvnZm
         jyMyM8vUb2UYMaqMkvQatG7STuhbjGKn2R9cDTsP2pJhcdW6ebr+YZhA8tWZUXtYpR
         Hubnz2bE97PUqE+Wcsh4FZxZnPVJNDQJmjJtFuJ8RisAdlae/WV/3u/9KbDY8EuwWE
         CwAw97wTtXPzw==
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
Subject: [PATCH v2 13/17] arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
Date:   Mon, 27 Mar 2023 10:36:43 +0200
Message-Id: <20230327083647.22017-14-angelogioacchino.delregno@collabora.com>
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

