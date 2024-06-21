Return-Path: <linux-i2c+bounces-4230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74097912A67
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89E19B28621
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A09479B96;
	Fri, 21 Jun 2024 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECXy0DgX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8917554;
	Fri, 21 Jun 2024 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984293; cv=none; b=mSk5GexIST7X+Pvipb9GZ1Nw+2Xt31Z3Bky6WCpjy/NpqBxB1Px6frFH7R1H5NhfEmkgoIP0BX+tlQSSHisHN5Gm8GKXHgZWbc10rkkEIhI+HxLwn+nmA1E4ZrSA8aNkJsk724d8Lp9mMA8bg0KEO52DbHQ9a1bwdqjnoefMVhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984293; c=relaxed/simple;
	bh=jMMrVL1rgmIwDEH0a7Oqa03pi1iQe89MfV1KSS9KNaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxxwZQ1m1oCWZ0P3AAZrY8ccSFRC0VhyER5IsC5scpSf6Ykiyr+cYHYKHK2dtPkTIYQHxl5TGn7C6ZNKIgUyk7aQAPpZwPgNTprYuqTdMrmNp9VZWdFpGMSiuqNTQV0/0Y6+ph1/O3QjxUQP4d7z19nGjWZVizMIbFEu46jQmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECXy0DgX; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6ef64b092cso256512866b.1;
        Fri, 21 Jun 2024 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718984290; x=1719589090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltQUr1dO5jYYGGbhW9Ya4ZQsIqGyRDxtW412nsUojBc=;
        b=ECXy0DgX5cLDTs0RmYfYtBkOnY0eWX2JiqpEDBxVQhmfzcqsrbqcS1Ap9BODxtxTZS
         z8Aqw4keTKS5nvd3nrwH/CBUOua4GbWkXu6wL3zLUuk+7EJ21jpdBUYzF+kQ72QRPzYz
         USRI8Iy472WLaJVp4bzmobvkSDm8WU2BqiMsH06P3zr8k+/6P93Mq9efKiRU+LZ3qxMR
         ZvP5gaYzwoEmlbpFuebAefi7RA4cK9ZHuXNptIa4gvEvXtay7LrSKTkW46X6IxFN3+Gx
         S9zgfbxZSVaXnsPUDLUJufvlZWZqCKriP6Lvjs4ENHjbVe51HML5/rxGvqmry+OyXZA6
         0Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718984290; x=1719589090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltQUr1dO5jYYGGbhW9Ya4ZQsIqGyRDxtW412nsUojBc=;
        b=q0ngmTapV48EAw/InArkAGM24BP/q9cd9r5YXA3f6bVkRPPV6TI51UuDE4GrufYdUZ
         29MkROLbh7hspmutTdJCkpVfT4Se1vXbWCYQZA3zRv5iRCXsokKMtdAG3L0mVLhmEnQ3
         AaBBJbqc3W47yhqZ9h0FN6qYUGU/IuyCWgOCPWNh0i8pP9AaFdoDrEFlpgmIXG1mLz6s
         /4Y6jJX7WQtncKkriqLBD9zpdOVSStGLsN6QjfGbGMOFKRqC4vGk9WzkpYq+ykqsk4yc
         qR+81LKX5gFYGBiFufFk3yGqOabiXerMzQXxpYtKdMuKDfnFcTbvUfvUIQQ6wcdr4GB2
         u0IA==
X-Forwarded-Encrypted: i=1; AJvYcCUzhCyPanH6cFG6ZrOOHnsoIpSdQBb/1Xezot5lGhFAodEIE6UM5d/L2pdHtndEy516HuMKY/dTmMm8ChDGshC039SWmq6xI1ac/22PnL+nHvCtdRwubYuj4VAehqVqqqob94HBf1lccsI+v1mPhQ==
X-Gm-Message-State: AOJu0YyUqhbrZ8pwQm2455o9Dyoup3rHnwShQuCueXcO7wFnuT9gjmFu
	2unTQa7yjvIQEApjhAAGDL5v5BwQp93Ls1OmUEYnb03RyDcCSGp/65LMrnj+9T4U3UAGqRVfStd
	qMHV6DL9kEmy4Y2nQCKK7h8QR+4k=
X-Google-Smtp-Source: AGHT+IG4cP6jEs97ecJysCiTcoac5DcXG1tFwcTAaDyNkPetKUOgAzlM9JMpHLn+zur6OfMtx/JjcIp3Q79N4cjZqm4=
X-Received: by 2002:a17:906:2a18:b0:a6f:79e6:3518 with SMTP id
 a640c23a62f3a-a6fab77a711mr564786866b.54.1718984289793; Fri, 21 Jun 2024
 08:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-7-hdegoede@redhat.com>
In-Reply-To: <20240621122503.10034-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jun 2024 17:37:33 +0200
Message-ID: <CAHp75VeSHVCKc-OvKXAQhr_euiA2bOMK0HZOnbZvnT9C=FeZGg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 2:26=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> of the accelerometer. So a DMI product-name to address mapping table
> is used.
>
> At support to have the kernel probe for the i2c-address for modesl

At --> Add ?

models

> which are not on the list.
>
> The new probing code sits behind a new probe_i2c_addr module parameter,
> which is disabled by default because probing might be dangerous.

...

> +/*
> + * This is the kernel version of the single register device sanity check=
s from
> + * the i2c_safety_check function from lm_sensors sensor-detect script:

i2c_safety_check()

> + * This is meant to prevent access to 1-register-only devices,
> + * which are designed to be accessed with SMBus receive byte and SMBus s=
end
> + * byte transactions (i.e. short reads and short writes) and treat SMBus
> + * read byte as a real write followed by a read. The device detection
> + * routines would write random values to the chip with possibly very nas=
ty
> + * results for the hardware. Note that this function won't catch all suc=
h
> + * chips, as it assumes that reads and writes relate to the same registe=
r,
> + * but that's the best we can do.
> + */

...

> +       err =3D i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data ^ 0x01=
,

Is 0x01 defined already?
Or BIT(0) ?

> +                            I2C_SMBUS_BYTE_DATA, &smbus_data);
> +       if (err < 0)
> +               return err;
> +
> +       if (smbus_data.byte !=3D (data ^ 0x01))

Ditto.

> +               return 0; /* Not a 1-register-only device. */

...

> +               dev_info(&device->dev, "Pass dell_smo8800.probe_i2c_addr=
=3D1 on the kernel commandline to probe, this may be dangerous!\n");

command line
...or...
cmdline

--=20
With Best Regards,
Andy Shevchenko

