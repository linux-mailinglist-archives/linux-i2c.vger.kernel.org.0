Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2265A591F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 04:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiH3CIf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 22:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiH3CIa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 22:08:30 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472DA85FE8;
        Mon, 29 Aug 2022 19:08:29 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id BECD65C01BD;
        Mon, 29 Aug 2022 22:08:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 29 Aug 2022 22:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1661825306; x=1661911706; bh=GGDTBRyW+4XVRImWG5fIL5Gvz
        l7xCQqxp1dUICfh3+8=; b=WMA6tk3u/1xZRuXbN1Erw8lrXHT06sw/CqH8MiJI5
        4uKS91DQcFUlLcX+wcwOMKYCOIUYunqV1sPOFkaYrpZHIB0iih4+N2zzviuMilCC
        2OWLuDkj2gNT598aj71wrxKYXZU8ZnYFS7O+xg1wkSJAlu/03Nm4fdWKtdidIwbb
        yYPM+e/j0KkzkFVnFDUQ/Ug94L5jVDKfEBHqQ0hgwwqIcHonksoJsLjbln3pgT0R
        Y2+hQ+aQeE2ohzJMYmD1JZwQnbqeIg5TZGutEPqMeieH1PyPss1xAQfd1iQYOlOM
        IYFJJ1zbGgiqQ1AxwvtUHrbrH309N07j1bTVvmzqLgcVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1661825306; x=1661911706; bh=GGDTBRyW+4XVRImWG5fIL5Gvzl7xCQqxp1d
        UICfh3+8=; b=jUJuShUsvZCEDZXKWos8xVmdLVjF8WtC26sLx7dg+DJRfBoSuRF
        zmnNyN2rKLdKRkRSC0PyJxO6+l9gFmBeV+OR3DHyAhvk+B6HeJpEqjvBcR1ylMM9
        Xz2JnBbC7Knr1uOaQhC0P+4K91dRDyMaXW50HTKzQazoAuGEDk7TKO5gYBUgIRp5
        57gikJ6UEF3Gc+jYz8wovevc6aiiTLmwoEY1b0DYtuRrU31ArS6jCrpfTeEhTJwd
        hflOPzY07Hdy39j/OfbFzZQKePYJU1HMagCcVbwg/yqTcy5PFx7wypeCZyqjYDYn
        Cclm1VHUO+GK89uY6o82XnoSm1w/bvWSLXw==
X-ME-Sender: <xms:GnENY2bim-XoPBqs6vQzQUyVSQ_wPM_X2QealMObc_I1BzpFnJExXg>
    <xme:GnENY5YlxUJSlQM4pwjICiBdeCBT6TMztW5O0bVemGEEGHp82oAAbkAQI1d7rrWBZ
    F63C2fwG8ZQuHbuOw>
X-ME-Received: <xmr:GnENYw8dXj-qj7P4YrtqZjuf9uKTDOtjt5YB5ybrQb0pg4EVp5cM5Z2FLaGZMgdWKPswtNoCqbgqhn2l8uhaKALXClHnq6QTn7LEtB7EgZoPNyWI-CTVw6Z6sbviJpI6MMAQcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekvddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:GnENY4pF5ZmPA4EODn_a02QlXNav4nDGIVNdjFXlkD6TRBU2WyslOA>
    <xmx:GnENYxpclIaZiQRMsvsvIX81cLU0f4wttnqPaMgKQdTOT5WbX3ME6Q>
    <xmx:GnENY2QvyYx4zNmtuFurwJev9_0Zj_aSzvcJDdo1okScfEGjJrEqPA>
    <xmx:GnENY83cXj2PirJJ_nInwNlzq_w2R-FjuBLs88Pk8Tcspdc0JMIOAQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 22:08:25 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] DMA binding for Allwinner V536/newer I2C
Date:   Mon, 29 Aug 2022 21:08:21 -0500
Message-Id: <20220830020824.62288-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
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

This series documents the DMA capability of the I2C offload engine in
Allwinner V536 and newer SoCs. This includes the following SoCs which
have some support in mainline Linux:
 - A100 (updated by this series)
 - H616 (missing DMA controller binding/support)
 - D1 (initial DT submission is on the ML; this series resolves some
   dtbs_check warnings with that DT)


Samuel Holland (2):
  dt-bindings: i2c: mv64xxx: Document DMA properties
  arm64: dts: allwinner: a100: Add I2C DMA requests

Yangtao Li (1):
  arm64: dts: allwinner: a100: Add device node for DMA controller

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 13 ++++++++++
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 24 +++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.35.1

