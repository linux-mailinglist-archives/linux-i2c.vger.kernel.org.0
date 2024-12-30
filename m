Return-Path: <linux-i2c+bounces-8824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3749FE5C1
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 13:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44873A2210
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 12:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3461A727D;
	Mon, 30 Dec 2024 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9NI/Zqa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F864126C18;
	Mon, 30 Dec 2024 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735560188; cv=none; b=je5iV0x8GLrRqmAxQkcytstRRh/d5Dy3YsIxFZwHvJpnIlvvapEZ/z56W8QOYQFDzD1tSLmm+NBywuouf6xZMW615e95sPPLGjlkFFCYazYxeF8x5L/vvJqNRkL/joiKzbQKMpDHhfrdsJn2SKHO1TAiV1JPooe+tpTn2n4Zx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735560188; c=relaxed/simple;
	bh=v2djG2h+s/5JCD7mDGOqH6gRAXDa7AHw8vu84exOwn4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jA2WPukIFctL9IR26kbkZ8xsC01GpMD5/eD/HWGJpWGprs9iMxgVN9Xq4plmn2gLTR/n2e0rfEzjTeMfPw5D3VC3BkABUwMmlePUgHHNCn8B8jDRH3SOWRvMxDwvV+RCK0M1K3ctw9S6BO1hz3WIVtSqOczaTc0QgbTHCoUy8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9NI/Zqa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43623f0c574so61373385e9.2;
        Mon, 30 Dec 2024 04:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735560185; x=1736164985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxuZn+Xbu1HcCrWjTmL/sC6NWgkq1yb5yjH6DUJBZs4=;
        b=k9NI/ZqadvFx2HnbS+udoeatccCOAfBBqHTeqkMIIphhP/81aPw/KklC+5tBNbdpwt
         pErgl/6qJo+mlxai4pt4JdMM+mBjcSm8wej8chMZoHXm3tgSVcJcvx0PfMrU9QJzlflM
         WgCcVjo9jO+nqos8c2lo+jN257jyD/qv6qZcalsUf1rX/koJ4cr+sgW4nCpKarSVd+Py
         HryquipibUhOPQRJjzn0VapCytqiYTF9ipV35XMmFOiymOkQZVwR3O8+q8h7NdvfS59L
         K2A+jrxUxEU+YCcJg9pivv6AiqG1PH2jIC0ODyHwmS0u/rdBdTl3yyMuBq0RiO9fp5jy
         Fmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735560185; x=1736164985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxuZn+Xbu1HcCrWjTmL/sC6NWgkq1yb5yjH6DUJBZs4=;
        b=Wvfpv8kwrcRBDS1aEOh7NNVu+bfaX27zZumStzLlofdLIo/UufBh4IeV6fRky9hrkK
         qeI6CXJt9ul7ultQxja1VAPkFejxA8F9UypVpW/PSvdA1rz4V/44ylYDoPCQpC7ObTf7
         BLq86UGpr27GavM/Tk/hDX4JBNqjQoP8MKEw/j2VpakNcEKq+I2xv+FUvKlwCqcezDfC
         MbgwkdG84hauv9RBMgVreUOPJhj0eNI6CmPbuendioDKljAOxwRjDCi8Uc5cqBvcchZP
         jqdM8xhwZJrWqCN/saearBYhmQ0y6Ak6YUsTIGTQfG6+Y5jPGKGnTpiCBTkSbpHfvtol
         2qDg==
X-Forwarded-Encrypted: i=1; AJvYcCWB+I7Ps/Y3052Ioo98/zzyETE/Im5zOMy7jfxFFK1u4n0MXcCcw0XHyf+WISJI6dwZvuh33jRkX44y7ZK3@vger.kernel.org, AJvYcCWS4xvEh99/i12MGXsKnNrcElk97wsSbNu/Z+5GSvnb7x1rySM149rMY9nQ+n9dVDiBqTINMr14L7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RRRxiw1SKpTGmp314BbWEShhsrjaFstLYBN40YWkzdrRPdzw
	YbnFIIId/QkR8+1ULqAxsZKsmVEuL7Ttixk5+0GarzwrU0mdY8kQ
X-Gm-Gg: ASbGncsNwovlrGM21/NaOHmrrZ7In3VJr+GHieVoyySY1K1ABOB9MG/kks9PobvR/EF
	wXOqegNZVzHfA1jgxw+nqdNcGRlizB9rhk4WQmL8Qx6q5ZW5SMq5Nq09hlU/VzIlhndZN5/B5TL
	JuXpmh8/bTy5HZRfMMsEpZ3HN30vHEVa0yG2WdBpAx/OJ4Y5pLnlEoFC22wtcbHYufkpq+Wo8Rn
	oSdvW/cR72m238kqzjgRKc9LeRB4JEg/e+KDdehrZCjytGaDK2ZYdp5FUUjZfog1y6+6nwDz6km
	1PA421r9gPiDf7aNhVv0tTo=
