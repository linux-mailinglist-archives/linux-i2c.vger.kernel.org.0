Return-Path: <linux-i2c+bounces-11351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB4AD3FC3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 18:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2756C7A47D8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A712424397A;
	Tue, 10 Jun 2025 16:59:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B3239E9C;
	Tue, 10 Jun 2025 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574768; cv=none; b=i94GoIUHSAc4IG9QOydmacHzwkBO0ICerMFfemd/w55fvS6RoB9YuxtPs8Dov2Qp7cCCLR7mtCl7h8LE8hbBU6wQsnyNa3avRlrzN3rfCXKOdB3oI7iPwvqeGxhvufFDUPdEVO9oCzc1jDN0xoE1a1x/yV+nn1KTE9HbVYIqTF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574768; c=relaxed/simple;
	bh=8fC38WprT2pWuEMPIy2gX/nxyA60Ti5bdwYYQsusNps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKlhGC+aBNyEj0a0YVbeHQQ34S2mw+Ucr3pY0rpO9o6jaHuG8GS/9MYHe2llZ1piwSeD2xh3JKoilpo7yHUriuiwv+OwRzaxbURScMj7Ne/F9MkL0MreNLjukRe4QD+hyWQ5dkp6ECJ76vDHw5VnVJz+fygbdhHYVhqnD1111dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so2160960137.0;
        Tue, 10 Jun 2025 09:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749574764; x=1750179564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9I8GBRTfKx+eWF19Xfo69kH8HTUqvrSIpR7dFGCvUo=;
        b=nu/PzchaTdwb1uUJb7NCSveDLt0ZERgAIJ5nHdDU2uovTZje2TGg8pt4DuIjKRHTsN
         4d+5RXcJEKmYHz3a4u9AGIvhaP1E80JFokf4akrxP8R2gD7O5+g+trVXF34DXMmW3BpN
         SNvkmrPSh9y2Jw1D5qsbiV2WEVRl1pifHkhBO+2GxZHspeLJwX9RqCSsNgQ75MrVg8wc
         6N4Gf7xFc82vCrcBvwj1Fi+WuaBzFoaneEk6pxm9gONkeQaHxelGuW8mEXzhLsPENegI
         OPqQQZ8NdIDwg7DpCHycy/RJQ3oo4Dn3Mx6ZOLOCgWE+nW966+36zeMZMEJZs/PIlui+
         X98Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGJeodoZEqgIaJZojR3K+Klu4rXqWpSfIVivO29AQsu8dOWUfxVWgRErVswzf+tTt+xoMNq8bQ/LkH@vger.kernel.org, AJvYcCUJogWMmuC1/ihFo4T47b/m3Ou5sJhApR2BVy+bIzpn0ypCXBaCh/dw7kVJvVv4ZYh4HHhKNAn9sWB0NNpY@vger.kernel.org, AJvYcCV2OBTUZ/QEkAlCwN8eq7N3BCcN9akUg5iVz0k6C9fbyBc+jok1vdrDQu+kXtQQh6NQ1aZH76qB7+m7cw8TqB+5sqI1Ug==@vger.kernel.org, AJvYcCVUiWy5DPYEWUmV4rFiESaJBfJDR10tf935jMy/dD4c0akm6PlCIX4jDYf2fW74oRM4xDPTjuQMn7+wPg==@vger.kernel.org, AJvYcCWFrRGfSZpZwJ98XXzVZMjF8DdFIjXcXtRgcffmJK0oxl+hsZGUghgZiXBU5dNRF3kF9NcXc+7riqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWsGXWLJE/x+/upMCQlSrvgWj9ROVB9Kvd6x9gFB1032z+Efk
	nGh5Mw2Sf+rsW4e3Q43PYC60BON8ED6+pySBTSW1SUaNqogpHJpI8RGAS0c/72w7
X-Gm-Gg: ASbGncusuoHYjOmYBUQYI3F1zz0ZKYLWL0IY62Y813VPqG3OhM318yqbGDU/DMgu6kc
	cWAKksmRv4tSogT/FcxkeLsQRM+kZLPhdA/3DrsC6sJ5sXTwVw61Asg6qQgNw0q+YuWnUbpPTkq
	2GIyEgV2KUQ/FkTSGC2bOf7Jx6DCc+CECbXeCFjIdG6E9DdiIcnoP+TE9tKOI548QZV6rAU7qaL
	KmLOEhD2VXL1AZwhAmYnjFP1Lh4Jfo7LbfK4YzaKCLSyBWluSYWYzSyCas9MmSVlzGbE0k1mqbh
	iZT4tiYiPzociVMAmehvv4dZ21BNkwhFV468sVKpbtdbDss0fsHNafWJyCskB0l3w+eTWlClmXv
	Oaz2ntwG5I0zDIaFoM6andOQ9
