Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EBF6C9E4A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjC0IlI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbjC0Ike (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971D635A9;
        Mon, 27 Mar 2023 01:36:57 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AA06966030DA;
        Mon, 27 Mar 2023 09:36:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906216;
        bh=WzRAN9wdA273tqZEI1XBRQYQ34kkvCmE+TRLQXkcUfI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KtrLlYCBHpTkJoPbpSiqdiv1eWgoXbGH6ejgegbEdZ8g1+eXFuuQwPUUcwv2zpaw+
         avQ2umUGre0wutECVyiHYYq1JMshDVuiFgSz8/WwWpGD7WKCXab+2zXfbUjMW1eXWP
         iUE1n2rNU8Oa/3js7vpBzMZqePlrh20ETm9og2MlI4V3Zuen9LbeKEsZHZe4S/+Vux
         aLS7vaBIZLxhc5b/qBIOPf5WI+5TbDanCacPV5tszT2KvY8Z79NGUz+OAk5efP7d36
         cff2oS+/7FAA8Ea7hV6UjVpTW6+G4BzPuSbQM4if8pLeO/OK8qa/RdhP7LzGAwB9FD
         iqPbPXaL9KSAg==
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
Subject: [PATCH v2 03/17] arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
Date:   Mon, 27 Mar 2023 10:36:33 +0200
Message-Id: <20230327083647.22017-4-angelogioacchino.delregno@collabora.com>
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

Enable FHCTL with Spread Spectrum for MAINPLL, MPLL and MSDCPLL
as found on the downstream kernel for this smartphone.
Which one to enable, and at what SSC percentage, was found by
dumping the debugging data from a running downstream kernel and
checking the downstream code.

/proc/freqhopping # cat status
FH status:
===============================================
id == fh_status == pll_status == setting_id == curr_freq == user_defined
 0           0             1             0      1599000         0
 1           0             1             0      1716000         0
 2           1             1             2      1092000         0
 3           1             1             2      2912000         0
 4           1             0             2      1600000         0
 5           0             0             0            0         0
 6           0             1             0      1518002         0
 7           0             0             0            0         0
 8           0             0             0            0         0

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index d3415527d389..52ce3284a46f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -48,6 +48,13 @@ bootloader-region@46000000 {
 	};
 };
 
+&fhctl {
+	clocks = <&apmixedsys CLK_APMIXED_MAINPLL>, <&apmixedsys CLK_APMIXED_MPLL>,
+		 <&apmixedsys CLK_APMIXED_MSDCPLL>;
+	mediatek,hopping-ssc-percent = <8>, <5>, <8>;
+	status = "okay";
+};
+
 &pio {
 	uart0_pins: uart0-pins {
 		pins-rx {
-- 
2.40.0

