Return-Path: <linux-i2c+bounces-14566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3ACC049D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 01:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BEEC3020501
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 00:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B258329367;
	Mon, 15 Dec 2025 23:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPPmVidt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6197327C1B;
	Mon, 15 Dec 2025 23:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765842753; cv=none; b=ViCy1bbttQvyj2WZcd4XVY0HtS12aJnK3CyNRa4E2xSc5RBJ4fvY6Chp6NrppxkbRFNw1WxHHOTO9azrdehFXYblEq9DEKK+Rdc6Qhsxy8xQbWdvCSliFXK+XATM/mhaEYae6vU3PUumTY/rj27q81zf/esPBJZ3RJtoKzfsA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765842753; c=relaxed/simple;
	bh=JjlJyfFbfSOBrgk4niKEPDfdOW76FAkt9+IFbphs2sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaL1WCurnvwTI+o9QwC9em14sqoDM1ULjkeOrcwxG8DNWFVUZulGmqMo8pAa7ApJ/D2wc5HAs23AbJmdWjVCG66qnV4diECUVY5HCB/ePV6rJK+B2W6Z61/J7S8XDScaCwOFUEauMGSkXPZXPdwLLf2Gln1QtYFnFNvU/3LUhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPPmVidt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E548AC4CEF5;
	Mon, 15 Dec 2025 23:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765842753;
	bh=JjlJyfFbfSOBrgk4niKEPDfdOW76FAkt9+IFbphs2sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPPmVidtCa29ZlkI+3JRDA7BBDICWRaBJxARazKMC0VlODB9T7jSVPxQPi7JprTxh
	 ayVW4DVolQNZT93H1iArYro8NuGiAtDNsVs1Zwsbi5ISyijxiwEHEgMaG69ew3zVHZ
	 RABp/PRieghdxBrBDzPscho6eUigLMqBGZ4VhqeFYgC17c1ojdN7af3kHxjYZ0w+M4
	 uEKuUNC4Kb2QuRHNI2tLiBX/xLgXDRfXPWyO86T/0ZuZAs/MvJTAEJ0z2gEuKbU7wl
	 POeiYaXs20tGcsMAS22QcPsYAD9AhcoTRCchoOqzms3WDsCU0j30Ug1FCxV4dLKvqo
	 TyszuqNsB05IA==
Date: Tue, 16 Dec 2025 00:52:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: i2c-host for v6.19, part 2
Message-ID: <nwyjzl67xd4wvjpmxs7ocgqh7j5qf42d2gfxjw6lma5vm5aox5@a3szzo3xuvwk>
References: <tm7m6za7jhdmq3rqdmutir65yw2mo4qty6qonsfyjgsqxdsl3w@dvom6ilx4vhc>
 <aT-ta1j1JB0FOiMK@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT-ta1j1JB0FOiMK@shikoro>

On Mon, Dec 15, 2025 at 03:40:43PM +0900, Wolfram Sang wrote:
> > here is the second part of the pull request for this merge
> > window.
> 
> as you could notice, I was not able to do a second pull request parallel
> to the conferences. I am sorry about that, but since most patches in
> here are rc1-cleanups or ID additions, I think I can send them for -rc2.

Cool!

> Except...
> 
> >       i2c: designware: Optimize flag reading in i2c_dw_read()
> >       i2c: designware: Sort compatible strings in alphabetical order
> >       i2c: designware: Add dedicated algorithm for AMD NAVI
> 
> ... these three, sadly, they are beyond bugfixes and cleanups. They
> don't look super urgent, though, so while it is a bit sad, it is not
> blocking anything else. So, could you kindly:

No problem, I was also haf mind for those three and I have
extrapolated them from a bigger series. I will then take the
series as a whole for 6.20.

> a) send me a PR for rc2 without the above three patches

I will send in on Friday along with the fixes.

> b) put the three patches into your branch for 6.20?
> 
> ?

Awright!

> Thank you, and I wish us good luck with the next cycle :)

Thank you, Wolfram!

Andi

