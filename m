Return-Path: <linux-i2c+bounces-9281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91305A26A4C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 03:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 382341887545
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 02:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B900714D428;
	Tue,  4 Feb 2025 02:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dni9JViy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2E25A634;
	Tue,  4 Feb 2025 02:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637590; cv=none; b=OoQY9+wGDgbs+LugOes8N0CYqxyO77yn0WjB17z3cZo6sRHWPjNLlT6CMja3ZOcIVXGuPrbZdeu0VChBzR0YbdKTzK+aOhEwKEpcrNWoS8bR2HfCxzfkORlbaErokOAwBpAcmYBhUmblt2p+XDeuzpc7Ht+n22cWG0InMOkVOvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637590; c=relaxed/simple;
	bh=VpcxOzYvc2EtxPfddOr62rkD1DZYmRv94X79g3nNc1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pl/5un2JIr8MpzwgR7ub6T3h7iTYWmOLGf9CSjFuAbHwQzo55716XoOeneauIGIR1P32EkXHGByp6IwL1t2Loe720+SUi0PtNYX7tA4wpbH1cj/MCg2hLapRZq5zi4HNdFYspY9PxUV6+CKa/eXi4XAqJUAycfGVCk7V2bgKQuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dni9JViy; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f47ed1f40dso31466077b3.1;
        Mon, 03 Feb 2025 18:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738637587; x=1739242387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLVUd6QfeA3M7Ges1AvVcKvNEAAOPuaos5MsyGuWTQk=;
        b=dni9JViyOe3l3tId6BsbvfKbGXBxkCZzQBznelKo2nyb7nwUJh/F1zrIGvsVbJyKqm
         DrjvLKI1V2sc7lUfLz9SS6b/n23xyIVET4EtRWwajw8QZtd97nATfQ2Vhp5+ibMGwmRw
         MrPI8ZDolPy4L6JO5gr/yZAN1rdomTmeQNr35lsAKpYlQdYz0qIsRKn3O3vgGDZ7YOAD
         YIrSmT/PDFtWeVLgGoXI6y+0C1elH47gwz7m7RPcyJJUuLtGFUdbkl+8kAvGBqeIij2d
         URm4P64NDZORYI1tWoqjIVRGjGZmHPjD08g2idxcyeBp01ri/aL0b2u/WRHX4JC5pfva
         A+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637587; x=1739242387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLVUd6QfeA3M7Ges1AvVcKvNEAAOPuaos5MsyGuWTQk=;
        b=jFd0Zvot66od/khObIQk/F0yoenn6cQSJvHtnYSmyM2OIZWgQmDsf/28G61zVtkplw
         /RVbnx8rpJb1+FTiGGwJ635MhGj/HhHFOTe2qz6rKk88viHXQe/D5fr1eGbx6bIECkw3
         9rvw3EKtJXYBALo/U8DGu1bgxN2nULUJEtrgp1f71NLGc44gFlGHqPfyvTIQVMVHCMIa
         5b66BWKDfZzaH+SNVdQ3sneudzRry65s3945IAWU6rD5fDorkbf4r5fD55hYdwLmFJgp
         i5cwg9NJrde61zI3/qTaaS/tcEtyzgoqQg11T099ZGzjmPaS8/K7H2D5cQ5EmFw1XyNZ
         jw8g==
