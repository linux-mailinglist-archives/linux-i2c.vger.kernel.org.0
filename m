Return-Path: <linux-i2c+bounces-10116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D9A7D223
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 04:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A203AD32A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 02:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DE821324F;
	Mon,  7 Apr 2025 02:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klJ2q2hU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D2414AA9;
	Mon,  7 Apr 2025 02:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743992772; cv=none; b=Avw+X5duHJNop5wHi/fxNZYmSZsyT/pXBWwC9FTeqKwTGSHpZ9XIWXU/QcocY7pO1xddyirohfno/2kd02NqzEBqtyu1dfv2MwhWccgbSBf7rH6IONTcTw4RUjiTsjdNChTpprT26wXBtaougbX7gV7XJ6oPz7oQk+Qs8kkmFi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743992772; c=relaxed/simple;
	bh=qqs+LE0eRz1+HvRjfisMIFt6Lj6/g1vAXELmv46RSi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nt/UT1plSi62tnPUhtD5mfYwdlQ9dViZRArM7AUwAcw1yvC6pOuXrUkjg5U+ZD3q5e63/wzaeSJeXJMNkyPBVgPmVLwPwbu7YhGYMFJTLn0Lt+5iWKlLr0hS93HXX80ME/bj6eJUbRKmyFL487qKz3l6HRamrxPyfigyAU1ZXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klJ2q2hU; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6febf391132so35008187b3.1;
        Sun, 06 Apr 2025 19:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743992769; x=1744597569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=debS+VRslkmHys5XV5kL/p+TQCO24vSGvmW5DmRp9r4=;
        b=klJ2q2hU5QK0BhrCPmtHpVURfrT3364cLANBbD1NoggF58lwGZ7V/qLNCtxEOiTjA6
         DSSic105zW7f34EANeRuZ452rbLPCI6zUYXIjuuJE+PoesQABHl2m/BO96sO+8oZR2qZ
         ob8oKFhU/AxYTiQqSHa8zYflUVLK2esMw/xCV1+so+pygeR7mGVbQoNvvhAk+dLZh8Kq
         6AQe/kxuzqwKf0suTzbOJ6ff9o/Yyb2ksPEAsWUA2Xvq74z61Olvtw2nES5TC52+TOUp
         1eUw8lpCwoVsjenYS6XYBYkg4Es577WzCNsqsFGxES5/2Y9ifFLZDu/ss1sD+FehfejV
         visA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743992769; x=1744597569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=debS+VRslkmHys5XV5kL/p+TQCO24vSGvmW5DmRp9r4=;
        b=WtwRZeFpNqTwQIJWf/qLEwLKcK2lOGv7qZVLoksE8mw3aLH7UyvPa51Co7er1gnv2F
         JLvJAgU/jdG0C++3j/daALV/KOPRt22msNLTQ55zmJbrzWanrJgD/OKQCa9L95i3avHH
         LLSpLfqDnomeBEDtooy/zXIHfFkYemTncq5LLwgLN2txBZJD8wS1dG5QJ//rhYm8/Qww
         z7K+cYJZ3R1bC5J/YTliBiTnPJVM4GQRTZJAlVpttv12rXXnURNqQp+ePRx6I8Xe+N1q
         xhdLHAvLVSLxotlki3MtlBSJnn73EthBPTuT2x0hUvTDjEaupwNFXJlf2/VnP30s7W7I
         tqWA==
X-Forwarded-Encrypted: i=1; AJvYcCUFaNkJXnxj7tkrHPvzm+iFffUJ7QMxkqXZWLuVSalt2OYx/EOm7RTJGKXWlHmC2q1cEvE8q5L3lsbM@vger.kernel.org, AJvYcCUPQiX/SyYLbOq3G2FoOzlJNY8YYkN+iAH7tuitd37I7bw0Upoitt/yUlnO0PisdvDb4g3kypj/8ttJtiwq@vger.kernel.org, AJvYcCUfh5WMlcb4kkJumy8aaXYQQEwejMYJmisobrld8Bpkl+LzIynG3rLtO5hue87/p52Y6DsCOBpKaCkWgZVLD/4=@vger.kernel.org, AJvYcCVE4f6AlsF932Ssa59QX+4x2kuvCfZq1DIkm4Mw065UcrLuHaBr2wDHYj6Va3X/yZk+DB0k8eRZAq3S@vger.kernel.org, AJvYcCVK+gadp8QAPJ+71sPw+uTzElx2dCJ5jnfF6/oeGZcxFRY8gHr3YtpFkyHM28ETCwu8jtnxFHU7I0NVkw==@vger.kernel.org, AJvYcCVKHqH3b01JAjrbEE02F663UFePU3XkAc7WZWeaZG0eBGVXktLgxYzAKtcbd9O13CS5lN9ktNM8tl8=@vger.kernel.org, AJvYcCWJgEqxzZfn3Zd4wUYc35YDricmRlQG3bsnWLMlQAgAN2Jb9csQH4VPY1sYvMrBtkQ5IIoJs8SM@vger.kernel.org, AJvYcCX/S4t4Ghktu+gZv3ALEc6NMC2TPeFGEdEGx9bVIWXG9CjCAIDeonNkzG/RXxDRj5crJrGddF7XhzBB@vger.kernel.org, AJvYcCXCzRN+p8rU/G7+yv84RwX8CQLpwbTLx1hGdwx5greFtJ/mOzm4rLM0J21qPi6XjF/4qCVegODP1Yt2VqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC51YS6iW3EVd87P9gX0kGMRMH8sNjNWpUGG2c7yXlqjqmoY2k
	plyN/MXILVSvC/aB8ZC1iFywSF06vv4e0fzX/32s9TfMwJBSSRBjc5jFFuJgYM5drVg2K1rMLwX
	5sdbq6R0Ays0BMVZlvbCbsB68yFI=
