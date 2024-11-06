Return-Path: <linux-i2c+bounces-7863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F19BF99A
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 00:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093DF1F221B0
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 23:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15E31DDC04;
	Wed,  6 Nov 2024 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poBQhvWM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5983213A244;
	Wed,  6 Nov 2024 23:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730934080; cv=none; b=L1TnUEsiqPGLyEJ1pzArCFRtOENCL3NGnEo8XLro1Ki4gIwhIloME2L9Ux3bauGO8BiXurdXI4ykWgXat+g1unERcDSZsJzd1ZQ9Gl9bwGFJaeKmwxyNS5Z+vpaArDCxH+Eg/uhfvht1910ZLgOqjEXOVsRrmOBu7F+tERvIhT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730934080; c=relaxed/simple;
	bh=lsZM1OifQMR0Ewkk9yEiN0OytYyrRhK0WgUktu0fm2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS8jPAdXk5JY3c3N3G9fIFD9oKwwndcUVesDGPDYdo16A3pC6K9GScM1k+MOBBrwZMAtl07ibzxubVzdtxBbhRvy9MIzL25+HdM9EVCbeZJXbwIXpr/pWSdScRypXYik8qU5lESu9pbpcrXrFMY7aXesB0Cow89AmhN775ZKMN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poBQhvWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BCCC4CEC6;
	Wed,  6 Nov 2024 23:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730934077;
	bh=lsZM1OifQMR0Ewkk9yEiN0OytYyrRhK0WgUktu0fm2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poBQhvWMcBUshJScA6qi+VoJHKUku76KrYRKcZmXbwDWEI6cPLvtn2nbafsCAIfWB
	 DuVj3zVc2G7Br0OzO5qRRqv/POtgTSYaYVvdwKPgdzzMHbq+mFw2UOso3RuatdyVtJ
	 shgjV94yLZYvIusjXNG1HhfGJBN9CLyhXQ4gpii59YUJramoLURM7WlsZKO1P0Njd0
	 K/xvVc2jxy1KVe6v7eDzmoYY+/OEglKrrzvDhLE+6sNpykrPv3P+UmuGOmZnLs65U7
	 dyjL1VsLLV0yBAknZRA93bx1ZuBGu5itBLLZ9zfn8lW0tgZ/oHnaKDI4Z9rRbqouyF
	 tdvSbC5m97xuQ==
Date: Thu, 7 Nov 2024 00:01:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
	rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, 
	vz@mleia.com, wsa@kernel.org, manabian@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
Message-ID: <fj2vssllh7zgl76a4jfakrcngcflwvqxzwwa2dhpkauli2u7wb@pz23fznmy25e>
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
 <20241105161820.32512-3-jiashengjiangcool@gmail.com>
 <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>

Hi Doug,

On Tue, Nov 05, 2024 at 01:29:40PM -0800, Doug Anderson wrote:
> On Tue, Nov 5, 2024 at 8:18 AM Jiasheng Jiang
> > Add check for the return value of clk_enable() in order to catch the
> > potential exception. Moreover, convert the return type of
> > rk3x_i2c_adapt_div() into int and add the check.
> >
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> > Changelog:
> >
> > v1 -> v2:
> >
> > 1. Remove the Fixes tag.
> > 2. Use dev_err_probe to simplify error handling.
> > ---
> >  drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++----------
> >  1 file changed, 37 insertions(+), 14 deletions(-)
> 
> Wow, this is a whole lot of code to add to check for an error that
> can't really happen as far as I'm aware. Turning on a clock is just
> some MMIO writes and can't fail, right? Is this really worth it? Maybe
> just wrap clk_enable() and spam an error to the logs if it fails? If
> we ever see that error we can figure out what's going on and if
> there's a sensible reason it could fail we could add the more complex
> code.

We've had this discussion several times. I'm of the school that
if a function can return an error, that error should be checked.
It's not spam, we do it everywhere.

On the other hand, there is another school, bigger than mine,
that doesn't want such a check.

I decided not to bother. If someone adds the check, I'm going to
accept it. If someone doesn't add the check, I won't bother
asking for it.

Said that, MMIO reads and writes can fail: in other drivers I'm
seeing bogus reads due to some firmware failures during device
reset.

I agree with you with the rest of the comments and thanks for
checking this out.

Andi

