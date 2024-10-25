Return-Path: <linux-i2c+bounces-7566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA39AFB70
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 09:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0FC31C22748
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 07:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2FF1C07EA;
	Fri, 25 Oct 2024 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAXAGRep"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EDB18D64C;
	Fri, 25 Oct 2024 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729842439; cv=none; b=YBTu5k5m2S4yiXI2K/jxoYimZvm5rihUwJbgMA4QdB/SY406qCvc3SAGmzDW9jkO4Vkw0eD3yigh4Yp8znzIYr+GWO7H3XGrh44SEcb2DfCJvH7gRpOGhaWNNpeh3Y4ZkJUlwUiFcjLQLPmtoUzIFhDGAVH/3J28uApundvjEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729842439; c=relaxed/simple;
	bh=ehX6fGT8vafd7eCpetvA+g+kudNcbQaq8YN3josdAO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJ4h8M5tPpoEC0k82eWvJ4YP3QfbB9Zspo01MbgbzDkAnL6dEQpkOTFqA2wGGCgvZOeXi4b0MHyScet6K5vfn1MFmS9h73xLM1sufef6mvdx2DTNtTQzZtxHfClk6GDIRi4tHOHF57SvS5MN3/08tR7HthQQp1wY/U0JJumLBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAXAGRep; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e2918664a3fso1639409276.0;
        Fri, 25 Oct 2024 00:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729842436; x=1730447236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqmzIpdGDKl30hMk2iyejkodckCkxhBpVsWYJrX29JI=;
        b=MAXAGRepCYMc/RQrWAJfIhuESR/PdTdZN1UurdoeMXadrPQcxgX24FOuiu9k9PRE/T
         zKy+/1d938SzpDYqf87AqGLIVAnAsxXHc5GT2zoJEk0VNjcNefmoGuklc4E/awHWeh2j
         PsRCkdy6nG38pSQF1Q6JcR/quNZOxG1//1YkO44M50QqKb3PRSrOVKH0K8bNH9s0y7D6
         u1i6lmkYGfDMxczGNk1vcJmc47v3FQmxRo42l68RPburrIqTHgEHmxSkZR7LgWTU2jwP
         5UwxlcRSvgChZaJIFOz6xDOIL+WNIarYrxO185ExPaIicng50pqUOl3YQafwW7wZ2mj6
         isZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729842436; x=1730447236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqmzIpdGDKl30hMk2iyejkodckCkxhBpVsWYJrX29JI=;
        b=Y2Eb32jtBLsUQc5qEv/u8Tpa/IK25QuUaVjsJlK8Bx3i20ZttersyxGFv7moBv7wde
         TTsfZ/oqfeCDrI8lskv8ovVEOKPoMCeQndGLz1Z8OC/hlGCAOwOm3IR5sZycFDAbZYaZ
         WyDViIt+f0DHapx5KXtg+K95qIwNHvaLb3sms69Gz+0Sf1H1PeWp7BNFR06iO6ZPXhP3
         qKVrW5UbXSQ/m5tByKOitqLG70x2CpXxfswcyO3VZfTZDBgU9t/PuT2X7tOAYqsmmIH8
         HgG9KbdVeltT5enOoZ91rGdAxn6AMNbvdNRIHneouO0CbJemw/08sZdOo3pHVDNWNoPz
         v3BA==
