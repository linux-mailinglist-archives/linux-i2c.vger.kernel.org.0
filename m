Return-Path: <linux-i2c+bounces-8836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F79FE698
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 14:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FC4B188247E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 13:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E718B1A4F2B;
	Mon, 30 Dec 2024 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dk9epxbP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DB7FBA2;
	Mon, 30 Dec 2024 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566137; cv=none; b=QjjeHlQWMD1q29et1oD14YnogAhgs/MlCoxJHmixVuDHuaCAOEatrihEm9gt5Ze69N/aYc1ldMUUGrW3+CiWLdRfRpMaubyN27DVbC9roiBUNY056YaAVkluMIEDQ5iJIgCGeYKe+rmloBijspTlpritEpgt8vWU378ZsKlJ8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566137; c=relaxed/simple;
	bh=RRstVgqGjIGSlt3vNfSkWP23nEiFVKZ+4papRtDajBo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0ASVXWmH+an/1sMxGWRGwoD4sjoIZBushLvRy6gw5LlyS6iGasmrRosH4Vgj1l2qFJkFdWtJ48oU852ZbWjVu+c2uZrcX/GoELQH3fU80Ng5HWIItTY4vQcL2sWve/g4KfxXmBSGm4MvfsFQLLI2MFZKjdqMBSMQreZ4n/YrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dk9epxbP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso59860945e9.3;
        Mon, 30 Dec 2024 05:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735566134; x=1736170934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh0/koVnZGBw11/xWnyoQEpirfrGnOzH29NTecWYvEc=;
        b=Dk9epxbPo3aNwci5F3OS6f8WxNmmrlhzYctSSQSAVqzm4/T6/3FVWS7uTteNpNTkgT
         HmeRvF42IbqhlHNhgo5m6WshRvk/PLv3lYCIdaBe3Da4fYkMzyEJ3765xfdO8dRMGq2n
         ygdpx3WuJBnoIPp0Li07UJAPo8BJs5MmO1b6foGV823xFjvruln23L2FYWu/vV5VlJ47
         SEjQ1A/fvoEZmQXBCXipzP/riZ6rTntcLGuq+w83hwt689b7jL2TpXNQgGVJTeUvpuda
         NsLul8ZXMUsa60cZ2RJ2K1fOYsPLJ+hNLSoKuZg8A7+d3wn2SGLMVkt7KfNBgRb7CVAV
         w1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566134; x=1736170934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh0/koVnZGBw11/xWnyoQEpirfrGnOzH29NTecWYvEc=;
        b=FtW6W0UkIvZ1+E2q8Yr5QIAXOZZVdUaVND9/vEv5iEAYO8eUSytzIU6NLWELT7j/Lg
         49J/ungAL+zs4MzJKpoCWYhV942U+LW6789hF4NTZQwYhHH1XH2iw/6YUpSGYgHCwVTR
         joMRgyTzTEIyzWJkLyK9MUaWX8N87v2vClnet3ym3CLc19tGaGadUjJcAh7r68uBTc6+
         9L3rGcQZFVFyVSuGg1Y4vJxCEPR74p3of/UVUoBzJwYJtEr6dvUyx/hDppkEHKYiRHdu
         puJY7WIdRPwVIu91Me/ElgyS31KboQm4MLbHu0UCiIFKhlvdJzFe8Tv5CRRAHoxqIl4U
         ehWw==
X-Forwarded-Encrypted: i=1; AJvYcCVJRHRcuOGiVewoo4mgYXEyLKu+uQPCe/XudUNj7pgb9b/+tXWAstiZwTjrL/GqGDJwZH6OVv5hnsILR+AO@vger.kernel.org, AJvYcCXtbY649K+nRnxSeu8TFfj5uoj64ObsNaqLj6WcQbc7/0de7AY8PNaqiUjgJMVcBveu1cyRYHNsjwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YywegoPh+GP+yRU9Z7g5xlJ9Rmf0gBWGbYdwoVKv/J64s+ezNlj
	Hod6dqeoVYu+9F+1mumS6ZP4nYTGqw7Oqyq0nyYVJuTjBvPcVLfY
X-Gm-Gg: ASbGncvy/Dz7bufp7QPp8qi0piJXIdM+okad4iwlded1+bRpMO/AIw7mcpg6CGB+qdj
	2r7o+cahKCDb5mLDjlltrT8Fm7HOQGwP/zvnnElp5zZzfLMosxePxnEpQ2sOI8cMcUcFvHlPO/M
	qEbDOZaqrboRfvu/0cUMf17crD9dIl45q0OmBgmahoXkZAIiNvHsLs7KAk79TcqxBjyePQtzPKH
	TZaTaloIhK6pTIYQejssWoRMy+USYuaI54xwIaQT2+qhw+uGyA4inJKPhxupZVsc4B+XL/jp6IN
	+ITVURQ2xMlw4q0ksDj26As=
X-Google-Smtp-Source: AGHT+IH/W9ZyRP5w/ZkvscWMXlidFRHHE7Zogvnpnkb2AEkwNEYIIlNUsvh1RmOLYQGz8GeMwSskpw==
X-Received: by 2002:a05:6000:4a03:b0:385:fcfb:8d4f with SMTP id ffacd0b85a97d-38a221fae8amr30030347f8f.21.1735566133929;
        Mon, 30 Dec 2024 05:42:13 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833899sm30097226f8f.42.2024.12.30.05.42.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2024 05:42:13 -0800 (PST)
