Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EB25A5926
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 04:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiH3CIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 22:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiH3CIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 22:08:31 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16EE86046;
        Mon, 29 Aug 2022 19:08:29 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 0ED665C01C6;
        Mon, 29 Aug 2022 22:08:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 29 Aug 2022 22:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1661825309; x=1661911709; bh=aq
        ERgIMNt16j+SVHZUcamE4zlhsBe0bcYHWFUyOTwKw=; b=VWBoq6yWkw5+41nvWS
        gslhd2UCl6nA5gZ0g9XNpFDCSgdYhobxIrmuKjtyz0qy17DY0Zp4swsla//wqDbl
        ylSrOUE23m/B7mCxduoGNq6wjbZk0nYrWcOO0SU263+YPm7s8s+1vxLrEnEO6mHI
        S14dOs4/Qxbsxgs2T8zWLr9P3thI0XRZDGZb63Ob3yaDUoVXPGy+N3iWXL7QRH06
        jEr6UlmrjoTaR58LEsxor1uHOCgROgoLfunOLU2xRFX9npn+ghKu4TTVSFCBjnl9
        wQJuX5CmpgVD5ST2LzryV4r7wN+VbgCXjr+6DBK3xiWa1mF/YOVyR4i79z1hXtc9
        iZmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1661825309; x=1661911709; bh=aqERgIMNt16j+
        SVHZUcamE4zlhsBe0bcYHWFUyOTwKw=; b=1VynNZDBXvRgC1E9/8dEzFjirj2bq
        j1Fg0hGu1ya+CjICj24ZMGWhqmdXofL+5mEWMazaKNlcc1d87juyD4YioyFdh1k/
        GX7upmmiAz3A5UD2xLyahQ5dQxQSMsO367y7t0Fr6tl9lBj56pnRaRJDOQ+hMfhR
        EkRPBDLtRPtnP5JE0UnTS5bkv1rYRpt8zUbPyxFBYv0j9XoQCV0V2rHiTFcEW3fz
        DWeZq1KKRUmihF7/XqUiSLRMUnhdah1hNcavm12OuRzn+BVtl6tUU7qjKgserQHE
        g+Xb+e1K426Y6ZdNyofnEAXscMo+K6XGN8aNMqRmlz8cQTTFolYAiGosA==
X-ME-Sender: <xms:HHENYw1HRG8PRZgKgsnvvCQbogcsTJgwIo-EOiRUSpHvUmO2fUsS6Q>
    <xme:HHENY7EK2sUq7mpVWKwqAthEkoLi-ezDbCZ-yYzs1fbdnhCincpkbGkjwyOEounuz
    cpbaCetfkhoS4P5UQ>
X-ME-Received: <xmr:HHENY47r_XN08hQgJqgqhPMfBzZVYr_tV--K1ua8sJghZImQdHBcINojUySFLGAEfmDEtaYpWt1ynR-2m3eq8jjMM72w62mxY2pmK1EEwHPgXrtrMbq-2S7wCQ75-G1cc6TdMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:HHENY51LihSeKfazJIpGQjNlVfEndWU11WX_XN3OBApS-M7YYF6ebg>
    <xmx:HHENYzEE0RUB-no0Qtk_ksuYbmGde1UeY7u47-7ZwytBHkisJKn0LA>
    <xmx:HHENYy9r1e_7iHng42qIvLGIwwEQsukhj_zczRJwIHvFAh6iQ58Dog>
    <xmx:HXENY78EtQLfOO0uXujxTgehkzo2i_jIvm_ct667VgpQUq04tu_Uew>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 22:08:28 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Yangtao Li <frank@allwinnertech.com>
Subject: [PATCH 2/3] arm64: dts: allwinner: a100: Add device node for DMA controller
Date:   Mon, 29 Aug 2022 21:08:23 -0500
Message-Id: <20220830020824.62288-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830020824.62288-1-samuel@sholland.org>
References: <20220830020824.62288-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

The A100 SoC has a DMA controller that supports 8 DMA channels
to and from various peripherals.

Add a device node for it.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v1:
 - From previous submission: fixed off-by-one in dma-requests property

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 548539c93ab0..5453a3bb7d81 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -101,6 +101,18 @@ ccu: clock@3001000 {
 			#reset-cells = <1>;
 		};
 
+		dma: dma-controller@3002000 {
+			compatible = "allwinner,sun50i-a100-dma";
+			reg = <0x03002000 0x1000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
+			clock-names = "bus", "mbus";
+			resets = <&ccu RST_BUS_DMA>;
+			dma-channels = <8>;
+			dma-requests = <52>;
+			#dma-cells = <1>;
+		};
+
 		gic: interrupt-controller@3021000 {
 			compatible = "arm,gic-400";
 			reg = <0x03021000 0x1000>, <0x03022000 0x2000>,
-- 
2.35.1

