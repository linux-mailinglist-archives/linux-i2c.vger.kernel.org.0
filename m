Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8F84A328B
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 00:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353492AbiA2XBJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 18:01:09 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41237 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353449AbiA2XBB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 18:01:01 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id CEDFA3200C6B;
        Sat, 29 Jan 2022 18:00:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 29 Jan 2022 18:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=KaJi6i1rcpG62yHLxKEhKW/9uykM7g
        g7A3y7usLAY7o=; b=oVF8yBuw077qKkvBIeh/qAs4mNm9itM9TlGO/vZrmoU4TU
        9twmdPOAGna6DE/QoGOVOzgkN8UHe3R27egreQ27tQJJuK0SDOf+1ZPxaYomaIMQ
        EcDLYvLFyxFpbQgBESAlCSHfc8Z/vZfjbPYScgmqYxEeDYG8B/xbrRXg1xxmPk3H
        2bFQZAROxBkMzTosbWy74aVUISfgrzTCrw0sG0UWEfaXNytWvipwMcXwDqNrJ/Xq
        FnpyS1Vy18lAaJEPDW2vlNeVsCkqqq97AfomPWIBUNR94FbqlotgUs8e3XFdSdQV
        qkxiHen9sTgmJfsNMQngzRt2dJbjL1qaSTCuKa5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KaJi6i
        1rcpG62yHLxKEhKW/9uykM7gg7A3y7usLAY7o=; b=fOo321VpFKHEDGKtZDhAdF
        itndNBHxmgZ79bb2owxng3DMR2PWDOfYk3ZayN+kxCdcCxjWpBw4ibcdnO7ZsWxI
        HSKbRVccrugHqUJt8hINAej+sYbmj3TWsX7DiUbcNmis/qgDWB+YP/jCD21J74NE
        QWUMzeZ0znPUHVbkUierrlTF4pzvbBImuhlEoyhzrZYCRF0+JzCbpd1gP9h/S7J1
        hq5hpvyQ6oaBdL/nOa3zHTXPJAOYA0+FaTejQOKIKddnTp3pwF3uTgDuYNIWPOuf
        I/TAQZQ5C+UlPkefQ6bxgXVbQgGTA4fe0UzB+P8hPnZoXZNdIwkRm3QrcuCB/tUw
        ==
X-ME-Sender: <xms:K8f1Ya-uVsLPzCG95vMYIuFj7naG6fZWaUu67PGCIv9TXlXC-BCxoA>
    <xme:K8f1Yau2I7NHP0n9R14fbN7yNEOKLnaluoD5Qnay3MCO9J_cijJUBEhTga4VISeIs
    bHPw38SGm7XLjsZsg>
X-ME-Received: <xmr:K8f1YQDBVgNCpkgVDZ2i4Sv6Y1gl5Xq3_2Qpj_r1C0OMbsUs5KusSUjJTKHxuLf792dkWJZ24RuTKRQNpkyFBD3zTp8PxXFw_SU2_arv3MbPCWOod4xwdx9iineL0ppS58GmyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgdduieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:K8f1YSeZOY6Vkcgw94yYKDOwcS-pVLZhNNpDY0rrZ1cB71vv49SW_w>
    <xmx:K8f1YfMDV4xma4M__hAF10BNwSa7dOcOAvfwXRYI8EACmfAg-m4N3A>
    <xmx:K8f1Ycmcg81X-UIlw9MWmr5k7rDRuFT_fCZkQguvox9DGY5mX0u-LA>
    <xmx:K8f1YadBZJtP_Pos210DMNbyRZQlvJqy3UXjUSIPPm1T8zjY1lbGcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 18:00:58 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 5/5] [DO NOT MERGE] arm64: dts: allwinner: pinephone: Add keyboard
Date:   Sat, 29 Jan 2022 17:00:42 -0600
Message-Id: <20220129230043.12422-6-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220129230043.12422-1-samuel@sholland.org>
References: <20220129230043.12422-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The official PinePhone keyboard accessory connects to the phone's POGO
pins for I2C and interrupts. It has an Injoinic IP5209 power bank IC
connected to the keyboard's internal I2C bus.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../dts/allwinner/sun50i-a64-pinephone.dtsi    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 87847116ab6d..2fa1bdf8aa63 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -208,6 +208,24 @@ accelerometer@68 {
 /* Connected to pogo pins (external spring based pinheader for user addons) */
 &i2c2 {
 	status = "okay";
+
+	keyboard@15 {
+		compatible = "pine64,pinephone-keyboard";
+		reg = <0x15>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 12 IRQ_TYPE_EDGE_FALLING>; /* PL12 */
+		wakeup-source;
+
+		i2c-bus {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			charger@75 {
+				compatible = "injoinic,ip5209";
+				reg = <0x75>;
+			};
+		};
+	};
 };
 
 &lradc {
-- 
2.33.1

