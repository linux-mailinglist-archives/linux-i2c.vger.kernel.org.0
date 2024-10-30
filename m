Return-Path: <linux-i2c+bounces-7656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4619B5A5C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 04:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD925283F1C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 03:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E0219922F;
	Wed, 30 Oct 2024 03:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvtq13+I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE914F90;
	Wed, 30 Oct 2024 03:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730258997; cv=none; b=ed6ocFOK6lRO3Szymoi7ZRORrcK5FIl4GAT6cHJRmdQ+RAWgIcJZVp7kaiJ8gy+Sa5GnP2WarV+f3Vil1AhMVr6avDZdW6aVENpsjCV3jmY+tbbMqmrixyZV4CUBw3WuT/DstVFyCxFuihsnDdBzT7Zi/qVsec5Wa/+72aYdHrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730258997; c=relaxed/simple;
	bh=gB6sMqfjocTtVpdzRyKnKZUQ89s5//aBIvoYbkO8htc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJWnkXpw9RkdypNuofLD7LIjrWdJ5QNl/TqB3MJxd9SdmlBfAJAgrYgRPV1PzLfx1ftkWNZMVDqyYYOgNyVDs61peYGge0u2kfHuOvD2wUvC/fY4GK8d1HCaB3T4vuYXNZffhWckXZ6o/xXU3OOiRdTa2RhjQsqwPuUafJrO9RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvtq13+I; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so6416226276.2;
        Tue, 29 Oct 2024 20:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730258994; x=1730863794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP29SaC0+NjDpQ+Q8kSclFW9qhNXYgN/YI2Vt9caTfw=;
        b=Mvtq13+Ir2K8UrbaAH2NeinUPkSi9Pefnkri8iKtcgB5GvMbrhSHDb8aOphpnwcsX0
         PNsLjVAh+lpbH4FFGDZ1EVmpeW24n+QlgCd8EsrR2x+xiSLozXUEYQonmPi36aiHqdJ4
         bENhdsKn9KSPibuehm9myVWFIxZT6xcVv41McDZ8wxJwjw+lPBwCt/hZZMEXBd5PrJay
         AX6D6hUs3+a3kFHhPiG9FfpvXPl8K9Z/VE5nPuj5Eoc5ERszHlIS9dUufys06ysqIAar
         CVm3WvE3IYqz3uwNoEtwvnwCjfPpEMFsZeTwIdR9aoy5MNoc/UEGtFF9wRZ2JewA85cu
         HU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730258994; x=1730863794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP29SaC0+NjDpQ+Q8kSclFW9qhNXYgN/YI2Vt9caTfw=;
        b=hO89FkEcCQBmYKM5WXVJtzQBJuZob7iKi2pXFhlFY7qsa1W9b9fUuN060Py5OLNUtc
         ViUKyNV+7zzBnq+pd8Y347WSTPPh/rvjvG5g/Sr24o8h0vIVJgFQ9NdWN3/BRTdc67vV
         ysRZKwiCW8OUJ30O6VNI+2NkiEmPAfStOEfEh2R6uQvYebAfAIWK+3pk4vzbgbfeMTj6
         VFSuvd34bjfFpPUIWMvmjdjrn+s9BUxsSew7vvcDW02AnJFJ4EBJi1FveCo5hX5hk5u6
         gdX5RjITIpXSrLu2lVDzlbw1zhp5bo+LYrJXlHj7vbgSnIsnWZ4M1jp0LhhNNChwjBNY
         19LA==
X-Forwarded-Encrypted: i=1; AJvYcCUQNIcwz0ZKLloMTPO4bVeJDbg7yJ73TNR9qfndcn6PbfpOnIiCooFE1GMTi5eeuQhwa6OwTmzDvhse@vger.kernel.org, AJvYcCUay08yr5SFvtOT8GNCeim9ShS6Ic4BL4PvegXrp4TH1PRBIuRqdzsAFktYLhf1yesC8iLDjDteUWeQsQ8=@vger.kernel.org, AJvYcCVN/RKj/C/PSwSdafMvcI80W3aaZe0xXnQyeoOuROW4mw3gANIN5vAuTDkB7vllWwzmVlwRzo7xEdiEZA==@vger.kernel.org, AJvYcCW76l/H+vb7n/2qzi6emWlDis2ADdCDu4PCysuzKIKidgTxGPAshm1DIqbafBpLJYG0SiQtC8it@vger.kernel.org, AJvYcCWKnzObPVU7MCE/ltf8OOmIkNQ2xk3WAZ8vrZhh4daiRwVAnPu5KlAjE9K9cW42QI5IT9XvcaKPlKlwGLZY@vger.kernel.org, AJvYcCWaieWED+EcEew7BvG8wzdWyasreMdzR/AOhi5Cr7eITkGalp9kzOPkeHKqu40bvK3b8tEC+1aNu2wN@vger.kernel.org, AJvYcCWgaTDx0CwAdMNk7TxAncd2ObB23c/n/W+rkQUUVGCB1GeAurY13Od3XJMEqOT1taJsAEt8jZ9IkuCywbseg+s=@vger.kernel.org, AJvYcCWoSO39idEDue/hSZ0xPPoUR8AbUOwKQPvZxxReVU/ia+QigqfmEE30jIJuPROmlErHIwFPNvuYeGM=@vger.kernel.org, AJvYcCXSbIYF6dC1P6qYC0h4JGj+mAOyOzZrdm1KQ+WVcZVXWxmmQbCKvvJnJRhEgLx7D9w0Lr3Z5yRKf12s@vger.kernel.org, AJvYcCXVWD3cvMTo0jBA2awVwJxo2UpF/upb
 Ya3AEK3C40sYJJmrbDsN9BiXs8whDlhezuYB+QgXTn1FoZ6w@vger.kernel.org
