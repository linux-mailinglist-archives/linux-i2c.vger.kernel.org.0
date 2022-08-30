Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9BB5A5924
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 04:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiH3CIg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 22:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiH3CIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 22:08:31 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B405E85FE8;
        Mon, 29 Aug 2022 19:08:30 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 2035A5C01A0;
        Mon, 29 Aug 2022 22:08:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 29 Aug 2022 22:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1661825310; x=1661911710; bh=Fk
        X4dRzih+XcP2CW0zREdq7aeZbkdtKNx9OgLkoxSes=; b=rDBaoXhcqQEA0OpLaU
        QEw9B3LnbTvWO9/ZUvZYc8W9lDDhg/ih/e/ivxppFCVF6z3HzzqtIB7Ae5jCKQyW
        +gBwT0dPYWg2QMIsIBNlZ3azbmNuUjyCu99CzbbuYp2BwckmaVNTOdZizGte+QP6
        sVzYBXUoMwG3YoZ8CBjiXULQcC2hguDYFqfVAdmKDX52Z5+aB8VGa3ju7kT7NcvY
        5yRcpuxVVfd2kfoxewhhcc8REvcb/+ReYSETJbuN+Ny43hdX/7dBABKODykD47ya
        CsUSxbd2w6hB/uTSyJR7puLCINeRHKgJ6t24dYZeE0ADh0Yb0JB9C3faS3QdCeUX
        NE2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1661825310; x=1661911710; bh=FkX4dRzih+XcP
        2CW0zREdq7aeZbkdtKNx9OgLkoxSes=; b=o9QEkRMFE6bjjUAAq21RkekJNXQgX
        z79Rw1D+s2kVQvPOf2rIlhOEMCLfC10+BVjO+FnAp8KfrR/r0Od1cd+pl4CMbwLk
        jTF/W1m19LX17escy+pfmzJwenSXncdLQDNMletfBbvUXTsWbZtzGzCc6olPZBNJ
        GKzQgVN+RfPSMhBzOZwBMnfTM3AX705KOTo6i8+88zmuyeQAcTmRlm6Omq9Yb3gj
        ieNx6t/Q8Br8frwrOuzfTMsIAOFd7T3MOxMy4ywyiwheru8YkR6ZQfnyJgSNhZkE
        XxmF443zQjijim72zfpfJteAr/3rWh7OOhhPh9QGRIK/V12eoB8KAPQ5Q==
X-ME-Sender: <xms:HXENYxmVhE1xrC9W_uJQfN5WKIkH2ipFO3Wn9dyoBfXXyUbclwOJBw>
    <xme:HXENY80Naoi1qiLBMXsH-Kwd3e7cyTWUrJYFu-Fd-r--kh31ijEBd_FqJ_xRQA7_h
    Rbh4Hvs-pC3cJUgeQ>
X-ME-Received: <xmr:HXENY3pm6tNhGWV3n3xip_Eb59UZ7D6Cz08076Rhw_QvxYb6ahLLWLWp1mLoCY9GoJjjJA1kRQLnOiaUF9P2ReTHvHpFs-AA-OAHf0xR41xUV6H4cONtgAG22CuQ1qfHRwVz1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:HXENYxmqOlwdwQ3VDTCkTsDN5zT2jq-CX0-JsK21mj0g4egJRlzYJA>
    <xmx:HXENY_2mHLPLwkUMkUcBHgitSvZgeCamcRocfPv9ja7-Qk1X0dtjlQ>
    <xmx:HXENYwsEXdnm_lZKbDyH8ctIiC5v6vjXS1C82txGaDebbw9uPaMuLg>
    <xmx:HnENYxyDonDBi3IZOj6K0-MOkq4iov0ZvBiO_62MlQFNGCFSSLDg-w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 22:08:29 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] arm64: dts: allwinner: a100: Add I2C DMA requests
Date:   Mon, 29 Aug 2022 21:08:24 -0500
Message-Id: <20220830020824.62288-4-samuel@sholland.org>
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

The I2C controllers in the A100 SoC are all connected to the DMA engine.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 5453a3bb7d81..97e3e6907acd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -221,6 +221,8 @@ i2c0: i2c@5002000 {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C0>;
 			resets = <&ccu RST_BUS_I2C0>;
+			dmas = <&dma 43>, <&dma 43>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -234,6 +236,8 @@ i2c1: i2c@5002400 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C1>;
 			resets = <&ccu RST_BUS_I2C1>;
+			dmas = <&dma 44>, <&dma 44>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -247,6 +251,8 @@ i2c2: i2c@5002800 {
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C2>;
 			resets = <&ccu RST_BUS_I2C2>;
+			dmas = <&dma 45>, <&dma 45>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -260,6 +266,8 @@ i2c3: i2c@5002c00 {
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C3>;
 			resets = <&ccu RST_BUS_I2C3>;
+			dmas = <&dma 46>, <&dma 46>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -337,6 +345,8 @@ r_i2c0: i2c@7081400 {
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&r_ccu CLK_R_APB2_I2C0>;
 			resets = <&r_ccu RST_R_APB2_I2C0>;
+			dmas = <&dma 50>, <&dma 50>;
+			dma-names = "rx", "tx";
 			pinctrl-names = "default";
 			pinctrl-0 = <&r_i2c0_pins>;
 			status = "disabled";
@@ -352,6 +362,8 @@ r_i2c1: i2c@7081800 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&r_ccu CLK_R_APB2_I2C1>;
 			resets = <&r_ccu RST_R_APB2_I2C1>;
+			dmas = <&dma 51>, <&dma 51>;
+			dma-names = "rx", "tx";
 			pinctrl-names = "default";
 			pinctrl-0 = <&r_i2c1_pins>;
 			status = "disabled";
-- 
2.35.1