X-Forwarded-Encrypted: i=1; AJvYcCUs5vS6p+LmD+VzL8TxAHY6YlYf35XJUd10ZoAGjg+foNqqcnUyHprP4rqjYB694bpRK9o4x+PFx7M=@vger.kernel.org, AJvYcCUyF4u41d6pfUWaUDa3fo1CDZWp1RgPyQqu4QCn8E1xP7fU2hkMpQ26oP052rIaWtlNi2QnnF85Gw3weSVf@vger.kernel.org, AJvYcCVsDLcBeoGeSG8uEPjSugW73SnuTX6PlTC28eU2mbr7hDH4OvF/YvZOszuRXqX6z8vIZhE9x8TpFXpj@vger.kernel.org, AJvYcCVth79viUHlHVjsif+o7yLQhH9MEShZEaHWv58roHbSX3/PKkqQ7aG9tPhxz59ArgOflw6lufP9ca6e@vger.kernel.org, AJvYcCW788IStS01O+EqTAJVkHYLIhw5hTVk8INy7TM1Owkl6QBPk0P8QlcYLWGPf4gYZTsupJV8Jt+7L7fotQ==@vger.kernel.org, AJvYcCWVsZQi4pNlMFIlqiHouLWFYcqyb4HH/6yEawajy3XqqN9Jkt0QHofj3G23qkbS9TVWnKsgU9iOx74b@vger.kernel.org, AJvYcCWYG86JcuVKxJgsRDfN0QRN/a+8Jx3Aswcj/Q/Nbn37lRSKvi0omn9Aiejo3EE/1qXaRBBaTTtJN0MKQRG0z/Y=@vger.kernel.org, AJvYcCXMF4STseyl+mjm2tOCHbld0DSkFKLL6BkTP7i/0DcJwLQpDMN6MmfO4NOJnSWejHGrDF6htQba@vger.kernel.org, AJvYcCXtIV2e9v8AoYKBMnqOS/kR0ie1KJbOQFxIzkPeAU2gMdRcD5MtbNcdkxo9q3C2D309ZocDHxZ+B6efYT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGCV5seRemnOC8jF869ZVPIq+FC2bZFgRiItfZ3P/qBaJ6lIs
	UkKQY4QXHiwf2yF1APg2hGvMyKO5deAWfZenzI2bJDCz2QMLliW0J3cxCW3FmxRRt16YQ7kseNO
	UIp2pXwktzhVgu/zS0xKADcl37AY=
X-Gm-Gg: ASbGnctJ+3SwCt+OPpaWleb5gF2T39NqMr74zlyVn2/DomNA3H3XoAXq8SOi5R8PHP4
	r22uscbeeF6om2yqXN/G1rZ8Q/RQ5nHDTHsiTFNL4ae+AMIXAr8rDDgqdHCc6xXoAznZwZ3AjPp
	QiOQAHCU8LXUp/qn0aYunFwubnhkK5ojw=
X-Google-Smtp-Source: AGHT+IFeDZU0dSd3LyKNE4SOHHZmjs/OWkO8WJYeqvdBv7r4EkCLwBFisJ9ZEKAYuz3qhthIDYgpoGZBY/0QIu6VXhk=
X-Received: by 2002:a81:b813:0:b0:6f4:2b4b:358e with SMTP id
 00721157ae682-6f7a8334490mr140033547b3.7.1738637587601; Mon, 03 Feb 2025
 18:53:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-7-a0282524688@gmail.com> <c1cbb337-9ca5-4071-b05a-a97ab451f358@wanadoo.fr>
 <685ce5ff-127a-4f8b-b058-d36d3adb1c0d@roeck-us.net>
In-Reply-To: <685ce5ff-127a-4f8b-b058-d36d3adb1c0d@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Tue, 4 Feb 2025 10:52:56 +0800
X-Gm-Features: AWEUYZkf53oBhkYM5RpWbSZEAayYxQcwszOFunFOYIl2jXoioDHsY_4Pifefhjs
Message-ID: <CAOoeyxVPgJAa_LQxjXtLpL04pwpGL57W1St3j7nEVqZd_rXbXg@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Guenter Roeck <linux@roeck-us.net>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent and Guenter,

Thank you for reviewing,
I will change the temp_hyst to a signed variable in the next patch.


