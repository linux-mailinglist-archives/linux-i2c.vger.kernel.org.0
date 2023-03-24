Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B2A6C8406
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjCXR5n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjCXR5P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:57:15 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B3C1CBD3;
        Fri, 24 Mar 2023 10:56:51 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 17F85660314B;
        Fri, 24 Mar 2023 17:55:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680515;
        bh=7QwlmzO687lgIQQgZpeWHJxJZ30x74RVdHCWiqIGrHY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b3SeICoNVCF8VmX+gw0g9JPvjE+XkavnqV6IFsRoaY8RsW9cPWMaSBl81k6foPP6T
         9i9CG4wJyxLkr/hyeF4ki7FYCDPdMWjPPoxdtXfoH+Zi7Ol1P/y0hrMZrNYy56xCtV
         dUXAU1vsokiT5i6m76iRPWoulXeeoab4GJ5FzL9CzMulROxdcWwG5nZLGb+YJw0/W6
         16s9R1uanDcGRoJ3JnlrxFDtqEB2OqcQpRga0mx4aRBA/tx7puwtqBl6u+yA+XphNZ
         tH7vO+22UTf4pgMlCJQzGe+i+587patL+SgkeiwEVhw00tHpBH2k3YWIZxG3bZpRfY
         R3uGyz5Td+5FA==
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
Subject: [PATCH v1 17/18] arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310 Proximity
Date:   Fri, 24 Mar 2023 18:54:55 +0100
Message-Id: <20230324175456.219954-18-angelogioacchino.delregno@collabora.com>
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

Add the STK3310 Proximity sensor and its pins.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index bda14c74a8af..bff0760cc1c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -111,6 +111,14 @@ magnetometer@0x12 {
 		compatible = "bosch,bmm150";
 		reg = <0x12>;
 	};
+
+	proximity@48 {
+		compatible = "sensortek,stk3310";
+		reg = <0x48>;
+		interrupts-extended = <&pio 8 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&proximity_pins>;
+	};
 };
 
 &pio {
@@ -127,6 +135,14 @@ pins-rst {
 		};
 	};
 
+	proximity_pins: proximity-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO8__FUNC_GPIO8>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	accel_pins: accelerometer-pins {
 		pins-irq {
 			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
-- 
2.40.0

