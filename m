Return-Path: <linux-i2c+bounces-10733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7FEAA6DA7
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 11:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AB157A4A00
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 09:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976C626A08A;
	Fri,  2 May 2025 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHP2L7o9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75927267B77;
	Fri,  2 May 2025 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176674; cv=none; b=Ddc/Mcm/Lfh1Q+MlpODEFDtiTUDgv6W5oRWrPn5VCpazY8yUqdQPg6OFJbVbjQCkDzrBy9VBNpybglMJwnvbYjwNt+7E6wKlcg05dC5Jt5oSoPxKn6lS/Ji/Ybh0m/pxytHEQKFSBIEnSG5kEnsOVuP7a+aan5vcNHteALuaWk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176674; c=relaxed/simple;
	bh=I7kWDbCb9YT/O0Cj2R2bStAeSRvHrutnIYH0yo5EYFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t76UFxCbQCkp90228Q+7CN0MXWONgRek/Ozbh/GiS3ODFNXN0CRDzJukUpPWUkDcDhJNmWFIxNseXL/Nb8HkpBaqo80pCPs5fGzGdQ3AvJIP3XvOx/N0fE7E6exkQPFrgcYauz3/LfHKEiCd/lgDa4ohyF1tpHsgaKMY0Tye5M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHP2L7o9; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6fead317874so15771147b3.0;
        Fri, 02 May 2025 02:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746176671; x=1746781471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax6rAQxnmMYtNEHshOX9p41p7YxJfMs7tSxdQeWwIh8=;
        b=EHP2L7o9uzzb5K7rVvAG0U3ueCu+nA8hXzCKmoFEP8bUPmOrIiKhzoLQpcToBjeccW
         /WdJhbC/iX3kT/Oj8s+P0KXkJNZHc3A9e4x4SdaTi65sK+M3nU5qrL/RctvnN9bFbrqB
         JqTIdBdsNUGVsjfVRMlImVFWTexnyaofAjPoYVXzi6386tRevDilERE09LNYbOhtRV/7
         J/7wBR8IDOJjyP09ERpq4IF2hVFK+faLABwK4tTiiwTCUyXAGq3pysvAg/5PGbHtcYh3
         ccTqkmSkso923v5xrBjF3z53bLrLJrU+S5RymYyz4VZh/HVvU85fr1uFlkPF1yh8m8q7
         Dfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176671; x=1746781471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax6rAQxnmMYtNEHshOX9p41p7YxJfMs7tSxdQeWwIh8=;
        b=rcgd2HdToi3VGbJ72uzz4XjBtK2rpUItG9aPt6jmxyclGriSuaGlSRJbzv96UJA3V2
         FrzhDiipfiShb+T/BfkV+mcmgu/pIJ1O3DwYWgA/br0hdpfhw96MmbHDqP++mrvIU4Pe
         jEA6oaalPxg6ztE6Own1IbjUeZtkNo1ROqjwIMmtUhQBIx1+lqZmTCVBGo0o1OcCYB10
         MOa+vM0VWaCdI9hcNO09flDOCugmi1lnRoe/v2RokBt5QnVvWttxjSmFIDqz0yGq9bpc
         iSSbtP9sKUtSV6/n7bfac43UYAIBmXFeZGkCDLKRUdvgtOzoN4BYghB58YeVEIq6P8np
         FFAw==
X-Forwarded-Encrypted: i=1; AJvYcCUcT8i1YTvWGEfiRdrcmGKs92qHcl5uPwlXtCDgqJBFYXeuuusXF13pk8F9N4oqpkopiyjpeno6yfzh5IX2ir4=@vger.kernel.org, AJvYcCUuhidYu0piXblS3dtZpppuxfC90DKv4GpVpa8ZytfC+44qmzg0dZ7Y5c/wFCWV4BxCurwZ010q1PxJjg==@vger.kernel.org, AJvYcCV5VjhM2yySPliwv4JiWLBrfChCl4Vfn5mxGpZifDC3teyjlevx+vM9fla/lY0akzYiO9JfnRCaaoGA@vger.kernel.org, AJvYcCVSrI377ArsAHzNhz03ZUkP2PSdH3Bw+2oDU8LkvdHXF0xPbS443OaMG7ZqiGdRRKjcNTRLEweXCaz3@vger.kernel.org, AJvYcCWAtmF56APy6D45Le4Cusho02EcH/3p78tGY0qQQLBcHyRQW1lQCpmXCSbU1TmEnYjNRFnyK5XvalMnmepO@vger.kernel.org, AJvYcCWabstch6zBM8uGmmGHd6qp6dR66IUr0A4SqEz7CeYkw410wB9LQFkxPGFrvrlbrDaGcYWUqSWa6WbT@vger.kernel.org, AJvYcCWsp0xdoL1q4Z/ywX6zqKVLJRtI/ziyetGe9sR9ppIapMBov+C3ln5nmfe+gm3MBJ5PtGvOwowMKhJCwHk=@vger.kernel.org, AJvYcCXBxT4p3DYAz3uASiHh7mPhOG7WDtccg5E1bKMuD20973jlQr8ip4QgNrWboEvJncqtyjuaeSUioN4=@vger.kernel.org, AJvYcCXv0N2Eb4L6F/H7zFaA3Srkk8CX0rTzVrxYK+yU9LJz7AcYD3+9QsvNRIBPBR9QPRCu4uoc6RKM@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPElaiTtdND9WHemUoS/sPU6GlZ3c+YzwOfrvNj8g6bJKi/Vt
	7xX1+08jg6oTeYZL9JbUJG9WjLUV57fpfKr4RRnaCPuBtAmHHoaIRcu6XA2/9e+Jch3wV5QjqJf
	vqRLhIDDXqpZ3t98+zOyjahEC60Y=
