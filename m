Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED35563EA8
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 07:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiGBFZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jul 2022 01:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBFZt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Jul 2022 01:25:49 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1E822B2E;
        Fri,  1 Jul 2022 22:25:48 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 667545C0170;
        Sat,  2 Jul 2022 01:25:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 02 Jul 2022 01:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1656739547; x=1656825947; bh=Tf
        wGykUWVQ4iE6lFrnkkSnFLx6F0x4K2zszUvg3ut5E=; b=bIvJSEKTWi2bYZ/+Bz
        zaPRdi4kzggMW1dxBJAucTPjByNiQuYB8gmWbfwbz/Rp1GXG0wEwbYWPRPVpFM8R
        gqMUEgqHSYVNmJXodQNHEsHbNq8xPagTjpBDCLI+cJ/nzQkfJT1AgcIHD+6qgE1y
        57W7gnOY6nGVbtSz8HjRJrMr7xmuRNVcuuItRJjVk+7O80aO84S7mgWcj09fjKGD
        ceEFf0Ym/Zlv5UPwRoSon53WkwhgreYJt4tPn8p+R55KShBBIA5gt1VbKYYI6BEG
        I5WAPKH1m966+bapvomAaFeUq2Re1A764uNHbf6efYQdDfwzeZ3M9Be2pMMDlwzo
        M81w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1656739547; x=1656825947; bh=TfwGykUWVQ4iE
        6lFrnkkSnFLx6F0x4K2zszUvg3ut5E=; b=WDjgOW8dtx8gQP4y5+3D4Qkf6y3n1
        Gf1Rrb3Pm9KWLzUFidWP1Q4U1iPZIX1aJUfyjJUowTkG8u+Ku8RVDu6HybIU7fVY
        TUuoN9V7bBwxEA3HY6PcanjjFZAwZGzf1BpIAA3IR0etus5Ac6176WPv2yg/wZjk
        FXMR3eM1wUVbLcpwPjLLzIXt2UvK/vg9M2lR6k3KOKTHP/W7ts2WqM4B5blfzkcN
        rn35oLx0tDaVOUFMf+fZjZdF8Z8D9DALYHnEgwfyPuT0OryeUTmrAcftnjF5Hh1x
        DOeSHimGnla3udZwBW+H6TOmRsiAaY9CIZ5Gz2u2DVWORZ+Tu4Jzw7wIw==
X-ME-Sender: <xms:2ta_YvbT8AVxfgcdEX2VpITqQtf--ZuzIRybBNg-XVuh5OWWvub7hA>
    <xme:2ta_YuZft-iEe0oDNnbniXz2IPTKn9et844CnO_KE1eybaSdu6wkOiXvbOc05r_LD
    0RZeOCUsI3JVDeD7A>
X-ME-Received: <xmr:2ta_Yh_RpKl0v_4D3zODKxA1bfN_7tbMjO2tmQTDnaSA5biqErt7H9v1-QLPzQ-eorhoUPryCysS59tyqJuKtw2rxBuMrK0Ow_AwNv-gtipTNXUBU6Um1WWntClv1Xmd7yYowg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:2ta_YlpQhj4drFM7GmE1AaemBFo4PWWNp_Mru1Oneh4M18jgjY6VBA>
    <xmx:2ta_YqrWnKYh4_Qh5tjj-tBI56rqpLrQEn4idDUURxSLjnX7MO4Y9Q>
    <xmx:2ta_YrS-QqukOsRtmu-nEF34YVHF7watPscLekVavZmq8EjIcZa2Uw>
    <xmx:29a_YnTmlSmvGlEo_dME-vh-QuucUjMNnss8i1h2nugBhWo8n9FSaQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 01:25:46 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Wolfram Sang <wsa@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: allwinner: a100: Update I2C controller fallback
Date:   Sat,  2 Jul 2022 00:25:43 -0500
Message-Id: <20220702052544.31443-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220702052544.31443-1-samuel@sholland.org>
References: <20220702052544.31443-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C controllers in the A100 SoC are newer-generation hardware
which includes an offload engine. Signify that by including the
allwinner,sun8i-v536-i2c fallback compatible, as V536 is the first
SoC with this generation of I2C controller.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index f6d7d7f7fdab..548539c93ab0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -203,6 +203,7 @@ uart4: serial@5001000 {
 
 		i2c0: i2c@5002000 {
 			compatible = "allwinner,sun50i-a100-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -215,6 +216,7 @@ i2c0: i2c@5002000 {
 
 		i2c1: i2c@5002400 {
 			compatible = "allwinner,sun50i-a100-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002400 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
@@ -227,6 +229,7 @@ i2c1: i2c@5002400 {
 
 		i2c2: i2c@5002800 {
 			compatible = "allwinner,sun50i-a100-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002800 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
@@ -239,6 +242,7 @@ i2c2: i2c@5002800 {
 
 		i2c3: i2c@5002c00 {
 			compatible = "allwinner,sun50i-a100-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002c00 0x400>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -315,6 +319,7 @@ r_uart: serial@7080000 {
 
 		r_i2c0: i2c@7081400 {
 			compatible = "allwinner,sun50i-a100-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x07081400 0x400>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
@@ -329,6 +334,7 @@ r_i2c0: i2c@7081400 {
 
 		r_i2c1: i2c@7081800 {
 			compatible = "allwinner,sun50i-a100-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x07081800 0x400>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.35.1

