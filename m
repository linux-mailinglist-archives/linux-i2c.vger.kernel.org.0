Return-Path: <linux-i2c+bounces-376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C57F45E4
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 13:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6638C28100E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 12:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21166FB4;
	Wed, 22 Nov 2023 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b="eYqrvmHV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UPw+yUH6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB0A92;
	Wed, 22 Nov 2023 04:22:55 -0800 (PST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id AE20E3200A29;
	Wed, 22 Nov 2023 07:22:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 22 Nov 2023 07:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feathertop.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1700655771; x=1700742171; bh=3N
	sL+Rw070Fga47xp+yQ7KIQQBlv195a72ndPj4rq4M=; b=eYqrvmHV+C56AOeU2D
	rae5pAnM7s7QReKqFmYVk+ab0f4eJAh3BCRbVFTc7v4nJGPwtppGlf0tdArjd1ZO
	RpFrZAR7tlVR7qB4kDwFZF2EC2U/6N2IxB/Ecx1274D/JyMfoWUTYbMd3yDtCD/z
	ErYANHMVPbmUTziCMXrV3iyu7vS+rtZIDOlDljhq/j8L8e5UW2VUPTbgsKgNVJuK
	4JUsRnjKdFaKbHbEqKI212ToAtfCDzRYrvxxH7DSFFVgP8OeXrNq+7IL3KcZYcQw
	NW33peNNTVNEfGgfuY0FG5bffZyes93C3MpRsfo16BZbNgAgDzAkeDWIty5DO2V4
	tLYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700655771; x=1700742171; bh=3NsL+Rw070Fga
	47xp+yQ7KIQQBlv195a72ndPj4rq4M=; b=UPw+yUH6wQMfdNRXRIgPEXS0TJ+oc
	eQQOrDH0NjxLbgZbidJyPeF2aRpXk8bmjIVYlI+65vdanrh/cVhOn3BsQHg414w0
	xt9yGmMGYGzb4F/qx6cYtKx5hYcg9B9em/eOgoFneeUFPgNYw5dyl1+nT2RGqSrG
	hgqi/uCEU4wHNI9WNFWmhsjVm8Z5S7EWcxAMYoFqcv4QNvz6xUNzK7aSpILTTTVr
	DtQt28UTd43CZnNOYTtfELqFEVr6RrIkC3ljweCRaFsGV2oTWrnCxFYG2MPfdpyQ
	TsON7/N+sNW+gsZSsM+/AcA1i6SgCvqfaIGSNmb0XP19ch4HKKZoMxTIQ==
X-ME-Sender: <xms:mvJdZS7e9M9NsGY9SZOKvE4SRk1L02xeqd_4fc0dq0YxhMzQ1-vjTg>
    <xme:mvJdZb4JPolK_ah1Zl5ozdZncZoGG9GF2gdgwq5BOSwp-IVxhUUuM72McP9fc2dzP
    pFo4b3NAg>
X-ME-Received: <xmr:mvJdZRcys-L1di2MsmmUwE1XRc6w_qLF9xfIYcjUrP7LW-_lzWtDJgiCSB0V7wJyh211iyJ5gf0_TjLTRHwkPcBWjt46u9s0Lfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhimhcunfhu
    nhhnuceothhimhesfhgvrghthhgvrhhtohhprdhorhhgqeenucggtffrrghtthgvrhhnpe
    duhfdtveeujeejjeffieevgfdtudegfeffvedugfetteehudevteehtefgieeitdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtihhmsehfvg
    grthhhvghrthhophdrohhrgh
X-ME-Proxy: <xmx:mvJdZfJpZOk9KGbvXSCRQeUC0YApHFEQWMIG1ucHb7f1bYVeOGahUw>
    <xmx:mvJdZWJMTFqpGFcYlltYzMFFaH971Nz71Jza5OYNhc3rCjbwhlPW_A>
    <xmx:mvJdZQwuW-aJdpcfBtdHPvtIEZNBzctigXpivm0LpZITEnZRFDgRyQ>
    <xmx:m_JdZTXrD-qJ5dXWL-Xa9kFqhJCIoR6_IExfmo2JlwgMTLJroLV7jg>
Feedback-ID: i1f8241ce:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Nov 2023 07:22:45 -0500 (EST)
Received: by feathertop.org (sSMTP sendmail emulation); Wed, 22 Nov 2023 23:22:41 +1100
From: Tim Lunn <tim@feathertop.org>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Tim Lunn <tim@feathertop.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/9] Add support for Sonoff iHost RV1126 Smart Home Gateway
Date: Wed, 22 Nov 2023 23:22:23 +1100
Message-Id: <20231122122232.952696-1-tim@feathertop.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Sonoff iHost is gateway device designed to provide a Smart Home Hub,
most notably it includes builtin radios for Wifi, BT and Zigbee, which
make it suitable SBC for use with many of the open home automation
platforms. It is availabe in two versions, first is based on
Rockchip RV1126 and 4GB DDR4 RAM. There is a second version based off
the RV1109 dual core SoC and 2GB RAM.

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

Changes in v2:
- i2c: clarify commit message
- Address review comments from Heiko
- Split out rv1109.dtsi to new patch
- Collect Robh Ack for dt-bindings patch

Tim Lunn (9):
  ARM: dts: rockchip: rv1126: Add alternate UART pins
  ARM: dts: rockchip: rv1126: Serial aliases
  i2c: rk3x: Adjust offset for i2c2 on rv1126
  ARM: dts: rockchip: rv1126: Add i2c2 nodes
  ARM: dts: rockchip: rv1126: Split up rgmii1 pinctrl
  ARM: dts: rockchip: rv1126: Add ethernet alias
  ARM: dts: rockchip: Add rv1109 SoC
  ARM: dts: Add Sonoff iHost Smart Home Hub
  dt-bindings: arm: rockchip: Add Sonoff iHost

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm/boot/dts/rockchip/Makefile           |   2 +
 .../boot/dts/rockchip/rv1109-sonoff-ihost.dts |  13 +
 arch/arm/boot/dts/rockchip/rv1109.dtsi        |  23 +
 .../dts/rockchip/rv1126-edgeble-neu2-io.dts   |   2 +-
 .../arm/boot/dts/rockchip/rv1126-pinctrl.dtsi |  72 +++-
 .../boot/dts/rockchip/rv1126-sonoff-ihost.dts |  13 +
 .../dts/rockchip/rv1126-sonoff-ihost.dtsi     | 407 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi        |  21 +
 drivers/i2c/busses/i2c-rk3x.c                 |   7 +-
 10 files changed, 551 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi

-- 
2.40.1


