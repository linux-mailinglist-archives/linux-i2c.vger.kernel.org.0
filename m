Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4936C9E4D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbjC0IlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbjC0Ike (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B119235A2;
        Mon, 27 Mar 2023 01:36:56 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B5F5E660308B;
        Mon, 27 Mar 2023 09:36:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906215;
        bh=NomHwJjqmoIPLlLZ3+9R0/l6R9Kvr/DrQn2Y01kmsNU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aKvdW67m47+IyhI0RzD0fa3Bs0TAWLxFlgyzU04BCqOx4zfcs5RKILed7DOh+Bm/B
         O3I5aMLMAnqeMtYBsMP300/IyAWrKOvoVXzBOli7N4MNXHDTVXlDwsGkh/wJnI6qZX
         N9gMFS2SjSChYOy+nCZ5r3zi5wPqHW2bl9g6zjVrsLBg/+sgS7ji0/TI7+j7QkRVki
         rxNiywvQhaeCjA1Sby+cQWty4r4BLtuFgcvz+cyxdPpbfpRVbD/aDfq7/vc35QQecb
         dwwRc5CwDDDWoHmtlcaaerfJQbiFxUE3Q65uqaWdtuk9JOBiFLrGCCeOl0whshwHNZ
         LrWH64shgjvRw==
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
Subject: [PATCH v2 02/17] arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
Date:   Mon, 27 Mar 2023 10:36:32 +0200
Message-Id: <20230327083647.22017-3-angelogioacchino.delregno@collabora.com>
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

Add the APMIXEDSYS node, providing a syscon to the APMIXED iospace and
also providing PLLs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 4d2119751572..26d640e1bfb6 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -310,6 +310,12 @@ systimer: timer@10200670 {
 			clock-names = "clk13m";
 		};
 
+		apmixedsys: syscon@10209000 {
+			compatible = "mediatek,mt6795-apmixedsys", "syscon";
+			reg = <0 0x10209000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		fhctl: clock-controller@10209f00 {
 			compatible = "mediatek,mt6795-fhctl";
 			reg = <0 0x10209f00 0 0x100>;
-- 
2.40.0