X-Google-Smtp-Source: AGHT+IEcBnU1NVzog03YI6rYXltmrEXjdKxJyZCwun0m6kRRtF5sMbQcip7gsYrCe/CkNhyfJeZIyQ==
X-Received: by 2002:a05:6102:94b:b0:4e6:67f6:e9af with SMTP id ada2fe7eead31-4e7a8236851mr3542480137.9.1749574764043;
        Tue, 10 Jun 2025 09:59:24 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7b71996a7sm703099137.11.2025.06.10.09.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:59:22 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e58ad70536so1835780137.1;
        Tue, 10 Jun 2025 09:59:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9e19i99xp3WZv0CQoWZl2Oyr72IP09fJ/dKKfThjU1Ibyi3Bq1fyJEoZWIRTRBnrHR7U4eDExEUM=@vger.kernel.org, AJvYcCUNdTeUftVcQiQSVIXDWs3OsQ2peFD4xVDHstMBGtGSbkeKwX+N0Oje+wlau9RBacWF5pDQqPUdQHFN@vger.kernel.org, AJvYcCVWuF5H6fZRMW8lFf3QST68sVPe1/o/C6Kl6TPPw2GJqknyOXzTwZRU0PDRoazGyPiedu+TSSFf+eKBuKet@vger.kernel.org, AJvYcCVt1RQ31ia3S3qCWVhxBosG0Mjaf+06ZdMMZSsnA9g2iuQWgG2J1Jwt/DRJt35tQFckmC1iqCra54xDTg==@vger.kernel.org, AJvYcCWEwoJzd6IAbsfifLZjAkJnGUvo+I1nId16k89XKHrCn6EKTrzcB+vhGEurposmVxFmFW4tpr5bCaSDn0GWTViZOTtcPg==@vger.kernel.org
X-Received: by 2002:a05:6102:26c1:b0:4e6:f7e9:c47d with SMTP id
 ada2fe7eead31-4e7a837baccmr3288817137.21.1749574762567; Tue, 10 Jun 2025
 09:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422234830.2840784-1-superm1@kernel.org> <20250422234830.2840784-3-superm1@kernel.org>
 <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
 <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
 <24febda9-6360-459f-82d3-6fba9ed9be83@kernel.org> <30a7f1a6-1e04-4fc5-9bea-e2b5956b28b7@kernel.org>
 <1e06c620-8f8e-4ddf-8356-0782bccd63a2@kernel.org>
In-Reply-To: <1e06c620-8f8e-4ddf-8356-0782bccd63a2@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jun 2025 18:59:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtrJn0i5ehBSq85+gTZ7fmeeQ=r-8fzV4GRFvmgOY1DQ@mail.gmail.com>
X-Gm-Features: AX0GCFvpdglJ39T9DZCon202OR6EMGtUfWEMmg5Bmv4fBETAUsiuRMtz0OZRCPA
Message-ID: <CAMuHMdXtrJn0i5ehBSq85+gTZ7fmeeQ=r-8fzV4GRFvmgOY1DQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Hans de Goede <hansg@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, 
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, 10 Jun 2025 at 16:55, Hans de Goede <hansg@kernel.org> wrote:
> On 10-Jun-25 16:53, Hans de Goede wrote:
> > On 10-Jun-25 16:12, Mario Limonciello wrote:
> >> On 6/10/2025 2:24 AM, Huacai Chen wrote:
> >>> On Tue, Jun 10, 2025 at 5:16=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> >>>> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org>=
 wrote:
> >>>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>
> >>>>> PIIX4 and compatible controllers are only for X86. As some headers =
are
> >>>>> being moved into x86 specific headers PIIX4 won't compile on non-x8=
6.
> >>>>>
> >>>>> Suggested-by: Ingo Molnar <mingo@kernel.org>
> >>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>
> >>>> Thanks for your patch, which is now commit 7e173eb82ae97175
> >>>> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
> >>>> in v6.16-rc1.
> >>>>
> >>>>> --- a/drivers/i2c/busses/Kconfig
> >>>>> +++ b/drivers/i2c/busses/Kconfig
> >>>>> @@ -200,7 +200,7 @@ config I2C_ISMT
> >>>>>
> >>>>>   config I2C_PIIX4
> >>>>>          tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/=
Broadcom/SMSC)"
> >>>>> -       depends on PCI && HAS_IOPORT
> >>>>> +       depends on PCI && HAS_IOPORT && X86
> >>>>
> >>>> Are you sure this south-bridge is not used on non-x86 platforms?
> >>>> It is enabled in several non-x86 defconfigs:
> >>>>
> >>>>      arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
> >>>>      arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=3Dm
> >>>>      arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=3Dy
> >>>>      arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
> >>>>
> >>>> The loongarch and loongson entries are probably bogus, but I wouldn'=
t
> >>>> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
> >>> Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.
> >>
> >> Well we could revert this patch, but it's going to be a compile failur=
e because of 624b0d5696a89b138408d385899dd35372db324b and other patches tha=
t go on top of that.
> >>
> >> My current leaning is we make a dummy fch.h header for these archs wit=
h #defines for 0.
> >
> > Move "fch.h" to include/linux/platform/x86/ so that it is available on =
all arches
> > and if necessary ifdef out anything x86 specific in the C-code referenc=
ing it ?
>
> Correction that should be include/linux/platform_data/x86/

Is that a good location?
It is not x86-specific, and I see no platform_data (struct) definitions in
arch/x86/include/asm/amd/fch.h?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

