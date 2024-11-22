Return-Path: <linux-i2c+bounces-8130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A1F9D59DF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE08F1F22EC8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 07:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1E917107F;
	Fri, 22 Nov 2024 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZHyrcmh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5C15B987;
	Fri, 22 Nov 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732260019; cv=none; b=S1Ow8DcubwEnhbBAfED2VhnOAJNUxzQoZIwcyWescPYnYsmwigpNv5WJ/Av1P4ixqGbJR1/rsuYiekNHI3YDGf7lkGIHERrQtQ9vvLdBSWHNgCiqGnUtnfv4C5J+HPOOMY9mOPZWCTWDkuhnYLBrCKxG9ABCqdCFfCHqslNXljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732260019; c=relaxed/simple;
	bh=sBFVC7C9RINBCv8fmIUVR8aRbHxatozvHOs/XUgRHwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcqXhhUM21pVJijXJcpHkxIGfk04a0cAQE4avFL+1K7RqiYu50MUOY94fl2Z1hBydBaG6Mdbw3vzed7g76N3HW08fpWyTmM1Z7qKOMMj3iezuAjHuH9rUpTzwgB4KTHk4C/ZioLWNs6/pFhMeN9VdczG8dIWjfXG72E8POYRS4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZHyrcmh; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e388c3b0b76so1529394276.0;
        Thu, 21 Nov 2024 23:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732260017; x=1732864817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=815PRNAXGixKSoavwJ5I7tnTzuqoesWmtEB/fULSXqw=;
        b=dZHyrcmhAVuMbbK8SA4sxXyh2C9Qa9DP7/0Ibjp4RWUPHNXSzLwCrLIc9ZE6L5CACE
         wThQYCteTbEPAoo5DxC/s0mIxiYMPqpf5nWeU2k5dxlyH9mhQVD++llrORBTXq+1xW5J
         2hZZJ0EQPMJNmrTFyqvWHR9hq8AMNU/wddf24LJ5fnez49uL2zpAY7PLFNHWTIn0MUWA
         OjQYg57lcx+q7uKFJ82oPPJBULaUp9qHIwP7+hB1+V/AenKQHJSJQAFmqNU5h9NjVnCS
         JAk/6LbnX1+MyM5hL6E5PrlCjfVGI7be88Gb8+R8FpQnagrQKwMrOREY+5bE4jqvSzTI
         gIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732260017; x=1732864817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=815PRNAXGixKSoavwJ5I7tnTzuqoesWmtEB/fULSXqw=;
        b=WeGZHeJc5m6d4uYc3qS2F2AGUchkyr2x7iILG/ohGoeVrZOtEYhFjfjVNc71z948VX
         u+IhzlPyx8lzSxz1aJCwm17ZDmHjWJwCV6z6l192cHuoy2D/mBHcrU0xdsO3R2NMjVtx
         k/rmwCw2q9HkHflVbAUD07+r5Hvi5znjEayZ7txXvSbyIm8fkQE3nnAXvXLOakAOwlxp
         uHoJkAMXUB6akSHLkEZH8iHRHWFCmgwoc/DksyVjjwiIKPUO7GMTOOFMwkmXgWt+DvhV
         Fq3q0WK2LN4n46ktECySUr87/jHeZP/bYlF+cX26VD4/b5BucxJMWZaiHJlOmIxSu8w3
         X9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF4XUvY4poZ3dNFFKGjVWjuCM54CxWitCGyfRaAzc8ioggQvaodNvhgBd+aCRGqTzqPM1S55WYI2OOqTFX@vger.kernel.org, AJvYcCVILqoG4reSE/HhktxRv9V+xuX9B6KP51o58ZFNX7aKbuo/86W2mua9IEi1V0XVRgF+WbBaK9bOx6f/I22Lvsk=@vger.kernel.org, AJvYcCViAtX8Qu/zwr9cUgewfQUgGI0pDEKV87KeH0JldFPK0ma3+OsQZgcEEAS7CN/Squ93rLIdUSrDL/sRpA==@vger.kernel.org, AJvYcCVj0yDbwFpVlo6w54EWmQ+RtX5xg8ALnCiEOOE7txifhsYfcdO437l1mNB9hy60ozI3eEoufJeD4utrB7I=@vger.kernel.org, AJvYcCW7mWRC4dA0e7wn56as4yX0iUOjErqjTaMhsFaFaRt4tQq2V+F1349z7bGS1UL+5l7oSjGzuhnP1Fg=@vger.kernel.org, AJvYcCWBMy2CSp6WnyLhH6lFb2nkA9R67+kcnHB68tTyv+5WpOjnv6+KVL5nxhHiwRhfDOTTo575OCA2pLnb@vger.kernel.org, AJvYcCWGG0yPKLiL2biTMr6C04ScIubQWj3woIQsoo46VnH4B2Iqa12YC/emg1lScNMVQYSKOq/21IS/EkwT@vger.kernel.org, AJvYcCXa+joCqNVSA0edxD2f4HDiCzQ6IOYt2Am1UNcom7jc3l+RLgeVSL1l75ZCQD727tqQUIeQTTTd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2Wk7fXhHFsHFA0Wj9xo4xqnJGAgKAnRho3/ZtYJZMulenrgA
	5s5j6pMu8vnB7cXWn9J9hykpXmVQU4tXBNIJx3dzwR8Nqp4xLNgZPDUjNs3YLkNepKHGhpPU9n+
	oxdxwI7eSTnLP5Q1uZoiR+8A9o34=
