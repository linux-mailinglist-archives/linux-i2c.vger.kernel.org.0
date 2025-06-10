Return-Path: <linux-i2c+bounces-11327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0923AD31A5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 11:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BB027AA204
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 09:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6046D28B7C5;
	Tue, 10 Jun 2025 09:16:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CB228AAE5;
	Tue, 10 Jun 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547008; cv=none; b=pj5JlTOAboPXYcocT8KkaQhknfQL0wvA9WusePfBe/CJSafAcPaOMH7iGxX9HRJd0Fe9QXhuv2ImxRFzYSDVYfRNfkQK2Eg3SaaXqlUISM6nKzkvYWW1PucF7Glw3nixoXFy49QxidgsAg+F/gv+enaO6yrqaKlJoTiFWsW6gKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547008; c=relaxed/simple;
	bh=T5SuRWpaGQwoZhvlpNpdBYid1/1wMrEkOat2uWnCvtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtDyjLkL3MOLRz/FM5VHyT3NVguuzeHnAnxwFlrXmIaebpHDW/V0t7SEvOPZ/zCfz2JPiw6nmJuPFybqlEOGOfDbgcyQcbI7wQYSZrro7pvPXK4Dy76va8Ayq6nKoS/6S5p2nZx9TlgRg9y4DHWNhJ20eMngh6bQbJ907UB6Ku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87ee0ba50bcso412056241.3;
        Tue, 10 Jun 2025 02:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547003; x=1750151803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXmJAjCM4QXrI8PFxZnnSaMVzam0rKL8btuAAYmyx5Y=;
        b=eRDt/QaaLRIp7tFMjcp1IZXr3tmR1DmvK+nyDkVqXa7EmzxSR0BJi3OsbNuxu4rCze
         ysweErCDDTHyMp2JqOwvcNeCVHXwwoBkkTgcE9pd0WVTP4VSCrN7LWc1mex+Tqu0DGLO
         qcQu9+z/utaznTdY/qB5iu42rcrpdbc062SDIMIL+WkosgaDA+w0HuDyinoLFr80wDzv
         Omx/VEl+GPqbVKCPUyGDTdFfpho3IZCy3FL3TLOdqDGfGB1lXLwpkXf69ohGsJgRyYhp
         xduunpyEJ0mGY1lM0awO2E4MG4cVy2kGnaB3EGs3DFVRmxc+LOgwOO2Ozz6173D+MBRi
         bi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNM5+WV+a1+vm/vfKu6Hod3uuxHBzm88dMw5hNWpUC8zUsF8LuMB6J7MxHxgAGJMQ/jEKi0TK4qq41dhw9deWHPQHzwQ==@vger.kernel.org, AJvYcCVMjz5vnDhba33d+3eNRU0pXTyCKPvs0LeNzBi7+NU2rDjaGk9QDQqWo4RsUVgPSjTDAN2kH9hnpjL4jQ==@vger.kernel.org, AJvYcCVVxPtcCU3EcjwnNEkd9k+ARrXjQp3k4wr1+WkBM3fqhjU7q8/5ViOCDQnmcu34cBwdtt9mRmFjxQrh@vger.kernel.org, AJvYcCVzO2Nv24xLp18QERRJiRmVMLPN1b9Tr3VODEEdTenUe3ppe95B4e1hQ3E51OdLborUCBOs2HVD1N4fT1l8@vger.kernel.org, AJvYcCXq4Bjh444THwWCoOLJXvkFzH32iA0Y/WgleMmfMy27k4gQCNc8SFxK6vqFH4sqxVFIK5ayo5rJxI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6yeocL7quuhwZQVHJsJ6qSuLPwCjfGliXQ52Mx6UmUTOe5sZV
	iDOPZWGwk5a0BYNyv/8OgmZzbizVZ+WGcY/ES03UxpLdX1H5hov2o38RvJ0mW6Wi
