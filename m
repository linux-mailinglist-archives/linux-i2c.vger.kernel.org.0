Return-Path: <linux-i2c+bounces-127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 671827E9BD2
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 13:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C398A1F20F45
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D511D548;
	Mon, 13 Nov 2023 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b="v7jv5J94";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CmlTM7CA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6814C1CF99;
	Mon, 13 Nov 2023 12:07:23 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32843D72;
	Mon, 13 Nov 2023 04:07:21 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 8F9285C0115;
	Mon, 13 Nov 2023 07:07:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 13 Nov 2023 07:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feathertop.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1699877238; x=1699963638; bh=Y5
	Gf1TE2G849jaf03zsNJMtCuWMkzZcXooRu7tYzxlQ=; b=v7jv5J94rs6ciPeif+
	dZMjzFxKlcgymjaa94blRo3nmx1zq7ZdEAFFyL7z9y7TnKD9O0AHYGzoLyYNP7Vk
	SmXakCLXtFRytafACy7H/LJIs6UjylnK6Qwt3kEAvWgjY82UiwtTykaYtC34QLOU
	xSiZxzc3n7xpby5XO09ZFbO95nXfLb853N699M5okzJn+S8r1wnBl8P9rzE36Uwf
	mP5rd1vmb58lA/1OQK8Xu+Gc5hxNpuob5cR/6MA8pBjJvtl/I9h8n4U7BttB6jXj
	ooEHRH1ALubjcwgte4bWYat4QKjFKCNNeUh4dIn840xWKT023R6YWbfd6A4MUQlZ
	+CPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1699877238; x=1699963638; bh=Y5Gf1TE2G849j
	af03zsNJMtCuWMkzZcXooRu7tYzxlQ=; b=CmlTM7CAGb8TcudAmYLNDBa4xo9fr
	oZd3mtK1sdu7CIhdxfFuaelQsqadO2mVVNJdjV+jiEwr38EMPxUYYudfzEbDYpn6
	Que4ezD9xnwSkRkyPXPvmL9j5f0eE9XRyCwCvQG3SPzKcdY49CN3qiv3cEGchXUt
	yno87LKsMVTS/0BIGDBVhLMxMrZYNb5xGSDygmoBis1AuGK3SLmXpAvAsfZrt9j9
	argoTwLAmzEShPJn6P72kxqFIUzvn1x8nQXZcY3q6Rh8fcCrRRvIpukr7M4/njLQ
	KyWokAf3ZIWefa4wMhXNhK0CujGRiut8jJt6hyxyQLJXAwns1S7HaJANA==
X-ME-Sender: <xms:dRFSZSUIHl0Nvd0Ul2hwAsM6LAVBt95ITbDn9wi8oLSNaV8Tj-qKYQ>
    <xme:dRFSZenRLIF1-KWbTu7HMRHxAnXdgj6jicd8Z7vhpHbGkVuhCEdqVcE-AMnUSRMxw
    jsuI9Ok4g>
X-ME-Received: <xmr:dRFSZWYO2cygtqZh5oN9JXx7T58RB_QP73bkytSD8SDf5BDJ7rglbKP1Pc6MckEQB7shoZ9_rqjPBU9a0aaHwyvrim8JzJ-tV5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeftddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhimhcunfhu
    nhhnuceothhimhesfhgvrghthhgvrhhtohhprdhorhhgqeenucggtffrrghtthgvrhhnpe
    duhfdtveeujeejjeffieevgfdtudegfeffvedugfetteehudevteehtefgieeitdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtihhmsehfvg
    grthhhvghrthhophdrohhrgh
X-ME-Proxy: <xmx:dRFSZZUxRjrtnYHOm8zYZrKfYiMtsV4XyVlWW4EheVzOVe0hcwOMlw>
    <xmx:dRFSZcm-DgiILmRj5QLxnvKQ6czOnHjzwiqVuBbjiXJctDmmCuk6dg>
    <xmx:dRFSZedt4l0b2fqTrQNCUTxt6NQyw1CcNwGChj8qbo6KNc7lTKe3zw>
    <xmx:dhFSZZjhzszfsqdvrUhPsWBGnfQKesMMjAmWegUFqZx6IOetXSXM4g>
Feedback-ID: i1f8241ce:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Nov 2023 07:07:12 -0500 (EST)
Received: by feathertop.org (sSMTP sendmail emulation); Mon, 13 Nov 2023 23:07:09 +1100
From: Tim Lunn <tim@feathertop.org>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Jagan Teki <jagan@edgeble.ai>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tim Lunn <tim@feathertop.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/8] Add support for Sonoff iHost RV1126 Smart Home Gateway
Date: Mon, 13 Nov 2023 23:06:57 +1100
Message-Id: <20231113120705.1647498-1-tim@feathertop.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Sonoff iHost is gateway device designed to provide a Smart Home Hub,
it notably includes builtin radios for Wifi, BT and Zigbee, which
make it suitable SBC for use with many of the open home automation
platforms. It is availabe in two versions, first is based on
Rockchip RV1126 and 4GB DDR4 RAM. There is a second version with
based off the RV1109 dual core SoC and 2GB RAM.

Features:
- Rockchip RV1126 (or RV1109)
- 4GB DDR4
- 8GB eMMC
- microSD slot
- RMII Ethernet PHY
- 1x USB 2.0 Host
- 1x USB 2.0 OTG
- Realtek RTL8723DS WiFi/BT
- EFR32MG21 Silabs Zigbee radio
- Speaker/Microphone

This patch series adds the various device tree nodes required to
support this device. It also adds the initial dts for this device,
This work was largely based off the device trees for mainline
Edgeble Neu2 and downstream Rockchip rv1126-evb-v13 configs.
It has been adapted with relevant peripherals and GPIO pins for the
iHost.

Implemented in this series are most of the core periperhals including
Ethernet, Wifi, BT, Zigbee and RTC. Sound and USB will be added in a
later series.


Tim Lunn (8):
  ARM: dts: rockchip: rv1126: Add alternate UART pins
  ARM: dts: rockchip: rv1126: Serial aliases
  i2c: rk3x: Adjust grf offset for i2c2 on rv1126
  ARM: dts: rockchip: rv1126: Add i2c2 nodes
  ARM: dts: rockchip: rv1126: Split up rgmii1 pinctrl
  ARM: dts: rockchip: rv1126: Add ethernet alias
  ARM: dts: Add Sonoff iHost Smart Home Hub
  dt-bindings: arm: rockchip: Add Sonoff iHost

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm/boot/dts/rockchip/Makefile           |   2 +
 .../boot/dts/rockchip/rv1109-sonoff-ihost.dts |  13 +
 arch/arm/boot/dts/rockchip/rv1109.dtsi        |  23 +
 .../dts/rockchip/rv1126-edgeble-neu2-io.dts   |   2 +-
 .../arm/boot/dts/rockchip/rv1126-pinctrl.dtsi |  72 ++-
 .../boot/dts/rockchip/rv1126-sonoff-ihost.dts |  13 +
 .../dts/rockchip/rv1126-sonoff-ihost.dtsi     | 409 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi        |  21 +
 drivers/i2c/busses/i2c-rk3x.c                 |   8 +-
 10 files changed, 554 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi

-- 
2.40.1


