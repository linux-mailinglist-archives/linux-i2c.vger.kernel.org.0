Return-Path: <linux-i2c+bounces-8691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBC69FA914
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 02:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E21A1885B84
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 01:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAB4125D6;
	Mon, 23 Dec 2024 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+TWeHzS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266C23D7;
	Mon, 23 Dec 2024 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734918670; cv=none; b=BBFoqiA2aYlwAqt1NPRGiwRO+ZSEWsYv26cLIDxwwsIDQBkL9PvRNoEH8PysFhSMe56aU/v3WIiiaS3a74jC1HrD3GvmYXwAnn5HRS1WqqUwxvJ+9z+93UFEk1q5uNmFhj+v0Cni1WmNjGK/0qLEDGTU3r2k5SXIU62vwmeBjyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734918670; c=relaxed/simple;
	bh=Ueo1SkvfgIF6RG7Tayj9JKXB2Ay6IMh4xY7wb58eVDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DX4GULvkMEFh/9ytL9HgEtdPPZ20IVbAXOn2WTesFJGpJvhOYNJI5nEVZVAgOTZPOJuV80PlrlA0ON3mpVTNo6EtpTYT+hQcsSN5jGs1lyqrj3KsCBEWanbDI5hji4LOwf1d6ywsCXMRutn9erStoN/ucMCbFm0qJuZfGEbX/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+TWeHzS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f29aa612fbso26253017b3.0;
        Sun, 22 Dec 2024 17:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734918668; x=1735523468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llHDEsm2+HQacxAs8QUDGLwaO/ynmYbcHeL3fhay3CI=;
        b=e+TWeHzSoogZdLRVw7IDeSohJpjFekyiqjkrG8f5mZ3pQE0Lqs9q0nQKevXKcuE4r+
         qk3CYmJTEC8lIkkol7N2KmPxijp+msc7WiIpqX/Rm7K5iwwBIUP4LuvHYZjEKd99hMTC
         /kePwoULwTFlhr2PNRZStAqhdufFqcN6883rut4FXmwUwjxign10fpQxk4cVPicF00C1
         RPr/yVUN7NGlE6bmftVNqReT6mB42bUYZIdqa+N24OAGacKQdQWvrqiRmYSM/OYrp4PM
         Ij2Tqc2dpQSPKRs9pHpP41Og/QnxTp9/3OmDInCvbajWqW4XCmUeiMxsoB5TZQfUeN2Q
         BUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734918668; x=1735523468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llHDEsm2+HQacxAs8QUDGLwaO/ynmYbcHeL3fhay3CI=;
        b=uQrxuumue5WELiTyC+FiEO+ZT7lV4OwpfyXyjcF0fZ/i6Zp7icQCPuqHEjyKi6ebHv
         nANlS5Mb+D+5LYCdSky/2Jo+0v/ZTMXAlBcxGxShDw6NCH+1bZWDDA8gvebUqF64r0vo
         P/+ys08NA9OzG1wX4XrDvA3ZmyE7MUmm3OMofYFBDh77oTmjWMS6haHA6DT1jrHu5uwI
         pGtmMdwegIX6zAtQBiHZnQ5nDr0Gmlt8NY/TZ9qNMfpEzQK8g0Izefl9DRCynX5z9raX
         BdVobj7+0En7j8PymG70Zc6UD1myx+H5/3f/65eblhPjnSmPGBPcLMWA5wL340DOnO2z
         FVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4FFvIYDPVG0Mrcot9LHwNslot8YAlxbLM40w8FqtRHNn82n06YcxA6lZ16YA8ryLTDkURlc2hKs21sJoC4t4=@vger.kernel.org, AJvYcCU9K8CeYcP9jHc9HjglFskU8ab90I92quYhD+irz7pmLWXUDm9GOcTO5OarCC4Wkg7VSFBSu2GlvXM=@vger.kernel.org, AJvYcCVRVQKSNNNRRC/koAUnUa+5lU1CRucjooQlwTVpJ1s9YCiv3K8j/wwdeL/l95WEjWzqOJJ3F4sg@vger.kernel.org, AJvYcCVkBeVkCublCZ2nW1DgewcW6QeLKNHe7bTiXzfMS3lSahbToIRhT33NKUrnVdOY2oPw4HqmKrACvrg97kQ=@vger.kernel.org, AJvYcCVmjKF0kp79wYrxnsm76Bh0Fejhjw/PaUSw9kCw9rWngWBQSg7v1LYEBOy67a78OSeSWNr5yyi+FZsD@vger.kernel.org, AJvYcCVsCWIaNzilrsqX0KF06QxFTUSyu5MC630a2fkDfnYSGksBOdeieLpQWPjot2MDvNDuypfC7o/3npPHFdBH@vger.kernel.org, AJvYcCW8+uOON/MvHROcGdUknBG4bU7lPbHuVcymMVs7iOcoM5NajLMV6iBYZQ7V+6sv+uRpi6QJnJHrvw3t@vger.kernel.org, AJvYcCWcHIs5REuYFllCjr6I4JNEqpu5wcXvW1tA1r0pz14/+vBqLNTdKOzyQUcipDatP0FEW8H99EEttw/+0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGYWeI2yESsLEifncFS7v0LU7zOAsWphhpOJBPWmRBcxe1iVr
	JonyETn3SXDxlySaa1imBFrHdMG0Z1vmDzyYYNsDLWGzd4/uoMqC5jBsM5aTB7jHlnVUuAk3cbf
	oBtjUrcuDgs1k+SwqIL7X5N+B7hM=
