Return-Path: <linux-i2c+bounces-8850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A62689FF71F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 09:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4D33A1F93
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9CF192D7C;
	Thu,  2 Jan 2025 08:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0/uiYjA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F603209;
	Thu,  2 Jan 2025 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808023; cv=none; b=LZ54Sen4TVISZUYxfL8f/cJ/AhADLcGptLHWVjSD1CQEe7E63Az5bNSmO7gDM04xAZHuoQV1mPz0u93q3fZ7MFGozQq5wdc/qmf2BHFriI7fBebc/6q6X/maFrc3yl+hsp99lSaHvoV7nWqDQy1H740nZlCsm+C1JqG1/4Je1j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808023; c=relaxed/simple;
	bh=dqLbAvV/AzANVgpDBDfFuH8ZLlxPQ3xRoVz9pRNoSTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4D7LHQPHYCGMHCYWDtFEXWfQebMDkWFiyBmKo/SkUNDaF4G5t0QI4zsBQ0PyOW4Bnq8VcMD7VPk7T+UorItRzIpexx20PsL8puYWs/ESIpgAJlZHsEFJRKDdpTI2Q6tm0vC+SKyJb8aQBZoASNZOrrly1fVfbXIvGtHBNcm+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0/uiYjA; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51623968932so5965704e0c.1;
        Thu, 02 Jan 2025 00:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735808020; x=1736412820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3x1fDjCGsfpjPLJt2EoweT4CAcY7YO8elqKZSG8axI=;
        b=X0/uiYjAB4HkNeiklMtHK6ueIsCKTIAC6rceJEOyODKLH9SIoa0EIZtl0wudDecX6X
         w9OtnwnpD5TogYhzjQg/qGsbB73LjIJAnfaaoe9BwuNIhMNpvRlzvCmwjwrWo+SJ9hXZ
         pc903yTktPzZdZBGhRvjamT+qlFkzYO4HxHO0Gwi2InU/j6oJyhePk5sHNDXxzjaoKAi
         S9flsQCfxAo41zHfDtaJkvSdF2I257HWr3cOR+Y4SMoRFJxtB8ELHoFJ18Mn2XfbhnQ9
         CX1FDM5BAoKylRfGCqPl06OgivPu6p4QtqEu6sJV56qb+tLwmAZ1OXR97yi71CtcyiI3
         mAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735808020; x=1736412820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3x1fDjCGsfpjPLJt2EoweT4CAcY7YO8elqKZSG8axI=;
        b=k98rF7pje0Wmtc+4qGf+OM+XS4Y/XrKAxW9jk+G30kqzuclrEspo19FLm7UMF37ZSL
         8t4CPI1CLCZqKtZUHfBXl5Hg/f9ywATApVAQ8rWFXwVNf8qb1gflSvI2ywaFO+2WefS3
         dZsDYz7a5QuLNfY+S2LnOxzH0Ows2DiZrBPYmn+xtJ3A1GhT5RhECBAbHe4vIzhXuoCQ
         13TsFWg23kPJWZKGXtlB57Hk/BaNVdcQTJD5taaE679nY+4zjzvfDyFlkvkq1hX+gSpY
         qncbvMlBhvZE3jwVj6pjV4c6phRweYF9M6xIWf48qrsGglAfynklGO2wxx7MlTyihY+F
         8OZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEMBGC2bKICtL1H/zFUerWvUamkEXss7VH4NTXoCrhADO5iIDyFVkdc1N/cbMXkwsmKYmBsDZlEEdpi18Os/ByTfw=@vger.kernel.org, AJvYcCWKmKcFcP6BXIyeBgoIckF8YTkxeYT4dhj0MvRqsuz51UNU2P1enDfSCSJ/ikroCl25S067iuLBPP156ZYi@vger.kernel.org, AJvYcCX4HXVwyhxk5TeJ11oQbNgvu5bms9sv54ixQtG2M7prlEbJPpBply/mTSKKjO/Quj6rZNHeQIW2/Mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUMB+49EdEXaDYGtjh9rxqPNBPxZgK5X0uhmZkgwJTcCF2d3L
	pegokMBer1Hkz0NYhwbDNwj3twXhWZay7mZZerZSCuWZlauFZ+dhD7XM03OFrwj7Mg6JYZYeSRK
	M03AN0JMgxBlCL3pbRRqh3ImfiTs=
X-Gm-Gg: ASbGncs8fbX404+r3qTUk7p6zKDNQC9LkqHU0wf9m+RzZhNv4CTwuocvrrh6CxchKHS
	BqZO9of1vfcneRombYr7zCu869Tz3aRjxER8n12I=
X-Google-Smtp-Source: AGHT+IGkEWcX5Pm+TMvZqATtCpIQUhnPuFtv6ogQRR3N8Q8G+zx0BDuw9LUywc5F4WvmQ9ZOX2zIciH8IoVM10ZNudE=
X-Received: by 2002:a05:6122:2490:b0:518:a287:56e3 with SMTP id
 71dfb90a1353d-51b75d3cd79mr31726921e0c.7.1735808020458; Thu, 02 Jan 2025
 00:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250101121122.3c3a8e0a@dsl-u17-10>
In-Reply-To: <20250101121122.3c3a8e0a@dsl-u17-10>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jan 2025 08:53:14 +0000
Message-ID: <CA+V-a8u03DjtUFf8j_y+bgbotiRt3fbBZGhrCTNqSVSdD8D8Uw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] i2c: riic: Use GENMASK() macro for bitmask definitions
To: Andi Shyti <andi.shyti@kernel.org>, David Laight <david.laight.linux@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Wed, Jan 1, 2025 at 12:11=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 27 Dec 2024 11:51:50 +0000
> Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> > driver to improve readability and maintain consistency.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> > v2->v3
> > - Collected RB and tested tags
> >
> > v1->v2
> > - Collected RB tag from Geert
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-rii=
c.c
> > index 954e066d61a8..ddae4b74a86b 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -55,7 +55,7 @@
> >  #define ICCR2_RS     BIT(2)
> >  #define ICCR2_ST     BIT(1)
> >
> > -#define ICMR1_CKS_MASK       0x70
> > +#define ICMR1_CKS_MASK       GENMASK(6, 4)
> >  #define ICMR1_BCWP   BIT(3)
> >  #define ICMR1_CKS(_x)        ((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_B=
CWP)
>
> I'm really not at all sure how this makes it 'more readable'.
> Call me 'old fashioned' but I like hex constants - especially for bytes.
> In this case it might be best to be consistent with the hardware datashee=
t.
>
Let me know if you dont accept such patches. I'll drop it from the next ver=
sion.

> Pretty much the only time I've actually used anything like BIT() was
> for a spec that numbered the bits from 1 to 32 with bit 1 being the most
> significant.
>
> >
> > @@ -73,7 +73,7 @@
> >
> >  #define ICSR2_NACKF  BIT(4)
> >
> > -#define ICBR_RESERVED        0xe0 /* Should be 1 on writes */
> > +#define ICBR_RESERVED        GENMASK(7, 5) /* Should be 1 on writes */
>
>         'Should all be set on writes' ?
>
Yes.

Cheers,
Prabhakar

