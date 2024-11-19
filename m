Return-Path: <linux-i2c+bounces-8060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D19D3039
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 561BFB230B5
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E3319ADBA;
	Tue, 19 Nov 2024 22:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pL9S6sNG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28914A60C;
	Tue, 19 Nov 2024 22:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732053792; cv=none; b=XpiMD3ge3vO9+iOUfbbaq+YoZMTEBObiITEF9iY9b+8zw6x6Ag5v/3k646UCI9E+FlMT47ur+ABMAFVV/dYLr4ITRTCEDXyNQoyUdWt0OrTLDWzsgYEXi9+eJPxsKLhMjYGWPsml4Imv9WdlhC45cpTdhvQLpFKWZ+KcsT2U2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732053792; c=relaxed/simple;
	bh=L0a/47726Uw6wdP1PChVy9Z1jtwej3YwRGgIMSLwsRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtVfQHvBaZzYdEGfMqMilmW9xf+sWF9ni8Vj2hhR8jjQa4+wotdA2Hm3Rxk5xiyT5Pw+NZacvixie1eBeNa7596E8HOTqz9VQfdNEJw2REMxl0fPNpBypqnK13QjXpVvyi9Wh5vwbsmvZC8FFxuvhIHcs0UMOkCmUg37bG1vzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pL9S6sNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFC6C4CECF;
	Tue, 19 Nov 2024 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732053792;
	bh=L0a/47726Uw6wdP1PChVy9Z1jtwej3YwRGgIMSLwsRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pL9S6sNGyvbz8TsF2TZIk+jSS2SIGB+ymVZ0vm/tqhn2yczH+X7G0C/j3GR06nViW
	 ubOqAqSIYPMEbbQSLF0yAHtm8STuNAdnIV8uEsgRgc/Rsu0Tr0ZY7cMFaOv1E1N6ma
	 h8+LMdk678XwSnWKlbqT56AI7NQ1HXKP5/rED/isMW9EapdotfGSkq2d1Jhc9dnQMn
	 lFNoLGN1Ge+uDGDZ/XkEagex3OGgBn9Ok8g7SBPgI2SG1/PtZdpLoYxeeiXfHQrznB
	 lTx8HHKGQNtYCtJEQPG4KPLaAuRFEhNpEKaocGsIH0XyYyluT/GgZDJROnrCkqpXeO
	 GgzttFmWXXI2w==
Date: Tue, 19 Nov 2024 23:03:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, 
	max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
Message-ID: <y4xv4lduinhjbhzt64erjw3er5w3s2tcwzjxxdknoudaefupxq@fbqf4esensnk>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com>
 <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
 <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com>

Hi Jiasheng,

> > >  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> > > @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
> > >       }
> > >
> > >       clk_rate = clk_get_rate(i2c->clk);
> > > -     rk3x_i2c_adapt_div(i2c, clk_rate);
> > > +     ret = rk3x_i2c_adapt_div(i2c, clk_rate);
> > >       clk_disable(i2c->clk);
> >
> > you can't disable a clock that has failed to enable, right?
> >
> > BTW, although I like this patch (or at least I don't dislike), I
> > still want to check whether it's wanted or not.
> >
> > Andi
> >
> 
> Thank you for your advice. I have carefully reviewed the patch.
> There are two clocks: "i2c->clk" and "i2c->pclk".
> The "i2c->clk" is enabled and disabled in rk3x_i2c_probe(),
> while the "i2c->pclk" is managed within rk3x_i2c_adapt_div().
> Thus, the "i2c->clk" has already been enabled at this point.

yes, that's correct, that's a fast review and anyway your patch
doesn't have anything to do with this.

BTW, did you have real failure experience here or is it just
speculation?

Thanks,
Andi

