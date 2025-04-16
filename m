Return-Path: <linux-i2c+bounces-10428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A1A90CC3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C975E5A030F
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F86226CEE;
	Wed, 16 Apr 2025 20:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAdeEAmu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFE1E1C29;
	Wed, 16 Apr 2025 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834161; cv=none; b=Dqev9wapioXBhLRkAOboPyvkcgLpKMryTKpcNBK+GgNyczGnvp9n0M2udlg4T8BlgQupOAMBWrFQO+JFvPMQemSC1X+3BEF97tO9PvzyMH4b9AolvVqBCxRxMtzY3nvUktcOh9aJm5T6YIc1r515a9s3GBMb3V3Esi+gCPpz8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834161; c=relaxed/simple;
	bh=pCQdOvo4laUHf7dQwDu8+NqQcri7JEdKnymIyq99jkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yef16dBMDkvDs1RoNFgIXHLVwQ61iDCZlXLcIlsUcA2WXX3n97EP4eKMKLw19mCaWvKHLLWwfwTUb54QalM2Ud2iRtSIsHEh6Lwcz2T+tDE1x8Jq+163uQq8N7WZ+zD4zlsBAr8vxQ/FrinqP/sgvS2pXyx03UNUvSnEwhtaVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAdeEAmu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EE1C4CEE2;
	Wed, 16 Apr 2025 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834161;
	bh=pCQdOvo4laUHf7dQwDu8+NqQcri7JEdKnymIyq99jkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAdeEAmuon9/vsZ60kDxHnAVHe3K9UHfeEPMgTodwRVWyu0vBQMReQ/G+JYguUv2T
	 HvMYz8VW5+3VAykUadq3Ns+OuqXJfJnfPwADjMISIV5Hhty5oa/1Su8VrJNBbJphLT
	 etufmg6zplKq6ZlN6Md9FIGRj8sUg/3UgvmcWw/Fbd/xnM6axYOyRl6wFR6wiHtfkG
	 Ka2gUyS55p6Zs8sY2eRxz13LBQg0/8KH4ozJMt0IBL/WAmsAbXFzFd1aJArcz1gIv7
	 xGwnVyApmtGIqPIOvF5zfpYA0DY/I7eVgaGokKpGdDRXMo+vN/3anERyK44APXUMb1
	 12z4vJN+GnE0A==
Date: Wed, 16 Apr 2025 15:09:19 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/13] ARM: vt8500: DT bindings and dts updates
Message-ID: <20250416200919.GA3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416155442.GA3255418-robh@kernel.org>
 <CABjd4YyPzZoX98=FMwr91BG2RhYc0r5=9P-2GGAbR0s043duPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABjd4YyPzZoX98=FMwr91BG2RhYc0r5=9P-2GGAbR0s043duPw@mail.gmail.com>

On Wed, Apr 16, 2025 at 10:55:52PM +0400, Alexey Charkov wrote:
> On Wed, Apr 16, 2025 at 7:54 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Apr 16, 2025 at 12:21:25PM +0400, Alexey Charkov wrote:
> > > Convert some more VT8500 related textual DT binding descriptions to
> > > YAML schema, do minor dts correctness fixes, and add a DT for the
> > > board I'm actually testing those on (VIA APC Rock).
> > >
> > > While at that, also describe the PL310 L2 cache controller present on
> > > WM8850/WM8950.
> > >
> > > Note that this series is based upon Krzysztof's linux-dt/for-next
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > > Alexey Charkov (13):
> > >       dt-bindings: i2c: i2c-wmt: Convert to YAML
> > >       dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YAML
> > >       dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
> > >       dt-bindings: net: via-rhine: Convert to YAML
> > >       dt-bindings: pwm: vt8500-pwm: Convert to YAML
> > >       dt-bindings: timer: via,vt8500-timer: Convert to YAML
> > >       dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
> > >       ARM: dts: vt8500: Add node address and reg in CPU nodes
> > >       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
> > >       ARM: dts: vt8500: Use generic compatibles for EHCI
> > >       ARM: dts: vt8500: Use generic node name for the SD/MMC controller
> > >       ARM: dts: vt8500: Add VIA APC Rock/Paper board
> > >       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
> > >
> > >  Documentation/devicetree/bindings/arm/vt8500.yaml  | 19 ++++---
> > >  Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 ---------
> > >  .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 +++++++++++++++++
> > >  .../interrupt-controller/via,vt8500-intc.txt       | 16 ------
> > >  .../interrupt-controller/via,vt8500-intc.yaml      | 47 +++++++++++++++++
> > >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> > >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
> > >  .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 +++++++++++++++
> > >  .../devicetree/bindings/net/via-rhine.txt          | 17 ------
> > >  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 +++++++++++++++
> > >  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 -------
> > >  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ------
> > >  .../bindings/timer/via,vt8500-timer.yaml           | 36 +++++++++++++
> > >  MAINTAINERS                                        |  7 ++-
> > >  arch/arm/boot/dts/vt8500/Makefile                  |  3 +-
> > >  arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  5 ++
> > >  arch/arm/boot/dts/vt8500/vt8500.dtsi               | 12 ++---
> > >  arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8505.dtsi               | 14 ++---
> > >  arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8650.dtsi               | 14 ++---
> > >  arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8750.dtsi               | 14 ++---
> > >  arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8850.dtsi               | 23 +++++---
> > >  arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       | 21 ++++++++
> > >  arch/arm/boot/dts/vt8500/wm8950.dtsi               | 11 ++++
> > >  27 files changed, 386 insertions(+), 165 deletions(-)
> > > ---
> > > base-commit: 62db22c2af6ce306943df5de6f5198ea9bd3d47b
> >
> > I could not apply this series for testing. What base is this? It is
> > unknown to anything I have. Please use most recent rc1 unless you have
> > a dependency then use recent linux-next or a branch in it.
> 
> It's based on Krzysztof's linux-dt/for-next [1] as mentioned in the
> cover letter above - it hasn't yet been pulled into today's
> linux-next. Specifically, this patch [2] from Wolfram is a dependency
> for patch 10/13 in this series - the rest should apply cleanly on top
> of 6.15-rc1

Unfortunately tools can't read cover letters other than defined tags 
like base-commit.

I would suggest you send each binding patch separately and then just the 
.dts changes as a series. Then it is split-up by which trees these all 
get applied to as bindings are applied by the subsystems typically.

Rob

