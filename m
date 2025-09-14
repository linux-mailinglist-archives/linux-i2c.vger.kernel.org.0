Return-Path: <linux-i2c+bounces-12942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89CB56A80
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 18:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65BCC3B7D1F
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 16:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7D42DCF45;
	Sun, 14 Sep 2025 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="WC26C4j9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IX2Fc/pH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B91E7C18;
	Sun, 14 Sep 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757866915; cv=none; b=mem2hOd1L4tjGeWnT/QobudG30m/kfy3NxxpT/ROFVN89VX4sxC3PuHJW2IyKpe9N1sjEc3CnZh0Z/TtoYMRpWAQClUSSRsL2oPhIp3TRGMoHguPPfoZ6jshw8EdyyGQQcK/knhkXtgjQ6sYOW7yP9hzU/QD2FE/2vH5VyNKAzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757866915; c=relaxed/simple;
	bh=/Da2DttCsQAa+Rx6qeHMuvNGUu0yZszNtgyGVHVLBZk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BbzDsCIi2H6i3mH1XYLvQVp5S+XEQJ95dk6JVrpAOxvn6+PZ180Qj3AvVTrlbYLlrwxyMaZk/It1ZNqot+3ngAZUFiJ1/tJcZiKBXpgEzGyehVBeSMRQvl77jVQlq4DeQ3Dp9TrX4vFIydC0wDpYL6r5lUGPvIT3NIBDr7EctHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=WC26C4j9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IX2Fc/pH; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D2DEA14004FB;
	Sun, 14 Sep 2025 12:21:51 -0400 (EDT)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-01.internal (MEProxy); Sun, 14 Sep 2025 12:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757866911;
	 x=1757953311; bh=5L1JR98KhQBQKrvqju9ZiQ8N8qn4BbPPDuCBRBMhO9U=; b=
	WC26C4j9j5I40r5iVd/pwI3ULw/a9svQj7Pk5fX+TiUE4tO5sCT51CxD7IS/f04j
	w9DsLzhJnv5QsOfY1wzAM/28gErfhhH+GGGG3z+yK+v/M/njIlE7qbY5M6Ov8rdj
	qgS4BZl2M8r1yXFkRNYoev8DiYmcfsQcL9U4+8yGs2wyt/cupF0pEXlDjXVh3Px3
	wbHMa2q1RAxQ5vB7nqiKrsY88t0bjwhheDLJcME9UU94kCamO0+Didun93p3bmT5
	XkH7H/c445UKUHRS/wT8b4+3DliH87HsRl+LcXX8B9LCf2ELVARRxMnW2WFrR7bD
	rVcBOqxq364VSOaXZNVFkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757866911; x=
	1757953311; bh=5L1JR98KhQBQKrvqju9ZiQ8N8qn4BbPPDuCBRBMhO9U=; b=I
	X2Fc/pHqqeYRaQOG7P/lBelAHpDL1n7dp+DNcCMENvAfhZU46AYCsBFsM2EOPJdE
	bOc2b/KZCGnHb7i+xZS1EGfrWAEwR8lyT/OP4YJ8GaZpmZvgjLTtoAOn1YlKCB4i
	5p5qRgTSbs4/Aad/XXETge02X7vauLZBb4NEJneQX2RaNm4CmtFzvWtnPgjCGrVa
	Q+IXttqgybGQcu/svf1Wloenc3D3p186+pV7K4thfFfb30cpIqlpPrZ4Ux09W3+E
	Q8eBrYXrNFNDy1dv0uMDX6enSEjbzGS2uEhfZ+hmMRRXnDjbPJumnugLbIvLQNaa
	KIKBwMHNqLsVsmbHIxyMQ==
X-ME-Sender: <xms:n-vGaDQo_YWrYXhHpkxVl7LU3zmRc160iOFv4svCy40jRVOUf7F3aw>
    <xme:n-vGaEzyzu7yxpXvkaqQJ8IQZHj4A-7FQlmk6wGullN5renYGx4KeBKoYMYvItKak
    Sda47yt2pBFXaUimBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefhedvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdflrghnnhgv
    ucfirhhunhgruhdfuceojhgrnhhnvgesjhgrnhhnrghurdhnvghtqeenucggtffrrghtth
    gvrhhnpeekleffhffhtdekffeiueeuvdfgtdeuudfgudejjeehheekvdelkeejudelfeet
    geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjrg
    hnnhgvsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepudegpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtg
    hpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepughmrggvnhhgihhnvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqphhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:n-vGaA1DId_2j3M1BvlFFEtcPGqhoqMEcdoU-RKGbsictkFjfEwqKw>
    <xmx:n-vGaMnWRLz_GQ5dhaLVh5duJPOaZxYnMOx_kU3iQhwmNTA-ZQhtSQ>
    <xmx:n-vGaGjiOXSq6wfV2fnVSUdEA_wBTmtWG_XiFCbfqrtn-YHwVcneRg>
    <xmx:n-vGaBSJrnKqoWCngHScSgpFGIKBu0WfTL8CsCXY6p5UJVXrHHx16Q>
    <xmx:n-vGaOpGgOnuB6UVTupcLqW-57ApmNXHTZIFa_Gnj0R9HNeLenDIYCvy>
