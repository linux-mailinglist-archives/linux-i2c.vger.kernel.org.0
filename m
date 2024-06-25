Return-Path: <linux-i2c+bounces-4349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A1917320
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 23:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996D71F23E66
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 21:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751B917F362;
	Tue, 25 Jun 2024 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArcIuk0u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C417DE2E;
	Tue, 25 Jun 2024 21:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719349938; cv=none; b=Db5z4zAG5THtvBE8Sbjgpk7Buk8k5WivILb93bEMkP++nXYYkUQBjStuQLOqthCx9ZUCfXgapOgnLqK8GJfrbbUVyPJLlaHpDAyBdxJ+JxqwnoNWUqYRWl+MTV+bMSd9v9qaplIh3Ffm9yRv/akWd56wKgrFWFMkWcI+hegn0R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719349938; c=relaxed/simple;
	bh=hyygwZzV0TA9MeTrczY+xfhnsSFmoluW/aMTxSPPF7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrsx3retKRTBVJTyM3S6vHK838RUV5hvPFphP1Gqr17eYJujvjIR5J7JcFM4n8gLXFMoRx0C1486VoYYLUauWvvCdzhTwn0Vzjol8SD1c3voUq0ajDCYRNGEVswIgHSVXgjLtoduOxeHFKbD2qDAMDUgDiGsju6urXTRgJFEazY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArcIuk0u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F61C32781;
	Tue, 25 Jun 2024 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719349937;
	bh=hyygwZzV0TA9MeTrczY+xfhnsSFmoluW/aMTxSPPF7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArcIuk0uRfsESHfkGfkKUOWRPGGQRoYshDAKXgfL7RAidYC2yoPUOF4EOIWRth/zx
	 ykHnbRshuPVKR4UsTmEqJpfbjR7Lxb1MgohaxTO7sN4G186OXUULYfjTSoMk/JACVy
	 rDH4YFTTQFVhxEeWdIOOD5ronHyHYn5GlVnw+3JtZFiKhbLmGLU7w1aHq4GtR8VqXx
	 zOrwlDLRr/Fxt5QON7ooh6qk8zgpeQFn4BGJ4f8p9B/da2ub1m3VU/0NxxHk78cBsC
	 Ylf78UIPjF87TiTkhrpWjEAnrqweWrfQoiMdjHdFmTSchTgaZPSVi6dGjUTTadSf7V
	 tnFI4Gu0p7ohg==
Date: Tue, 25 Jun 2024 23:12:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yangtao Li <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
Message-ID: <73yvglxha45d5ft74m3y5fdmkgatm2yftvhza2msg4ombjz42f@wz43pubhbpdz>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
 <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
 <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>

Hi Piotr,

On Fri, Jun 21, 2024 at 02:08:03PM GMT, Piotr Wojtaszczyk wrote:
> On Fri, Jun 21, 2024 at 12:57 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> > > When del_timer_sync() is called in an interrupt context it throws a warning
> > > because of potential deadlock. Threaded irq handler fixes the potential
> > > problem.
> > >
> > > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> >
> > did you run into a lockdep splat?
> >
> > Anything against using del_timer(), instead? Have you tried?
> 
> I didn't get a lockdep splat but console was flooded with warnings from
> https://github.com/torvalds/linux/blob/v6.10-rc4/kernel/time/timer.c#L1655
> In the linux kernel v5.15 I didn't see these warnings.
> 
> I'm not a maintainer of the driver and I didn't do any research on
> what kind of impact
> would have using del_timer() instad. Maybe Vladimir Zapolskiy will know that.

Your patch is definitely correct, no doubt about that.

And I don't have anything aginast changing irq handlers to
threaded handlers. But I would be careful at doing that depending
on the use of the controller and for accepting such change I
would need an ack from someone who knows the device. Vladimir,
perhaps?

There are cases where using threaded handlers are not totally
right, for example when the controller is used at early boot for
power management handling. I don't think it's the case for this
driver, but I can't be 100% sure.

If you were able to see the flood of WARN_ON's, would be
interesting to know how it behaves with del_timer(). Mind
giving it a test?

Thanks,
Andi