X-Gm-Gg: ASbGnctlS/EmZsO03xfTR6I7UxrHstdzKFexf4wuGHJjiqZNAiIaXf7aMhVLd97YmzX
	Z4jRhLOH9hNHQrImLgbEQTqLMAVVrLs+8BXpa+4TmjmbU0fRfqEYV1s9Wh4q/7NScR795tIXf9n
	b5c5E7INRR/WY0ozD9sHi7jqGY5bVHbKkMsoZrawgM6DwXD6ZgVDp8Vzg4Sc9JjVUKpbRJqNbv3
	uodA6fVdSeaaBV42N8y9UMi4CUBVPFGILVoLA5uVJ/KxZ6kVuq6s+GoEYg5RYPyaDsS9X5tYjoY
	OKk6qnsZWvKUOgCpzbJMSTJEK/JMm5Kw8PuznEyaaQqPevOXjf+r69gBUkvo2btVXHnN7tJGhnm
	lyXE426ryRHQWxTDxRbQY6um9
X-Google-Smtp-Source: AGHT+IGjk7FFhQmtnDl7IVnNDq0YQrhxvalZUdYjdTl7Yk8yFclJTFNB4/F5T0bLCn44doMUvzDxhQ==
X-Received: by 2002:a05:6102:5802:b0:4e7:596e:e029 with SMTP id ada2fe7eead31-4e772a30842mr12498831137.20.1749547003114;
        Tue, 10 Jun 2025 02:16:43 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e77394bd3bsm6139299137.23.2025.06.10.02.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:16:41 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87ed98a23easo464772241.0;
        Tue, 10 Jun 2025 02:16:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0WpwwFPS17YAfEFOydbs32YGAV7Rs/9qBoqIyWDUbz0tdDkIrUOPNIRzn/oelNKdO8Ww5GQCYwLlX@vger.kernel.org, AJvYcCVNtmoGy+hcBquTeKh1Pa3PjJf13gN9gE8k/Tol6ZuK6Ch/DALoYprAdVNT+WUx7DFJD7ULtbqDW7E=@vger.kernel.org, AJvYcCVlwME51ZzgE5fA+l/kS42EuxfYr4O8qqcvSnURO3nm4MT+Z1tGB9+ZiMjB7s+99o3n+vuhrKNagt4r0vnS38EvqI118Q==@vger.kernel.org, AJvYcCWFThk45PPY1ttQmv8ZR0v/TvxO6WlbP6L4yc5AUBz58dSny+Pcs0kd6HK0iqtkVJCL3quiJAE/nG1lMw==@vger.kernel.org, AJvYcCXDmmiGipFbRHY8UybXKCpvUy0eUWJqxXN0tawP767PsqBNY9bUXFZBy0WGJI1dWsMR9qh4WIgmrlX2Ok7m@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:4e6:ddd0:9702 with SMTP id
 ada2fe7eead31-4e7729a3b75mr12821267137.15.1749547001193; Tue, 10 Jun 2025
 02:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422234830.2840784-1-superm1@kernel.org> <20250422234830.2840784-3-superm1@kernel.org>
In-Reply-To: <20250422234830.2840784-3-superm1@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jun 2025 11:16:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
X-Gm-Features: AX0GCFv1stbSgApzqPSScCybuPZoPnTcTv0OURpXKeqUfK7lSULXavQbaabojaE
Message-ID: <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, 
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mario,

CC mips, loongarch

On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> PIIX4 and compatible controllers are only for X86. As some headers are
> being moved into x86 specific headers PIIX4 won't compile on non-x86.
>
> Suggested-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks for your patch, which is now commit 7e173eb82ae97175
("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
in v6.16-rc1.

> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -200,7 +200,7 @@ config I2C_ISMT
>
>  config I2C_PIIX4
>         tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
> -       depends on PCI && HAS_IOPORT
> +       depends on PCI && HAS_IOPORT && X86

Are you sure this south-bridge is not used on non-x86 platforms?
It is enabled in several non-x86 defconfigs:

    arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
    arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=m
    arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=y
    arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y

The loongarch and loongson entries are probably bogus, but I wouldn't
be surprised if the SGI Onyx and Origin do use Intel south-bridges.

>         select I2C_SMBUS
>         help
>           If you say yes to this option, support will be included for the Intel

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

