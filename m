Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD5A2673F92
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 18:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjASRJT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 12:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjASRJS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 12:09:18 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBFD10A97
        for <linux-i2c@vger.kernel.org>; Thu, 19 Jan 2023 09:09:16 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e3so2493191wru.13
        for <linux-i2c@vger.kernel.org>; Thu, 19 Jan 2023 09:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=P65lYM/d/tq/Tl+523m0GHYdBPr1YEqPOFcgIGr7Fb3OmHUpAzkHxBwCvneoSkKqSA
         cN0C1PdoheStFj4oa4A9us8dMWFJn7V+qQYlsv37VHnvy1GYHeegrbBb0cBJ1c0kyVzm
         QCvRRVTGBRpngeUjZifN4H6yV9v0BpllFhZvtPnyMwPnPPjI76H5wBeVC6JlND4/YIQp
         GHn2y2tC18K5hsmJ/YGbBCbCLWg/wKzrdV5V2kR1EL9Z8mwfqxXhcTGYB8lOD4x6oGV6
         P6DNeaV4536ihL0rpi7B/3oCM2OY1hdr3f1tmb8ZjZm2tEA5cizIF3FwtEtHFHD9Phya
         uARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=a2KAvJUFikqpvS/wvGmZokWjZ6L1hzIqdgRVHpzMQDe8GE/TFYgOEzFIxX39a+LCzt
         ObiP2ZVEASrgLsYGBFFgtKK5lrmJTnIxwdmPQVZx2DP6GyZ7Rnl+L1438HBgUjbbnG+w
         V0BAevve/SYQE11MysArh2/b29grUdKsamEPoY7jNg9w5+ZWRjo0iDLOwOhIEh6OVN/0
         eMUJx3RSqg35oTUg62hjDEavDa0Vr6Iwv2ZTxAsGQebXTHNaTMFU9uNWl0rN6bFNvHqv
         JrYi1zD33DYgk8skYUoqn1anx/tSF+BIRfAWlydUeLFwLDHVeaHTdZ2req2a5zmYnHhe
         AXpg==
X-Gm-Message-State: AFqh2krsXWJXtAJnD252rtWc1kpMr5ZzzX0cibM8imYM5drcyur2Nd53
        CC0yiPGuYPPCvnHqtzaG59y16A==
X-Google-Smtp-Source: AMrXdXuVy8ToVBnQPqscQFHF/FAJ0rM3gQzJN+hV5KyJBH7B3bYj/kUMevWR4CjW9sGQCBIdSI7M8g==
X-Received: by 2002:adf:e841:0:b0:2bd:bf01:5c3 with SMTP id d1-20020adfe841000000b002bdbf0105c3mr10191130wrn.61.1674148155117;
        Thu, 19 Jan 2023 09:09:15 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id bu9-20020a056000078900b002be1dcb6efbsm8738701wrb.9.2023.01.19.09.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:09:14 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Thu, 19 Jan 2023 18:08:54 +0100
Subject: [PATCH v2 3/3] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v2-3-e4c7c514e781@baylibre.com>
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=VOgzUWYZ5LqJIocyR/msYYzp26C90wB0hqeJ/d6bEGk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyXk2ouw0TaK/YymL8/LwYG7zbgNsYWk7Sm4QaG1v
 Hq9eNMeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l5NgAKCRArRkmdfjHURZhID/
 9Uub2bUuBaf78i7z9ZyRrS0l1yJ8Bdey5zQzK/4aK8mPTm5Nl9fubCpzirBoXEG8bhSVJjvmZwyo1G
 RaJkZfkeBqgLOJKpWVHZNGWpoGrsrNBkJoWkhNvK2qfqsOrK1w2RIbO8lefpgWEyvDM3JRCEW/WDJc
 i0pj+XSJSlvga7oQPj9FmDe9blRKUlGJDJTa2RQvdpsD+RE+Cq2wK75i0s0+Qmi6JEW8QcWXLIroNv
 lgqeZRqvP4ZBHWeQ6zRF/u+lyUNHKnRR4jU9DIM5f7xBmwQT3rAEdrRck4Px0Peb8tBqrov38SNyq9
 A70WPxxZ8VFGSC1FkhuROcCV61CNyfxQSdAI9eKlmzav2RDqVbTjBSX+5jxcbLsd+gS2kS5rWWlFiE
 8psXIUQHk9FxSOt0knnWdNgq2oMQ9MkBrmh3xDVJVKkCzBm1DJ/89cXh+Ems3p1VUYNt3MHOXIDDeM
 1SQoV1em6g9NpHeegLBV1V/zKJ7D2+6avO1l9p2Ay8/4GZHtSOosLIQn2i0iT1mIgiXVZ3fFTv1SLK
 Ck+g+gNQ+/TN0hXC0qiPja3qxrwsuv1EnANH9SEJMt2OLgrXDyUV5yHWgRwmbBCWt/mfsh7+mbL31H
 80CefxZZyl5wX20zlkLw5zEso3Vz3EOdA4uXryCmzG3y74NAbfq2W1SSwkVw==
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
