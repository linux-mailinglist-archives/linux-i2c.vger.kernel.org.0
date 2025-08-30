Return-Path: <linux-i2c+bounces-12516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA1B3C8AB
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 09:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5FE67C7633
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 07:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A9927A124;
	Sat, 30 Aug 2025 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="bGPRiKj+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A28P82GL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403365BAF0;
	Sat, 30 Aug 2025 07:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756538189; cv=none; b=BnZXf3FyY14Q14ztdY7cKgzPh+uUy8+6jbStQ6iIUOGo/WoJtjvw6qjODgYl2iy1kJQDqmoCSipMwQU4N4YqS6TW6X77mSC6dcBitk6khk6Ee0eU9UktyHv1v23z+M2ktP8MkkStNpxJrQRhRaSCVsdvacobpeWnRyWUdXev0Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756538189; c=relaxed/simple;
	bh=Xgq//bPMcuLhTUcoKQVvIGaVUwN6Y8zHe3tfndbRoBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APLNP1pWpFXMSnM07ztj/na3FmyYYxNzNXea5BBUTac2XBmSxO7Vu/CDXiE4g9yjwqEMZCIcEEc/NmoDbdy3yWmTPnGr6ljnrTZlpve87ZHYFEYVvFd0NLDftigScHSQICZIujS5w2outiM1ZJezKY2WDJmMuTrn75UX5QF7OFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=bGPRiKj+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A28P82GL; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 50B9C13803E1;
	Sat, 30 Aug 2025 03:16:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 30 Aug 2025 03:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1756538186; x=1756545386; bh=rH5wSPSqP8
	tNxz48V8nyDtHP/PfH/+QarsY2hPsLNiY=; b=bGPRiKj+zJAsCUQyrJp0/StHT3
	Z0CEFhLQjV5xm7Yvbyg5RazYCfPbyTHWSm2ZpCegTbXOy6qhuD/CjdcFxuViszyu
	G3+fcGeOv7HdCyn7AzxAqSFmzLO2erX/Vdp5eEeZaLTZRFRspFMiQ+busfvUv9xK
	P1Qxg+vqomILq0dDixCVgYHw5VQEBClB9I6+/uTShTR//VYQFOWuKhVaLsvC6l/b
	E1N/tfeehqrMQEp4i3wWoOJxGypUi7brZoL9qGPmQKmmMa93tVd1AY5Gro+BAjS3
	WpUTogmTRpIeiSKPcsYZ3mE0og2OG5NvvD5b/WVFxeoMPFsjnwskajCq3uyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756538186; x=1756545386; bh=rH5wSPSqP8tNxz48V8nyDtHP/PfH/+QarsY
	2hPsLNiY=; b=A28P82GLhQ+gU+qNvkSXEMIHHGhWHgGPB6W2BqfuM8nVdICuM2A
	NcqEdXjnRC5GOtPhl8vytw2JOVW6a632Lth7tFVqpN0jcVrs5FIWi0nJ5dbfpPbz
	93UWghe/7/x4NXeA4FN4wHq2l0R/6xrVdl4M6x+X4EqZcsuk7fUrrkX7z2aqNGXe
	GRh9v13JNwBHa0GWMNd0IJAZ/VLuVZRHMzmIP6KgEOrMibcUtTOr/XOmSC3N9SR2
	+4h7cZHX5hYQElJlZ9AcSZWpik6DY6Yif1Q+6msGHxqUXYJZ/hDnKBXbWh3Xvalq
	Rf1Hz1zKH3Te14Zyu+F/tIsbTPiaescl/sQ==
X-ME-Sender: <xms:R6WyaEoVPmMMjSTFVHUliXOdv-32qkUK5pBFUekwj0BEfXYXKXHMdg>
    <xme:R6WyaOxfi2Sr_p908cLZZq0WtOWmPygKs_jKndyVj8rKDpXX8ikKi1OeywN_Gtza-
    FiH-hDxXuUZTl36M64>
X-ME-Received: <xmr:R6WyaEyfRmAxZWCNsVqvVaXCqEN1juICIShBdAflOgf0gNEE_E5nocVl8uCdcH2Ux_v_VJ8rmIGy5LrSoEu2QIiMu_-QOznOlpk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeehjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepieefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdp
    rhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoh
    eprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhrvghshhdrkhhu
    mhgrrheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:R6WyaOKeRrX_rKVtlS-_HS0UcyN9w8mWfjCwNfiQ70_pAa29FRblZA>
    <xmx:R6WyaBhJsS4AgbvUvcN_o6uHp3h_R8NH2iRFaJDZJdGCW4iQPaQfCw>
    <xmx:R6WyaMkzXbMbopG8scAkzx_CFhYUQNKGJXW5k3t17XIk3bIEeUpTWQ>
    <xmx:R6WyaOgrns0dbGzbmla7f4E8nyVhRwKAcFG-qkHg9ORUTbTcZhmzrg>
    <xmx:SqWyaJIOEg53pkAeV7MbeJTeynbZUjxSAdTQb-JDXFYqQHxsi0m95a1W>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Aug 2025 03:16:22 -0400 (EDT)
