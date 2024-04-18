Return-Path: <linux-i2c+bounces-3011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1798AA0EA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 19:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F291C2103A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 17:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211F1172BC6;
	Thu, 18 Apr 2024 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZR2vh+F8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F2516F855
	for <linux-i2c@vger.kernel.org>; Thu, 18 Apr 2024 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460634; cv=none; b=cOaeX4SZe9/wGb72VwURg7bZgZnmxtjwDnUCn4WPXd7NGCxDN6xhvAQB61xVWxKai53e8dr71aKTacuYQ3+z20kcx83bo2ioBa+1RKFmQsw3nU++LXzXmzlOsEP7OcVW/EpTxA51uKonwxRza0TnNvBAyIZAimCAMWLeVra4r9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460634; c=relaxed/simple;
	bh=v5XuTFSt2Kik+XEmSmTAttULoZnECzNaRJxl6D9YXHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SS2PlxQI1NXQ0miimDGvaGRJVpjm8N5+pqVAverq2uKsnZNP4nTeVGWgJl+/VFByo2GPPAhDOwxcuO++6wgF1yyQUCwbvnM/HVxJ2BHsBSMkwsRMdIYMMXPH05Iq7+VETEavfEbWZMQEs56Sh/v01l9nhchCV+onK2eN4IgEajM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZR2vh+F8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-518b9527c60so1230473e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 18 Apr 2024 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713460632; x=1714065432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRA3Nwo8/llUCeKE7NO8/3NSffIJqFe+sm4EX8Gj6IY=;
        b=ZR2vh+F8IfVihlYJXzRawnhMIgZS2EBrUR6HdC4SeTtWGjiRIm9++/yYljF+Si/Otq
         HSsqlMaZuZ1SzVjZzs2m1JZgMbU6Rm1YxuFTvttw5l2slqhUXlIh1VbO++Q0cPWkjorg
         Y/nHxBB4m0CyX2pGIMXXvB/k2lb67GN8KuBL3I76T9+/QtEdUbQs0tRI7J6Uy+16oh/2
         Tu8ZYffgV5SpZA6w2+2k4Oc75+FYlQOsy2AZO90bCY044zqNBc6Fe7mY8cKq8MqXMy3y
         WU+4BpIU/pZK9Sq/Hi6v0I14a/Y5q9o8lLBur1jRjwN48MfuDJZ0KBrcjlloIt5gjLVI
         0Tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460632; x=1714065432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRA3Nwo8/llUCeKE7NO8/3NSffIJqFe+sm4EX8Gj6IY=;
        b=ZsuS2mcZFG6GB0bJ4YbtdWHIvW/0Xk0RBmpa4BCI03tvj7+Q0udqM7taoNiU+/ywcI
         Ko39Q7oEaTtnZQbOfv1QEsuIP/y4dpyQ0aTTf0azbjD7UCjqB4ZGeAWUTEy4xxEFNxFQ
         CrZUbGq0zDcl3SbOq1JW8bnSCSBlQa+MmNGX0NPSeUH3D1JB3b5qhn3lRWBu7fgXKMnN
         4VxwVWgiOvn8nQ3XeC8MPb+ei9uFP7UXOvhg5es588+OxZywazmR9SLsWqg3/9MjycVc
         qrrEmLX1lBLpKbwYlkNYhRhSQFv0TVRZbGBKJp0wPOBHPnsgQGqDxuIqoJ/3MlopFyH3
         M/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUxZGAADzsiQoWys+Bk2Vv9GLTY9z+ye4cCrtmFC9wwh4hFsW+V/j6R7LZa/6Rb/yu8YWFKJc3VkjYW6JAiDXJxp5w9N/MLaID8
X-Gm-Message-State: AOJu0YzmrpYUTqWJTf9wVUyFoj4Qpxu2tZ7tFXEpnDLVd57FKXufC0li
	J1eEqnWt7x+Eci8fWGOhfpm3p85X0vj0JRAyUoAyj9f2yA2vyf+moklYDMWl6IlOOmBIhRLX1pL
	oBFKYt/cv5Uv2FOWOLmerlfCI+fFHkH/wkAwX1Q==
