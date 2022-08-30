Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7DF55A591E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 04:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiH3CIe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 22:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiH3CIa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 22:08:30 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DD285FCC;
        Mon, 29 Aug 2022 19:08:29 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id CD23E5C00AC;
        Mon, 29 Aug 2022 22:08:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 29 Aug 2022 22:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1661825307; x=1661911707; bh=hr
        iNRaqge8di6Ww36SKeJsUSNLWsxQP2UWUeu3Y6Tt8=; b=f4BT1sPJL4o7WzjcBR
        1jqIBj5zF9YuD90LCO+y1KLCajAdeYlWJ2FdrnqYeLae8kERPLpMLaZ+FlmgMt12
        rgsuWW+534sr0D+C63FS+HHvsbnqPSZzeoKxFP4Oc0bmmdyYGvkjr7e67Xtd7RAo
        q1Rhfj8qxSqqhmig/LoQ5HLRP/TMkhbM9JBCkFB35CxQtqfFmrQ+P+jHUe1r0INe
        XQn7MN1j4AZx8IZJnFu6HYR4FLFbUzggtqSAGdDSO9y6Whx0YcgJr7DjB3PyLtVa
        0x29H0Fk+CHV3/4Ht0tZsBs1wPOAQVcznlfYKUplLmi77O4KrBQ0cOvuVxCd1f2K
        2ylQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1661825307; x=1661911707; bh=hriNRaqge8di6
        Ww36SKeJsUSNLWsxQP2UWUeu3Y6Tt8=; b=PgSbXtigZzpay4QdeHzHdaRjSntAa
        aIjlTnlB+8Nofy9QzgE2BRQ3ZUr4UxFPeUxI9iy9xpv8mQ4a0+CnMukc4QwvYPX4
        t88g8hFvcRRCF33kNChivE489sIRk6YL5Lp4bdhcp0rtNsfxM33Iu9uBgqKdRh2/
        rF48o7RxQxMEqbcR1+khfkdI6BA3DorifLH/OoOBTs2F8ZJfkiUkhT+eeKij2EEN
        rP5yiqn3P55aK5X61P2vM0IPbiGX9920jEXhH3Y19VnHxvfPIQssIaywSF64tR+u
        Fvges9yZUoN/HAZgCIc8SVg6fbLA9c4393ZUxkyBBH4AatA1mKvZkKoFQ==
X-ME-Sender: <xms:G3ENY8B1cWEszYEx57VbczYrgcRaAP0xlUevpyrcPiCmQAwTRSrksg>
    <xme:G3ENY-i-D8L9f0vxH2SLJd-0jsOzk39W97Oee70c7PR13Gpx4QURx5jimguQh4i0_
    BDkHSslKbbmCQH9Hg>
X-ME-Received: <xmr:G3ENY_kQeeut0f-KU3Le4F5jxTSK0lzWleqV8LfSWFkdw7l7j3ubQJm72PIiaKrGtzlCHCwX1BDy5LgAfdMwasLivNNSj8PCeGIKe6ZSJXlFJN7xAwdyE_X4XXksTrIx2ud0dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:G3ENYyxcO-AwDqbQGmxWUq__Fy0cp6ehiSSks45fgmkScUymaa1tfg>
    <xmx:G3ENYxSL6SqpS7ZIP_rLx2uvXGDYZTsfdEJWG-OgpG28zzYxgPuonQ>
    <xmx:G3ENY9bLuicmg0TEf3L4oS9Zs7kHTS1PMgXoL7dzCF6tcdNKD7oXwQ>
    <xmx:G3ENY-_fz8bM0MQYzXVuk2TeOHhGLVtPgVWMz5WED-os5mco2SFRbQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 22:08:27 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: i2c: mv64xxx: Document DMA properties
Date:   Mon, 29 Aug 2022 21:08:22 -0500
Message-Id: <20220830020824.62288-2-samuel@sholland.org>
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

Allwinner's I2C offload engine includes bidirectional DMA support. Add
the properties for describing this in the devicetree. "dmas" is optional
because not all instances of the controller have their DRQs hooked up.
For example, R_I2C0 and R_I2C1 on V536 have no DRQ number assigned.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml           | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 0ec033e48830..63d665a4f9bb 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -66,6 +66,19 @@ properties:
   resets:
     maxItems: 1
 
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+dependencies:
+  dmas: [ dma-names ]
+
 required:
   - compatible
   - reg
-- 
2.35.1

