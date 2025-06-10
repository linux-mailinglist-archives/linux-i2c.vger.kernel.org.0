Return-Path: <linux-i2c+bounces-11328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC918AD31E6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 11:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 499941896CD3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 09:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCDA28B3E8;
	Tue, 10 Jun 2025 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/ESNX8S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171FE28A409;
	Tue, 10 Jun 2025 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547485; cv=none; b=CF+3mim3+TI9zfLk4/5mRmN22TdtDqyJmX4L1Y0Hgr83+l8gbmVP8dKW6jtjDLe6zK5SX4UvxEWkjIEBTNWZ4l+ZekPv/KS/47GFjif8PnmhtiU9vISldLx9QqZnXBEZx7j1gA0fEd5GHewegIjODdClW96tKZNjn0TqvT2hVdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547485; c=relaxed/simple;
	bh=7O8pLwMtFMpTYlcRgT7szr1Viv9rchg8SjS1xi2PCaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGBdxDTzRwqbz8IM4hL43WkYT4apis84+UViskQjkr/rDSscwd8CHco5x36noHyexYQzH+q4tgVuAjQi7DjwUBIutvUoTMZjjD7W65T5UoxtC1DY0BlPymOWNHyuTcM0NWcVgwSgt9ojHaRW2lO8xFyJ9bVUo1TY8TebNkM0VNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/ESNX8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE4EC4CEF4;
	Tue, 10 Jun 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547484;
	bh=7O8pLwMtFMpTYlcRgT7szr1Viv9rchg8SjS1xi2PCaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h/ESNX8SjqAIz/fIEsEV2YR9QfqZ97fQl6gbBK0Wqzd9CGz2I+2hGeYCGGNwKFF1q
	 4GgUTzuEiwdZABnuRKxnCXdVv3KWEcsd6LXVMaY5KwJ+4VHNk/XlNHuC0h849sfxeP
	 fDttr645y7K6OxNgsCRZvE3QMBEfm2U4xnbfPfvVj/4meDG9xO7I1dp6JXI5/Zc+Q6
	 ReizgibSRPZSYJfww1QxdU6DiySj7el7R69zggX2xH/6KBkwWOtdnwEzgU6qiUXy41
	 9XGHwaWfQm6hBaP9C4eIjz3eBcBQGFv9HWOCNhFOQ806wcuqL+eHrW/CIa3c86++5T
	 2CpVzO1IsL5Uw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad1b94382b8so905756966b.0;
        Tue, 10 Jun 2025 02:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURCEXMjtGT4TQH2FanKQ9gC4V+dvOql8N6eGqDkBMrJobcyE4NwkVGeQKU1w1a1c9vVdRw07cVrAYy4Q==@vger.kernel.org, AJvYcCVHp0TZtUSIML/Iq4QZfBZnl4yZOoy5KyQIQSy7FxVf8mQL7flcv0gYK9vOQOF6K6nmJr+abR2Bm6s=@vger.kernel.org, AJvYcCW3fiZH3bdLfUbVdjYW42XqUKFw2M8N4jprWd+TJSkPpy4PKDg5Kdl/DfQEdWQMmJrdQYrHpJgQQFNIa/YSC4+2TFuxQw==@vger.kernel.org, AJvYcCWYMaB339IEIX8Iz0doOq7aK5QOeO1eXD5LGLJUiUgElLqDYGxGIcHN5+MobFTgnQHglZAfv7t7SUi7@vger.kernel.org, AJvYcCX7vGqqJasEIFBmNm1polAZmgM6ufJxgsWW/HsQGd/iqhyfHZgnVmD9qR09DEf4QocNMWdHZ+NEIyNQyRBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYv/ZzFiYUFedMZQfxxYvfv01R+OvmA2DQevizydUHp8ygAkXJ
	ddc4A9DuqsQrL6XZfE1ht2MDe5MnYWJYjZG1XAS98uIYNluq3QLsd00+k1F+z7UEb+4T8bN/eeD
	xewvpyhK2AxKYOrPxVPcAT/h5Bhfji9w=
X-Google-Smtp-Source: AGHT+IHp9IrXPr6CUNbh1St5Hg3ial/rjt2FWdk+sYxhxJaYrSLty/M96Too05Y4+45YoU/INmTjI/uhZJoYsjtNpkM=
X-Received: by 2002:a17:906:ef0d:b0:aca:d4f6:440d with SMTP id
 a640c23a62f3a-ade7ac572a4mr171877866b.17.1749547483079; Tue, 10 Jun 2025
 02:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422234830.2840784-1-superm1@kernel.org> <20250422234830.2840784-3-superm1@kernel.org>
 <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
In-Reply-To: <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Jun 2025 17:24:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
X-Gm-Features: AX0GCFvyd2N-spvgVUDQiEXjOROXJ4rt5ErLp4PE6STdQ0GN935XFU-Ao7ctaOk
Message-ID: <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:16=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Mario,
>
> CC mips, loongarch
>
> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrot=
e:
> > From: Mario Limonciello <mario.limonciello@amd.com>
> >
> > PIIX4 and compatible controllers are only for X86. As some headers are
> > being moved into x86 specific headers PIIX4 won't compile on non-x86.
> >
> > Suggested-by: Ingo Molnar <mingo@kernel.org>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>
> Thanks for your patch, which is now commit 7e173eb82ae97175
> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
> in v6.16-rc1.
>
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -200,7 +200,7 @@ config I2C_ISMT
> >
> >  config I2C_PIIX4
> >         tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broad=
com/SMSC)"
> > -       depends on PCI && HAS_IOPORT
> > +       depends on PCI && HAS_IOPORT && X86
>
> Are you sure this south-bridge is not used on non-x86 platforms?
> It is enabled in several non-x86 defconfigs:
>
>     arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
>     arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=3Dm
>     arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=3Dy
>     arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
>
> The loongarch and loongson entries are probably bogus, but I wouldn't
> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.

Huacai

>
> >         select I2C_SMBUS
> >         help
> >           If you say yes to this option, support will be included for t=
he Intel
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

