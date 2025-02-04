Return-Path: <linux-i2c+bounces-9280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F91A26A2C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 03:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F233E3A6713
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 02:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDF514831C;
	Tue,  4 Feb 2025 02:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNi21EDJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6B200CB;
	Tue,  4 Feb 2025 02:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637065; cv=none; b=QZwsXmtoOAiWi8DJKVQShmhtsum0ObaLcnSAGvi5/UUWPu/OZZ34iwnZOfyg3k+rPAvu0UO1lf/4HAVewvxi5DXhHp9koo8F5TAMrhat0rMKr6+wP7b6eRdI87FFQgr/yBxrI5FyMr+M1xVEqCjAzqEtKVf/aI1lTP4B9L4jc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637065; c=relaxed/simple;
	bh=jRd25VpC/Xy5FBYn9Lx5VwOU+AFhy8WP3pOuHsrmNwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=klcDie5uJcbdPD5NtJCFprs7B2Ph86mYYkB178ojYem0rg9Sw53/+WMt9FcKrt1ahZYB0W9o07gGG6ZFjRsadIhUvOePPKOReKFnA0EaOIHm7HyzL7YcOhl5WQDFR3cn51WwU4Gvj7+l/lMHsZbOBpNCH6AhidblClSXNIgWmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNi21EDJ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f7440444efso33921217b3.2;
        Mon, 03 Feb 2025 18:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738637062; x=1739241862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPBsu7yo7VhCDkdiOz7IxSqvDq/dfwWbvXlFPc3BdcA=;
        b=VNi21EDJ+a0y1yxkG35nYbaFhFTVWU7PMqhE4MBG0n2Ah6IWwIPctc/akobxef72oX
         LDtSKXoxlezN/oQylNuY2mJ2rWtTwn/YkBjtEF43URcRgWWCOxcORtgamxGZ+ijo1Hv/
         OjwnQyGOSjZ9ecwjv1Mq8NrOe4GQ4lzcbS/muCoXiO7v1o0YHHmd/VdgVCPR6jYGumvT
         7+sJ3LSnjbILFIhnb/1WouJ6c7QL3mBv95JgNpffHy/fW8X/bAuW5vPbzyt86v7F3qLa
         Y0t9XdSnak1/sB96bI4Vqwhr/lCUAKAhr2BOajpsVOkpPAsrHJqBmMp1O8uGWUPFMvAa
         9QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637062; x=1739241862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPBsu7yo7VhCDkdiOz7IxSqvDq/dfwWbvXlFPc3BdcA=;
        b=TywmstqkZsbHkKfnLVQxXvofSjvLMZAcqEntRsaLiEWdJ8MiLP2ugLTJxhVDw2iYo2
         LQcALUr0fQmfbwRjgYlexeGeXT3kn2VbIlysV6gwzPoQfMGQIjmoed+BMimoSeyZiR0E
         XDp81GcTG9yfwODROcvxn3yyk7Xtt7MzJSW8s6xH2jd/QCW1luEqR6E05jDbDGarT0Cv
         V0XyrnEgX43AHdiWal/h4obMw9rRoWCi/31t0+/oT3ObJQQls+ImCyE5n+9OpprdtCFS
         0MxG5i0VUiNF53A/TD1yEf9yH6zprrWuKqXHx5Vuz5z2BWmCbdeMRca7uNai8ifom4xT
         X6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUEZwWNqd4BPAeCJQk3E816ahe10IIdadc+M2fYOGhmU2k66ZMadNYN6ukNuIo3sIqL+BHuX8QNryTb@vger.kernel.org, AJvYcCUulNs9Q8+wiiq2jTFa0aFnoZJnGWFN9AosIV1qgynUXhbZEU9i+Id2idPyWOZGGC4fa5Np5NAM@vger.kernel.org, AJvYcCUvCpieioo2Ou90SfJIgSUpULlF8z2hhv4wElXPUXA0BRwi6dqNBKQuyKXNqfd/UYgkW9UH8nG1bJCCpA==@vger.kernel.org, AJvYcCV6M9L/30XOjNCeeXcCM2LbOZzlgwnfURKs159TyYmLWzcPG5JNh3aJyb9QAzBLkx7SA7OU32jT73o=@vger.kernel.org, AJvYcCVNll0moCnVpDxVQL1VukOn6r/5yyBSD4pPo2CmX1XcjIrLkKAxMzk/Sznx63etz1ocbA0qkEUTzo7qETV/1gM=@vger.kernel.org, AJvYcCW1U7uia3XckZoEsVPCteYsUY4R/R2eeHyfrG9b37mqijxSOtg0KL1MOeYZunvkE/vMebzr284WsCf67b8Q@vger.kernel.org, AJvYcCWrzDxRENycVWrRNSB026x2tsHaU/2garz/oSri8Skew8AaO8ULhliK3bVC8m9xlsdgOSaPmTCdON6al5g=@vger.kernel.org, AJvYcCWydhMvYizSDdoc5xvea/o+778drqBusYNuG/4+L9jzO/vqJJlgeNfQMmHbdJN1IvqmW6Ds1KpjQJU8@vger.kernel.org, AJvYcCX8/9QM8DvzcVYRiuM8O6PCTe6KKBo0JkSYwfFWkeW76qOBqiCqjedggST6H2ymHWDTG3H7kQx3mwgP@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJ9QZgGqwO+cFeac2yp2G145AodrEhMmvZeTzW5lv811sQdU2
	Cc7YafAZ0AsyjnS0okFhBGkNK2iq5ma6tAA1uh7lL0Rf67Lpuhj1hYZSbL3NILG2JXAfgMn7Ug8
	ftReo1GxNrzxZFQLxt6Wdx2c3Kmo=