Thanks,
Ming

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2025=E5=B9=B41=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=889:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 1/25/25 23:42, Vincent Mailhol wrote:
> > On 23/01/2025 at 18:11, Ming Yu wrote:
> >> This driver supports Hardware monitor functionality for NCT6694 MFD
> >> device based on USB interface.
> >>
> >> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> >> ---
> >
> > (...)
> >
> >> +static int nct6694_temp_write(struct device *dev, u32 attr, int chann=
el,
> >> +                          long val)
> >> +{
> >> +    struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> >> +    struct nct6694_cmd_header cmd_hd;
> >> +    unsigned char temp_hyst;
> >> +    signed char temp_max;
> >> +    int ret;
> >> +
> >> +    guard(mutex)(&data->lock);
> >> +
> >> +    switch (attr) {
> >> +    case hwmon_temp_enable:
> >> +            if (val =3D=3D 0)
> >> +                    data->hwmon_en.tin_en[channel / 8] &=3D ~BIT(chan=
nel % 8);
> >> +            else if (val =3D=3D 1)
> >> +                    data->hwmon_en.tin_en[channel / 8] |=3D BIT(chann=
el % 8);
> >> +            else
> >> +                    return -EINVAL;
> >> +
> >> +            cmd_hd =3D (struct nct6694_cmd_header) {
> >> +                    .mod =3D NCT6694_HWMON_MOD,
> >> +                    .cmd =3D NCT6694_HWMON_CONTROL,
> >> +                    .sel =3D NCT6694_HWMON_CONTROL_SEL,
> >> +                    .len =3D cpu_to_le16(sizeof(data->hwmon_en))
> >> +            };
> >> +
> >> +            return nct6694_write_msg(data->nct6694, &cmd_hd,
> >> +                                     &data->hwmon_en);
> >> +    case hwmon_temp_max:
> >> +            cmd_hd =3D (struct nct6694_cmd_header) {
> >> +                    .mod =3D NCT6694_HWMON_MOD,
> >> +                    .cmd =3D NCT6694_HWMON_ALARM,
> >> +                    .sel =3D NCT6694_HWMON_ALARM_SEL,
> >> +                    .len =3D cpu_to_le16(sizeof(data->msg->hwmon_alar=
m))
> >> +            };
> >> +            ret =3D nct6694_read_msg(data->nct6694, &cmd_hd,
> >> +                                   &data->msg->hwmon_alarm);
> >> +            if (ret)
> >> +                    return ret;
> >> +
> >> +            val =3D clamp_val(val, -127000, 127000);
> >> +            data->msg->hwmon_alarm.tin_cfg[channel].hl =3D temp_to_re=
g(val);
> >> +
> >> +            return nct6694_write_msg(data->nct6694, &cmd_hd,
> >> +                                     &data->msg->hwmon_alarm);
> >> +    case hwmon_temp_max_hyst:
> >> +            cmd_hd =3D (struct nct6694_cmd_header) {
> >> +                    .mod =3D NCT6694_HWMON_MOD,
> >> +                    .cmd =3D NCT6694_HWMON_ALARM,
> >> +                    .sel =3D NCT6694_HWMON_ALARM_SEL,
> >> +                    .len =3D cpu_to_le16(sizeof(data->msg->hwmon_alar=
m))
> >> +            };
> >> +            ret =3D nct6694_read_msg(data->nct6694, &cmd_hd,
> >> +                                   &data->msg->hwmon_alarm);
> >> +
> >> +            val =3D clamp_val(val, -127000, 127000);
> >> +            temp_max =3D data->msg->hwmon_alarm.tin_cfg[channel].hl;
> >> +            temp_hyst =3D temp_max - temp_to_reg(val);
> >> +            temp_hyst =3D clamp_val(temp_hyst, 0, 7);
> >
> > temp_hyst is unsigned. It can not be smaller than zero. No need for
> > clamp(), using min here is sufficient.
> >
>
> Wrong conclusion. It needs to be declared as signed variable because
> "temp_max - temp_to_reg(val)" could be negative.
>
> Guenter
>

