Return-Path: <linux-i2c+bounces-10507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47581A94FBD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 13:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20841169D95
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 11:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9322627FF;
	Mon, 21 Apr 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPuNhvAd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3717CA17;
	Mon, 21 Apr 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233229; cv=none; b=DyYaaE6NCbTX9JBBa8dTlkFYZOv1zTAfZqV4ZjvEjpyoEwRKfvrfbiYgRAoZUm9iNBX8wzS9eqEYRS8rCtV5ymyNe2668CSlV3E2mDbGQXL2s9wHC3zNLdrXPpI41jGJGSr60fBiy/yRy8FYMYLGkZQUe3wmmCTUzJqvfcj/Vlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233229; c=relaxed/simple;
	bh=l5zPS8y6iowCGIfNInsmJ0YWWMW6rrpVtTzMCrgMbTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/VzIBHI2ImsEY3HzBdT89kGY0X6EPYnzK2/iRWDXRqxrG+xaPoQOVXT9TI2UkIz0CU3aFPBOytGU4NrNkszrDb3N7FOAGHarZQoxkxqUuAhEU6oHoanXxLAR9zEPnSXqpz93kh65sFp8vMd6AjzpGqTOcNwsAkWzf1g3Xsb68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPuNhvAd; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-706cb438672so25527007b3.3;
        Mon, 21 Apr 2025 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745233226; x=1745838026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viAID0OFSfWPdzwpqnKUlHRrEMqoxHvEgq73p5L8B4c=;
        b=NPuNhvAdASLO5KA9eZqnSFG1fC7zuIRY+fRwraWyDboxLB1H5N5spYyk7KfOJtn0Aw
         PsOApmgNU1agFoJPGk6QLiR5JHvYtNPAx64xtFDtnCTt5SJwx5lZXfFY2mrMM5vSZ3FD
         tWkS83mF0ltclqlO3rbzeEuOIkbhMIItf1KIWwOGQEndmrJVgKNOsVOMIpwewFzux0Jg
         HsNCHLO85gufY3t+cm016dhn37i9OUsajHTyk1f7iYjKiuoq428Fh2KlWf2KxQmBimHn
         el2d0S0rMJSav0O3T+FJlil2trrQxKV68PVV+13gTe3J8MOwp+w6d/hcH/KLYrjeSoXE
         5stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745233226; x=1745838026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viAID0OFSfWPdzwpqnKUlHRrEMqoxHvEgq73p5L8B4c=;
        b=CB5H+SnpnW5y6nJeMgFYjjXhmCzlwTy2XFy3seuWovjxZotiz/luCPB+Fr3gds6XAS
         xEmrKVr+kUcNqaaYklCSL/ShyvCk4lqWtdBzFZ77zJGhFs1RA8PqzxtNflBLgN6tVR3q
         L3Me6nylrYvGhtUuRWn+6GOlP3J40kko6H6410vsD8fD84omsnMyLtcJ7Rn5JP75NEIk
         gfg3Rn7LcqbG6CBcsrjhbtNWTT5DDb+8Iol4WXL2K0itEojeoSe0GWQM0AuOaRCq1jhS
         F1LZ9wBqjt1psEVYdECcTED17T9RW7VU1bWcl2OKFcCRWUryfugVI2iisJ8HtFhfSFKw
         sslg==
X-Forwarded-Encrypted: i=1; AJvYcCU3QcfpJag8rq1lc1LrtZeeJEUGBrbswCh22ROLEfCQw2N5JLud/5S8w6Xb0aCqZtLm/kKN8vlH8NuOk8U=@vger.kernel.org, AJvYcCUE/dbXN6SuWxBh5z2jspE3L/ptFxC9fPznicNyQmQ1Q/p26Iqpw4tDQnbTSR+nX/HkzyPgUjwat7xU5KZN@vger.kernel.org, AJvYcCUd0FPLOqgDP5PZ2Pl+aokpOPlFEajitRZBQadWRfxrVRNFWymmd7zi3mIoj+pAIOX60juDClz07z0Y@vger.kernel.org, AJvYcCVAlnkonTaK2LUTsLkVleWIA3KLa8hIwL592384G/g7nl57UAkcNdJIgmsLTobyUm2RahWdxEUpibAu@vger.kernel.org, AJvYcCWfDkB0/VPWDveOdZBLEMnTbWaV3bl7pDlXEFJuLL51cTfqI7qPZ3ka8JmaK4HVaTkhNFsH77Ho@vger.kernel.org, AJvYcCWpb2nTtNJlxaZqXiP9+7wRoBCYD1rfBT911+kJuErP6D5HQZa1xLMRngZqj/P32a6b3WxbuOezqVuTZmOSAZs=@vger.kernel.org, AJvYcCX/fF4gF+YWwV7sXykA7797RbAMxPNVaFbLAnIVYB45LPAKWLmly9JqS89qBfAS43/1K+v5LYHosYQ=@vger.kernel.org, AJvYcCX5XvfOnxsvtfxLA5A2g1SD+x2FjMSmAn+/4VFfY59V+Q/eL0pnXlbsrsCmw3vqk8sFfijcNJcEfzG1YQ==@vger.kernel.org, AJvYcCXGkiEbh+myd8yS+gro1rnbT0ziL5b4RfAlosuxY/lNkEnql11HpH/XIeKl0LgbPK62+lps1Mb42xOe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuu6/hErfw3kg3JSHKH0FJEXOVJHrkcFlnqSPhi3iVtxt4iM8y
	bhjuMHssgB6J5UbEWU3UQTahchw7Yl57COT3pJgZ5scRlniwJda5kDfpyJE0jAaKuI3cywEf/o+
	Z65JwL2TtdrGD/VSmj62ynS33T+Q=