X-Gm-Gg: ASbGncuJCaK1j5LXTgNBS9YEy91O2RCR+imUEYLEUpkew2eySpp4a0xUSXEsPXxMNqf
	u0k8Yt13SMPe51GQ5aV77CRtTEEDmgnlje7S9JJhrHCXY758nIL6aqAGz1sopiroIHsjZ3czrub
	kZhhoZlwXDwhMnHF5aFaxhBhVah/eUkOo=
X-Google-Smtp-Source: AGHT+IESXnVIr9gwsDh8JYS2ZHc96GPKGOAyJAIlgFJHg8yw1rueL8YQGCkSpyu90dnvYesk6WBb2RxIYH6+1NDH2Vw=
X-Received: by 2002:a05:690c:7345:b0:6ef:6f24:d080 with SMTP id
 00721157ae682-6f7a8322970mr175922357b3.7.1738637062624; Mon, 03 Feb 2025
 18:44:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-6-a0282524688@gmail.com> <825dad63-4241-4dd2-92fb-c9f95bd2220b@wanadoo.fr>
In-Reply-To: <825dad63-4241-4dd2-92fb-c9f95bd2220b@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Tue, 4 Feb 2025 10:44:11 +0800
X-Gm-Features: AWEUYZmKgRtUOwt9D5NiYIUltw6b5mxsHOid3BeUGjE-zqStY526HW5UgvCugZw
Message-ID: <CAOoeyxUqHs2NRh1-2DJ0vj3dquQjETdNFNf0_4buATb2dG458A@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for reviewing,
I will make the change in the next patch.


Best regards,
Ming


Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B41=E6=9C=
=8826=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=886:13=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On 23/01/2025 at 18:11, Ming Yu wrote:
> > This driver supports Watchdog timer functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
>
> (...)
>
> > +static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
> > +                                unsigned int timeout)
> > +{
> > +     int ret;
> > +
> > +     ret =3D nct6694_wdt_setting(wdev, timeout, NCT6694_ACTION_GPO,
> > +                               wdev->pretimeout, NCT6694_ACTION_GPO);
> > +     if (ret)
> > +             return ret;
> > +
> > +     wdev->timeout =3D timeout;
> > +
> > +     return 0;
> > +}
>
> Not critical but I would rather like you to fix this shadow warning:
>
>   drivers/watchdog/nct6694_wdt.c: In function 'nct6694_wdt_set_timeout':
>   drivers/watchdog/nct6694_wdt.c:168:49: warning: declaration of
> 'timeout' shadows a global declaration [-Wshadow]
>     168 |                                    unsigned int timeout)
>         |                                    ~~~~~~~~~~~~~^~~~~~~
>   drivers/watchdog/nct6694_wdt.c:36:21: note: shadowed declaration is her=
e
>      36 | static unsigned int timeout =3D NCT6694_DEFAULT_TIMEOUT;
>         |                     ^~~~~~~
>
> > +static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
> > +                                   unsigned int pretimeout)
> > +{
> > +     int ret;
> > +
> > +     ret =3D nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_G=
PO,
> > +                               pretimeout, NCT6694_ACTION_GPO);
> > +     if (ret)
> > +             return ret;
> > +
> > +     wdev->pretimeout =3D pretimeout;
> > +
> > +     return 0;
> > +}
>
> Idem:
>
>   drivers/watchdog/nct6694_wdt.c: In function 'nct6694_wdt_set_pretimeout=
':
>   drivers/watchdog/nct6694_wdt.c:183:52: warning: declaration of
> 'pretimeout' shadows a global declaration [-Wshadow]
>     183 |                                       unsigned int pretimeout)
>         |                                       ~~~~~~~~~~~~~^~~~~~~~~~
>   drivers/watchdog/nct6694_wdt.c:40:21: note: shadowed declaration is her=
e
>      40 | static unsigned int pretimeout =3D NCT6694_DEFAULT_PRETIMEOUT;
>         |                     ^~~~~~~~~~
>
> (...)
>
>
> Yours sincerely,
> Vincent Mailhol
>