X-Gm-Gg: ASbGncuqgu2NCJdWa2ZzKmyI3FtN1MDFFhUr4HMlrldJJaBbQSKapl+ZN6ik+S4iBh4
	9KdLhNulu42Gnygr9F7EaV9z/MMfxZq7PH4KKo8aDlvuFwckPTh0pGEC82588DIUG4AduaYYkWL
	WaO0HfFQgZmq8JAUEXy9j9mDWxJK6zqFoX6aYGsIG5quYVsPgapnXdYQ==
X-Google-Smtp-Source: AGHT+IFeIif58xXASLlUQ5gUuhwQWQfmgZ6uEgeqnbXUDfU31RgSE83NowbSJaAJgLlbclQ9hMc30P2+IT7ECEc6eyc=
X-Received: by 2002:a05:690c:7307:b0:703:ac44:d367 with SMTP id
 00721157ae682-708ced214admr35881097b3.6.1746176671162; Fri, 02 May 2025
 02:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423094058.1656204-1-tmyu0@nuvoton.com> <20250423094058.1656204-2-tmyu0@nuvoton.com>
 <20250501122214.GK1567507@google.com> <CAOoeyxVL2MV83CJaYCXMiw0b5YUzk728H4B9GY1q9h_P8D43fg@mail.gmail.com>
 <20250502080754.GD3865826@google.com>
In-Reply-To: <20250502080754.GD3865826@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 2 May 2025 17:04:19 +0800
X-Gm-Features: ATxdqUELjUMd__-XSmruQ7aiBehkcn0fiRFxm_J9Q8eFjgTFGBlNo-dtZFMfegY
Message-ID: <CAOoeyxWpYmcg1_FBXYqDfMi28R5ZXp2Sk2PhUo=cL10Nn3iVEw@mail.gmail.com>
Subject: Re: [PATCH v10 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B45=E6=9C=882=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > > > +static const struct mfd_cell nct6694_devs[] =3D {
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > >
> > > These are all identical.
> > >
> > > I thought you were going to use PLATFORM_DEVID_AUTO?  In fact, you ar=
e
> > > already using PLATFORM_DEVID_AUTO since you are calling
> > > mfd_add_hotplug_devices().  So you don't need this IDs.
> > >
> > > MFD_CELL_NAME() should do.
> > >
> >
> > Yes, it uses PLATFORM_DEVID_AUTO, but in my implementation, the
> > sub-devices use cell->id instead of platform_device->id, so it doesn't
> > affect the current behavior.
> > However, if you think there's a better approach or that this should be
> > changed for consistency or correctness, I'm happy to update it, please
> > let me know your recommendation.
> >
> > When using MFD_CELL_NAME(), the platform_device->id for the GPIO
> > devices is assigned values from 1 to 16, and for the I2C devices from
> > 1 to 6, but I need the ID offset to start from 0 instead.
>
> Oh no, don't do that.  mfd_cell isn't supposed to be used outside of MFD.
>
> Just use the platform_device id-- if you really need to start from 0.
>
> As an aside, I'm surprised numbering starts from 1.
>

OK, I will use platform_device->id instead. However, I'm still unsure
why the ID starts from1.

Additionally, I noticed that when calling mfd_add_devices()
separately, the IDs are also assigned consecutively (e.g., GPIO: 1~16,
I2C: 17~22, ...).

Do you have any recommendations on how I should implement this?


Thanks,
Ming