X-Forwarded-Encrypted: i=1; AJvYcCUFGH/890W0iGuystFFj/D5k4XiGf5WlK1JjykBavHNlKTARpVbdMKn/P/afeWDqKkJTnySv4SCBJYx@vger.kernel.org, AJvYcCULKK2qcm7mCqN5MOq3T4Xe0Uzfz+1iPjB3VOIrZ0mnMzB7vumf/ahTmfDjpsZt2XKge3ACbTBjodU/3gUeFCc=@vger.kernel.org, AJvYcCUlWYoj7D9i669dzP7TbEIyoCqrh7CH7HebVYh1m59wHTeBT0d46Su+oH2qnZw6En9Cal/lY3I+5KVe7rw=@vger.kernel.org, AJvYcCVRShx7sOIFMRDSTTchwQ+AIBDZCrkAJ7EQLzULhpHx8Euuinkx+cDG6vpBDjIWTGE55tk5TR5yWsE=@vger.kernel.org, AJvYcCViv2CNc4n5LDGYmRI1DJVMmAPUpGwDi2D/OXlQ1corBaViQdEn0AggHnJk2xU9Dyza0Mg58sCaBQ4low==@vger.kernel.org, AJvYcCWILv2M5kiCPVv+18a3N+NzkMfHRrbLVAEuCyejdAlZPqqf7m6Bp6Q9uZ+Ykx3VmbbgkChi6EVQu/bH@vger.kernel.org, AJvYcCWZEFir2novYGxInr4GU7LiCxCMO9fG8RPMjr6OC1Ds3t7yXEECFKJ/gMcIP0C3LVDEkgFAIBYwDwBN@vger.kernel.org, AJvYcCWnX7L5E2Idz0l0GDpC1r/sTfOLaTZ5cT73st8gSGkIsdX961FS7feS7iB7e6BUuZL0EKtAp7O1dX0mRk62@vger.kernel.org, AJvYcCXG0KSPH7vhQZn2Z3pRzq0CtGINgnB3QmAXT6+2zlzYY9FyCIoxrywQfXItasOuP5c1wiyoFLDO@vger.kernel.org, AJvYcCXzu8/xNTsthaBXcULT5BwYTHlop6XK
 Mj/jyH5oK4dXic9qchKg+x7wYWhVPYXICCLPljcRqA80AXdO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh458Yr6NwZ84pIZC5bXkLAhJT5hK38FnH2kkvX9ze2lCypUpw
	qR4/9qWcc4N9/GsrKkjV5+pzrIHiHkiBPRIL4cR5Q/QSPcvI8BV5uIay9KlzISqkL93F2qBnznw
	E167oaZOVAFUVOWai5MuUi/kxdug=
X-Google-Smtp-Source: AGHT+IEC3bW5kzqxYrvzM09I5JNT9Wf/rxKh5CLA/Pjzi95L2nOK0TXzA8OLIIbsTpzcl+KEiiOwITvqlSGE8AxXZVw=
X-Received: by 2002:a05:6902:2382:b0:e2b:dc72:3bdf with SMTP id
 3f1490d57ef6-e2ea8a42093mr3811661276.10.1729842436128; Fri, 25 Oct 2024
 00:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-4-tmyu0@nuvoton.com>
 <linka6lz5zpnaf64vmunrn2ezqts5gp5rsbwiaffm4v2mtnqyg@npxgcksgizrn>
In-Reply-To: <linka6lz5zpnaf64vmunrn2ezqts5gp5rsbwiaffm4v2mtnqyg@npxgcksgizrn>
From: =?UTF-8?B?5ri45a2Q5rCR?= <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 15:47:05 +0800
Message-ID: <CAOoeyxWNed1RmZ1FDJ4sTHJ=CmhBWnGZ0wkWF_dEuQgAOqwECA@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] i2c: Add Nuvoton NCT6694 I2C support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, resending this email in plain text format.

Dear Andi,

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Ming,
>
> ...
>
> > +static int __init nct6694_init(void)
> > +{
> > +     int err;
> > +
> > +     err =3D platform_driver_register(&nct6694_i2c_driver);
> > +     if (!err) {
> > +             if (err)
> > +                     platform_driver_unregister(&nct6694_i2c_driver);
> > +     }
> > +
> > +     return err;
> > +}
> > +subsys_initcall(nct6694_init);
> > +
> > +static void __exit nct6694_exit(void)
> > +{
> > +     platform_driver_unregister(&nct6694_i2c_driver);
> > +}
> > +module_exit(nct6694_exit);
>
> Have you thought about using auxiliary driver here?
> (auxiliary_bus.h)

[Ming] For platform driver registration, I'll change it to
module_platform_driver()
in the next patch.

>
> Thanks,
> Andi