X-Gm-Message-State: AOJu0YwhNoPPrOQ6nHW1Tr5q6jYM3ZZYT0CZEm7lm0Tm1XaEtU6v9FlZ
	zu7hLL1jqhbnpWVhzNZgoaqpVfODzFwRbpf13KoziEfbIudN8Oj4dL0E05k632dr4QM6q//vpDu
	rD2rFOmNj/kkBhT1jZljb0GZ4r8g=
X-Google-Smtp-Source: AGHT+IHPHivp//5/1F1E+KCfk4ICpoDujCclNjDxmM3AkIl+YaqACUChlZiv6jcz1YluWguSbfgvDGU/q+nvuJeLm/Y=
X-Received: by 2002:a05:6902:2b8b:b0:e2b:ba9d:64c5 with SMTP id
 3f1490d57ef6-e3087c13018mr11188254276.48.1730258994399; Tue, 29 Oct 2024
 20:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
 <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net> <CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
 <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net> <02f05807-77ae-4a3b-8170-93dd7520c719@roeck-us.net>
 <CAOoeyxX2Jk+76Cedu5_ZGgeRCPmT8Yhczmx7h+K-za7r2WS=Sw@mail.gmail.com> <20241028185414.65456203@jic23-huawei>
In-Reply-To: <20241028185414.65456203@jic23-huawei>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 30 Oct 2024 11:29:43 +0800
Message-ID: <CAOoeyxXJa05XxTg0JpZ6GRV7XMMa3Rct4+c5Q3cqCtW9KZzQLw@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jonathan,

Thanks you for your comments,
I tested your suggestion in both the MFD driver and the IIO driver, and
the iio-hwmon bridge worked well.
On the other hand, my requirements involve accessing thermal sensors,
voltage sensors and tachometers, so I should implement it in this HWMON
drive, right?

Best regards
Ming

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:54=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 28 Oct 2024 15:58:00 +0800
> Ming Yu <a0282524688@gmail.com> wrote:
>
> > Dear Guenter,
> >
> > The original plan was to use the IIO driver to access the temperature
> > and voltage sensors, and the HWMON driver to access the tachometers.
> > However, since the device is a hot-plug USB device, as far as I know,
> > IIO-HWMON is not applicable. I will merge the IIO driver part into the
> > HWMON driver in the next patch.
> > In  other words, the driver will be used to access TIN, VIN and FIN.
> See drivers/mfd/sun4i-gpadc.c
> for an example of an mfd using the iio-hwmon bridge.
>
> Jonathan
>
> >
> > Best regards
> > Ming
> >
> > Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B410=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:50=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On 10/25/24 08:44, Guenter Roeck wrote:
> > > > On 10/25/24 08:22, Ming Yu wrote:
> > > > [ ... ]
> > > >
> > > >>>>> +static int nct6694_fan_write(struct device *dev, u32 attr, int=
 channel,
> > > >>>>> +                            long val)
> > > >>>>> +{
> > > >>>>> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev=
);
> > > >>>>> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0=
};
> > > >>>> [Kalesh] Please try to maintain RCT order for variable declarati=
on
> > > >>>
> > > >>> Ok, but that is already the case here ?
> > > >>
> > > >> [Ming] Is there anything that needs to be changed?
> > > >>
> > > >
> > > > I don't think so, If two lines have the same length, the order is u=
p
> > > > to the developer to decide.
> > > >
> > > > Question though is if the buffer needs to be initialized. You shoul=
d drop
> > > > the initialization if it is not necessary. In that case the second =
line
> > > > would be shorter anyway, and the order question would not arise.
> > > >
> > >
> > > Actually, I just noticed that you also submitted an IIO driver which
> > > reports the same data again. If a chip has an IIO driver, there shoul=
d
> > > be no HWMON driver since the IIO -> HWMON bridge can then be used if
> > > necessary. So please drop this driver.
> > >
> > > Thanks,
> > > Guenter
> > >
> > >
> >
>

