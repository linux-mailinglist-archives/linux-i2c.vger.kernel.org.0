Return-Path: <linux-i2c+bounces-4424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0F91AF91
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 21:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E84461C225C3
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 19:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2075F19AA7D;
	Thu, 27 Jun 2024 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dth0Q3cO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A612EAEA;
	Thu, 27 Jun 2024 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516103; cv=none; b=uZ6kntJT2htCCsrUiZPeazFGZHorlqSfiv7OjMfH2yjIddVLQ80fUMHvM5TO9xtur2FrB9MSU22uRS5TLS0ebqdp/ePvadhXUSQD7OKPGGqHMfrkItb2oW+5BJWKhs7Ff7gyDmpTMZGTVUdWCdFfALnjbzA6LzZc6m3X9bK0sp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516103; c=relaxed/simple;
	bh=zP/DduxMo+Pi/jf7b4MTK+rTemYqKvWKL0pkpzGGOgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8Pcv7eTdRRr7JPoNJUCdKAuL4Q9XTn/1iDNgEo6IMUtCIE7SBYLYr41gxCp58qksxP8PiS23c9gep1A8LrwaqfLZM/vuCdcykm80MI9h840KsDoGk0Jm1Z5m7Gbfi8e8cAiksyIkiITNqPm4MHKCNI7EFaQikyqMiXSGTIxv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dth0Q3cO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C75C4AF0C;
	Thu, 27 Jun 2024 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719516103;
	bh=zP/DduxMo+Pi/jf7b4MTK+rTemYqKvWKL0pkpzGGOgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dth0Q3cOrsTCNADJS7wBZw9ePNLt5Xq51kGiA8Rvvy73rKX0/hgj4VC25lgC8WWKg
	 yi9L95uMe2fY9kJa/Rd9PJgRd5zkJG/ttVfWNmKjbT3wVyo0vv3rrK37gQ43eo37lc
	 HZ1IUD2VXGQRky/+Fp8bYOqpQl4NRzox+Vs/9ZOpqxUUr/7nYnaqzgGxNY+yN/B1oN
	 7Y/si+K+40h7gMfHqekWECgU6hll+5W9FXZX9x3nfJX9bcv0d5QAXjD60/NiPoTumP
	 u17JlHZFC1VTJfyet0ZTmGttWRr+uTuol91NjdzJbR1Vzsd22XBFgY9Pp6zC9Ha8K7
	 mosY3yIqSAMCA==
Date: Thu, 27 Jun 2024 21:21:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Chris Brandt <Chris.Brandt@renesas.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Message-ID: <kfaiindnm4wpyr4iruczjlichq5g7n5ru5nvzeproty3qx3n6g@tu3fenmprzjy>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <14167607-e67b-4627-99f0-6e99acc7f880@tuxon.dev>
 <TY3PR01MB11346A47493E0EE96CB2CF17B86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <a8b5ccee-f9a9-4bfa-be70-085d2fe7f8d2@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8b5ccee-f9a9-4bfa-be70-085d2fe7f8d2@tuxon.dev>

Hi Claudiu,

First of all, thanks Biju for checking the code and bringing up
this topic.

On Wed, Jun 26, 2024 at 09:30:52AM GMT, claudiu beznea wrote:
> >> On 25.06.2024 18:53, Biju Das wrote:

...

> >>>>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)  {
> >>>>  	writeb(val, riic->base + riic->info->regs[offset]); @@ -133,10
> >>>> +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> >>>>  	struct riic_dev *riic = i2c_get_adapdata(adap);
> >>>>  	struct device *dev = adap->dev.parent;
> >>>>  	unsigned long time_left;
> >>>> -	int i;
> >>>> +	int i, ret;
> >>>>  	u8 start_bit;
> >>>>
> >>>> -	pm_runtime_get_sync(dev);
> >>>> +	ret = pm_runtime_resume_and_get(dev);
> >>>> +	if (ret) {
> >>>> +		dev_err(dev, riic_rpm_err_msg);
> >>>
> >>> As at the moment we don't know how to reproduce this error condition
> >>> Can we use WARN_ON_ONCE() instead to catch detailed error condition here??
> >>
> >> [1] states "So, naturally, use of WARN_ON() is also now discouraged much of the time". I've go with
> >> dev_err() or something similar.
> > 
> > WARN_ON_ONCE() should be ok I guess as people are using for printing this info only once??
> 
> Ok, I'm leaving this to I2C maintainers.
> 
> Andi, Wolfram,
> 
> Would you prefer having WARN_ON_ONCE() instead of dev_err() for potential
> failures of pm_runtime_resume_and_get()?

I prefer dev_err. WARN_ON should be used for some serious
failures in the code.

E.g. memory corruption, like:

	a = 5;
	WARN_ON(a != 5);

but the system might still work even with such errors (otherwise
there is BUG_ON()).

Besides, WARN_ON() prints some information that are not really
useful to understand why the system didn't resume. For example
you don't need the stack trace for power management failures, but
you need it for code tracing code bugs.

Andi

