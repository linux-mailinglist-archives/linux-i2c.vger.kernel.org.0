Return-Path: <linux-i2c+bounces-9371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F6A31C03
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 03:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C42213A7AAF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 02:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2391D5CC4;
	Wed, 12 Feb 2025 02:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZhxnhDH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188CB1CAA7F;
	Wed, 12 Feb 2025 02:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327268; cv=none; b=CIFE/P/+pf00xhCPoRkVwxJPM/5LC2pHRjgyz/E/zTrjUHeDUkeCybETM8my2NugsG8FmXbiwag+ilsX16sO9Zjkq3JpaGo+Le6ttK8SnWlBo3fFTP0ZNLgjuVI+iaiWpEs2ji0Z2i/0hK8/RMS7wBIvtaFcH/mPTlhPMVFlrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327268; c=relaxed/simple;
	bh=XNTpRhZ3fxRHmJEWAMolHb8JRph6LE03ym0ZpWAutSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nua2o3VPYj7LOiYccljNmmCZUdqJE0eMLInA5thuWcBeUYSWTSIhBgUwIJrYx4/aLVL9MTY0mY3OXeoBpK133TAso7mWOfZKNA5XELL1WUEqAploiSXTOSGoNSuN0dMgbtatnMRA057nc89Kop6EOT2uwXYk1/3zrzFrbBxj+n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZhxnhDH; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f77b9e0a34so46456287b3.2;
        Tue, 11 Feb 2025 18:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739327265; x=1739932065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6F4L4SaFXOFnk/DwcnTDSe6yOs/RUxwb5c9eaTPL0A=;
        b=TZhxnhDHQwSTJCV0+CQ6hm7PFfhD4jDWMgf4x0E3WmNvLdFb3qcMyyI/6ig2qNMmos
         kTmurabQshN/1l4Dn/mLSNgasfzlXKSRFpNYYAG9Miw9vsMYR5zTuYTSx+m+dlZkbhxP
         HWEJ+w+vbk0np0Uam+0+ugisHLcXIVjBOrWDh7TjbTS0bvMUrumjzLq1/fTH/ja/aCAd
         dSuME6S2WJBO0HlafKPVv0Dhrl80RjXuDRAfhkv/hWwCP/lwAWhNUbw4tM2h1xrFsZJN
         NZCW+pGqFngyoMYU5EHb9rFNKm61hwMdgY9Dtqc63Ut/ukurs+HEzICAnGB25QVvJ31k
         R+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739327265; x=1739932065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6F4L4SaFXOFnk/DwcnTDSe6yOs/RUxwb5c9eaTPL0A=;
        b=uYABGZaBF/jHmGXkN0epA5gqa6XBVrE2jhrkIUZgNOt4jdY1cB9KMnEFGtK/bzfVJX
         V9J8mnqE6Fnc6QJoaShl4BKymELbQynR4I+s+YfVk+sEqwlQEmQNcwz0lXy6eDWR+fv7
         8HDv5028d59jY8EDjVlJ1XETYTIpCh5q663dHvFGj0/PHIte7e8H05H8HZ51pPlMn3RX
         NilI7sQt5/Tkdbg0K87CfwTagMBIhgIfbZQUVZVsQpMyz8cRrkvD8+MHZw126PpHgtxH
         ZZj873+hg9jm7woXH7ryai4daoGzhV4J7DoMaXlhlsTGIkrzQ9i7vGGxJ4EXmRTZTpKV
         /Nxg==
