Return-Path: <linux-i2c+bounces-3005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E898A8FF7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 02:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 543C7B21F1B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 00:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94D910E6;
	Thu, 18 Apr 2024 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EQmJXtT+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7D376
	for <linux-i2c@vger.kernel.org>; Thu, 18 Apr 2024 00:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713399832; cv=none; b=t7SBqSIj6+SEHg1f6jOfdpIZ66ANS+3WFpv8oI3dv7eGnEm/w5WOecdRC/PhzO8YlxgdENp6DU0JblSMzS5S+sqKpiPtJf2ZbdxUJlkucCujW/+ERSlmz5mlFjf1EkjizfdPVL5Xtamjse58gPJCV6rNdOtuerAn07WadFAv6bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713399832; c=relaxed/simple;
	bh=8+F6PP2qvcM28ExvjGoCq9ck+Fvk40LFrhNIeFQyvd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bewnLoVzRszPf6mVjSiBVeVMXJzM+81fW5wYRqoO74ab2/4DD3ljugpvnfVR9ttjotrkBY/i809y8mIHtunO3DcOlDOptPrjMiywTFg8+ghRPLXxvkq/68kjSKzUhw+ds6GzoOqbX53nJ+a/ApDZN+OPp5ou2I2oZVv8zTjEwf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EQmJXtT+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so253197e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 17:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713399829; x=1714004629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i9VTKXdwVrZUiFoJtRZUvp3SrFLNeCVgmhZ/CQHQQo=;
        b=EQmJXtT+38OaKNZVPehAP4pcfhVzRa8UaVwm1sbV+WFV1DbSXfgjo2SlAax21A3Laz
         itpKBsD3DbkklYVsT8uyKgBG/FVQBwlkECUT6lPG1+9CPEw6aOOEPB+zmZrspA06d7qN
         i8bywpX+VlCrkSkdZEyxrQJxutb3RmsWX0rk28k7I4j3+GKjQYHd+cI8M28DwBiIUo7A
         rLGPDzTmAeHB+MLpzIMBH5JfCgSUbnn224EAttsj3G8cetG9uAnR5gqm+KsBz/KhozbX
         ddE2Ua5HT9nykeaxAGQ6CKX4Fo7E+9Zm2w6pcZFbu8NDtZvuzR3kzcCl8uf0u7ByAgXU
         cKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713399829; x=1714004629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i9VTKXdwVrZUiFoJtRZUvp3SrFLNeCVgmhZ/CQHQQo=;
        b=eIkbfUVLcDGr1uKLIMaAgdwztpff1Q4biuMBy/BLXQKM2G4j+ipIbQTN7GAPPF1Wff
         nEZMqj37pkH0pC8QRAnh2sw1EVSHxaEnlQ/EPaH51pKQ4RAdv1luqLfJXM5+Noa86Ojb
         z/MRYli9LSmElHX1+8OXVk0j6y7CL6PMoQteVmBHgiBJrmhGo4UgYhLQfK8cEnYXgAYZ
         mB38JDfE8++90EcwNPLwyZxv20yYVTxHkrY3PSLq2SazqMj0h6G0+ZAe+Cbqh/yF3Nsl
         7tvBDklVDtNxs4WMmC8JZilScJnZQyp+lO5t+aUodBFa0cbMDKFBRRSgWeoD59JxLYF7
         h6eA==
X-Forwarded-Encrypted: i=1; AJvYcCUQKdzesJ06SKGgejFqjWtukCcGR7Hl6UZTjOQfZqQLtjM1VXxL2WNGoPqfn4u4tSVdVBFyPQ+SpDIMNsOrIcg2B61djf1SKkPm
X-Gm-Message-State: AOJu0Yx9Y9MdflhQ3eZSAXtuBdrXqp403S9wcyXufv6eIrX8x2Scy3W9
	/gqjqmLHqES/Dj9Eg7aSqd7LDtj9OEtzccj6/wodjwowD29tiASVkLh1T4fs38KVN1pUgjs+6sk
	7l5y/UJkYYfsOq77wOy0w6ZVA2j0jmTDO6eKeiA==
X-Google-Smtp-Source: AGHT+IFSP7fv6n7n7EIN3wTedD5rHV4pAWwZx/vDgr9JJwfPB43rEvOuqvl3kArK2oSeRzx1fctxxl5dppJuW0GjOMk=
X-Received: by 2002:ac2:446b:0:b0:516:d4cf:f957 with SMTP id
 y11-20020ac2446b000000b00516d4cff957mr374456lfl.60.1713399828947; Wed, 17 Apr
 2024 17:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417230637.2592473-1-dtokazaki@google.com> <CAMRc=Mcbi8BQ-tHNs+BVjbm3aDSVY0zzOM4QfND3d2y8ryT62g@mail.gmail.com>
In-Reply-To: <CAMRc=Mcbi8BQ-tHNs+BVjbm3aDSVY0zzOM4QfND3d2y8ryT62g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Apr 2024 02:23:38 +0200
Message-ID: <CAMRc=McRiv6vtU5LySrkbfdbCaqZ2tXbHnazo4iahRS-SKAXxg@mail.gmail.com>
Subject: Re: [PATCH v1] at24: fix memory corruption race condition
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-team@android.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 1:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Thu, Apr 18, 2024 at 1:07=E2=80=AFAM Daniel Okazaki <dtokazaki@google.=
com> wrote:
> >
> > If the eeprom is not accessible, an nvmem device will be registered, th=
e
> > read will fail, and the device will be torn down. If another driver
> > accesses the nvmem device after the teardown, it will reference
> > invalid memory.
> >
> > Move the failure point before registering the nvmem device.
> >
> > Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 572333ead5fb..4bd4f32bcdab 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -758,15 +758,6 @@ static int at24_probe(struct i2c_client *client)
> >         }
> >         pm_runtime_enable(dev);
> >
> > -       at24->nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> > -       if (IS_ERR(at24->nvmem)) {
> > -               pm_runtime_disable(dev);
> > -               if (!pm_runtime_status_suspended(dev))
> > -                       regulator_disable(at24->vcc_reg);
> > -               return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> > -                                    "failed to register nvmem\n");
> > -       }
> > -
> >         /*
> >          * Perform a one-byte test read to verify that the chip is func=
tional,
> >          * unless powering on the device is to be avoided during probe =
(i.e.
> > @@ -782,6 +773,15 @@ static int at24_probe(struct i2c_client *client)
> >                 }
> >         }
> >
> > +       at24->nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> > +       if (IS_ERR(at24->nvmem)) {
> > +               pm_runtime_disable(dev);
> > +               if (!pm_runtime_status_suspended(dev))
> > +                       regulator_disable(at24->vcc_reg);
> > +               return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> > +                                    "failed to register nvmem\n");
> > +       }
> > +
> >         /* If this a SPD EEPROM, probe for DDR3 thermal sensor */
> >         if (cdata =3D=3D &at24_data_spd)
> >                 at24_probe_temp_sensor(client);
> > --
> > 2.44.0.683.g7961c838ac-goog
> >
>
> Looks good, can you add a Fixes tag?
>
> Thanks,
> Bartosz

Wait... While the patch is still correct - we shouldn't needlessly
create the nvmem device - why would anything crash? Looks like a
problem with nvmem then? How did you trigger this issue?

Bart

