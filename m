Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14A1B6ADEF7
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 13:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjCGMl2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 07:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjCGMlW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 07:41:22 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665A17C3FF
        for <linux-i2c@vger.kernel.org>; Tue,  7 Mar 2023 04:41:19 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bw19so11943164wrb.13
        for <linux-i2c@vger.kernel.org>; Tue, 07 Mar 2023 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678192877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da3gycm9GaSOTxM2r6GKDW6btSTz1Fl+GtonHRy4OIs=;
        b=CeuK0gBWMnnVxKXxuaS4TbHqVvqx/XcRViY6Ab8AN5ulApgZO1xLbviliDSE8SggCv
         0oROsCCoztpy4OEIaM453xTfC+EaR6i6iWS+mzmQBhKyWMgaliV3Heff6IujzglBKc2d
         mpP0OgwLpfktzGbumYthAreBwgMeplwXW6dih2aPW13Bmi7Bg5hW9GMyFBuKKEzhUfrp
         WhIA+AJBhV4aRgMXikn4aEY96bWjucyydAZWpKz33v6QcC4MI0LsglG7EkX0JaLVbwjx
         /o5Wy6x0NNQAURfDWBOdjG6HznTOR31Gza8TyI7VHMWpBtWTuIGqcHga1x7bDUANvEZZ
         qpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da3gycm9GaSOTxM2r6GKDW6btSTz1Fl+GtonHRy4OIs=;
        b=U8nXYi/rjs/mYHogW+gZEbXVu0Jt40Ho+iD6EmFU3zxQAY517xv1dljJ+SLgSbCIxl
         iJ62hUCAkAc1/04OpLWij6xgKzsOFMOWVlz0hNKxllowN+ySZEKrpyAk1OUY0AezsSGU
         m8I2XjzF8ZeTDg/yMtShjVq2XPiZBWpkCc9hhzw72ryZsIqK5KesGFDNOno7+CdSFgsf
         mjb7l8SN1UO5z3uiuHVPmJhfbMucw15n0Mu0HlW2xnUtOhrjnFYv53vdpq1f/kKst52o
         QFRI98L/hsBK/q14ixJcFow6J2tDtpX4LMI0dYM1chQewWSoXX4/jSzcxWdzDJaeiu5H
         LtqQ==
X-Gm-Message-State: AO0yUKXli2tyJTsx8xUP5CqToDPc4fv17AU1LYVZ/S79ca1oYY5+XqEk
        8z9cwFWj9eEjCgbvPCw1m5Mp4g==
X-Google-Smtp-Source: AK7set8ho3AE5slu0eVuVQjsVB3HmQggDT+fS0otKyV+eMbPIkDH2/8BRv6LrVQf2lZZpiaBnlISXQ==
X-Received: by 2002:a5d:4ec5:0:b0:2c7:1e32:f7ff with SMTP id s5-20020a5d4ec5000000b002c71e32f7ffmr8350736wrv.16.1678192877556;
        Tue, 07 Mar 2023 04:41:17 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w9-20020a05600018c900b002c5a1bd5280sm12434670wrq.95.2023.03.07.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:41:17 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 07 Mar 2023 13:41:08 +0100
Subject: [PATCH v4 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v4-2-885ad3301d5a@baylibre.com>
References: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/2/cjSO2mF7U+slihZOD76PFWiM0Jv1Qz+ElLd/bOnw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzDqcQGDX7mF+2FUnSGPLDJyNAnKOn4NaJfOwzgl
 MmtGUVSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcw6gAKCRArRkmdfjHURYkYD/
 9KfGHtkTIXYn298xwf9hQ8ovbQgNJm4iLoD0gTwEbNJbtAQWcm+pf/kgA5UzVtT6LolXsRv6xkDDFg
 HtHgOj/0G6IQrF9O3BuUX7c1MW5ynG/CTjXxf/uYzlDG95t7NAQIxy7MzHKMlDur6zTNmVrks7GI5z
 s9EDsvMqQx1j+LBOv1Jj0Moq6vzCXrP4+LucyqXzSg7hMmXn7mRFalNAd+TJpN295ZFwwmL3Qg3EQs
 UnAuqUywmHwMWYxwRm9fFKutfibO2LvXfmQOs1Mgo+9NpQfuQxmtenzmqwqcvAyW0qhU/Ai8GFd5Wz
 w9/2JIXAN4K3kquecBWSkFZNGfux0VlX63Womo8TbX1mDWq3TNvNeH5g7mdqKdkccBF8XU2F7K/+5L
 3s/7x3JaCafJg1A/ckS5I1+eeDleUiHGtk5ZNYYEWNTMJdi64+G3bhL6OeU1DZdCx/ACZJv+Qgn4ta
 HMdFJgqwFGG3qnM0TxbgjGoGFtYn1E1Y8DI1BNhHugJHGg/Em9usE2p/nZxShBJrRbM7VGxaMWb5Wh
 2UsHNmnXEA8Qnu+FIL/w4Bi4o6PQw+AVgHrBxdDRscOaCeMd6axkQWAmFEsTSCiG7cMtwj+oAcSlI7
 IYdbwUpMSrB7sIeFan52LlY4xfCjYz/+APqYAGG9BpSyF31DoOnVHpqvrHAg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable the I2C0 bus provides communication with:
- The integrated RT9466 Switching Battery Charger.
- The integrated MT6691 LP4X buck for VDDQ.
- The integrated MT6691 LP4X buck for VDD2.
- The pin header, to plug external I2C devices.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 4683704ea235..bfaee9a4a38b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {
@@ -96,6 +103,16 @@ pins {
 		};
 	};
 
+	i2c0_pins: i2c0-pins {
+		pins {
+			bias-pull-up;
+			mediatek,drive-strength-adv = <0>;
+			mediatek,pull-up-adv = <3>;
+			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
+				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
b4 0.10.1