X-Gm-Gg: ASbGncsbK27821sCgQ0yBn1GI9r4Wo9BJm0U2NV9ArM078W9y9Of42txhz8dB0o5r1r
	0lamvdjAd8BPiZ00K/hFdbby0wf/QuLk=
X-Google-Smtp-Source: AGHT+IEo9z3KG+qp+L7Dv7o9KTWLJa02iuVvebytFW0OHFU307Dg/AvnlIih0s/Axe8p+7QfLYX633cDQcq1B3yoR4c=
X-Received: by 2002:a05:6902:114d:b0:e38:b48b:5fc2 with SMTP id
 3f1490d57ef6-e38f8bda124mr1654950276.36.1732260017069; Thu, 21 Nov 2024
 23:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121064046.3724726-1-tmyu0@nuvoton.com> <20241121064046.3724726-3-tmyu0@nuvoton.com>
 <CAMRc=MdT_iXoRJeGFEhuCvjVXVPpJVNeddPc6pi5agTaTm+QpQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdT_iXoRJeGFEhuCvjVXVPpJVNeddPc6pi5agTaTm+QpQ@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 22 Nov 2024 15:20:06 +0800
Message-ID: <CAOoeyxVzVF0Jiiv1MeY6b=2XR5HFuGx+4q8Kvw3kFrgC+_LnBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bartosz,

Thank you for your comments,

Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2024=E5=B9=B411=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > +struct nct6694_gpio_data {
> > +       struct nct6694 *nct6694;
> > +       struct gpio_chip gpio;
> > +       struct mutex lock;
> > +       /* Protect irq operation */
> > +       struct mutex irq_lock;
> > +
> > +       unsigned char xmit_buf;
> > +       unsigned char irq_trig_falling;
> > +       unsigned char irq_trig_rising;
> > +
> > +       /* Current gpio group */
> > +       unsigned char group;
> > +
> > +       /* GPIO line names */
> > +       char **names;
>
> You only use this in probe() and after assigning it to gc->names, you
> never reference it again. You don't need this field here, it can be a
> local variable in probe().
>

Understood. I will modify it in the next patch.

> > +};
...
> > +
> > +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       data->names =3D devm_kzalloc(dev, sizeof(char *) * NCT6694_NR_G=
PIO,
>
> devm_kcalloc()?
>

Okay, fix it in v3.

> > +                                  GFP_KERNEL);
...
> > +       mutex_init(&data->irq_lock);
> > +
> > +       platform_set_drvdata(pdev, data);
>
> There is no corresponding platform_get_drvdata() so you don't need this.
>

Okay, I'll drop it.

> > +
...
> > +module_platform_driver(nct6694_gpio_driver);
> > +
> > +MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
>
> It's an MFD device, don't you need a MODULE_ALIAS() for this module to lo=
ad?
>

I will add MODULE_ALIAS() for each child driver.


Best regards,
Ming

