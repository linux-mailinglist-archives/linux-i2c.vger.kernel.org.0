Return-Path: <linux-i2c+bounces-12622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B465B43B79
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016021BC7F76
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 12:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1002ED143;
	Thu,  4 Sep 2025 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="hDNDwMru";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nwHa/7xp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8A2E1C6F;
	Thu,  4 Sep 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988671; cv=none; b=nUnMh4qZMgUNwbAVKrgTIcN/7BkzL90zYllU0/0rmQD53enbX1tQuUm4B4SZqzegn2Z1kgyGrS7YraK+7OJwH4pVsbGYLSXPRlMQdteL9ePw5f4E69iaQ0thIDcD9uUDbD/xon7edfVSeMi7bA6YtoHiVTvXHB6PeQN4Lr3rWos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988671; c=relaxed/simple;
	bh=KTI+fAni0p2MENKwxEmxfldj86CWpRNVIqjj2os4Uhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swZ3D021e9GKvqpwcHdeFHpyRidBYOrSm+XnXxAbMvt7yxJ0cavyfgfzMMFQchani6r0z29WFfqqmV1hPKNwI3p07IYFleN6cAgiZ8bnnPZTIkavwKOtd1Bi9vGr68s+imvANCjcYG3ltDHFgopM0G8QRsNEReNKagBIwtgxBA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=hDNDwMru; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nwHa/7xp; arc=none smtp.client-ip=103.168.172.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id 91B7A138030E;
	Thu,  4 Sep 2025 08:24:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 04 Sep 2025 08:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1756988667; x=1756995867; bh=8U7GdOjxhs
	TzAyM8D4u5BI8G2Xd1f8HkMUIoKDmyl7w=; b=hDNDwMrunWW+ZSBiQCae5O6HdM
	rHIzrk1w93POFvUtWhk8/PTcjfDQw70b/bAYalCtI2CEx2Jf3r36xMTLqz9CDIHu
	HZcPpZPQ+saIaP0ny4IDb8U+Rt3hJOO0nBCCwBQG1znzCFlMcLqF43sj3v5cxi5F
	JrUfDaG0n1YTh8zUbpL1UxNYnnzVf7SsFPCIxwfijVgSkmuLxLS3N65UfaS6exGA
	ADh5LalaVXZoXMFdoF1Z1f55no4+j5lcUJw0Jasq3jj0uF9M2iWqQlJ4iQPxmKgW
	bJR0slNQsYWBDyjz0B2oPnJfmGr+7Cs2dBc6c3jMcMe8lqkFrYcT3BVZQUFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756988667; x=1756995867; bh=8U7GdOjxhsTzAyM8D4u5BI8G2Xd1f8HkMUI
	oKDmyl7w=; b=nwHa/7xpjU32Z0Hf4NkHRGrhCI9S0+o+3GkFeLYaD4BO4ahSIiE
	AzfgjNUTcHpC8m5rkhEaZpprVmEahYBL4a3IXs7TKP7uSms2vaqjFv/7OVT1+BrN
	HiMWeD78WUeyUOqv6Ut+wjdDFtN7PwBIpxpp77y9j/hfwsM5M40bJShcazAq2Nfj
	vU0k0733ZUqRn1WSn2lEKneSOFqnM5iYPhEZMUh5lh5NYIX7eFe8AmPGcP1UL9Oo
	NpVS0IuWh+DjWJNqzDnp+c3xE7dELMyc/KjBBuMsB0ith0KURGCxVQ8t1hCBLsHq
	Nw/5Zqgh0Zq1JjITNRJNb43qV+z/R/mJORA==
X-ME-Sender: <xms:-YS5aPp7-Q-PJ75oKwTPe0FcPwMF6CU7PPlMZUYvafzhxITyOuiNQQ>
    <xme:-YS5aNw42Jh_uRF-Vh88T3KVyMb5UDEtsSugx0zRywWFbbhkl6SwQIyf9iLELaMQ5
    m338mmu0yL4v5o3LG8>