X-Google-Smtp-Source: AGHT+IGxt4gY5xvRqj+X0q6Yo3MbqlkRZaOSX6Mvc6ee2gPDB2zYeEmWVTTaFoLHAJ+chcVvCtVjJ16zdnVjKjkHWcs=
X-Received: by 2002:a19:2d14:0:b0:515:b164:4112 with SMTP id
 k20-20020a192d14000000b00515b1644112mr2535477lfj.68.1713460631543; Thu, 18
 Apr 2024 10:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417230637.2592473-1-dtokazaki@google.com>
 <CAMRc=Mcbi8BQ-tHNs+BVjbm3aDSVY0zzOM4QfND3d2y8ryT62g@mail.gmail.com>
 <CAMRc=McRiv6vtU5LySrkbfdbCaqZ2tXbHnazo4iahRS-SKAXxg@mail.gmail.com> <CAOC40965VyOQX_WHxA0a=Ke6knoeYYYjqTkFva9eNyG55_Yi-g@mail.gmail.com>
In-Reply-To: <CAOC40965VyOQX_WHxA0a=Ke6knoeYYYjqTkFva9eNyG55_Yi-g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Apr 2024 19:17:00 +0200
Message-ID: <CAMRc=Mcb0uAjUBOKraLaev_xU+3OObj9YJm1Yq2A2s2bZOViiQ@mail.gmail.com>
Subject: Re: [PATCH v1] at24: fix memory corruption race condition
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-team@android.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 7:13=E2=80=AFPM Daniel Okazaki <dtokazaki@google.co=
m> wrote:
>
> nvmem devices allow for linking by name in the DTS which doesn't
> create a dependency in the probe order.
>
> What happens is driver B probe starts shortly after the eeprom
> probe and calls of_nvmem_device_get. Since a device is
> registered it starts using it; however if the eeprom isn't there
> then the read will fail and it will start tearing down the resources.
> Driver B will now access invalid memory causing a kernel panic.
>
> Daniel
>

Please don't top-post on the linux kernel mailing list.

I'm Cc'ing Srini, the maintainer of NVMEM. I think this is an issue
with nvmem core as it shouldn't allow access to nvmem devices once it
starts tearing them down. Srini, could you comment on this?

Bartosz

>
> On Wed, Apr 17, 2024 at 5:23=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > On Thu, Apr 18, 2024 at 1:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > >
> > > On Thu, Apr 18, 2024 at 1:07=E2=80=AFAM Daniel Okazaki <dtokazaki@goo=
gle.com> wrote:
> > > >
> > > > If the eeprom is not accessible, an nvmem device will be registered=
, the
> > > > read will fail, and the device will be torn down. If another driver
> > > > accesses the nvmem device after the teardown, it will reference
> > > > invalid memory.
> > > >
> > > > Move the failure point before registering the nvmem device.
> > > >
> > > > Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
> > > > ---
> > > >  drivers/misc/eeprom/at24.c | 18 +++++++++---------
> > > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.=
c
> > > > index 572333ead5fb..4bd4f32bcdab 100644
> > > > --- a/drivers/misc/eeprom/at24.c
> > > > +++ b/drivers/misc/eeprom/at24.c
> > > > @@ -758,15 +758,6 @@ static int at24_probe(struct i2c_client *clien=
t)
> > > >         }
> > > >         pm_runtime_enable(dev);
> > > >
> > > > -       at24->nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> > > > -       if (IS_ERR(at24->nvmem)) {
> > > > -               pm_runtime_disable(dev);
> > > > -               if (!pm_runtime_status_suspended(dev))
> > > > -                       regulator_disable(at24->vcc_reg);
> > > > -               return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> > > > -                                    "failed to register nvmem\n");
> > > > -       }
> > > > -
> > > >         /*
> > > >          * Perform a one-byte test read to verify that the chip is =
functional,
> > > >          * unless powering on the device is to be avoided during pr=
obe (i.e.
> > > > @@ -782,6 +773,15 @@ static int at24_probe(struct i2c_client *clien=
t)
> > > >                 }
> > > >         }
> > > >
> > > > +       at24->nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> > > > +       if (IS_ERR(at24->nvmem)) {
> > > > +               pm_runtime_disable(dev);
> > > > +               if (!pm_runtime_status_suspended(dev))
> > > > +                       regulator_disable(at24->vcc_reg);
> > > > +               return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> > > > +                                    "failed to register nvmem\n");
> > > > +       }
> > > > +
> > > >         /* If this a SPD EEPROM, probe for DDR3 thermal sensor */
> > > >         if (cdata =3D=3D &at24_data_spd)
> > > >                 at24_probe_temp_sensor(client);
> > > > --
> > > > 2.44.0.683.g7961c838ac-goog
> > > >
> > >
> > > Looks good, can you add a Fixes tag?
> > >
> > > Thanks,
> > > Bartosz
> >
> > Wait... While the patch is still correct - we shouldn't needlessly
> > create the nvmem device - why would anything crash? Looks like a
> > problem with nvmem then? How did you trigger this issue?
> >
> > Bart