X-Forwarded-Encrypted: i=1; AJvYcCUjYsbjtmTgOfJ69eVXqci2d4MEdwOSPKT/fzfLX2V71OMs3un4YHs43OU0bAmwZL/rJTB4avOv@vger.kernel.org, AJvYcCUzQZs/j/3WevJdmK+WPIB48mSudx8D78StpbhmLmTIA2v9XxdaxcG1aFlT7MW5GLLxaZLRXOaK16BQ@vger.kernel.org, AJvYcCVJTHsKMhpjESUj0AtyBd2g+yPl3TzzstNOq/aIo12+fEkM07DJpVHpi4RYe3+nVnYFiA7WsWGfaZyef4BF@vger.kernel.org, AJvYcCVK4UOd1jWyu//0OBlGQ9UAGmLV/2Pgq2dbGYO8OAa4aVUVg1bVpGvGBjFG0f/WV1J8RS7Ae3mF3X/p34c=@vger.kernel.org, AJvYcCWHJz9hRZMnj5cym9ZfH+zHclKri2hC2x4p0ii1ZxVSm+DQQKJPK0HyiWZGJDvKrY2aH7T+lGvn/yyY@vger.kernel.org, AJvYcCWtyPeeAlwRn4S2kxnopBEM6ybyKAW7b8LpdUI/VT0adgbYm75R8LFWcxL7rQ5DR4hXvtzrpWwzDHU=@vger.kernel.org, AJvYcCXNHtUu+eeb8dqr09v2QUEKerxdz1as7+Iu8YFdAkIfYXBQQLWsCpxN3QZVp3Wk2uaKWtUvsZeJaSey02aXg1A=@vger.kernel.org, AJvYcCXUVs0BRZavrv7M8wxVzNryb5jJv2Bz73ec8wJKFbSSAM0jFUdnnzr0Xjg7551PEhSkSprb/Jr++OTV@vger.kernel.org, AJvYcCXvxT61kfmVmICqwn7NppD50JZF67fsYqdHth7WvtW9zZ9DVIEmuz/c2Knlt/hnJGjxFofR86rMiXKJ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA05BTCcGvrdpPafDmxGzfmeDvLJIVrEcLrwkEnHjiKhc23cRM
	icRXUTqIGgjkToZ+jsaMq5xwm4TyqF/ZMDeukV6fFzTJapqvvoejXr1XczxZrhKPrDtHlbz05lU
	XW6OHgATNJjXfeY6KF4m70lEUAes=
X-Gm-Gg: ASbGnctif47bAfKPbdqkcNY6w4Sg0ZRBIIXswDeKJl3tbwL6By8yFcKNHCNFm11xuT2
	lwKzhskG0GG2b/T0YHAPrmZDTjDVwkWqtePjaxTQfSV8t5Qz1ucJBHlkMABod/ZLNQiia/pIp3I
	U8kjdMhpfXg5Ku3qX/f/ZRnC5abvD7790=
X-Google-Smtp-Source: AGHT+IGulwT7PweDVmkr4+FYlxSo7B/VIPVfzNPz8aOBhzRqp88wCHV/cWMR2HEkNYYGahtbaGGkuIKK7iWPIbqnZIc=
X-Received: by 2002:a05:690c:46c1:b0:6f9:82fa:6d96 with SMTP id
 00721157ae682-6fb1f19bbe5mr24081647b3.11.1739327264826; Tue, 11 Feb 2025
 18:27:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-6-a0282524688@gmail.com> <9b451153-41b4-4c15-a586-01cb5126e207@wanadoo.fr>
In-Reply-To: <9b451153-41b4-4c15-a586-01cb5126e207@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 12 Feb 2025 10:27:33 +0800
X-Gm-Features: AWEUYZkhU0SYHW9fyypqI2zEJgjkjlaLa0F4ZfNBX2YLvjUCEHwSXFQN1lr6P_Q
Message-ID: <CAOoeyxUthDO8wo5fbMuNyJBd-YKD9TrCE5Lr3ve=Z+rndm6X5g@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
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

Dear Christophe,

Thank you for reviewing,

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2025=E5=B9=B42=
=E6=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:30=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Le 07/02/2025 =C3=A0 08:45, Ming Yu a =C3=A9crit :
> > This driver supports Watchdog timer functionality for NCT6694 MFD
> > device based on USB interface.
>
> ...
>
> > +static int nct6694_wdt_probe(struct platform_device *pdev)
> > +{
> > +     const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +     struct device *dev =3D &pdev->dev;
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct nct6694_wdt_data *data;
> > +     struct watchdog_device *wdev;
> > +
> > +     data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->msg =3D devm_kzalloc(dev, sizeof(union nct6694_wdt_msg),
> > +                              GFP_KERNEL);
> > +     if (!data->msg)
> > +             return -ENOMEM;
> > +
> > +     data->dev =3D dev;
> > +     data->nct6694 =3D nct6694;
> > +     data->wdev_idx =3D cell->id;
> > +
> > +     wdev =3D &data->wdev;
> > +     wdev->info =3D &nct6694_wdt_info;
> > +     wdev->ops =3D &nct6694_wdt_ops;
> > +     wdev->timeout =3D timeout;
> > +     wdev->pretimeout =3D pretimeout;
> > +     if (timeout < pretimeout) {
> > +             dev_warn(data->dev, "pretimeout < timeout. Setting to zer=
o\n");
> > +             wdev->pretimeout =3D 0;
> > +     }
> > +
> > +     wdev->min_timeout =3D 1;
> > +     wdev->max_timeout =3D 255;
> > +
> > +     devm_mutex_init(dev, &data->lock);
>
> Error handling?
> (also apply for patch 1/7 and 6/7)
>
I will add error handling for these in the next patch.


Best regards,
Ming

