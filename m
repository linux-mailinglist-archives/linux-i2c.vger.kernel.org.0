Return-Path: <linux-i2c+bounces-8719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8C9FC976
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 08:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B621883510
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 07:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934D11684B0;
	Thu, 26 Dec 2024 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8RfkO/l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B702F79CD;
	Thu, 26 Dec 2024 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735198803; cv=none; b=qoJWfRIZbA5bhTvzCjW32dp5YU3Nj57CMR9PZ09T88iEWPWxmRWTKNC8xhbFLKnm/FoFp7vs6l4s4IjhDTMqaER+WOcjxxcdjyVfz4TtSMrHRiZDatlHi0vKYK/gZG+Nww/s0PmZ5Ob/qERZ+fDO7MyNbFxz47ccKx3zZyZTpl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735198803; c=relaxed/simple;
	bh=0SPXi4Lv0kPrSfz3VJPcy8R4Ni5dNj+xHtqShogyfEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDQcmOyzXzLcHMCMoVIHCLYnrST2QX8nhKqy9c/Biv8Hq4XTln4CQPehnA0Cv8WHvRND7L6f/b1BA987Rdbt0HU8vfDkPAjXLoRIawLVX25wQxe9JmkC7O2V7CpVtWEH0QgChqeO0eWLf3UzxIi6toCItrm/I2nUV8uICjV/CAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8RfkO/l; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51873e55d27so3455435e0c.1;
        Wed, 25 Dec 2024 23:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735198800; x=1735803600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QtflvWHe+zkWwMVid12l8jwem6qnHM/IhIQljnEcbw=;
        b=Y8RfkO/lpaWAfpDdEYyv911FPu1nmaLJr3nAD49q4o5lwlGvWwDxyaD8LLEdue2iq/
         N3zSGRFXwIelHvd6U+Ndb3/FopZecKqhn3THHTvT7tvTchtXSI3jy2nnI7PJ9Ffw/Dn4
         dNAMdX0SOKkfCN2EiE/6mA+kPG1ZW+VSyiYQfknsrTPQpfYT6v1/qGb8vpazN3EQOgYG
         62zLv33fzaQoaTyANtnsc4L8R7EmnJkXv28m0H11PEdRZ7zk6R8Yrs2R+aMsiAOxbVEJ
         nB1REEVk3iKOvRExQjxJr6f0PFatLoZanDIeLLTiQItOy4hKKTsEhRNQE+L5VpcDMAVW
         tosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735198800; x=1735803600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QtflvWHe+zkWwMVid12l8jwem6qnHM/IhIQljnEcbw=;
        b=r72LE8TqaCNv55u1i2/8b9nkoRVcURsrN0T+O0AjnRxbbG6iEO7eluxhIFZAlgr9NS
         fHnkIOp8FqOd3D0/8wYxShKTp7zwF0fb2WVl+UEv1asauq6UNZbNrAuH/fcGjyPaZr6T
         9lActkNhJH6m+Xq7BEtdlFUBr6j+pWikon1xzjrdU4Mru8QGhuNThdSQAH08xOoxgPHo
         a9dkBroo2gUgoXJlU1R8Drdg+FPRZAzxZ6+RJh5RtgbtQL3GNT9fJ9C/UFKwnXjKJskg
         7HIg7gtnNRCc25hrpjmcFa8P2TRaChow9eabesZTxQt6Iag2DF0QacCWmR3odh6l8fT0
         aA7w==
X-Forwarded-Encrypted: i=1; AJvYcCVNiAR1xEG+NLR8AcWjwPHJhYhbb93IV90+9z4UlVQaiRCuIk3BZQ71FT3+f7KMuCA9aUSnV7PeJ7c=@vger.kernel.org, AJvYcCWLhJgtGXiRloa7uemP6nOJGbB93/nvb4DS6ltH2GsWyqorPebDEHvSBUMATTM0ulcJq5t5JshDZfxsflRqgDtGVo8=@vger.kernel.org, AJvYcCXhycuJuTwstdp6ibj8a0ugZVYLcWPWmIp0rSjEk7whwW+4T1CXEwTrNdklICdFcZHYBCgZh7wqKeZksSld@vger.kernel.org
X-Gm-Message-State: AOJu0YyErJ/SW6QDJQRonp/NRRbFCE5GHOi6Wuifg9PXCi+JfiyxpfBQ
	Q+H8f5v2m85Fqf8wrcUKmyaZOpfiEEq0bd9ogdSpWJYzhB+wOXSF3mGwDcxNTbx5L+S07MAf4vW
	mpaQwqWyEEEv+wt8jNOZB9LFVd0/jqzSrdsE=