X-Gm-Gg: ASbGncu9A5PtZTY7SOOQ0IasZmO80XfQAqRRP01tBlIfcp9ewMUt3oASUCxjrWYDdFV
	x+gaF/+h6szxX/VuoZGYtXPcML473+PA9o3kv41XI+bsssKyn1CMWBoFsyiitDJllSHZ25kePM2
	Y7E/dlMnJ6FQ2FjojfEg9jefTKzx05EgycxGAMdn72sFuvr3Hk6CCPFl+5gplkXU1XfDtJMHw=
X-Google-Smtp-Source: AGHT+IGquV6j7kjxSU5DDbl56LJUWg84NJlvktHpwJEewJUQrkBdAn2Dp3qCJNnObG7k37I2GpH8CM6noQcYsBFXMjQ=
X-Received: by 2002:a05:690c:670f:b0:6fd:a226:fb76 with SMTP id
 00721157ae682-703e31407ddmr182228257b3.14.1743992769361; Sun, 06 Apr 2025
 19:26:09 -0700 (PDT)
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
 <20250404142115.GC278642@google.com>
In-Reply-To: <20250404142115.GC278642@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 7 Apr 2025 10:25:58 +0800
X-Gm-Features: ATxdqUEJhGHgxl-DlDPMkzogxSTRCsyaw-VHC_dALxuK6Y_oivsfK0lqdUug0TA
Message-ID: <CAOoeyxVVgHGkH5ajQT0NGNPv7FmVPLzuZtGjCiF7mRRto70aAg@mail.gmail.com>
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

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B44=E6=9C=884=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > ...
> > > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
> > > > >
> > > > > IDs are usually given in base-10.
> > > > >
> > > >
> > > > Fix it in v9.
> > > >
> > > > > Why are you manually adding the device IDs?
> > > > >
> > > > > PLATFORM_DEVID_AUTO doesn't work for you?
> > > > >
> > > >
> > > > I need to manage these IDs to ensure that child devices can be
> > > > properly utilized within their respective modules.
> > >
> > > How?  Please explain.
> > >
> > > This numbering looks sequential and arbitrary.
> > >
> > > What does PLATFORM_DEVID_AUTO do differently such that it is not usef=
ul?
> > >
> >
> > As far as I know, PLATFORM_DEVID_AUTO assigns dynamic IDs to devices,
> > but I need fixed IDs.
> > For example, the GPIO driver relies on these IDs to determine the
> > group, allowing the firmware to identify which GPIO group to operate
> > on through the API.
>
> PLATFORM_DEVID_AUTO will allocate IDs 0 through 16, the same as you've
> done here.  These lines do not have any differentiating attributes, so
> either way we are not allocating specific IDs to specific pieces of the
> H/W.  I still do not understand why you need to allocate them manually.
>

I'm using PLATFORM_DEVID_AUTO to allocate child device IDs with
MFD_CELL_NAME(), like this:

static const struct mfd_cell nct6694_dev[] =3D {
    MFD_CELL_NAME("nct6694-gpio"),
    MFD_CELL_NAME("nct6694-gpio"),
    ......
    MFD_CELL_NAME("nct6694-gpio"),
    MFD_CELL_NAME("nct6694-i2c"),
    MFD_CELL_NAME("nct6694-i2c"),
    ......
    MFD_CELL_NAME("nct6694-i2c"),
    ......
};

For example, the device IDs retrieved in gpio-nct6694.c is 1~16, and
i2c-nct6694.c is 17~22. Does this mean each driver should
independently handle its dynamically assigned IDs?
Additionally, I originally referred to cgbc-core.c with i2c-cgbc.c,
and ab8500-core.c with pwm-ab8500.c for associating child devices. Do
you think this approach is appropriate in my case?


Thanks,
Ming

