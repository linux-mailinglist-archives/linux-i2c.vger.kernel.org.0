Return-Path: <linux-i2c+bounces-5155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5A09483B8
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 22:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FDC41C21D7B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 20:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9657B14D703;
	Mon,  5 Aug 2024 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4gRQlKi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E5A8469;
	Mon,  5 Aug 2024 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722891102; cv=none; b=KJYMV5ROPXiSe6MZ+UARVO4Gek+THVyh/rZsdxugvKR7mabVxdiXpxT1zO/jZUUI2CYMdtuRlQNjmJ70pSFCB8BDwM6fhOrSIyyA9cnFk4/u5pUxcatiAfcyAzO29zEGcTpFzjIospP5QVDd++xKEajyazh9LitXxgH/kbb/ySA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722891102; c=relaxed/simple;
	bh=MrGvdsIiwNjp/hC3sZxgp1Ig213BER/Mfyt7rnIq3Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VU4wF3EWBWtTIw6ExD1BwMy+ireYkbVCJ6P8JVwfwJH8633v9liaygjFkErTO/rs434F/FEL6rxvitQ3I0JhPvZs6bU+c2Yc4NajeQJGpyagnz7PQkoC+s2zw4iCZJBxFLYdScD0gI0OHEXUiG8spuRPm4PXqDxBI8bChWWj+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4gRQlKi; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so121737841fa.2;
        Mon, 05 Aug 2024 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722891099; x=1723495899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7VLm4Ac5XWQXH6FV4V7aIvlxbqJmiqLM4EcKwmyOh0=;
        b=b4gRQlKiCAbfxQ9DXsDSGOGW5jbXXVSDe/I1RHDLvoco0BUEYkFhNqsu469IZyoc1e
         aLey24OOqaBnxlNlEC/W1/HRWRxNj93o6xYjNJKTCYfZtKL0A7RNT/BeArwXztfr2vWr
         IN1f3RMaBEslO8x0WkSsjXuubAPunPrZ5XIrlrhvDVrqIdWwhByMHEqrmyNXn2YPO+n7
         t34M4/jPdWiV4L8rSp8hkAnY1IWthbn+qrAYOcPy0x2Xz4UcLHih4uwryd7wB7WtJBGQ
         Op+cH1/VT4CrcB+hcNDmZ9BgXi+zk80QiY+9z/q1f5Qjf6+44J72zLVaanUMPKogC0ZJ
         FVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722891099; x=1723495899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7VLm4Ac5XWQXH6FV4V7aIvlxbqJmiqLM4EcKwmyOh0=;
        b=QjQRK5cM8g+AFIoNSMmO86UYYBzR4P/Zg6CVq/bRK5Ft4mXh6/jAKV73JV+289qy+r
         d2w95xH5WY5obCrfirN1cqVp3WWSEgmL/5HZmNsrnpVxLkK1MSkR2zuAJCePHQDKLC6J
         uQg/Z/WVfQQcs6lF+tm68RyvTygYwBVjeneCi0K/mzg4ABe38AnNIN96WetTFK1sflJe
         aK/x/no0irC8BjcYCYcrxnCsjs3WGaUfio7TTzQrH26Hwo7NKybZBZapkWnhZtciUxFK
         4gW6MW3xaFebRR0ND6E+s9UrIrY/AwFeW1suaJvmSEe4JshNCLV81LeKF6ftzSVu8nOc
         NloQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcnrD4Q0sak+ix2V/Y1WG/Fmkkb3t49aiXsZnKKsW5pIF19lY9CyWDIcPg1usIhx9IJqOANIvBdNmppSCbiMyS1z7e9uCtoF6hJLrsI2thLg3Z11RMUG1r0DgiZDCUytVopV7FCW5FPYbtytXpwQ==
X-Gm-Message-State: AOJu0YxbNY46huBIqDSjGdXez3K/RPJnHeI2921zKSBTAof+XHAtoZU7
	GMe6BHyW/Ej4cO8rEvnagRizaXvUYzRnnFbjV0QCd1d76JF0ezDOCQ28uQycS4vqSlUa3ZGpL+d
	ESznEtMbJj7J2t39wMHvbcrNEKpo=
X-Google-Smtp-Source: AGHT+IFGxUA0O8Q1tN3x5+k05mPCu3CfYsdmjbuR42uvWvHg3gH1gwhp1XtXvu4Emq4rGc3GTBwvTzeI1lHTekofZUY=
X-Received: by 2002:a2e:3019:0:b0:2ef:2883:2746 with SMTP id
 38308e7fff4ca-2f15ab047dfmr88351991fa.48.1722891098543; Mon, 05 Aug 2024
 13:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805133708.160737-1-hdegoede@redhat.com> <20240805133708.160737-7-hdegoede@redhat.com>
In-Reply-To: <20240805133708.160737-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Aug 2024 22:51:01 +0200
Message-ID: <CAHp75VenFFqtkxVjOvWcA52NV8jTcmu5usnW5fv5VSxsq74ysg@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] platform/x86: dell-smo8800: Add support for
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

On Mon, Aug 5, 2024 at 3:39=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> of the accelerometer. So a DMI product-name to address mapping table
> is used.
>
> At support to have the kernel probe for the i2c-address for modesl

models

> which are not on the list.
>
> The new probing code sits behind a new probe_i2c_addr module parameter,
> which is disabled by default because probing might be dangerous.

...

> +static int detect_lis3lv02d(struct i2c_adapter *adap, unsigned short add=
r)
> +{
> +       union i2c_smbus_data smbus_data;
> +       int err;
> +
> +       pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);

Using dev_info() against an adapter device might be more useful, no?

> +       err =3D i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM=
_I,
> +                            I2C_SMBUS_BYTE_DATA, &smbus_data);
> +       if (err < 0)
> +               return 0; /* Not found */
> +
> +       /* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02=
d.c */
> +       switch (smbus_data.byte) {
> +       case 0x32:
> +       case 0x33:
> +       case 0x3a:
> +       case 0x3b:
> +               break;
> +       default:
> +               pr_warn("Unknown who-am-i register value 0x%02x\n", smbus=
_data.byte);
> +               return 0; /* Not found */
> +       }
> +
> +       pr_debug("Detected lis3lv02d on address 0x%02x\n", addr);

Ditto for the rest of pr_*() in this function.

> +       return 1; /* Found */
> +}

--=20
With Best Regards,
Andy Shevchenko