Date: Sat, 30 Aug 2025 09:16:20 +0200
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
Message-ID: <20250830071620.GD204299@robin.jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250829195119.GA1206685-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829195119.GA1206685-robh@kernel.org>

On Fri, Aug 29, 2025 at 02:51:19PM -0500, Rob Herring wrote:
> On Thu, Aug 28, 2025 at 04:01:19PM +0200, Janne Grunau wrote:
> > This series adds device trees for Apple's M2 Pro, Max and Ultra based
> > devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> > follow design of the t600x family so copy the structure of SoC *.dtsi
> > files.
> > 
> > t6020 is a cut-down version of t6021, so the former just includes the
> > latter and disables the missing bits.
> > 
> > t6022 is two connected t6021 dies. The implementation seems to use
> > t6021 and disables blocks based on whether it is useful to carry
> > multiple instances. The disabled blocks are mostly on the second die.
> > MMIO addresses on the second die have a constant offset. The interrupt
> > controller is multi-die aware. This setup can be represented in the
> > device tree with two top level "soc" nodes. The MMIO offset is applied
> > via "ranges" and devices are included with preprocessor macros to make
> > the node labels unique and to specify the die number for the interrupt
> > definition.
> > 
> > The devices itself are very similar to their M1 Pro, M1 Max and M1 Ultra
> > counterparts. The existing device templates are SoC agnostic so the new
> > devices can reuse them and include their t602{0,1,2}.dtsi file. The
> > minor differences in pinctrl and gpio numbers can be easily adjusted.
> > 
> > With the t602x SoC family Apple introduced two new devices:
> > 
> > The M2 Pro Mac mini is similar to the larger M1 and M2 Max Mac Studio. The
> > missing SDHCI card reader and two front USB3.1 type-c ports and their
> > internal USB hub can be easily deleted.
> > 
> > The M2 Ultra Mac Pro (tower and rack-mount cases) differs from all other
> > devices but may share some bits with the M2 Ultra Mac Studio. The PCIe
> > implementation on the M2 Ultra in the Mac Pro differs slightly. Apple
> > calls the PCIe controller "apcie-ge" in their device tree. The
> > implementation seems to be mostly compatible with the base t6020 PCIe
> > controller. The main difference is that there is only a single port with
> > with 8 or 16 PCIe Gen4 lanes. These ports connect to a Microchip
> > Switchtec PCIe switch with 100 lanes to which all internal PCIe devices
> > and PCIe slots connect too.
> > 
> > This series does not include PCIe support for the Mac Pro for two
> > reasons:
> > - the linux switchtec driver fails to probe and the downstream PCIe
> >   connections come up as PCIe Gen1
> > - some of the internal devices require PERST# and power control to come
> >   up. Since the device are connected via the PCIe switch the PCIe
> >   controller can not do this. The PCI slot pwrctrl can be utilized for
> >   power control but misses integration with PERST# as proposed in [1].
> > 
> > This series depends on "[PATCH v2 0/5] Apple device tree sync from
> > downstream kernel" [2] due to the reuse of the t600x device templates
> > (patch dependencies and DT compilation) and 4 page table level support
> > in apple-dart and io-pgtable-dart [3] since the dart instances report
> > 42-bit IAS (IOMMU device attach fails without the series).
> > 
> > After discussion with the devicetree maintainers we agreed to not extend
> > lists with the generic compatibles anymore [1]. Instead either the first
> > compatible SoC or t8103 is used as fallback compatible supported by the
> > drivers. t8103 is used as default since most drivers and bindings were
> > initially written for M1 based devices.
> 
> An issue here is any OS without the compatibles added to the drivers 
> won't work. Does that matter here? Soon as you need any new drivers or 
> significant driver changes it won't. The compatible additions could be 
> backported to stable. They aren't really any different than new PCI IDs 
> which get backported.

I don't think backporting the driver compatible additions to stable
linux is very useful. It is only relevant for t602x devices and the only
way to interact with them is the serial console. The T602x PCIe support
added in v6.16 requires dart changes (the posted 4th level io page table
support) to be useful. After that PCIe ethernet works so there is a
practical way to interact with t602x systems. So there are probably zero
user of upstream linux on those devices 
I'm more concerned about other projects already supporting t602x
devices. At least u-boot and OpenBSD will be affected by this. As short
term solution m1n1 will add the generic compatibles [1] temporarily.
I think keeping this roughly for a year should allow to add the
compatibles and wait for "fixed" releases of those projects.
I'll send fixes for u-boot once the binding changes are reviewed.

Janne

