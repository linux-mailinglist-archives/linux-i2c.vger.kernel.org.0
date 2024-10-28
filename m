Return-Path: <linux-i2c+bounces-7636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA29B39BB
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 19:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C48285229
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 18:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171971DFE2B;
	Mon, 28 Oct 2024 18:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVzHeTEN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4873A268;
	Mon, 28 Oct 2024 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141668; cv=none; b=aoArrMviq3n86DrfCQCc8u6D0HU7vb200fbMll+miLf1njisWVrUCst3REJIDijDfr2PRVaKBswnUkiDVucoIgUQLFU8OhLtpA2T3B8pCDpevh8m/bhZznnTcgO66I1rnElLY3FZrlT/nLh8KibZHMljSdQs5tWUJRypr+KAWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141668; c=relaxed/simple;
	bh=ANCSbHqyxuvgp0nFgUZB2RvRiM1hWXf/XbsXVH8Nu0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdFLplWPAyc69aNByuijthAxKBbbriIRvMajr6iPquUlyH+e3JN4sZJYKG1aD5fJDYXdAC/UsJkL4cAkTp0RshUSr53MQ6w1kHKoP9KvzRQpYNSoXnOuuVaseliKh96BbDETHt3z06e8Wvr8maJhSnKW/E0gMpc3MgDzedUVxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVzHeTEN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEACEC4CEC3;
	Mon, 28 Oct 2024 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730141667;
	bh=ANCSbHqyxuvgp0nFgUZB2RvRiM1hWXf/XbsXVH8Nu0w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hVzHeTENHMRNzDW3+KoT1ZR10ZxgtOU2dYGXd9+qjI7sGIXekTjlWGJ3QlHZpX333
	 m5sd7l4u3A6e4KsRDqXzjwzflDfK0/to5CzePmJNw4VOulXUgz9OISBalHm75SzJYO
	 9VQ2dh+2YTTwiEwGP3zjFwzsZr84qNKDKS8dEx2zk2hdGydSIFNV0bsk76zSFWm8HV
	 pflgGv5/4GIwx2OwzHndpsshfKrVQ+i6eN1rnbb1+LSY8T8i55MEV5NyHWYd1vuDCv
	 bPwfRWdxS5sWjeLr/TZXMjbDddRjGTSgXtmFrmInNeUP2sitIPfdswQQvnyl2lPWU3
	 QzxqydZz+LTOQ==
Date: Mon, 28 Oct 2024 18:54:14 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Kalesh Anakkur Purayil
 <kalesh-anakkur.purayil@broadcom.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
 lars@metafoo.de, ukleinek@kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
Message-ID: <20241028185414.65456203@jic23-huawei>
In-Reply-To: <CAOoeyxX2Jk+76Cedu5_ZGgeRCPmT8Yhczmx7h+K-za7r2WS=Sw@mail.gmail.com>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
	<20241024085922.133071-7-tmyu0@nuvoton.com>
	<CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
	<62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net>
	<CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
	<817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net>
	<02f05807-77ae-4a3b-8170-93dd7520c719@roeck-us.net>
	<CAOoeyxX2Jk+76Cedu5_ZGgeRCPmT8Yhczmx7h+K-za7r2WS=Sw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Oct 2024 15:58:00 +0800
Ming Yu <a0282524688@gmail.com> wrote:

> Dear Guenter,
>=20
> The original plan was to use the IIO driver to access the temperature
> and voltage sensors, and the HWMON driver to access the tachometers.
> However, since the device is a hot-plug USB device, as far as I know,
> IIO-HWMON is not applicable. I will merge the IIO driver part into the
> HWMON driver in the next patch.
> In  other words, the driver will be used to access TIN, VIN and FIN.
See drivers/mfd/sun4i-gpadc.c
for an example of an mfd using the iio-hwmon bridge.

Jonathan

>=20
> Best regards
> Ming
>=20
> Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B410=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:50=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On 10/25/24 08:44, Guenter Roeck wrote: =20
> > > On 10/25/24 08:22, Ming Yu wrote:
> > > [ ... ]
> > > =20
> > >>>>> +static int nct6694_fan_write(struct device *dev, u32 attr, int c=
hannel,
> > >>>>> +                            long val)
> > >>>>> +{
> > >>>>> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> > >>>>> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0};=
 =20
> > >>>> [Kalesh] Please try to maintain RCT order for variable declaration=
 =20
> > >>>
> > >>> Ok, but that is already the case here ? =20
> > >>
> > >> [Ming] Is there anything that needs to be changed?
> > >> =20
> > >
> > > I don't think so, If two lines have the same length, the order is up
> > > to the developer to decide.
> > >
> > > Question though is if the buffer needs to be initialized. You should =
drop
> > > the initialization if it is not necessary. In that case the second li=
ne
> > > would be shorter anyway, and the order question would not arise.
> > > =20
> >
> > Actually, I just noticed that you also submitted an IIO driver which
> > reports the same data again. If a chip has an IIO driver, there should
> > be no HWMON driver since the IIO -> HWMON bridge can then be used if
> > necessary. So please drop this driver.
> >
> > Thanks,
> > Guenter
> >
> > =20
>=20


