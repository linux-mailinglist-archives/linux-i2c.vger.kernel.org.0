Return-Path: <linux-i2c+bounces-12941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6AB56A33
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 17:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3C217BB28
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 15:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB2D2DA746;
	Sun, 14 Sep 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="fqniaA4n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vj23bhcy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A9E55A;
	Sun, 14 Sep 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757863527; cv=none; b=KF/+pcMACm7ObV85zo8vM6aIaeYqgg/RWTOOwffP869F9fKrFttweX2mCAaLDBhD93Lgn7+mR9F89W44ISFdX9W5GUWFwgpP92yaSKGbu7Sr08R5JWcfdow34SraYAJ7ufK2TDazJSaJgt1Tn1ihYlHjzhgmK4piZnUJYfPLmiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757863527; c=relaxed/simple;
	bh=pzjFWi3vSizi+sDsUA5hWojROcQ85d1CDLAbV4UkiYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diuB/VKmqxYjKGY2fFwWQEl2UH3PcxRxUfDekQSFonP3nk/kVPKedeJHeIoknhbixllfQtoRjCynangPYIoVT6B4QVeQcYOWPD+fvj3Y+3s19mpj1+UjRuy8ziPobpzty8HbRVgekknHkyoI+5KLP3lqavmiha+jhpy66VxZXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=fqniaA4n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vj23bhcy; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 9FD391380371;
	Sun, 14 Sep 2025 11:25:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 14 Sep 2025 11:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1757863524; x=1757870724; bh=tWnDpBVNIk
	8/6xOJajwpS5PW/ODB8z60GmMpvcHEyLY=; b=fqniaA4no7nBvtwisVO0EAziaY
	zEu1OxB2nmfd9hxQQ6FceNaEfgPI/uOeA3ZUMlixYSgDNmwiIjnghzegCeXC7ooM
	LvWC+S6IFuwyUZIiDef/lCWKT4qBsufKdFw30aP8oBZazgmYwz3BDB+ZmycSta6t
	xptfu7gQpOG7ehf9onSRjHDPp99xdgiS7wuPGm4N3NTF+9TI+D6pUYs4H+vp6SZw
	M5/GnUj+UjYiCszBHilRciH7Xg30wJ4oaajlksr0rV95z7TNExSNAABZPiumrshE
	FvdljC6vKY79xqhNPoz+sv/5ZzI32UEqoetagTR1nlRh8Hs/vE+pwru4KkFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757863524; x=1757870724; bh=tWnDpBVNIk8/6xOJajwpS5PW/ODB8z60GmM
	pvcHEyLY=; b=Vj23bhcyVMjkmI+SG5zcvx9xWXRofAidImGdIqDbcLHM0WUXLc8
	VdJ5/Ah1c+SQLupMy8hPB6g+eQtldDZoSyTcdvRRHeqbzvU0Cza12fMqqwBCwKIx
	XRXQG97RFEtAOSU5a+qagQeuIAZpU+z4/twkaZZ9fF8rbZYTKJJUunKkcHe13HsO
	taCZKYFvYUAnhVBpORJEKOyg2/M2EAShulAaGjcM8zm5gq5xLiBnzeFc2Kbds8Kl
	cjiBRbNIWFH6ATBWXfkEOIb9VhsgtBfbtq1YELEVGHuugIERRPgQ8SsFlhE1Cyyg
	dvlCSYfmupMutudH+yvoMkyjyO68z9vORGw==
X-ME-Sender: <xms:YN7GaCTuMx0f0t2jRi7MjfjequzWOeswX29HOTcvvGYGS0MYiIBHUg>
    <xme:YN7GaL6QBGhruZL6oRXxCEfZI4zo5kPWLdpjuyLcU_mz4EuO5tln9nxooV2UWTC9E
    tIpfL6jS9L3FfQQEuI>
X-ME-Received: <xmr:YN7GaLYUVdoEvMx6ZIn2invZ0We4bPduj51BqChNtRqO21phkH22Zsg10x0DzgL7UQBL86YCGWtRbrW6wbE3W7edo_aBudk-3-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefhedujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfduue
    ffleefkeegueektdehkeejtedtffdtudejhfdvheetgfeigfeltdeufeejnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepieef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlih
    hnrghrohdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohepnhgvrg
    hlsehgohhmphgrrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghr
    tggrnhdrshhtpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YN7GaATZo9SilxufSz1EnUQzaOFsuTqisab9144SXip2OdtK6SNNLA>
    <xmx:YN7GaJKV9V5TpZEISgGyVcxs3hzxjRHlCRxpZ1ubu5AZbXZ1dg9h1Q>
    <xmx:YN7GaLtfn-mnCoeiXQaPsWDk9zzhoxZfBvlAx4p97b2D9kfTWnImVA>
    <xmx:YN7GaPJNXrp5QdJBPMY7CemSNwxQLBjHfnIQrKLxRmSJmLsfz5TGDQ>
    <xmx:ZN7GaF5XtQVAFSjVp-zByym9kYneBv_lXsjnvFHPMbeT2w1HFN8_DQfJ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 11:25:19 -0400 (EDT)
Date: Sun, 14 Sep 2025 17:25:18 +0200
From: Janne Grunau <j@jannau.net>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
Message-ID: <20250914152518.GB1645557@robin.jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <CAPDyKFr3WO5nLXYWoyH13KirmfNU+sVrvhefuwC+GrpAgynBgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPDyKFr3WO5nLXYWoyH13KirmfNU+sVrvhefuwC+GrpAgynBgQ@mail.gmail.com>

On Thu, Sep 04, 2025 at 12:41:58PM +0200, Ulf Hansson wrote:
> On Thu, 28 Aug 2025 at 16:01, Janne Grunau <j@jannau.net> wrote:
> >
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
> >
> > The series adds those fallback compatibles to drivers where necessary,
> > annotates the SoC lists for generic compatibles as "do not extend" and
> > adds t6020 per-SoC compatibles.
> >
> > [1]: https://lore.kernel.org/linux-pci/20250819-pci-pwrctrl-perst-v1-0-4b74978d2007@oss.qualcomm.com/
> > [2]: https://lore.kernel.org/asahi/20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net/
> > [3]: https://lore.kernel.org/asahi/20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net/
> > [4]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> >
> > Signed-off-by: Janne Grunau <j@jannau.net>
> 
> Is it okay for me to pick up the pmdomain patches (patch3 and patch4)
> by now - or what route are you planning to get this merged through?

Sorry, I forgot to mention the merge strategy in the cover letter. I've
picking up all acked patches that are not yet picked up and we'll merge
them through the apple-soc tree.
This includes all dt-binding patches, patch4.

Feel free to pick up or ack patch3

Janne

