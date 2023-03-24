Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0C096C8468
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 19:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbjCXSD7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 14:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjCXSC1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 14:02:27 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B5A18AAC;
        Fri, 24 Mar 2023 11:02:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 373046603149;
        Fri, 24 Mar 2023 17:55:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680514;
        bh=/T9WmBbua2oCTw4GMfNhun8IUtdf0uXbZIh9+7jUzSk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KVERgUP5/zEPGkUnlFHSCczSQhqJ2ushyYTycvVgxC+XOUfV21uuNMTrh3HaQdIRU
         il90KXUEy1Xufgx/Lm247MqI69OAeQDcxMSpVcRXRHT9zD56I2XPgTHWv+ew1owt5a
         8CXGqHYeh1I1U7DN1VLXg8JIaWsrMBqdwoHVI/patj0FrcIJpBOFUMmjdtESo3IJMt
         Coyl9SN+nFk+3y+5Bxs3Hr2DJOpOWBkJ9qX5+idJIZscBZ33mJhTEJgSQPSAZztSVz
         n00zKTB1RrbanwEwOaYZPz08ypRPFtPtcTVEnYpGh2pk14tUN/u0QDog03BKMHRVn2
         uK3ch3Kx85bxQ==
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
Subject: [PATCH v1 16/18] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer
Date:   Fri, 24 Mar 2023 18:54:54 +0100
Message-Id: <20230324175456.219954-17-angelogioacchino.delregno@collabora.com>
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

This smartphone features a Bosch BMM050 Magnetometer on I2C3: enable
it with the BMM150 binding, as that driver supports BMM050 as well.
For this sensor, there is no interrupt pin;
readings were validated in sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 54a1f7f306f7..bda14c74a8af 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -106,6 +106,11 @@ accelerometer@0x10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&accel_pins>;
 	};
+
+	magnetometer@0x12 {
+		compatible = "bosch,bmm150";
+		reg = <0x12>;
+	};
 };
 
 &pio {
-- 
2.40.0

