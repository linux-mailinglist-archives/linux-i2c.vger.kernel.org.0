Return-Path: <linux-i2c+bounces-14983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85CCFF435
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 19:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57463302CDDE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 18:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076C5376BC5;
	Wed,  7 Jan 2026 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQ5yYqQS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D136AB66;
	Wed,  7 Jan 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767808306; cv=none; b=JrdK5jpTpQH/8GNF/eCE/YlA3MPNj3R2jR8MiXAM6/yx39HOi2qTwV23Cl/ErYvpb4A1ewSEH+Bubv08xFG+HLPvq6o9Xi09nlUj7QPpyyBprMrNy4Oam2T2ni0ZHDloNOkc1GKwbzE2f7+Kq1pgG5zPPpBWfd0jNEoW+NOxKxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767808306; c=relaxed/simple;
	bh=EvfJl+USajo90pWhoSwMTyGP/X8mWv1NTXOWkDGByiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAi2+OXTlsNo27N7i0AqzL+Vl3oMs0J0y7bvQcayJMvIgliC5IS77bddwyK43X2GVI0TKim+S73wNt6/KAQqmxGMNoCEsIVN2ggGpMFAqEpQ996dahd+8NKUg7oYnHC4b4MDnCcc1d9uPR8r9iVSZ8ePCSyfGQLog/oVP6tmNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQ5yYqQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654FDC19422;
	Wed,  7 Jan 2026 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767808304;
	bh=EvfJl+USajo90pWhoSwMTyGP/X8mWv1NTXOWkDGByiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQ5yYqQSS39EtrC+ZAupv9l6DhoWvRqn/Qc29x02khw7rJCqK43fbKw3irDKzd3Zx
	 efSkLDzw2YKn42etqwkrc4b/R/6XOPXf043Jq5JMuIEhjGGNEJjQDN75lzWS5nd84U
	 2vf8IeisBsyGk+25s8HL2Pyb+ldOJbmMsyUVj7XY17eFDRaVqc1xumlgYFq6iMxktf
	 t9uL69fC9mCULQ1Tt6dzoRaM3CZ6EOZmR5ZzpiSOmEyHg4UxDSXc58rBRKVY3jZCIU
	 4E9kbWe1DKDhdEuWLVEZaM15NdF4rJWCKpZ2+IC4Ka7onAkhMWe0r3vWWDU1ovJWaF
	 Sm4Lj7TnYfuKA==
Date: Wed, 7 Jan 2026 18:51:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@gentoo.org, guodong@riscstar.com, krzk+dt@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, 
	spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <aV6c5-C9AOccl3vf@zenone.zhora.eu>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
 <20251230150653.42097-3-jyc0019@gmail.com>
 <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
 <20260107162343.GA49546@hailin-HP-Pavilion-Laptop-14-dv0xxx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107162343.GA49546@hailin-HP-Pavilion-Laptop-14-dv0xxx>

Hi Encrow,

On Thu, Jan 08, 2026 at 12:23:43AM +0800, Encrow Thorne wrote:
> On Wed, Jan 07, 2026 at 03:22:42PM +0100, Andi Shyti wrote:
>   Hi Andi,
> > Hi Encrow,
> > 
> > On Tue, Dec 30, 2025 at 11:06:53PM +0800, Encrow Thorne wrote:
> > > Add resets property to K1 I2C node.
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > 
> > how is this patch formatted?
> > 
>   Sorry, I forgot to add the version number when I resent it.

you also forgot the tag section :-)

No worries, I took patch 1 and 2 into i2c/i2c-host branch.

Thanks,
Andi

