Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968A9563EA9
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 07:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiGBFZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jul 2022 01:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiGBFZt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Jul 2022 01:25:49 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2452C673;
        Fri,  1 Jul 2022 22:25:48 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0AA685C0195;
        Sat,  2 Jul 2022 01:25:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 02 Jul 2022 01:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1656739546; x=1656825946; bh=ZDVhLQRWt4nVJ5OST5kNBSRBh
        F8l/TWZdl9kfqTRWzI=; b=mIbeZnXFq0Rs6r+UoMXOGz25PnMMgtnD8SvbMSpBB
        aGWj8+hY6AD9fRzW3cl0iqrLhGC3k0+DiILkLuzB3VJ3quyitNDNIPfUR1Op9U3r
        C0sjBHqG2z3FEL6zVX4X/AE13KiNPf4wI4RfaX29ckzu6ox4Ib9nMP+6ajfnteSZ
        hKHbd/N90oho/qgBmqkCjcjCQvIAKvPF5H139EQq5EkNODFVkQW3lGNIravAOKEd
        hTHjCDyh6DtJDuU/AqkYEQK+FjrNCte4VxrcBJ1ihAJFnOfxk5LfXb2uHUy9nupJ
        ckLLVq4AADxJBvKmDpFD8ugr2FlvLNo+qZnYqHUJqzy1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1656739546; x=1656825946; bh=ZDVhLQRWt4nVJ5OST5kNBSRBhF8l/TWZdl9
        kfqTRWzI=; b=l4sZcQ2rtRuAky8TOo1V5MnEsIFU4de9DrmGsml10Gd3V3cJziF
        IKRWJPLZhhj+8rvUfzaLSfXjZ8MQOvEpzrFz3hGSyvpU99ysPKhLHDqt0O7Go3wc
        hAG0FSAPabdOkj85H+OMgkL1EFyG3bZaoApKAOaNKcWNzEWQqU9vUuig7QEDSn30
        iIozUddiIMQ7ImxbGzR9HaeQKs+8Qq3dMs8NJRZRdU4BATIi8CMJhbhHzMGgMaQq
        myjt/137qpudzM8zJC8WMZugUhCcMtNtRLUB4/+1e3VKM+RN+llfWXv7BD10EsTx
        +3w3WAQwib9E63qHa0KCZCbSLe9E+6gS3Fw==
X-ME-Sender: <xms:2da_YnbURUi1iyulsI8R0PTakitGEyWvGJ5VL7jpU3-TqnJfJma9hQ>
    <xme:2da_YmaWW_sAX8EWpqY1XyzrnGB4Rkp3w5ceJ3Nd2zeX1NdX476kGk4AFdTQruqcC
    y2lUdYHqbBGkkJjBg>
X-ME-Received: <xmr:2da_Yp8Fh2A6eh2pUIFds3kLes4VWHCfQeRmg-bOvdVk4Eg6bH4rzcR0nb97wOn6idcsiASChG0EEh7SkWqrDQYD6mf5asASuJLEuZSshfCa1ClJmRpX7UbcjIbbbkLRp8pDvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:2da_YtqqAb7OH2GygbqbbuYrhsN7f6TAXTXsUqpFwrpc2jzKSlVDDw>
    <xmx:2da_YipfcS8qtiuoqxbzBkqb3mza8GJiVFVZphrIZOj_1ETiNMAbHQ>
    <xmx:2da_YjTdY7aNktkzFgJkuTSKSwVRPdoJLB4GJhfPwimtCTC9eov32g>
    <xmx:2ta_Yh02n4mcx_MbuXT0oJAIF8cfWaTEr5LHHgEsYOKWSl1jB3j89Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 01:25:45 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Wolfram Sang <wsa@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Add variants with offload support
Date:   Sat,  2 Jul 2022 00:25:42 -0500
Message-Id: <20220702052544.31443-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
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

V536 and newer Allwinner SoCs contain an updated I2C controller which
includes an offload engine for master mode. The controller retains the
existing register interface, so the A31 compatible still applies.

Add the V536 compatible and use it as a fallback for other SoCs with the
updated hardware. This includes two SoCs that were already documented
(H616 and A100) and two new SoCs (R329 and D1).

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index f771c09aabfc..0ec033e48830 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,10 +21,18 @@ properties:
           - enum:
               - allwinner,sun8i-a23-i2c
               - allwinner,sun8i-a83t-i2c
+              - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-              - allwinner,sun50i-a100-i2c
               - allwinner,sun50i-h6-i2c
+          - const: allwinner,sun6i-a31-i2c
+      - description: Allwinner SoCs with offload support
+        items:
+          - enum:
+              - allwinner,sun20i-d1-i2c
+              - allwinner,sun50i-a100-i2c
               - allwinner,sun50i-h616-i2c
+              - allwinner,sun50i-r329-i2c
+          - const: allwinner,sun8i-v536-i2c
           - const: allwinner,sun6i-a31-i2c
       - const: marvell,mv64xxx-i2c
       - const: marvell,mv78230-i2c
-- 
2.35.1

