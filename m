Return-Path: <linux-i2c+bounces-8452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 553C99ECC97
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 13:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4990E1889426
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 12:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA1023FD17;
	Wed, 11 Dec 2024 12:51:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A823FD03;
	Wed, 11 Dec 2024 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733921476; cv=none; b=jNXUYWORPsfCItCzZiI4yEmGW/fQ2OIa4CgjtVv0D4Hl3eccpGgvdmuFRru5UlfbxCDp36PXTgoCe63nvdrorIoGzC7Q2G8nFWiHB61AXdi21o8Rxpdx6eFjdL/W/gcK2PR5bqnqLTsWFVGkzqjrXjscoRK60847UyO1Cb1ZvA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733921476; c=relaxed/simple;
	bh=vcAQurai/BB74O3BCIac6KmHpf8APPzsSnz9eB4UGlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yz6PBJn1lGoXjwbwWwE2jmyuvqR1L5wU65zeBcK4HBMog9mpGsZMJZFKB26Xuz/Xyhp4GjzJGMu/51IpcGNzno2hRHHXaCBFGBTB4PiaMsd7q2CTuH1Md73w4xz4PTJwVyjFY8+JeU53S1nqz0JSS3kjL60J01iL9Z1Jf0P4lFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85b8c94a6b4so1359723241.0;
        Wed, 11 Dec 2024 04:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921472; x=1734526272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAOEKBzE5o1rhnIM5Fl8astpcrYrkQ6+tlQEAtHTLuI=;
        b=Jk39hLwmHqzA3a1Uj/dyMqbO2r/a2Y4kByX1mvlNn9tK5mRuoXZPSe2LO5TZTOemcO
         /gOThFvoP5gFCtkXzNdE2fj4bjJCDC4VF36+REN2JV75hdCtAEsgVa4aN04r2Rb8n4pv
         LdEZmqRN/5bBcOSz8XN7vire9uAdxN1ic64q6dus6hCO/LihjRgYy8Vy3YRaRwk6/EYl
         +27HVmlb24qWepyjWqpO8wmkE4j/3iCAzl3S4l0ThPOICa4yyNW219qtrGvG413N1WAk
         Awdo5BiyV98gWyUMx1cxLTCPUc8oV8DXM/UpcfmyGrxlORp+UdVjr/dLL3DwV7OuZA24
         0+gA==
X-Forwarded-Encrypted: i=1; AJvYcCV0NC4KiVe1Sya96zQEawqp6+1h5pvrbPodY7rEdJVJBNoaj9aidLb5AMOojwEZkWRZpJUlYD/m23g=@vger.kernel.org, AJvYcCXgC5J5xcFD/0fPW4C1qC7p/M+tL+kVkT1IkZrb2vPzPtf4P22rfB2iIJnGuqiwUlPwcQL5frWjcoQguQuGZJfwTlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dHH5SB17x+fK5jYvQookphJ59h/eepb0C+NSAyXuKNrdd/Pi
	1axVnMNEtpFZiUlFbtYNtn/okPzHA855102KnvkdTuXAlWHadea9m/CcUC+S
X-Gm-Gg: ASbGncspTIOUvBnHZg8RlTQ0bpe43BStFvScco7x+5uczxuHzrqTOOTEyCQiy+q8okj
	l6LxI7ir+etb72A+OF63pfKsRkshmuLBd3O/XrF/m4cHcPEjgaFTjl5QVfNBS7oNBdtYVui6dSd
	UVNeS+mUDHd3yl9Ga2MEdGA7ZdykompWpWPZU6CyKMMwnfmqppk9NQSNw7ysCpbgmN+RtlrfeGe
	iWk5Os9waj44Y7LRnzI5BKnYH+vYsMBEJYozqxlHILFVC1PRIm2qFRCd9ES8nY4zdtTSd4w8btk
	+NuM3PxuHUbdyBVF
