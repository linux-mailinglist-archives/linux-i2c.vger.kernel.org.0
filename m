Return-Path: <linux-i2c+bounces-996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36E81E237
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Dec 2023 21:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEDDA1F21C06
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Dec 2023 20:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693C3537FD;
	Mon, 25 Dec 2023 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Toifzjdq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025C4537F1;
	Mon, 25 Dec 2023 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-67f9f6caabcso27577026d6.3;
        Mon, 25 Dec 2023 12:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703534445; x=1704139245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dr83uq7zJXyt/w+nNJUOwUzPhYgIcUw9vQ+ilNQ8Pms=;
        b=Toifzjdqwl59P9aywnBERRkx9ILpGDaU9LLjql8se+IUlym9Pfoye4os2fy0wkbHgo
         p3PeL8RId4D46HNglqx+EwJAs4p+jPzCuIxwlcWCdg2POx2kt6E2LZhdBnhDWhjT7s3y
         FCYOGc8zVBwtOFbiUdTgQGWjmIBWP3wMIm33LP9bYflp4qp4Fc4JdH4bsKncdJ91vogZ
         3yNILZpVG2d+PYljVkEfLGIxNTs2l7MeicwjXwkKrGNEP28cS9fp19UkwfQfg6xa79Vj
         tBatzNxu+OpHINavNXcKdjMo0g/zK9a/gIBKWTuGKmfZd9T/cbk8rxdGWZDcGtlZvsHc
         GprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703534445; x=1704139245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dr83uq7zJXyt/w+nNJUOwUzPhYgIcUw9vQ+ilNQ8Pms=;
        b=OoZaiCXYja7mcEjekJGBcxsnyvhLC+s1+aXMw32ZZW1mP8aboS6GAqxBKoqe8PnrvD
         jG9IIJwUL1lZRWGKRVrBoydG6FJlWTawu0Vfm+GAanBC93QF4CWcNEPWqBGiVWGoaXtU
         JBaXM+nW5T+LxljOq2STMQ0a1rCpbem+M68La4q5/PIH3Oi7mf7/m2kspVxUuJxNLA6u
         wdol9s2NfzEtOiYSfYBwxnliyIlDzPOjMax4RyoRpSEawWQS/EMiWdZ7hBWTTeuzpyCZ
         sYm+hoay827jvvHaAbXOAGT+OtrZJbaacxY9EX4W5rrOeHiVLhYTfRPtaeEM3erjZvBl
         Xfwg==
X-Gm-Message-State: AOJu0YzNMyGcGeoYfV6bJ5YVFOozXQpkA8scmOdlBmfW4LcnSDWbjJ1F
	4/yyFHs3nVkw+FFq7mubrrUWcYBlf2UDwVUdyKk=
X-Google-Smtp-Source: AGHT+IGJys61uyMcfmE/sxOpDzfYY8hKi31G6Z2ZjjcjBZVg3r1xOfSCFDo0f5bLCptl7WSlGeDVTEpbZIuZYKF61uc=
X-Received: by 2002:a05:6214:2a85:b0:67f:7009:f6cf with SMTP id
 jr5-20020a0562142a8500b0067f7009f6cfmr11275075qvb.45.1703534444887; Mon, 25
 Dec 2023 12:00:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231224213629.395741-1-hdegoede@redhat.com> <20231224213629.395741-4-hdegoede@redhat.com>
In-Reply-To: <20231224213629.395741-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Dec 2023 22:00:08 +0200
Message-ID: <CAHp75VfeQsMYoWWbpc1MXJTvry=xGwDvtDEPK67E5Ne=2BrNJw@mail.gmail.com>
Subject: Re: [PATCH 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com, 
	Marius Hoch <mail@mariushoch.de>, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 24, 2023 at 11:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> It is not necessary to handle the Dell specific instantiation of
> i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
> inside the generic i801 I2C adapter driver.
>
> The kernel already instantiates platform_device-s for these ACPI devices
> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> platform drivers.
>
> Move the i2c_client instantiation from the generic i2c-i801 driver to
> the Dell specific dell-smo8800 driver.

...

> +       static const u16 i801_idf_pci_device_ids[] =3D {
> +               0x1d70, /* Patsburg (PCH) */
> +               0x1d71, /* Patsburg (PCH) */
> +               0x1d72, /* Patsburg (PCH) */
> +               0x8d7d, /* Wellsburg (PCH) */
> +               0x8d7e, /* Wellsburg (PCH) */
> +               0x8d7f, /* Wellsburg (PCH) */
> +       };

I prefer to see this as a PCI ID table (yes, I know the downsides).

...

> +/* Ensure the i2c-801 driver is loaded for i2c_client instantiation */
> +MODULE_SOFTDEP("pre: i2c-i801");

JFYI: software module dependencies are not supported by all kmod
implementations in the user space. I don't expect people to complain,
but just let you know that this kind of change needs to be done with
care.

--=20
With Best Regards,
Andy Shevchenko

