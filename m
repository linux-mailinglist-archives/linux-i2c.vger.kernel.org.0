Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E4266D8A0
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 09:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbjAQIuK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 03:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235997AbjAQIt7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 03:49:59 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDE9233D9
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:57 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id h12-20020a05600c314c00b003da50afcb33so5304071wmo.4
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=AZ8IcZTPMXsufFN2kXO3HRi0ZvdFnnGQ2th1Ro9B226rdQQ9Xel2dmYM/oQFtw7oNK
         vpKamG8ugf9p9+/xOGR2r1aaHyM5yBTGRSjMXlGQdyqHRRwSpURDHqjtpQAf3rULEo8+
         j8j/QezFDU6aFt0dKO3/CWdYa7wKaZBfaRVFDjagWtWYsQoHglP/3ZMpRGurpy8JwimG
         WiPJaD6IIDRt1Ok/7mkDQJye4rXHCzTYKIdL7nvDFm2tWMYoap9OBGUlZLFumPLJ+8Ge
         xFxnHiBDcmIEONVN1/Ig8MeUGsL8G/kcEL7txjup5DjRTLNQM3Lbe2eJhiPdFEDEJvfR
         0S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=Q2kyocBvKMleyUg0uUstUJNdqjfWuloQ6ZUmMwAtKNxhG5BlgVIi60fTZXhDN65D2m
         BZzSLXLWd9Ub2zVqu6Be8R2MeHuLLyPor3/ETC2Y1erxcUxTM/xnu5hMD4nwhkG6nGfb
         awhawqMmnyuIwj9VDT/Rq0lfw+gM4V0gres+EVAgqUtSnOI1qgWk705iE147MiqVd99L
         xPSF0ge1lYyQ+KVrq3NcpCzJ3GvcE3UC6CKsBIPCrbtfzETi+PZa4zS/BXjMozZgQjJJ
         G4kfDv6Ss04bUltNtKL+XrixEN7tO2LFCjKRx27vulUv+HSVj2H5oPDXOcs9uto0v0y0
         8xcw==
X-Gm-Message-State: AFqh2kojy/JGzyp6uFhcJ/Z2AIQkku/CrDs23zZQZJzAxUUNvkKfwEqX
        930p7nGqfRauVH2JhE89XfkSVEz4V298kqTB
X-Google-Smtp-Source: AMrXdXvZ3Mbz7cXl2jBywRBW+mzQr4zX495ZTEUrU3W0d/jp9rOsVcaRFJTSMHg1lquwMfnKi2lI6w==
X-Received: by 2002:a05:600c:511f:b0:3d0:bd9:edd4 with SMTP id o31-20020a05600c511f00b003d00bd9edd4mr2266161wms.0.1673945395322;
        Tue, 17 Jan 2023 00:49:55 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:54 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 17 Jan 2023 09:49:41 +0100
Subject: [PATCH 3/4] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v1-3-4aeb7c54c67b@baylibre.com>
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=VOgzUWYZ5LqJIocyR/msYYzp26C90wB0hqeJ/d6bEGk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEu/1ATFrLnz4wZ5FHf5BjXYBtuHu6+qKyasU1/
 oquOHiOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURRfJEA
 Cc8GST/9irlHGIql2YtIHfbd9HQu1ah91IpB36SZWBJ1g9wwyeKf717wTh56hqNAk1XtGyWlCWaKUg
 dqIYRlZUB3HgoB0Mp6rgZLakIRV8+Nuz2GrLGcOqfRJDK8qUIQRY8WFHC38AbnQ+aqOkXsWqcRBbPu
 UnNJ6rR93Wzz4HuEQBx/PfZObcu/XlPvZgQ8zVvbbkDsvjm6viTW7RSEW1Epqrg2d3tgD7f7VzZhUP
 47+m5NgJRAiy/2gp3hyn6OE9w5TfRm1fQ8TThmZRTusk/bmozRM5N4wDuQqcmxRumio69SCQDjyc09
 XkQ8fPIp0fA8Yc0T+b19ftVXI/FEoTrOvUYvYoF6FFb3yfGZPrsfuWGRA38IEXVTH7KP0YZsYFajQQ
 G9UJtyrFB/ray4flboMovBDwOkdoUGflFSf/dPhTF3RlvxBVhzCGH23BsZHClZcoVpKHowuljXTws4
 TWdqBz/Uq4gE41F9a3DUzMH8tbejAgu5Kcvb4FlIMPOuBkERVVb/jaWcXnjsG1aOlmu7NbIE7OtgJ5
 OJrzLRYCZq5BF6cKyxtEL5/KCYwt7MA958VDbeR5phILWFgh7tTnh0P5ilQvRgrbFVoS5hwKvEuW2d
 TpjzBvM+1lYxsEadLGbHFyVT53ay0BQSFGlhw4HlxvoFj6K3jCUahD9T4Mdw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 275ea3a0e708..d5d76a7dbd82 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,15 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {
@@ -97,6 +106,16 @@ pins {
 		};
 	};
 
+	i2c0_pins: i2c0 {
+		pins_i2c {
+			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
+				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
+			mediatek,pull-up-adv = <3>;
+			mediatek,drive-strength-adv = <00>;
+			bias-pull-up;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
b4 0.10.1