X-Google-Smtp-Source: AGHT+IHbJDez7G0vVWlcAbC1GQARUxMF7nkFvyjvtJZgSiUaFZ5Zxby6j3M0SkbRBRuduG8RuqTANg==
X-Received: by 2002:a05:6102:1629:b0:4af:4ae0:2320 with SMTP id ada2fe7eead31-4b1291bba89mr2954120137.26.1733921472454;
        Wed, 11 Dec 2024 04:51:12 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd91e2d09sm1292440137.15.2024.12.11.04.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:51:12 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdf096fc5so879502137.2;
        Wed, 11 Dec 2024 04:51:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLuivkK1+ArHYkFuJSIXdp8g0Wo5C1Z3hzWyHGn4zTBot7WWPqXsds9LTBLP0/GAzIcpe9XazgzE4=@vger.kernel.org, AJvYcCXbIL5w+TE/uLPuk0XrtL7Jxq9JpzaCh3YfpcQoWJUfxOBXZ+yXJECzNrq2fvZvApriM9+IaYT52glMrsonJrZ6N5Y=@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:4ad:de0b:fe11 with SMTP id
 ada2fe7eead31-4b129162d78mr2327052137.17.1733921471800; Wed, 11 Dec 2024
 04:51:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c59aea77998dfea1b4456c4b33b55ab216fcbf5e.1732284746.git.geert+renesas@glider.be>
 <ljyho2ftsxmjkyi44hgc5zavxv3ytbvi2iuoht3gjetr3b4jq3@mjuvcrwm4klt>
In-Reply-To: <ljyho2ftsxmjkyi44hgc5zavxv3ytbvi2iuoht3gjetr3b4jq3@mjuvcrwm4klt>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:50:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWc63Q47=4Z5_zDLy3BfGaaV8RyQRAcQbhC8PFvtz4z7A@mail.gmail.com>
Message-ID: <CAMuHMdWc63Q47=4Z5_zDLy3BfGaaV8RyQRAcQbhC8PFvtz4z7A@mail.gmail.com>
Subject: Re: [PATCH] i2c: riic: Always round-up when calculating bus period
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Wed, Dec 11, 2024 at 12:20=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
> On Fri, Nov 22, 2024 at 03:14:35PM +0100, Geert Uytterhoeven wrote:
> > Currently, the RIIC driver may run the I2C bus faster than requested,
> > which may cause subtle failures.  E.g. Biju reported a measured bus
> > speed of 450 kHz instead of the expected maximum of 400 kHz on RZ/G2L.
> >
> > The initial calculation of the bus period uses DIV_ROUND_UP(), to make
> > sure the actual bus speed never becomes faster than the requested bus
> > speed.  However, the subsequent division-by-two steps do not use
> > round-up, which may lead to a too-small period, hence a too-fast and
> > possible out-of-spec bus speed.  E.g. on RZ/Five, requesting a bus spee=
d
> > of 100 resp. 400 kHz will yield too-fast target bus speeds of 100806
> > resp. 403226 Hz instead of 97656 resp. 390625 Hz.
> >
> > Fix this by using DIV_ROUND_UP() in the subsequent divisions, too.
> >
> > Tested on RZ/A1H, RZ/A2M, and RZ/Five.
> >
> > Fixes: d982d66514192cdb ("i2c: riic: remove clock and frequency restric=
tions")
> > Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Apart from the rounding issue fixed by this patch, I could not find any
> > bugs in the calculation of the various parameters (based on the formula=
s
> > in the documentation).  Still, the actual (measured) bus speed may stil=
l
> > be higher than the target bus speed.  Hence this patch is not sufficien=
t
> > to reduce the actual bus speed to safe levels, and I have not yet addde=
d
> >
> >     Closes: https://lore.kernel.org/TYCPR01MB11269BFE7A9D3DC605BA2A2A98=
64E2@TYCPR01MB11269.jpnprd01.prod.outlook.com/
>
> Can I add this in the commit log?

I'd rather not add the Closes-tag, as this patch does not fully fix
the issue.

> > On RZ/A1H (RSK+RZA1):

[...]

> It's a pity that all this description is lost. I love long
> explanations especially when they come from test results.
>
> Can I add it in the commit log?

What about starting to add Link: tags pointing to lore to I2C commits,
like most other subsystems do?
That way people can easily reach any background information (if
available), and find the corresponding email thread where to report
issues or follow-up information?

Thanks!

[1] https://elixir.bootlin.com/linux/v6.12.4/source/Documentation/maintaine=
r/configure-git.rst#L33

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