Date: Mon, 30 Dec 2024 13:42:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, andi.shyti@kernel.org,
 andriy.shevchenko@linux.intel.com, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <20241230134212.18af06f8@dsl-u17-10>
In-Reply-To: <k3zeri45onxbumirsdq3egiy6hdp4x4wcuqj3phv6uddjmmyrd@yr6v4lqxadxu>
References: <20241228184328.5ced280b@dsl-u17-10>
	<CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
	<20241229005936.4d54f2a6@dsl-u17-10>
	<ytxbpm4zmausomklykqeqaw3nnkaurqwsi76uejgq655ylmxyd@ubbetotmrqo3>
	<20241230120303.691e7a5c@dsl-u17-10>
	<k3zeri45onxbumirsdq3egiy6hdp4x4wcuqj3phv6uddjmmyrd@yr6v4lqxadxu>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Dec 2024 13:54:45 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> Hello David,
>=20
> On Mon, Dec 30, 2024 at 12:03:03PM +0000, David Laight wrote:
> > On Mon, 30 Dec 2024 10:42:55 +0100
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
> >  =20
> > > On Sun, Dec 29, 2024 at 12:59:36AM +0000, David Laight wrote: =20
> > > > On Sat, 28 Dec 2024 15:29:24 -0800
> > > > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > > >    =20
> > > > > On Sat, 28 Dec 2024 at 10:43, David Laight <david.laight.linux@gm=
ail.com> wrote:   =20
> > > > > >
> > > > > > Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove =
the
> > > > > > extra _EXPORT_SYMBOL() wrapper.
> > > > > >
> > > > > > This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is=
 included.     =20
> > > > >=20
> > > > > Grr. This is horribly ugly.   =20
> > > >=20
> > > > I thought it was a neater 'ugly' than the current definitions in ex=
port.h
> > > >    =20
> > > > > I think the i2c code should just be fixed to use the proper "defi=
ne
> > > > > namespace early".   =20
> > > >=20
> > > > The i2c changes were needed because I found the code wouldn't compi=
le.
> > > > It is pretty easy mistake to make and will happen again.   =20
> > >=20
> > > There is
> > > https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-k=
oenig@baylibre.com
> > > that moves the DEFAULT_SYMBOL_NAMESPACE above the #include block for =
the
> > > i2c driver. Though it seems I missed ...master.c. (I'll address that.)
> > >  =20
> > > > and does - I missed drivers/pwm/pwm-lpss.c drivers/hwmon/nct6775-co=
re.c
> > > > and drivers/pwm/pwm-lpss.c   =20
> > >=20
> > > drivers/pwm/pwm-lpss.c is addressed by
> > > https://lore.kernel.org/linux-pwm/cover.1733245406.git.ukleinek@kerne=
l.org
> > >=20
> > > the hwmon driver is addressed by
> > > https://lore.kernel.org/linux-hwmon/20241203173149.1648456-2-u.kleine=
-koenig@baylibre.com
> > > (and applied in next)
> > >=20
> > > There is also drivers/gpio/gpio-idio-16.c (which I guess you intended=
 to
> > > list instead of the pwm driver twice), which I sent a patch for at
> > > https://lore.kernel.org/linux-gpio/20241203172631.1647792-2-u.kleine-=
koenig@baylibre.com
> > > (also already applied in next). =20
> >=20
> >=20
> > With all those applied it is probably worth applying my change to expor=
t.h
> > (which is all I really wanted to do - until the build failures.)
> >=20
> > diff --git a/include/linux/export.h b/include/linux/export.h
> > index 2633df4d31e6..6cea1c3982cd 100644
> > --- a/include/linux/export.h
> > +++ b/include/linux/export.h
> > @@ -59,14 +59,12 @@
> >=20
> >  #endif
> >=20
> > -#ifdef DEFAULT_SYMBOL_NAMESPACE
> > -#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, D=
EFAULT_SYMBOL_NAMESPACE) =20
>=20
> If you keep the above definition (without the #ifdef), you don't need to
> touch the definitions of EXPORT_SYMBOL and EXPORT_SYMBOL_GPL below.
> Probably a matter of taste.

The extra wrapper just makes it harder to read (and will be immeasurably sl=
ower to
compile).

> > -#else
> > -#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, "=
")
> > +#ifndef DEFAULT_SYMBOL_NAMESPACE
> > +#define DEFAULT_SYMBOL_NAMESPACE ""
> >  #endif
> >=20
> > -#define EXPORT_SYMBOL(sym)             _EXPORT_SYMBOL(sym, "")
> > -#define EXPORT_SYMBOL_GPL(sym)         _EXPORT_SYMBOL(sym, "GPL")
> > +#define EXPORT_SYMBOL(sym)             __EXPORT_SYMBOL(sym, "", DEFAUL=
T_SYMBOL_NAMESPACE)
> > +#define EXPORT_SYMBOL_GPL(sym)         __EXPORT_SYMBOL(sym, "GPL", DEF=
AULT_SYMBOL_NAMESPACE)
> >  #define EXPORT_SYMBOL_NS(sym, ns)      __EXPORT_SYMBOL(sym, "", ns)
> >  #define EXPORT_SYMBOL_NS_GPL(sym, ns)  __EXPORT_SYMBOL(sym, "GPL", ns)
> >=20
> > It would be 'nice' to get that into 6.13 (along with the other changes =
that
> > remove __stringify()) - but it is getting late in the rc cycle now. =20
>=20
> I'm pretty sure we won't get all my changes into v6.13.

Indeed: Linus would have to like them and 'just apply them' :-)

	David

>=20
> Best regards
> Uwe