X-Gm-Gg: ASbGnctWVn55G+UO++gg/trH/z4UyJ34A47DK5j77DL+uM62/utj67loFyh0Z7ISzMG
	zADKE6xwNWKdnWrb5H/j7FZpb9a6c66kNrgApHia2cEEVcuVHkGMsJsGIbwwOUFj40KuwrPNNiq
	jnTzuKX8SOB+5ZZtwt9OXWAwrrpYdknVtQnLXaIn/EmHkH1GApUfpChVff
X-Google-Smtp-Source: AGHT+IG7euA4BFR+Mx5i/i0jG3mwDi1xEltiPr00AQmdaQcpf6Ouk/sCc3/HcH3nGYloVrsJS5NYz9rk2JRvmLgu4/g=
X-Received: by 2002:a05:690c:4a09:b0:703:c3ed:1f61 with SMTP id
 00721157ae682-706ccd2a836mr163642197b3.20.1745233226387; Mon, 21 Apr 2025
 04:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com> <20250307011542.GE8350@google.com>
 <CAOoeyxUgiTqtSksfHopEDhZHwNkUq9+d-ojo8ma3PX2dosuwyQ@mail.gmail.com>
 <20250320145042.GS3890718@google.com> <CAOoeyxXZmrzBSNRdRx9vK84m5Z5y8T_A+wY98vVrPUZ7f4w4iw@mail.gmail.com>
 <20250404142115.GC278642@google.com> <CAOoeyxVVgHGkH5ajQT0NGNPv7FmVPLzuZtGjCiF7mRRto70aAg@mail.gmail.com>
 <20250410082132.GP372032@google.com>
In-Reply-To: <20250410082132.GP372032@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 21 Apr 2025 19:00:15 +0800
X-Gm-Features: ATxdqUESxNdKH3-Yj-9uSqFAuc712zSM3LkrmRSu8wa-twvX0fsx93cPWbbNJ5U
Message-ID: <CAOoeyxV-dzrJNJ83Y55SKc0rBqcFk2jPM1Z2T+hPF+QFGz3GRA@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B44=E6=9C=8810=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 07 Apr 2025, Ming Yu wrote:
>
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B44=E6=9C=884=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:21=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > > ...
> > > > > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
> > > > > > >
> > > > > > > IDs are usually given in base-10.
> > > > > > >
> > > > > >
> > > > > > Fix it in v9.
> > > > > >
> > > > > > > Why are you manually adding the device IDs?
> > > > > > >
> > > > > > > PLATFORM_DEVID_AUTO doesn't work for you?
> > > > > > >
> > > > > >
> > > > > > I need to manage these IDs to ensure that child devices can be
> > > > > > properly utilized within their respective modules.
> > > > >
> > > > > How?  Please explain.
> > > > >
> > > > > This numbering looks sequential and arbitrary.
> > > > >
> > > > > What does PLATFORM_DEVID_AUTO do differently such that it is not =
useful?
> > > > >
> > > >
> > > > As far as I know, PLATFORM_DEVID_AUTO assigns dynamic IDs to device=
s,
> > > > but I need fixed IDs.
> > > > For example, the GPIO driver relies on these IDs to determine the
> > > > group, allowing the firmware to identify which GPIO group to operat=
e
> > > > on through the API.
> > >
> > > PLATFORM_DEVID_AUTO will allocate IDs 0 through 16, the same as you'v=
e
> > > done here.  These lines do not have any differentiating attributes, s=
o
> > > either way we are not allocating specific IDs to specific pieces of t=
he
> > > H/W.  I still do not understand why you need to allocate them manuall=
y.
> > >
> >
> > I'm using PLATFORM_DEVID_AUTO to allocate child device IDs with
> > MFD_CELL_NAME(), like this:
> >
> > static const struct mfd_cell nct6694_dev[] =3D {
> >     MFD_CELL_NAME("nct6694-gpio"),
> >     MFD_CELL_NAME("nct6694-gpio"),
> >     ......
> >     MFD_CELL_NAME("nct6694-gpio"),
> >     MFD_CELL_NAME("nct6694-i2c"),
> >     MFD_CELL_NAME("nct6694-i2c"),
> >     ......
> >     MFD_CELL_NAME("nct6694-i2c"),
> >     ......
> > };
> >
> > For example, the device IDs retrieved in gpio-nct6694.c is 1~16, and
> > i2c-nct6694.c is 17~22. Does this mean each driver should
> > independently handle its dynamically assigned IDs?
> > Additionally, I originally referred to cgbc-core.c with i2c-cgbc.c,
> > and ab8500-core.c with pwm-ab8500.c for associating child devices. Do
> > you think this approach is appropriate in my case?
>
> Yes, if you _need_ the ranges to start from 0, then you will have to
> call mfd_add_devices() separately on those ranges.  Otherwise one range
> will follow directly on to another range.
>
> But wait, you're using mfd_add_hotplug_devices(), which means you are
> using PLATFORM_DEVID_AUTO.  So your .id values that you've added are
> being ignored anyway.  Thus, if you have tested that this works, you
> don't need them anyway, right?
>

Yes, it uses PLATFORM_DEVID_AUTO, but in my implementation, the
sub-devices use cell->id instead of platform_device->id, so it doesn't
affect the current behavior.

However, if you think there's a better approach or that this should be
changed for consistency or correctness, I'm happy to update it, please
let me know your recommendation.


Thanks,
Ming

