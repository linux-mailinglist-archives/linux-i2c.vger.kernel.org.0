Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A866C9E42
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjC0IlE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbjC0Ikg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EAF34C0B;
        Mon, 27 Mar 2023 01:37:03 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 65F93660312B;
        Mon, 27 Mar 2023 09:37:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906222;
        bh=B7Q7CvpVnU7TsRYDdxFDdSefgx35z35TKL9n9ACkUg0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vpeh3mTAKR3/91/MvTtBXsgMh3DpUAZnX4a9ErZJJZEWJ5RYbglwR/M6/RHj0MAKR
         J2gi5nWNqGdAZ7DKXhNK+opYgVdl3dgzkN7Vz0NZ7Se1RMuAW2jXISS3XDXq5bS4LS
         4oqG59B/WrFiXxUEOlpfKfuuq/RzpJdEFUQvEI0cwtnabHnlFDnLa3iMygQKFuWLdw
         vnwBkmB1LaRnb1G+Ciri9qCfrJCnN7onhRih4dQzR7209Dd1MrZIs8DvnqBI4eDQfQ
         tQJnZTjm/9KoYJGFZ5X9O9LmsQApAgHjOI7s2tmJWepG2u3JlR+CBKm/PEFRs0gE0E
         lGUPQhIuuhYQg==
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
Subject: [PATCH v2 09/17] arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
Date:   Mon, 27 Mar 2023 10:36:39 +0200
Message-Id: <20230327083647.22017-10-angelogioacchino.delregno@collabora.com>
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

Add the MultiMedia System node, providing clocks for the multimedia
hardware blocks and their IOMMU/SMIs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 0f903e8fe70f..b721971d4e5e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -634,5 +634,18 @@ mmc3: mmc@11260000 {
 			clock-names = "source", "hclk";
 			status = "disabled";
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt6795-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+			assigned-clock-rates = <400000000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+		};
 	};
 };
-- 
2.40.0