X-ME-Received: <xmr:-YS5aHydJs3sY-GK3oCbvAHsOkngOP2IJEXL3-Xsm7VL-Gn688r9we0YV-V5onScvbN07mdHctJXOIr-NeHO4ekZlmvdoAv7z3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeitdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvdffve
    elgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnh
    gvthdpnhgspghrtghpthhtohepieefpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgt
    phhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehkrhiikhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoheprh
    grfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhrvghshhdrkhhumhgr
    rheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:-YS5aFL5RENaptCIz0BuOu7c20yv3c3vvpf0r7dw-JaCLTja_Bz-qQ>
    <xmx:-YS5aMhqfqjJDjwhEwdZLnuYL-XJITqjWEtj1CN62kOs7Lr-e1ARig>
    <xmx:-YS5aLmrOIowpLzSrzFmFlJi5IwpCHBFCji4UnFHC3LawjtEN9XozQ>
    <xmx:-YS5aBjdESh3CesfnA5BUM2uF_YS4jSIK-ieYu5ywQQcEQrIsgMdmQ>
    <xmx:-4S5aHzTvFrOsjIChzaXkMhnpIzOEDH0ImtlmNuExND3IUGhmeRiqy8O>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 08:24:24 -0400 (EDT)
Date: Thu, 4 Sep 2025 14:24:23 +0200
From: Janne Grunau <j@jannau.net>
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,	Hector Martin <marcan@marcan.st>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,	Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,	Robin Murphy <robin.murphy@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,	Andi Shyti <andi.shyti@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,	Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>,	Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>,	Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,	asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,	linux-pm@vger.kernel.org,
 iommu@lists.linux.dev,	linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org,	dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org,	linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org,	linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org,	dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org,	linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
Message-ID: <20250904122423.GB89417@robin.jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250829195119.GA1206685-robh@kernel.org>
 <20250830071620.GD204299@robin.jannau.net>
 <20250902194528.GA1014943-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902194528.GA1014943-robh@kernel.org>

On Tue, Sep 02, 2025 at 02:54:34PM -0500, Rob Herring wrote:
> On Sat, Aug 30, 2025 at 09:16:20AM +0200, Janne Grunau wrote:
> > On Fri, Aug 29, 2025 at 02:51:19PM -0500, Rob Herring wrote:
> > > On Thu, Aug 28, 2025 at 04:01:19PM +0200, Janne Grunau wrote:
> > > > This series adds device trees for Apple's M2 Pro, Max and Ultra based
> > > > devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> > > > follow design of the t600x family so copy the structure of SoC *.dtsi
> > > > files.

...

> > > > After discussion with the devicetree maintainers we agreed to not extend
> > > > lists with the generic compatibles anymore [1]. Instead either the first
> > > > compatible SoC or t8103 is used as fallback compatible supported by the
> > > > drivers. t8103 is used as default since most drivers and bindings were
> > > > initially written for M1 based devices.
> > > 
> > > An issue here is any OS without the compatibles added to the drivers 
> > > won't work. Does that matter here? Soon as you need any new drivers or 
> > > significant driver changes it won't. The compatible additions could be 
> > > backported to stable. They aren't really any different than new PCI IDs 
> > > which get backported.
> > 
> > I don't think backporting the driver compatible additions to stable
> > linux is very useful. It is only relevant for t602x devices and the only
> > way to interact with them is the serial console. The T602x PCIe support
> > added in v6.16 requires dart changes (the posted 4th level io page table
> > support) to be useful. After that PCIe ethernet works so there is a
> > practical way to interact with t602x systems. So there are probably zero
> > user of upstream linux on those devices 
> > I'm more concerned about other projects already supporting t602x
> > devices. At least u-boot and OpenBSD will be affected by this. As short
> > term solution m1n1 will add the generic compatibles [1] temporarily.
> > I think keeping this roughly for a year should allow to add the
> > compatibles and wait for "fixed" releases of those projects.
> > I'll send fixes for u-boot once the binding changes are reviewed.
> 
> Honestly, at least in the cases where the generic compatible works for 
> every chip so far, I'd just stick with it. The issue with generic 
> compatibles is more that you don't really know if things are going to be 
> the same or not. And most of the time, the h/w ends up changing.
> 
> If you want to keep it like this since you've already done it, then for 
> all the binding patches:

Let's keep with this series. I still have a branch with dt-binding
changes using the generic compatibles but let's keep this approach to
confusion and duplicate review work.

> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks

Janne

