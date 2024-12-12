Return-Path: <linux-i2c+bounces-8458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E089EDEE9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 06:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173221889BB1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 05:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCADB17C7C4;
	Thu, 12 Dec 2024 05:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHDfh5SJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D816DC28;
	Thu, 12 Dec 2024 05:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733981280; cv=none; b=d5BupylUznLUZ20PEwr6M/yRDeKZv1Lkxr1WcZcakM0PlRkVb4EPyrBHMfTxukQS4zo41CtrFEggXBkHfYFltrYN42Te280ImB+Mb/ZwRTzDEOCxEe2c6pLXP/l84QTEO4Z2d7HK4+ekdUbydHoY/gz8cU3orFpLer0KvaanyxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733981280; c=relaxed/simple;
	bh=qp0i5w/u39t3jbXhVMeRQCOlDTJ4v3kQ6Qs1em2ybJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBmB1prfHkn6FB1SEt6NYyxFZ63Gg+U0TJuZNJCEf149wMG+69DAYyActd2BuL9YOSDKt/3XIEWkjq3CurfDl21P0YyGDAxxdhz5iWHYNkjNDTJFsAKrpN0L4LKIg4zUSyPgKMc2Wg1h3u78M5GbfeCoa1Fn/tQAN/WbJSz2ZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHDfh5SJ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ef8028fe9fso1834257b3.2;
        Wed, 11 Dec 2024 21:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733981278; x=1734586078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2jQavP4ta6B4Cbqnu1IGli2ZwXsJRL5QsCRRyBteD4=;
        b=mHDfh5SJQP+HIePXtVlkvBf2FRCtretS6vVkF4QOvrzmUM9gXKatBDWKpq8xJNTrrc
         fxbsr28Ln0iInO1oQDlJ09JPNw5vkaYjsOdVl1rhXh1krqa3Ombz+G12VHPt/FeV4qBS
         opas9J3A+gVVCMCT1+9NJ9hvm4m93B7Efb2ed20mTYaELI38zQIES7eepmUdbiPGyhIA
         An23NXM972ctVGXGIafTW0rZu8tvESOfRGF2pK0Z4xbaPgspKCTtAY0Mg0eatiFZ2uHu
         vPNQ8+d8LE+r2nNsCsPD7sAU7tZd7kLuMVcSseiSuzcGcTb4lsy/qnTZhpfqLCjb7Vsa
         xojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733981278; x=1734586078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2jQavP4ta6B4Cbqnu1IGli2ZwXsJRL5QsCRRyBteD4=;
        b=MhchKkJ6AFALxTi8dEdQh5LqzuA1dNxIW66wImlZei2Y9appkDIE63BXd8VP99irhM
         8D4GFkKHWFQVf9hANJSwOQ5R0oK0Z5/hvSVqB9Gd2PixZQ3p6gBEHh4dIQphNeRdjY08
         Eox1bk4Wqx8kSd005uU0xTAw9H98Uh3lAqr+KMteece/Nwqqp/W1WiihylWKoaiYGjSc
         5UU7F80gOUxReSPmtx9qakTW2wLG/Bw6OU1mzOMUNkFiWKzWseK2a4zdfeWVKQWfeWUZ
         Lu8NN+z1X8GyA0f4Zrvf//yxGfFSvtRYkMaBqsTxOubE6I7SQ5FsWDKZ0EFa485D8Rdn
         E7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3RnsTOJijdK+9GGDlO0fJQB8SmvaxIXanpwg+kZcj6959XZa8UkO2aezo+DnmjaQWEQKN4p8ZrCp25k5n@vger.kernel.org, AJvYcCUJkIv0zvdY38ma9IJm810eTixMY2RfUX7ULm6MBnWB0PwTKitDrx81Nqq9S8WZQ9jgDd9v94HRMwo=@vger.kernel.org, AJvYcCUbhLHoPHK19WtURQ34faZrPMRbcwjA0UHbqpiKTxEYY5mXvfASARFdms14AhwY8Ny+V/7iPy4UAzuktWs1iLU=@vger.kernel.org, AJvYcCUfMWOlpQCYeeKZRAUuB1TgIGikSo5LE1BfZp98W1qrx6anwsKCGsFYC5cAi2K2SUlFHDy8vFtnANdkpz4=@vger.kernel.org, AJvYcCUzWJl07K2EpOlF+vVJGCcQEEolKF0KZZmEs8DjV/MNDUzvOH6Ed2l6S3sy1kFOYQJQrUGr+9giD2Ta@vger.kernel.org, AJvYcCX3Z5D/p1iCpfIQx/2elza+/Wi0y4+TmU+eUgzSrY7G36R0jM2dKln4k0eQRSHraU4G4yXp0/JhtGNGXw==@vger.kernel.org, AJvYcCXm+zHuWwEo3eX3JIZRZyCZXTs0y1qjixscBuXC4eqLgZTFkiwHkf4p1RPHRrovUCjzezEm7C8H8dQb@vger.kernel.org, AJvYcCXr5YixUF63Jf3WjDg2TUu8ELQkaIRhrWUdXfW8fvRozSGSBApRG0nL+oo9jwagNQsX3qx9i0Qh@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQraaoPhxpySDDNf4lLt0a+MKupDzmoSRkI/lTTsJRmIqJAIL
	nRgCMmfI50tdgFSjUqzXxRci0xuZdPbsKRac0qgNMsgmMNhyqx2fnnXKPiGnKWk3hYuiyRC5sEP
	eERfs/FQFWh9UJC28J94n/aEmyBs=