Feedback-ID: i449149f6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 875863020073; Sun, 14 Sep 2025 12:21:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgUUmYTZniXg
Date: Sun, 14 Sep 2025 18:21:31 +0200
From: "Janne Grunau" <janne@jannau.net>
To: "Sven Peter" <sven@kernel.org>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Neal Gompa" <neal@gompa.dev>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Hector Martin" <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Mark Kettenis" <kettenis@openbsd.org>,
 "Andi Shyti" <andi.shyti@kernel.org>,
 "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "van Spriel" <arend@broadcom.com>, "Lee Jones" <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Michael Turquette" <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C3=85=C2=A1er?= <povik+lin@cutebit.org>,
 "Vinod Koul" <vkoul@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Keith Busch" <kbusch@kernel.org>, "Jens Axboe" <axboe@kernel.dk>,
 "Christoph Hellwig" <hch@lst.de>, "Sagi Grimberg" <sagi@grimberg.me>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Janne Grunau" <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
Message-Id: <175786548036.4027671.17732393166265974160.b4-ty@jananu.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
Subject: Re: (subset) [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 28 Aug 2025 16:01:19 +0200, Janne Grunau wrote:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
> 
> t6020 is a cut-down version of t6021, so the former just includes the
> latter and disables the missing bits.
> 
> [...]

Applied, thanks!

[02/37] dt-bindings: arm: apple: apple,pmgr: Add t6020-pmgr compatible
        commit: 27ac175609b31853a336917f9596024589989d4c
[04/37] dt-bindings: power: apple,pmgr-pwrstate: Add t6020 compatible
        commit: 9ee3fa4f1dd03ba24be886fcde82286b38378121
[05/37] dt-bindings: cpufreq: apple,cluster-cpufreq: Add t6020 compatible
        commit: 46d7b4c16ee7afc67e21c1044d22ec197e5a3498
[06/37] dt-bindings: interrupt-controller: apple,aic2: Add apple,t6020-aic compatible
        commit: d45bed97401a3b76c968ec08f0292220e32ab852
[07/37] dt-bindings: iommu: dart: Add apple,t6020-dart compatible
        commit: d248111a13852e9823300060f07fefce3ccf3c2a
[08/37] pinctrl: apple: Add "apple,t8103-pinctrl" as compatible
        commit: 100896ab413284dcf77340c114bafffb96f6fd14
[09/37] dt-bindings: pinctrl: apple,pinctrl: Add apple,t6020-pinctrl compatible
        commit: 1b70bfcc576eb8007c003f285c5834ec7cf1beba
[11/37] dt-bindings: mailbox: apple,mailbox: Add t6020 compatible
        commit: b4958f928e0d587bd35318a72bdf6a8df8387933
[12/37] dt-bindings: gpu: apple,agx: Add agx-{g14s,g14c,g14d} compatibles
        commit: 49d7ce3ca93ea90110d334f4f8ce2f68a3536475
[13/37] dt-bindings: iommu: apple,sart: Add apple,t6020-sart compatible
        commit: a93d0de2403a8b1a1686665d5808e4d1d39d5b24
[15/37] dt-bindings: nvme: apple: Add apple,t6020-nvme-ans2 compatible
        commit: 1c9e6a0db3a86bf8f99981570f81e9fb1fa33d4a
[16/37] dt-bindings: net: bcm4377-bluetooth: Add BCM4388 compatible
        commit: 2ba11087d283d00c7a99b45672d564eb1de872dc
[17/37] dt-bindings: net: bcm4329-fmac: Add BCM4388 PCI compatible
        commit: b6b8d3ffaffacdb534c2fc151014b8e7ba382a94
[19/37] dt-bindings: mfd: apple,smc: Add t6020-smc compatible
        commit: 306632217c123ef23c917c7348c32ad29599ba15
[22/37] dt-bindings: spmi: apple,spmi: Add t6020-spmi compatible
        commit: 155eb6a9838776bd217e8942e5074e3b4bdcb5ff
[24/37] dt-bindings: watchdog: apple,wdt: Add t6020-wdt compatible
        commit: bb7a2260fea3f637afafecaae9478c93211f9e8f
[26/37] dt-bindings: clock: apple,nco: Add t6020-nco compatible
        commit: c7c5be895e32299f38035b6c05fa68a7d5c57a50
[28/37] dt-bindings: dma: apple,admac: Add t6020-admac compatible
        commit: a90183490c54bf793cabb5b54b30cc40b24ce129
[30/37] ASoC: dt-bindings: apple,mca: Add t6020-mca compatible
        commit: ae45b991c9f76e8988b7d3bb4b39e4b7c73dceb7
[29/37] ASoC: apple: mca: Add "apple,t8103-mca" compatible
        commit: 186b1b4b5b3d40ea53d739aa025c3a9f8cb37f4c

Best regards,
-- 
Janne Grunau <j@jananu.net>