X-Gm-Gg: ASbGnctEDZRrbvg/rlXIU0ILaguKZ/z9C93znyILwL1CTBWsLt8S4AsjSZ0bWV76isg
	tP6cT92wxfpyJGB9sn9L+4cmOB9HyCS8ahXx9
X-Google-Smtp-Source: AGHT+IHNEPgUnyOUOLJNYmuWZzb+A9VZ8DHSgD5LFG69R5fcYpoa/i4kczMgAE3xSasrhbjfGxzaLMqjTmL1iCVGthQ=
X-Received: by 2002:a05:690c:640b:b0:6ef:8296:359d with SMTP id
 00721157ae682-6f3f813cc98mr75276497b3.22.1734918667598; Sun, 22 Dec 2024
 17:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-8-tmyu0@nuvoton.com>
 <202412161041586ed7c0ff@mail.local>
In-Reply-To: <202412161041586ed7c0ff@mail.local>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 23 Dec 2024 09:50:56 +0800
Message-ID: <CAOoeyxUOZSA++uprMZ+4rbjb1zuyPUi6728Cx8sudRaizqSwnA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] rtc: Add Nuvoton NCT6694 RTC support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Alexandre,

Thank you for your comments,

Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2024=E5=B9=B412=
=E6=9C=8816=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:42=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On 10/12/2024 18:45:24+0800, Ming Yu wrote:
> > +static int nct6694_rtc_probe(struct platform_device *pdev)
> > +{
> > +     struct nct6694_rtc_data *data;
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     int ret, irq;
> > +
> > +     irq =3D irq_create_mapping(nct6694->domain, NCT6694_IRQ_RTC);
> > +     if (!irq)
> > +             return -EINVAL;
> > +
> > +     data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->xmit_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ=
,
> > +                                   sizeof(unsigned char), GFP_KERNEL);
> > +     if (!data->xmit_buf)
> > +             return -ENOMEM;
> > +
> > +     data->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > +     if (IS_ERR(data->rtc))
> > +             return PTR_ERR(data->rtc);
> > +
> > +     data->nct6694 =3D nct6694;
> > +     data->rtc->ops =3D &nct6694_rtc_ops;
> > +     data->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> > +     data->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> > +
> > +     mutex_init(&data->lock);
>
> You should use rtc_lock/rtc_unlock instead of having your own lock. The
> core will take and release the lock appropriately before calling the
> rtc_ops so you only have to do it in the irq handler.
>

Understood. I will make the modifications in the next patch.

> > +
> > +     device_set_wakeup_capable(&pdev->dev, 1);
>
> This will cause a memory leak later on, see the discussion here:
>
> https://lore.kernel.org/linux-rtc/a88475b6-08bf-4c7c-ad63-efd1f29307e3@pf=
.is.s.u-tokyo.ac.jp/T/#mf51fdce6036efa3ea12fe75bd5126d4ac0c6813e
>

Okay! I will drop it and add device_init_wakeup() in the next patch.

Best regards,
Ming