X-Gm-Gg: ASbGnctWgydxVY2baaxBOsw/IMS5DJA6iSs7MCN64LBpOdAEBaZ03O0l03l+fqYs2X8
	WYoYlBLbc2yEm+wrSrOWcYiaNCWQOuwpeYS7RlYw=
X-Google-Smtp-Source: AGHT+IGiYKj7LuWJbTmYSlab/2QRdZBtcOZ9jBgALMXOjqANaJw6vDagfZIuzHSTGNnxOpZJ0ZRWbSRw9xTlH0Srt80=
X-Received: by 2002:a05:6122:2b9:b0:516:dc0f:c925 with SMTP id
 71dfb90a1353d-51b64c06b47mr16994435e0c.6.1735198800544; Wed, 25 Dec 2024
 23:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <vb5nqey4teo3mtblh7wxqwykw2ebs7oo3fjn56kulzgn5il5pm@jgr3xsdn6m2j>
In-Reply-To: <vb5nqey4teo3mtblh7wxqwykw2ebs7oo3fjn56kulzgn5il5pm@jgr3xsdn6m2j>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Dec 2024 07:39:33 +0000
Message-ID: <CA+V-a8sDRLNY1cTuoG4oJSBu+97Ri6qON8RRc_AeDO2Z_bz=9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] i2c: riic: Use local `dev` pointer in `dev_err_probe()`
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Thu, Dec 26, 2024 at 1:19=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Prabhakar,
>
> On Wed, Dec 18, 2024 at 12:16:11AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the `riic_init_hw()` function to use the local `dev` pointer in
> > calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
> > `riic->adapter.dev` in error reporting. Since this function is invoked
> > during the probe phase, the I2C adapter is not yet initialized, leading=
 to
> > `(null) ...` being printed in error messages. This patch fixes the issu=
e by
> > consistently using the local `dev` pointer, which points to
> > `riic->adapter.dev.parent`.
> >
> > Additionally, replace `dev_err()` with `dev_err_probe()` throughout
> > `riic_init_hw()` for consistency.
> >
> > Fixes: d982d66514192 ("i2c: riic: remove clock and frequency restrictio=
ns")
> > Fixes: 71dacb2565ed (i2c: riic: Simplify unsupported bus speed handling=
")
>
> I'm not sure the Fixes are really necessary here, as it's not
> really leading to a bug, but I can live with it. But, then, ...
>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v1->v2
> > - Collected RB tag from Geert
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-rii=
c.c
> > index bfaa2d728a76..01195ffd4c07 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
> >                                     : I2C_MAX_FAST_MODE_FREQ;
> >
> >       if (t->bus_freq_hz > max_freq)
> > -             return dev_err_probe(&riic->adapter.dev, -EINVAL,
> > +             return dev_err_probe(dev, -EINVAL,
> >                                    "unsupported bus speed %uHz (%u max)=
\n",
> >                                    t->bus_freq_hz, max_freq);
> >
> > @@ -356,11 +356,9 @@ static int riic_init_hw(struct riic_dev *riic)
> >               rate /=3D 2;
> >       }
> >
> > -     if (brl > (0x1F + 3)) {
> > -             dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slo=
w.\n",
> > -                     (unsigned long)t->bus_freq_hz);
> > -             return -EINVAL;
> > -     }
> > +     if (brl > (0x1F + 3))
> > +             return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). =
Too slow.\n",
> > +                                  (unsigned long)t->bus_freq_hz);
>
> ... I'm not happy with the splitting here: mixing a bug fix with
> a cosmetic is wrong for two reasons:
>
>  - they are conceptually different;
>  - fixes take are applied to the -fixes branch and sent to the
>    weekly pull request.
>
> I will appreciate if this second chunk is squashed with patch 1
> and the first part has a patch on its own.
>
OK, I think the best approach here would be to promote this to patch
#1 ie just replacing `&riic->adapter.dev` with `dev` (as second chunk
also includes the fix along with cosmetic change) and then make patch
#2 as replacing `dev_err` with `dev_err_probe`.

Please let me know if this is OK with you.

Cheers,
Prabhakar

