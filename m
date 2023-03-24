Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4046C83EB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjCXR4v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbjCXR4l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:56:41 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4326D1A493;
        Fri, 24 Mar 2023 10:56:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id DA32F6603143;
        Fri, 24 Mar 2023 17:55:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680510;
        bh=klZ1wIb0qi8AUCKdFQaQFYLZ3ZlhvULeIjT368zNwRg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S3wo2L/WbIXRtUL5Frry1upxALnlEdZImgYbyWsWSbznlxp0XuL5HR17x/tbBs0fP
         A9xyNIzHJYqC3xVp+g4AvO7GXjeSKAXOApHB3QYpJ5OcvOkjv5dTEFd07MFciqzEgY
         z+bu6qqVncKe1kYxh3ca2LfAG97wRIdo/z1F1mDcFoSxynCUqlWzKjwmTRxJUPhieH
         UJRVNn3oITsuGGNIpt+jcdYzfjqF5iXfNc7GOLK1+OyfWhNrns3acRMPqHHfNP2ZT7
         UjIWSnDu1aRUs9Kp7odBTvPOfFOwxLIOkWfhlmf1kmSOQovcyVf0ayaKDlrJqbtWSA
         dDgfDjUNabFGg==
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
Subject: [PATCH v1 11/18] arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
Date:   Fri, 24 Mar 2023 18:54:49 +0100
Message-Id: <20230324175456.219954-12-angelogioacchino.delregno@collabora.com>
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

In prepration for adding the IOMMUs and LARBs of this SoC, add the
VDECSYS and VENCSYS clock controller nodes, providing clocks for the
vcodec stateful decoder and stateful decoder hardware.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index b721971d4e5e..a8b2c4517e79 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -647,5 +647,17 @@ mmsys: syscon@14000000 {
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
+
+		vdecsys: clock-controller@16000000 {
+			compatible = "mediatek,mt6795-vdecsys";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: clock-controller@18000000 {
+			compatible = "mediatek,mt6795-vencsys";
+			reg = <0 0x18000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.40.0

