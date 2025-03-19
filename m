Return-Path: <linux-i2c+bounces-9918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04BA699BE
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 20:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78091886CC3
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 19:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AB3213235;
	Wed, 19 Mar 2025 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjlMTwKm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3D41E5710
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 19:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742413749; cv=none; b=rvKyXQiEtemkrYARgafvHK4qHtTVzRrOl4RjbsmEC8pCxRN084u8JoXD1scEP5kr3yO34eab5oR5GAzxL3CNJQG8a3g+XeTjqqRirZ4L3T+o1LOGnpnR2sQAeQ3qdkbuSsOYAGHQEZN5+nUmTSy83lwL90HQkmgzX8erZCpvS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742413749; c=relaxed/simple;
	bh=eBONCRCLvGp5/7v9Hfke00+nf3no8DhUa5kgSekfOxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pck5ngDzkqJalj4lHla26eqp2C6Zo5Urt4UWX4vQH5/glhVn0I3pZemDz1JwKKTSLP5GC/xY6sJ7Nr0h4ns+B1qcSx16Wct9lM8lRCsa8GQ0R3R2cOWaHMazJdNClrKt5ayNr6IAEB7mtHnD1IecPaaN00GgW+Iyu1pF5aXEhI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjlMTwKm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2ed007aacso18960666b.0
        for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742413746; x=1743018546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBONCRCLvGp5/7v9Hfke00+nf3no8DhUa5kgSekfOxU=;
        b=kjlMTwKmwMjJyymg2mu6CHZ83xh/PPRKOhvUcYvhEKjrg2wtrrrkSIHHmdHWaJhPaQ
         6ikAubgpny+O0ZoKAga1s+VwQ4upe4YFsPdsMXBfHAyGgiBOKqNWpWfVvBOaGIc+N1yk
         gOkrCaL39FlrTr+gs0cu6sCcTrXbk23KEtpjHG+XwvStJPUeXPDH4gfT2yIHu7DLZUtU
         G0h4AKJ3VKYe9BuxHfD2hzo/E3L6cPvnOnZ5jbOROGlpO1RRjlBF/7giKCDt93mMcN5Z
         WyXcNpvQh1/2zE94xiOmc+LDiAsK/7d7GotPjawpkae1CmCVXK03w0OYRQ4IgjwfFaVC
         yIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742413746; x=1743018546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBONCRCLvGp5/7v9Hfke00+nf3no8DhUa5kgSekfOxU=;
        b=lN+Xn2cS7AfZkkuPdBMOUg2isVadlWOB8V4ki2AX9wprWh+jgVDI4RhePZuNWhR5Bb
         6Jd+yd5OY1oLoETQjrEDHg0tWUlW4/AcY2ZNU32F4jja1K+6PIiXD8KBORJdBDk/ATpM
         Q1HcakQDdkoqXauAmbotzu5prC6dk4pKsYnAvEp3Ae7bOzxs3vbVox9bGJl7ldCIIxTa
         9rYXAVnehTcJDH9IHVzm2sReNV+IkT2DmrEU6Ru0L/9pdScbRM8Im9MEKMhj3OwNWytS
         Zdk/OZhyouaJxXT52UdijOh3GJEXz9TbKReOZcWU4keMM+vJdlq8mrUKIujffjb/ufoa
         3M/g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ79auwypvpPOzEAta/IfeoVtKYfDA+YN8z7ZJRpJTIZ8CpyqE2rlFfk6yC2UXTiqnDs4MKR0a9hg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0fs4UAvVldCLYovNML7Y2cYx2z1+D3p9uAsc5uVk9dGwmW+Y
	l+1dutiETTItKLjZpkxo8eiD7AnBlPyUqkEmT4Gf41HcV62MTG28ZyZyTIqZdnVPFvvTF54eBpg
	lB65p4ROp7zMaNqLaq+BxYW636/k=
X-Gm-Gg: ASbGncuBex2MOoOLqIqYs3u+UuV4SRvUNfKm3x7FuPnamsM1ykoigsuNwy2ae6h5noo
	/XuDrAAzOIv9O+6ab6KAKL2zac0uDIhT0McCL/KlRJiBJjGJ61eOVi6kZ/ofDKtRK/Nb9eOsNln
	Hvwz7ZmVS9xKaWMcwc7YdVSb66kg==
X-Google-Smtp-Source: AGHT+IFF4mXzmUrYcVv7Xv/DDy+o3ZOUnEaDwj6ac8iJX/+em9z4D4x+wlluqWxP5U4JdGrf4YgH9JK5RM+dbUoZdJk=
X-Received: by 2002:a17:907:60c9:b0:ac2:49de:45c1 with SMTP id
 a640c23a62f3a-ac3b7ff3106mr522336566b.50.1742413745472; Wed, 19 Mar 2025
 12:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com> <Z9nxRwoeLEriKP84@surfacebook.localdomain>
 <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
 <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com> <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
 <74d8af68-88f5-484a-9854-e00f4b0e33c1@gmail.com>
In-Reply-To: <74d8af68-88f5-484a-9854-e00f4b0e33c1@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Mar 2025 21:48:28 +0200
X-Gm-Features: AQ5f1JpsCiQqmYOjUwtnA__OxmmdShRVc5pUaf_4_skFajE9BC_0FX3rMnH_h-I
Message-ID: <CAHp75VcskbS7mxQxFwhqdSH-KMKLG6E8oeRDV8VhmK=FE2NiXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 9:33=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
> On 19.03.2025 09:23, Andy Shevchenko wrote:
> > On Wed, Mar 19, 2025 at 9:17=E2=80=AFAM Heiner Kallweit <hkallweit1@gma=
il.com> wrote:
> >> On 19.03.2025 00:22, Andi Shyti wrote:
> >>> On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
> >>>> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
> >
> >>>>> Switch to iomapped register access as a prerequisite for adding
> >>>>> support for MMIO register access.
> >>>>
> >>>> I believe that I at least discussed the similar change a few years a=
go or even
> >>>> proposed a one. The problem here is that *_p() variants of IO port a=
ccessors
> >>>> are not the same as non-_p ones. And commit message is kept silent a=
bout
> >>>> possible consequences of this change.
> >>>>
> >>>> So, at bare minumum it would be good to test for some period of time=
 before
> >>>> going for it.
> >>>
> >>> How would you do it?
> >>
> >> Documentation/driver-api/device-io.rst states that the artificially de=
layed
> >> _p versions were needed on ISA devices. And in general I didn't find a=
ny hint
> >> that the non-delayed versions ever caused issues on PCI devices.
> >
> > At least put this in the commit message. It will show that you were awa=
re of _p.
> >
> >> On my system using the non-delayed version works fine, but I can't say=
 100%
> >> that it's the same for the very first (> 25 yrs ago) chipsets supporte=
d by i801.
> >>
> >> Likely users with old systems don't run -next kernels, therefore leavi=
ng
> >> this change a full cycle in -next may not really help. We can argue th=
at
> >> we have the -rc period for testing (and reverting if needed).
> >
> > My main concern is to make no regressions for most currently used
> > cases, that's why one cycle in Linux Next is better than none.
>
> Even ICH7 datasheet from 2012 mentions that SMBus register space is also
> memory-mapped. So all systems from at least the last 10 yrs should use MM=
IO
> instead of PMIO now, and therefore not be affected by switching to non-de=
layed
> PMIO access. This should significantly reduce the risk you're referring t=
o.

Cool! So, can we just put a summary into the commit message of all
findings, worries (or their absence)?

--=20
With Best Regards,
Andy Shevchenko