X-Google-Smtp-Source: AGHT+IG0rb7LVaKwYTLz2Qc4C5jfEw10/VNt09D87ExFuf9t9yVRiU18xYJAEgoXmj+Cq4jnhOsz6g==
X-Received: by 2002:a05:600c:5246:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-43668b7857amr322522635e9.31.1735560184673;
        Mon, 30 Dec 2024 04:03:04 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013ecsm387669845e9.16.2024.12.30.04.03.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2024 04:03:04 -0800 (PST)
Date: Mon, 30 Dec 2024 12:03:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, andi.shyti@kernel.org,
 andriy.shevchenko@linux.intel.com, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <20241230120303.691e7a5c@dsl-u17-10>
In-Reply-To: <ytxbpm4zmausomklykqeqaw3nnkaurqwsi76uejgq655ylmxyd@ubbetotmrqo3>
References: <20241228184328.5ced280b@dsl-u17-10>
	<CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
	<20241229005936.4d54f2a6@dsl-u17-10>
	<ytxbpm4zmausomklykqeqaw3nnkaurqwsi76uejgq655ylmxyd@ubbetotmrqo3>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Dec 2024 10:42:55 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> On Sun, Dec 29, 2024 at 12:59:36AM +0000, David Laight wrote:
> > On Sat, 28 Dec 2024 15:29:24 -0800
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >  =20
> > > On Sat, 28 Dec 2024 at 10:43, David Laight <david.laight.linux@gmail.=
com> wrote: =20
> > > >
> > > > Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> > > > extra _EXPORT_SYMBOL() wrapper.
> > > >
> > > > This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is inc=
luded.   =20
> > >=20
> > > Grr. This is horribly ugly. =20
> >=20
> > I thought it was a neater 'ugly' than the current definitions in export=
.h
> >  =20
> > > I think the i2c code should just be fixed to use the proper "define
> > > namespace early". =20
> >=20
> > The i2c changes were needed because I found the code wouldn't compile.
> > It is pretty easy mistake to make and will happen again. =20
>=20
> There is
> https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koeni=
g@baylibre.com
> that moves the DEFAULT_SYMBOL_NAMESPACE above the #include block for the
> i2c driver. Though it seems I missed ...master.c. (I'll address that.)
>=20
> > and does - I missed drivers/pwm/pwm-lpss.c drivers/hwmon/nct6775-core.c
> > and drivers/pwm/pwm-lpss.c =20
>=20
> drivers/pwm/pwm-lpss.c is addressed by
> https://lore.kernel.org/linux-pwm/cover.1733245406.git.ukleinek@kernel.org
>=20
> the hwmon driver is addressed by
> https://lore.kernel.org/linux-hwmon/20241203173149.1648456-2-u.kleine-koe=
nig@baylibre.com
> (and applied in next)
>=20
> There is also drivers/gpio/gpio-idio-16.c (which I guess you intended to
> list instead of the pwm driver twice), which I sent a patch for at
> https://lore.kernel.org/linux-gpio/20241203172631.1647792-2-u.kleine-koen=
ig@baylibre.com
> (also already applied in next).


With all those applied it is probably worth applying my change to export.h
(which is all I really wanted to do - until the build failures.)

diff --git a/include/linux/export.h b/include/linux/export.h
index 2633df4d31e6..6cea1c3982cd 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -59,14 +59,12 @@

 #endif

-#ifdef DEFAULT_SYMBOL_NAMESPACE
-#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, DEFAU=
LT_SYMBOL_NAMESPACE)
-#else
-#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, "")
+#ifndef DEFAULT_SYMBOL_NAMESPACE
+#define DEFAULT_SYMBOL_NAMESPACE ""
 #endif

-#define EXPORT_SYMBOL(sym)             _EXPORT_SYMBOL(sym, "")
-#define EXPORT_SYMBOL_GPL(sym)         _EXPORT_SYMBOL(sym, "GPL")
+#define EXPORT_SYMBOL(sym)             __EXPORT_SYMBOL(sym, "", DEFAULT_SY=
MBOL_NAMESPACE)
+#define EXPORT_SYMBOL_GPL(sym)         __EXPORT_SYMBOL(sym, "GPL", DEFAULT=
_SYMBOL_NAMESPACE)
 #define EXPORT_SYMBOL_NS(sym, ns)      __EXPORT_SYMBOL(sym, "", ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)  __EXPORT_SYMBOL(sym, "GPL", ns)

It would be 'nice' to get that into 6.13 (along with the other changes that
remove __stringify()) - but it is getting late in the rc cycle now.

Whether it is better to define DEFAULT_SYMBOL_NAMESPACE at the top of the
file or after the includes is another matter.
If the file is a module then it really makes sense to put the definition
with all the other module-related definitions.
The fact that it needs a #undef is annoying, but not the end of the world.

	David


