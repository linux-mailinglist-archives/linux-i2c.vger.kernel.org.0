Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA596C840A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjCXR5q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbjCXR5P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:57:15 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F5920D0B;
        Fri, 24 Mar 2023 10:56:50 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 575636603141;
        Fri, 24 Mar 2023 17:55:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680514;
        bh=M2x6XrfKatUDNCzi+SX1mFtgO/Okir8+l/Hd5u8MM30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q5Qwgsjg8AYINobxCuKGoobK7lgFqgVaO38HO0RpzrQMMGsCSJU7V2uWZ+hmnUD1J
         FDZFWN+8QZG/wU5QpuUNJ6avrHh/he9KPWRk/hwSfCw0PrhIku7xz0MrpvUpJhrW4/
         5hfgekhpTF4rJUgtOwoM8dqYJHZzUxgcEXeVTRIhDBYmOohJeQe9fsFjCIz0oOBQzZ
         ZvBSJ+1OaLfU2LdHFUcIvaxOuD0RSjfKarwpNG4AAzYaEyz6+9DwRNURVCrQB3d3Uf
         jhWviIH9vyMFyyYRrpPJ4hvX5Rvzx8SiUdH0B7Ab0znN70mBztpP+9gcy4XVqcGoXW
         Ti5hpG/O9fw1g==
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
Subject: [PATCH v1 15/18] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
Date:   Fri, 24 Mar 2023 18:54:53 +0100
Message-Id: <20230324175456.219954-16-angelogioacchino.delregno@collabora.com>
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

Add the BMA255 Accelerometer on I2C3 and its pin definitions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index edab90f06a24..54a1f7f306f7 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -99,6 +99,13 @@ &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
 	status = "okay";
+
+	accelerometer@0x10 {
+		compatible = "bosch,bma255";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_pins>;
+	};
 };
 
 &pio {
@@ -115,6 +122,14 @@ pins-rst {
 		};
 	};
 
+	accel_pins: accelerometer-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-- 
2.40.0

