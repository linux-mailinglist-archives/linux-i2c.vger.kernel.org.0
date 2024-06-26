Return-Path: <linux-i2c+bounces-4364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9291795C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 09:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8841C21D0B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 07:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF66F158A25;
	Wed, 26 Jun 2024 07:11:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481DA31;
	Wed, 26 Jun 2024 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719385868; cv=none; b=emCGaV4R48J2K81o/jYgqjyji3intCNNBPcdvF8lO56724fHBHXAsWkJTsgyaVPldQUI24hxq8+sf2EWPjtVHNBlDXlHrryAPZWkIVPg/pNlx/ESw5W0XxQquVK7veBbQL8b+qHAx0yZHxatA34L+zOT/9ab9ZdFjGh9UWoOgms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719385868; c=relaxed/simple;
	bh=fzxSia2agHN3X/RNLtdjuINsI+EbMnDIGmS892xRA6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/FqoRX65DFMTdTmSzTPgvFPqCYnLkli//PZVOeITGpUJxBiSuDYmfEXJ430Ztrj7CTGxiPraqSMkokViRknNUCUlB3hcQg0RZJd1Ts5iCEnsFcE46ce1xwp5NDof7VyEk2a6uHYHUb6i5K1BKd04RYSwsPOBUGwVGo3KxDqa7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-64789495923so11678057b3.0;
        Wed, 26 Jun 2024 00:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719385864; x=1719990664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07yYxV7EnOmksXH2UcjyWNu5DW1U/oEUl8YKdbIe8Js=;
        b=VNw+OZ6sxv3lcERUikJ311nzTknwAoGqfSKnJctP4NhEubGj5UmBEk26VRYrzEfWNe
         xS7jn+Q9H8vU8NyXD8/KD5f4SlUISGeSWv0P8+o/RVe1TNB+/1ebrQF+BiBGURdKuYau
         uhY46siRWxL3R4fHhWbyLk2L+ZI6IzOAepc9o7jUyjwZb+PlGNeYqVSifZaB8T+Z1+1C
         ICS1/fA+r9+WAC4f2FCNfRzDPMtnf7VVH/BuLDCR+GwCHHTLj2tnGPVTozPOhbh2ESvJ
         +CSgsI0w0BiuZTIcyPSWHWq1fOVFQPkjsyOQR1FGYGqc9qkVVpFv4vUrMDjwSxaXUkw+
         rskg==
X-Forwarded-Encrypted: i=1; AJvYcCUK41HoK9WWXsHYHlhUD7u/9hLzz8a+IbdHiN4Uw4m/GDAInw9P4HD58fh8RsUrCaYMPqsyfw8Ohk405mTW7f+ivDI7MEK0TW+yQxhpBvQ5kSlAoeMTvbDREV+fDluYFDH28G1Nc9ksGHQoqekz6rMbcu5bx8U3euphGTv4l2dMbFnp8s6HGmJ5qKrN2fR67h1y5YLFOOiFg3SVYGMhWs3fV4GlXm75sqf8TlnjiMxZqrH4TM0PAdzETtBsJgW9b+qG
X-Gm-Message-State: AOJu0YwjIJTvyO0dxdPaQ6dXyx2Usx3rtatUVNHSiZClry+PiCf05b5+
	L+ZjGfxBCrIrYGpdeRcj404jA+cHznhA99WRzHAsEGKwyymVFJ7AUoFPuRmc
X-Google-Smtp-Source: AGHT+IH0zgec7hwqcLbCl46WL8YDXZcl/65syzLW1GAUrRVGI9HTo8JwM/PQVt6qYQrhGcpHiffkXA==
X-Received: by 2002:a81:6057:0:b0:61a:bc2d:5186 with SMTP id 00721157ae682-643aba46495mr100522467b3.32.1719385864257;
        Wed, 26 Jun 2024 00:11:04 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f154d6075sm38423587b3.113.2024.06.26.00.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 00:11:03 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfdff9771f8so5922062276.1;
        Wed, 26 Jun 2024 00:11:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaoQlIeEnSq1zgag1u614KipmMP2mHJXn0cJuJg60pQ21X6kB3HHMoLuFs7OOoROuvpqT5bu3iYOGQyY9syiNOavhbJI3yAnsBpTjxnK2g2gKEuex8QsdGNEbixwx3/HhDYhDZYlJ4Nu/ToN2k+9NZJDEetN9uLqcFNWdjcE6a/Qn3mHfS5p/YLlvqRAHM3EwPyCv61QSnMCNb1GjGyb0bzESFpzKrm+k2r06iwCJtea3cwtUMQy0cS65DK+M29JoB
X-Received: by 2002:a25:97c5:0:b0:df7:7065:24cc with SMTP id
 3f1490d57ef6-e0304045133mr9012192276.61.1719385863499; Wed, 26 Jun 2024
 00:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <14167607-e67b-4627-99f0-6e99acc7f880@tuxon.dev> <TY3PR01MB11346A47493E0EE96CB2CF17B86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A47493E0EE96CB2CF17B86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 09:10:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDMMy-Q-1=DPcvpu9Co-oCQOvbStt-hLpdEwrLRdpt_A@mail.gmail.com>
Message-ID: <CAMuHMdWDMMy-Q-1=DPcvpu9Co-oCQOvbStt-hLpdEwrLRdpt_A@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, Chris Brandt <Chris.Brandt@renesas.com>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Jun 26, 2024 at 8:23=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: claudiu beznea <claudiu.beznea@tuxon.dev>
> > On 25.06.2024 18:53, Biju Das wrote:
> > >> From: Claudiu <claudiu.beznea@tuxon.dev>
> > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>
> > >> pm_runtime_get_sync() may return with error. In case it returns with
> > >> error
> > >> dev->power.usage_count needs to be decremented.
> > >> dev->pm_runtime_resume_and_get()
> > >> takes care of this. Thus use it.
> > >>
> > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> > >> -  pm_runtime_get_sync(dev);
> > >> +  ret =3D pm_runtime_resume_and_get(dev);
> > >> +  if (ret) {
> > >> +          dev_err(dev, riic_rpm_err_msg);
> > >
> > > As at the moment we don't know how to reproduce this error condition
> > > Can we use WARN_ON_ONCE() instead to catch detailed error condition h=
ere??
> >
> > [1] states "So, naturally, use of WARN_ON() is also now discouraged muc=
h of the time". I've go with
> > dev_err() or something similar.
>
> WARN_ON_ONCE() should be ok I guess as people are using for printing this=
 info only once??
>
> Currently we don't know how to trigger pm_runtime_resume_and_get() error
> condition in our setup using a testapp and we are expecting an error may
> happen in future. If at all there is an error in future, we need detailed
> error info so that we can handle it and fix the bug.

On Renesas systems, pm_runtime_resume_and_get() never fails.
That's the reason why originally we didn't care to check the return
value of pm_runtime_get_sync().

The various janitors disagreed, causing cascaded changes all over
the place...

IMHO, WARN_ON_ONCE() is definitely overkill, only bloating the code.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

