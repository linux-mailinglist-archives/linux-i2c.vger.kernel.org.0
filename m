Return-Path: <linux-i2c+bounces-6956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C68B984477
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 13:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218081C23B13
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C37D1A4F04;
	Tue, 24 Sep 2024 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kf4cIfYh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99911A270;
	Tue, 24 Sep 2024 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177137; cv=none; b=SSHLchp7zTdGF655I6ZFMwit9lK200Gld4oKj6Jl1p+iT5/xAekM3knEZ25kxU94eIfA5mpXls7hNXPKqJqDstWkSlrmpgxP8syC3YHmI/srE/I3X0wReDDDUTjYdWDt95WxU4f6urq1yodTfMNZo3rLBIrhL0x6KcrYtraaEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177137; c=relaxed/simple;
	bh=gMP4ROzet3LyXOPb2jNgVBfFzeC17Wba2KR9nozCgak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IETUnitXLXu1CRdNuKjQDfWhNIj3tS1iBsp892KW42o73cVaROh1nMT+mETvO1Gy+PTrqGTivZ5vckc4SBwkQfG3H3ZJ5c7MYd8TixUE7VzS+3Mfls+xl2+AReRwWGziOYj46XUqgEJ5OJ6qC95ScMpTlnTxEPEcRSSVBkjLDww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kf4cIfYh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6900CC4CEC4;
	Tue, 24 Sep 2024 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727177137;
	bh=gMP4ROzet3LyXOPb2jNgVBfFzeC17Wba2KR9nozCgak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kf4cIfYh3mkKdmpWKBWSXbzxTDBBn4u5QhFtDRL7bvVHObkv2aR93/A+IZm81xZ3s
	 tBMdlFq2iC2Yt7nr9jM1N8VbbQuOPBiD0u/iukStKGQOgdHhGkrq+guw5g73SbaRYT
	 99Ut7pzOB+n/2WQf4yO4V136eZGpeZieu4YKPrvghgR4G4qFbrww3kXjKM9pKoDd/F
	 q8adfQIuW95R4dEm4ime2l+U8mK4pD48wFpcubHXXgbjeUl0WRV1lqPvZPJBRzqAHl
	 6R29RsLRvS1pHD2y2F2aRKFQZdqaFVlIjBkvQba7LUUTUTG9ThrjiCkGzqBP3jh6mc
	 /RcBkztLlMKyQ==
Date: Tue, 24 Sep 2024 13:25:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc1
Message-ID: <ex2fzqqe32wnoqfyhlifllnfyhz4rkn7i7njaqp75xlrpdtelk@jqa7tljdgdfp>
References: <ZvEaHWH0IndyeMvs@shikoro>
 <CAHk-=wghWmpCT9Drh6wLXW04THfr=ZrHonRLDUdy=ou2Cmv9gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wghWmpCT9Drh6wLXW04THfr=ZrHonRLDUdy=ou2Cmv9gA@mail.gmail.com>

Hi Linus,

...

> > The Intel LJCA driver loses "target_addr" parameter in
> > ljca_i2c_stop() because it was unused.
> [..]
> > Still in the iMX/MXC driver a comma ',' has been replaced by a
> > semicolon ';', while in different drivers the ',' has been
> > removed from the '{ }' delimiters.
> 
> Stop describing pointless noise. The pull request - and the resulting
> merge message - is about USEFUL INFORMATION.
> 
> The above is just pure noise. You're literally hiding all the useful
> stuff by overwhelming people with totally uninteresting stuff that
> matters not at all.
> 
> I edited things down a bit, but I shouldn't need to wade through this
> kind of pointless verbiage.
> 
> I want a useful *summary* of what has happened, and what I'm getting.
> Not some line-by-line "I changed a character".
> 
> Is this some broken attempt at AI summary? Because it sure isn't real
> intelligence.

No, it's not AI summary, of course. I tried to be as more
specific as I could in the description.

I'll keep your message in mind for the next time and compare the
way you reworded the git description with my version.

Thanks,
Andi

