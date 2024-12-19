Return-Path: <linux-i2c+bounces-8639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6479F7BBF
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 13:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B915163E39
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FB22253E0;
	Thu, 19 Dec 2024 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti9zHYoX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E2224B1B;
	Thu, 19 Dec 2024 12:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612319; cv=none; b=Y6rIxQ0HRixgH4VxI4acE8A5N4i4Mu0lkERWTuNgxmwQUgr1F1xkzRU3Cbo7IdZQGLbHDDVmsOEIVg25jjkMY881bBXgNQAicahaPB3X3+mokfWBfKb5iPs+Vk4uxXc3G+3BQ1qo17oX+wQpazEknsvQpKUDGUd8/x+BbDN4pXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612319; c=relaxed/simple;
	bh=LL6LRUMo/74W+slzDay+B9bpA3Nh+434C+oVlThfPb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpqTGqMNPLz1KuMkEQqlDSx4L/cw78M3W31FUTFUTQtYa3MaxkT8TPddI5aaLshLpHs+NmCtPLOVXWZO2rHdUsPEQ4gTWxhXM2VTkFbhAFWkKMcmn34ePc0VyshopclPigDok6bHldrmEQYPGzA1QynLUOzFfno3sexFDRxsEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti9zHYoX; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso149760241.1;
        Thu, 19 Dec 2024 04:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734612317; x=1735217117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGt+4z9oO0ve2MAf1RQ/OJ0gbms2Qyvz49afhsF5Smg=;
        b=Ti9zHYoXDUNcJ55zQWQyjNObC7pnSZE3UryugJyXLomT65MenRT4ZX2wt/fjsnRHc9
         BJsZ7vfsrFGG6JL1Eeuc6GwoTnTLoeQ8ajwK971n0M2Ypzym7Kn864OlY2ZCGqxKZQQY
         x69bwwWya9nKUT44ooztOtuFsNeZ44YSFf7G3oDynLXkKH7KWoejws6Ip6fNTVRETx3L
         E3fs+apZiNt8tph7DIVFtAIEGBGUdSsPAZm2KTIxathHO5W0LBtYjIjNNHhV8Ds2XShH
         7Kgx/pHgFpWkAf4Sb/YES52sIkHCJn4WOVxTLldZFQ3q2TU0fAsSl0mSe7UWf+WFOG5s
         Kkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734612317; x=1735217117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGt+4z9oO0ve2MAf1RQ/OJ0gbms2Qyvz49afhsF5Smg=;
        b=RtSN1pY5IlMNnm4h9klmi94E09nzykbAXes1Tu6wXma2tQffvDAlNPxS5VR494qdPN
         03F1EH5mbPeZfJr25gx0aQHKlAjIM22P6TDYM7s5UmhBiX4PJPYUactRa8e+ILCRec9d
         NEFfxJQ+4SRAwPOb8O3QEX/dej46v76CJHIcQ2GhfBNWqUtN9elFyBayMfILwURaQbGF
         0lVYIgiZOS/ld+pfh/WSv5XteYHb3cdxyjQ0f4vgWYDAXC5LMdH2I/3rU8Q0XPSss6RM
         d98vuyrdTUsSl8rgz12P/mujcFjc+da1Cf/jdtS//0ez/gwGevLd8IL3+uR+xQgH/CZb
         oZAw==
X-Forwarded-Encrypted: i=1; AJvYcCUGDop8dJ7T+sgtyYH0G5UYa6ReQ6MjxbPhxpD73Imw9Ou2n83Oehdn0BoScBGJWxNc3inTNldu2cQCpLu3GIgW6mk=@vger.kernel.org, AJvYcCUtvFir8ZP1WunzsPPJHQ1tN9/ocoyCZdgJ312vJpCZ2pWCvhJsU/6FbdGxBHzF/07p3TCkk687zJ734UIW@vger.kernel.org, AJvYcCWwdw/4O9/08kSvxVplwik0eF0cbPn9PMpiGYi4ho7eB8+Pbv5KwjivL1S0W1wWBqox326sKYD+XpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPz09veEOKOEJKj8NqevzeKTEGJ/rzZVQRq8gHfDk0yBHakUv
	f0WlYI1BQVRLrNtck+UK4j4ECK7TnbnZDw8bjPyO+chhpRrZGme2lCmiJ2M5P8pWBSLrPVNbgpb
	G41DOr4kGEeRqdJpM0o4+DOTCOvw=
X-Gm-Gg: ASbGncsraov3ZT5jJCGxYNyqioEMMH97hknn309JompCvFBBRhcoJXofQvrCKIS9Fts
	+rGqPxEyMrUxvTfuMXa3IWdJNa0V09sllOPw9ovw=
X-Google-Smtp-Source: AGHT+IGgl7B27kTW4vhbS0ueyp0vdIFniNwHcUPYsY6M7ljZcK3Uz9rruJUtmI+dlGKQUGQ+a8lFMoQzjiBDGAKQYhQ=
X-Received: by 2002:a05:6102:943:b0:4af:f740:c1b4 with SMTP id
 ada2fe7eead31-4b2ae700a9dmr5273177137.5.1734612316352; Thu, 19 Dec 2024
 04:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <ozrnsv5gampgx3hz6mfkg6gtazofmfbl2xfelfpuxmwx7porcq@mejsk7hdc55o>
In-Reply-To: <ozrnsv5gampgx3hz6mfkg6gtazofmfbl2xfelfpuxmwx7porcq@mejsk7hdc55o>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Dec 2024 12:44:50 +0000
Message-ID: <CA+V-a8sCCwxkEh=jF+XGuCf0X-N9_QUc8hiiQgtwtpxMm11tdw@mail.gmail.com>
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

On Thu, Dec 19, 2024 at 12:21=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Prabhakar,
>
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
>
> Which branch are you on? This change has already been introduced
> in commit 71dacb2565ed ("i2c: riic: Simplify unsupported bus
> speed handling")
>
I'm on v6.13-rc3, the above change just replaces the first parameter
in dev_err_probe(). The change introduced in commit 71dacb2565ed
("i2c: riic: Simplify unsupported bus speed handling") does not update
the first parameter in dev_err_probe() which this patch addresses.
Actually I have fixes tag for commit 71dacb2565ed in the current
patch.

Cheers,
Prabhakar