X-Gm-Gg: ASbGncvsgnEwA5EGm8LflYi2gufq8ko55BRGJDcF/j78TgZlV3BXtfLbjKd22HgWqVL
	paNh5ONWMtJIi9WDqu0ZqpPGaaPuPElu0ncHEffYlCLgQ+lKDJFkcnGBFN0eSCy6LvztB2Ro=
X-Google-Smtp-Source: AGHT+IFdrPaTPZ9GejJx+R+k192Po7wThLXGiNtYgpHneGtofpZWdqMlRAawKJACPdSwzsCirltSWXVY1xz5qEDY38E=
X-Received: by 2002:a05:690c:7249:b0:6ef:6a91:4965 with SMTP id
 00721157ae682-6f19e861030mr21004747b3.37.1733981277626; Wed, 11 Dec 2024
 21:27:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-2-tmyu0@nuvoton.com>
 <68d1490a-ba67-480b-943f-afa56e5b8436@kernel.org>
In-Reply-To: <68d1490a-ba67-480b-943f-afa56e5b8436@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 12 Dec 2024 13:27:46 +0800
Message-ID: <CAOoeyxVAbf45g-PGiDiUkZoBrSq6mRvAwHdoC6OCjEUYAUS=Lw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
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

Dear Krzysztof,

Thank you for your comments,

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:38=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> > +
> > +     dev_set_drvdata(dev, nct6694);
> > +     usb_set_intfdata(iface, nct6694);
> > +
> > +     ret =3D mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6=
694_dev));
> > +     if (ret)
> > +             goto err_mfd;
> > +
> > +     dev_info(dev, "Probed device: (%04X:%04X)\n", id->idVendor, id->i=
dProduct);
>
> Drop. Duplicating existing messages and interfaces. Your driver is
> supposed to be silent on success.
>

Okay, I will drop it in v4.

> > +     return 0;
> > +
> > +err_mfd:
> > +     usb_kill_urb(nct6694->int_in_urb);
> > +err_urb:
> > +     usb_free_urb(nct6694->int_in_urb);
> > +     return dev_err_probe(dev, ret, "Probe failed\n");
>
> No, this should go to individual call causing errors so this will be
> informative. Above is not informative at all and kernel already reports
> this, so drop.
>

Okay, I will drop it in v4.

> > +}
> > +
> > +static void nct6694_usb_disconnect(struct usb_interface *iface)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct nct6694 *nct6694 =3D usb_get_intfdata(iface);
>

Best regards,
Ming

