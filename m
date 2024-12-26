Return-Path: <linux-i2c+bounces-8723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F89FCA28
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 11:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74E687A116D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4578B1B87F6;
	Thu, 26 Dec 2024 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMXqxSR+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AD84A2F;
	Thu, 26 Dec 2024 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735207573; cv=none; b=Z9LAZc94bUWg7UNPFV9cb1I94LR+Fh3m1TqyxylTqHfNHa9YBGh4kL4jRVVj1osVVPbmA98WeUUdCckoy2rknI5Jvp+txfvHJcUT5e/+s1M8Q/zwGAdcdHXO4IZzL/DdFYfvZD3Mz/rcA/MMoXQ4N3IyB8BT2YmAAjmxDpfF25Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735207573; c=relaxed/simple;
	bh=O3mSmcz4ejMWeus3HiYrXlTdTaE4Srl+dcPn1THIwjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSnNnCVgx7GF5EmTkadGrje+JdfYaB6cJXh02Xu4NxRzjQIxlUEopg5uWEOwlfigTaJ8Mc8kZ8e2gd49G7Txlwy9pJUhaV5PK5oTaujhqFQ3O4h8XRIiKBs825CJxVtV70NKSp5OUk2KdMV8Gem7wuqUspXPuydtPrtkehRKTr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMXqxSR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6A0C4CED1;
	Thu, 26 Dec 2024 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735207572;
	bh=O3mSmcz4ejMWeus3HiYrXlTdTaE4Srl+dcPn1THIwjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMXqxSR+llGuDYvRAKJM+NOdqiCQWegOaecvE1hPzjDM75nlO15+7sHj/dkeBHrlL
	 9WYmXSA5cM/8jcGzAaMRTxo+BBtrh1jJVv+5HqvMqD4s04msXWOBFwuWX+7GZBfxq4
	 0A+SYOoi/gFqcFyix0uIGMZP93Ncr3Ta9Js08j7dINykvjf6kV0pgDtZnH/4hsMyFl
	 nUfADInyImiNj012dWAs4N9biSP/g+TnfXvz0DfjbFf8JB8aC7/A+IaYWHrTfUaSjz
	 Q++GILajbiUVNTdCJavkpGoSrbkNAy69itT9udYaeUU8aYmX8JnFOlGmpcVInecm05
	 oT5Z3rn7HNnhQ==
Date: Thu, 26 Dec 2024 11:06:05 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/9] i2c: riic: Use local `dev` pointer in
 `dev_err_probe()`
Message-ID: <dpx4cpffb3mfh5i4w2gahjxpswjyxnl6nixwkl5xzkoas77uvf@yrdiivu36szx>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <vb5nqey4teo3mtblh7wxqwykw2ebs7oo3fjn56kulzgn5il5pm@jgr3xsdn6m2j>
 <CA+V-a8sDRLNY1cTuoG4oJSBu+97Ri6qON8RRc_AeDO2Z_bz=9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sDRLNY1cTuoG4oJSBu+97Ri6qON8RRc_AeDO2Z_bz=9Q@mail.gmail.com>

Hi,

On Thu, Dec 26, 2024 at 07:39:33AM +0000, Lad, Prabhakar wrote:
> On Thu, Dec 26, 2024 at 1:19 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Wed, Dec 18, 2024 at 12:16:11AM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Update the `riic_init_hw()` function to use the local `dev` pointer in
> > > calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
> > > `riic->adapter.dev` in error reporting. Since this function is invoked
> > > during the probe phase, the I2C adapter is not yet initialized, leading to
> > > `(null) ...` being printed in error messages. This patch fixes the issue by
> > > consistently using the local `dev` pointer, which points to
> > > `riic->adapter.dev.parent`.
> > >
> > > Additionally, replace `dev_err()` with `dev_err_probe()` throughout
> > > `riic_init_hw()` for consistency.
> > >
> > > Fixes: d982d66514192 ("i2c: riic: remove clock and frequency restrictions")
> > > Fixes: 71dacb2565ed (i2c: riic: Simplify unsupported bus speed handling")
> >
> > I'm not sure the Fixes are really necessary here, as it's not
> > really leading to a bug, but I can live with it. But, then, ...

On a second thought, I think this Fixes tag is not needed: there
is no bug as the missing reference is already handled.

> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v1->v2
> > > - Collected RB tag from Geert
> > > ---
> > >  drivers/i2c/busses/i2c-riic.c | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> > > index bfaa2d728a76..01195ffd4c07 100644
> > > --- a/drivers/i2c/busses/i2c-riic.c
> > > +++ b/drivers/i2c/busses/i2c-riic.c
> > > @@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
> > >                                     : I2C_MAX_FAST_MODE_FREQ;
> > >
> > >       if (t->bus_freq_hz > max_freq)
> > > -             return dev_err_probe(&riic->adapter.dev, -EINVAL,
> > > +             return dev_err_probe(dev, -EINVAL,
> > >                                    "unsupported bus speed %uHz (%u max)\n",
> > >                                    t->bus_freq_hz, max_freq);
> > >
> > > @@ -356,11 +356,9 @@ static int riic_init_hw(struct riic_dev *riic)
> > >               rate /= 2;
> > >       }
> > >
> > > -     if (brl > (0x1F + 3)) {
> > > -             dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
> > > -                     (unsigned long)t->bus_freq_hz);
> > > -             return -EINVAL;
> > > -     }
> > > +     if (brl > (0x1F + 3))
> > > +             return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). Too slow.\n",
> > > +                                  (unsigned long)t->bus_freq_hz);
> >
> > ... I'm not happy with the splitting here: mixing a bug fix with
> > a cosmetic is wrong for two reasons:
> >
> >  - they are conceptually different;
> >  - fixes take are applied to the -fixes branch and sent to the
> >    weekly pull request.
> >
> > I will appreciate if this second chunk is squashed with patch 1
> > and the first part has a patch on its own.
> >
> OK, I think the best approach here would be to promote this to patch
> #1 ie just replacing `&riic->adapter.dev` with `dev` (as second chunk
> also includes the fix along with cosmetic change) and then make patch
> #2 as replacing `dev_err` with `dev_err_probe`.
> 
> Please let me know if this is OK with you.

As Wolfram suggested, the dev_err_probe chunk can be squashed in
the patch 1 and make a single patch that is about
/dev_err/dev_err_probe. Further splitting based on internal
functions is a bit too much.

While the first chunk belongs to a different change.

Please, keep all the tags in your next version: I don't believe
anyone would object.

Thanks,
Andi

