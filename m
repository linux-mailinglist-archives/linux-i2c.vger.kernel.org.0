Return-Path: <linux-i2c+bounces-8459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B19EDF72
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 07:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371AE18898A7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 06:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A2B1DF98B;
	Thu, 12 Dec 2024 06:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEhY8J/4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A58176AB7;
	Thu, 12 Dec 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733984816; cv=none; b=cwgcn8TsSfnQes/IF+mhaRu4AqT/5LOrIEs7ENY4L5QFDSZZPeKYExyy+wAdrIlDbXDwQn2iw6YXWaIG/eWvQoU7dGF6oyL2ofAqJqOstj0xNSCz1qBF620oe6UNhu40AAdOlRXzp0saNUM/KRGkG52+DeQcysxdf4PAE6MvtXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733984816; c=relaxed/simple;
	bh=fsAhW7uXSwTVCHbkk7P6nCdfV+5oyEPDJvHbIi1IALg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ag6HM0CB2ESkzyGVhRaUIqlT5BKcxSrozlDvyUG9SNeuiieIrEpNgrqhdqgGRbda9GXqZvw/vQeWLnHPRuyTDaQUyktCW+4wu3ygxeHMtm9L0z8QxD2I780E42dkxm0uXPBjk51uNncznS5HGrV9R3yNx2fsuz+UJUAv9C1FBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEhY8J/4; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef7640e484so2519257b3.3;
        Wed, 11 Dec 2024 22:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733984813; x=1734589613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2zbvxVhnIA1/tYrT/GzUNHWzm0AQCITVV3oMXXfgf4=;
        b=NEhY8J/459Dh+htAk9JUoQfWTCj54W/rp5ssLxkzIoOIpMNVpOxqf0P4vUbkh94dlF
         DKKyk4ZBcqM0dE6jTTQ90UUVP42ddss1dntEuSFzIOz/Ym3pkFiBys09ICKTbkx1Uk+y
         5wFGDpNKJx49ttxDclPZgKfiAr7tPHN6+fzMj0HdxTeGHyMRjczwAHuozUgCgd/7yuqb
         OEjOjFTyPAILar49TsicLMX/t+K9jERyrkTEDJgVOFlkEddl+yo52CmYpVMUoQVTLPmg
         FmWZr6JJY1lAP1C7/yCySzZ6a3HpMExU4WTE07lVulfbKpl7EENARQj5yKkSrXFHjAA6
         2ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984813; x=1734589613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2zbvxVhnIA1/tYrT/GzUNHWzm0AQCITVV3oMXXfgf4=;
        b=wk1IKL/Zi29o8svsywT9RueNqZBLmflqW/ryRP34MopB39gtDsF+NuxWUtKE2ahh3R
         WNqRZib1VERFCZqb0qVvLkccd6AInv5CGuZXZgT+FBLedFzKHEYAgGw4F28beySbvIQr
         vTDWTzwC6k1cQ3o97Ms+toNwEpd71ezAljoabOwuT4I/X/q9BPr8Vb4a7JyuuWriV/+f
         XRrH397AMUN4lNWmQeEFCp3UUCbHBOUBNFOw9eXn42ndlMpA5idss0IVHOWGLft5P1B1
         1JtXju2AIia2g6BR6XyCDp6hUj57lkSNblGWIGcKtK2mvnKwXWbO1bh0I2OX/zGZ7awj
         SVdw==
X-Forwarded-Encrypted: i=1; AJvYcCU6PfiPUNXW4BddUuRWNI5XeESQxpBn81eruR+fVW/ImEwP1UgQPudSuQg/1ZCHRrz+Dct2NYkPq1tzsZY=@vger.kernel.org, AJvYcCU9YZKPTE3VGGh+hMp4vYj2Uy+bT1Mgv4x/sla36VswR7/IhPFJwsZe1Ex1ic8pozGMMl25xY2e@vger.kernel.org, AJvYcCVtDrvomi2oRUzlrEFFniW547Nn88cau4hzzwMFScW6s4xQRB3vzufzjOolkvarf8PZv+LiRy9teZ8=@vger.kernel.org, AJvYcCVy1KSrPC/6k4gTuIzdZt/XMa23bJnsocwN5V03wFtql0GrSQdlSysweMshFDGGXxQcSDu7uAnTEviD@vger.kernel.org, AJvYcCW2SSpcsUQ2s3/QyetvfrZetABWCYfMxAMyqzrPruyrkvyz9hVFlPEtFCMLwGwjFgo+JIL6neGv/c60WD52@vger.kernel.org, AJvYcCWLoilqqATFSzN9Op2V88z0NVpVNbMRgaHEgDpZJNv5VjBnx2k9m2OBA+ArUD8OqXIsEm6k6IhEjslJCA==@vger.kernel.org, AJvYcCXFtlYZ4iWVy70Zgm6CWgMOcFZn1GGQ16bm14Z3GbFgwGXsW8wY5FRVrlxMh5QuDTWv+PrWzRaL2n29EwrLBV4=@vger.kernel.org, AJvYcCXPZDs+hpWazzLJ9ntR5uNsmdbKQauLmvkqOeCw8lAmIkF80HmxcV6Tag/TMQKGI5beUaVMJbkavh4u@vger.kernel.org
X-Gm-Message-State: AOJu0YySH9emI4uhh8WNacnLGBUiyPhnolEc/wWr5lSnWHBDl1bvNvCF
	p2p6D16BRnhEHzV7grTA7cxvdWwMQnb9kAHxdsX5Nv9Y79REyQPhiiUgFmS/BVK/4edGW8nsfhg
	PUnxQFd9y7Fp0K6VM3AMLBrxAQ0o=
X-Gm-Gg: ASbGnctwsPeFoxEoZU798/fz2fnfAyVt0wT/KCkFbEo8g0FQr3ds/geRBhbMcgING0r
	KR7PO4FNweusFCcLw3igbmucqxhIs53Xi+uRGzBvCqlEQbh5b7PyB4PmbEQmG3EJgWp/9QEg=
X-Google-Smtp-Source: AGHT+IGqdigMfVFnbLLNn+yyp2sMBMAH7e5o6CU1jXSYMqjxj+WKGacedXvEKBN+row0zV7EnrkLe5Rj2bZFUaNxIqk=
X-Received: by 2002:a05:690c:6ac5:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6f198a3b52dmr23213857b3.3.1733984813469; Wed, 11 Dec 2024
 22:26:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-6-tmyu0@nuvoton.com>
 <e8165e99-9770-4287-8a05-709a9a7bb701@roeck-us.net>
In-Reply-To: <e8165e99-9770-4287-8a05-709a9a7bb701@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 12 Dec 2024 14:26:42 +0800
Message-ID: <CAOoeyxUXcMn=prW6gSebmCBM0Wb0Z+SvBw9oSrViRvZtqT2gZg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Guenter Roeck <linux@roeck-us.net>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

Thank you for your comments,

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B412=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > +static int nct6694_wdt_probe(struct platform_device *pdev)
> > +{
> ...
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
> > +     mutex_init(&data->lock);
> > +
> > +     platform_set_drvdata(pdev, data);
> > +
> > +     /* Register watchdog timer device to WDT framework */
> > +     watchdog_set_drvdata(&data->wdev, data);
> > +     watchdog_init_timeout(&data->wdev, timeout, dev);
>
> This is pointless since timeout is pre-initialized with a value !=3D 0.
> That means a value provided through devicetree will never be used
> unless the user sets timeout=3D0 as module parameter. But then the above
> check for pretimeout is useless.
>

Understood! I will drop it in v4.

Best regards,
Ming

